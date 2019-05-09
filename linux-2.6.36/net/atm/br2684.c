/*
 * Ethernet netdevice using ATM AAL5 as underlying carrier
 * (RFC1483 obsoleted by RFC2684) for Linux
 *
 * Authors: Marcell GAL, 2000, XDSL Ltd, Hungary
 *          Eric Kinzie, 2006-2007, US Naval Research Laboratory
 */

#define pr_fmt(fmt) KBUILD_MODNAME ":%s: " fmt, __func__

#include <linux/module.h>
#include <linux/init.h>
#include <linux/kernel.h>
#include <linux/list.h>
#include <linux/netdevice.h>
#include <linux/skbuff.h>
#include <linux/etherdevice.h>
#include <linux/rtnetlink.h>
#include <linux/ip.h>
#include <linux/uaccess.h>
#include <linux/slab.h>
#include <net/arp.h>
#include <linux/atm.h>
#include <linux/atmdev.h>
#include <linux/capability.h>
#include <linux/seq_file.h>
#ifdef TCSUPPORT_SHARE_PVC
#include <linux/mtd/mtd.h>
#include <linux/mtd/rt_flash.h>
#endif
#include <linux/atmbr2684.h>

#include "common.h"

#if !defined(TCSUPPORT_CPU_MT7510)
#ifdef TCSUPPORT_RA_HWNAT
#include <linux/foe_hook.h>
#endif
#endif



static void skb_debug(const struct sk_buff *skb)
{
#ifdef SKB_DEBUG
#define NUM2PRINT 50
	print_hex_dump(KERN_DEBUG, "br2684: skb: ", DUMP_OFFSET,
		       16, 1, skb->data, min(NUM2PRINT, skb->len), true);
#endif
}

#define BR2684_ETHERTYPE_LEN	2
#define BR2684_PAD_LEN		2

#define LLC		0xaa, 0xaa, 0x03
#define SNAP_BRIDGED	0x00, 0x80, 0xc2
#define SNAP_ROUTED	0x00, 0x00, 0x00
#define PID_ETHERNET	0x00, 0x07
#define ETHERTYPE_IPV4	0x08, 0x00
#define ETHERTYPE_IPV6	0x86, 0xdd
#define PAD_BRIDGED	0x00, 0x00
#define MIN_PKT_SIZE     60
#ifdef CONFIG_SMUX
#if !defined(TCSUPPORT_CT) 
int (*check_smuxIf_exist_hook)(struct net_device *dev);
EXPORT_SYMBOL(check_smuxIf_exist_hook);
#endif
#endif

static const unsigned char ethertype_ipv4[] = { ETHERTYPE_IPV4 };
static const unsigned char ethertype_ipv6[] = { ETHERTYPE_IPV6 };
static const unsigned char llc_oui_pid_pad[] =
			{ LLC, SNAP_BRIDGED, PID_ETHERNET, PAD_BRIDGED };
static const unsigned char llc_oui_ipv4[] = { LLC, SNAP_ROUTED, ETHERTYPE_IPV4 };
static const unsigned char llc_oui_ipv6[] = { LLC, SNAP_ROUTED, ETHERTYPE_IPV6 };

enum br2684_encaps {
	e_vc = BR2684_ENCAPS_VC,
	e_llc = BR2684_ENCAPS_LLC,
};

struct br2684_vcc {
	struct atm_vcc *atmvcc;
	struct net_device *device;
	/* keep old push, pop functions for chaining */
	void (*old_push)(struct atm_vcc *vcc, struct sk_buff *skb);
	void (*old_pop)(struct atm_vcc *vcc, struct sk_buff *skb);
	enum br2684_encaps encaps;
	struct list_head brvccs;
#ifdef CONFIG_ATM_BR2684_IPFILTER
	struct br2684_filter filter;
#endif /* CONFIG_ATM_BR2684_IPFILTER */
	unsigned copies_needed, copies_failed;
};

struct br2684_dev {
	struct net_device *net_dev;
	struct list_head br2684_devs;
	int number;
	struct list_head brvccs;	/* one device <=> one vcc (before xmas) */
	int mac_was_set;
	enum br2684_payload payload;
};


#if defined(TCSUPPORT_CPU_MT7510)
int napi_en = 0;
EXPORT_SYMBOL(napi_en);

void (*br2684_config_hook)(int linkMode, int linkType);
EXPORT_SYMBOL(br2684_config_hook);

int (*br2684_init_hook)(struct atm_vcc *atmvcc, int encaps) = NULL;
EXPORT_SYMBOL(br2684_init_hook);

int (*br2684_push_hook)(struct atm_vcc *atmvcc, struct sk_buff *skb) = NULL;
EXPORT_SYMBOL(br2684_push_hook);

int (*br2684_xmit_hook)(struct sk_buff *skb, struct net_device *dev, struct br2684_vcc *brvcc) = NULL;
EXPORT_SYMBOL(br2684_xmit_hook);
#endif


/*
 * This lock should be held for writing any time the list of devices or
 * their attached vcc's could be altered.  It should be held for reading
 * any time these are being queried.  Note that we sometimes need to
 * do read-locking under interrupt context, so write locking must block
 * the current CPU's interrupts
 */
static DEFINE_RWLOCK(devs_lock);

static LIST_HEAD(br2684_devs);

static inline struct br2684_dev *BRPRIV(const struct net_device *net_dev)
{
	return (struct br2684_dev *)netdev_priv(net_dev);
}

static inline struct net_device *list_entry_brdev(const struct list_head *le)
{
	return list_entry(le, struct br2684_dev, br2684_devs)->net_dev;
}

static inline struct br2684_vcc *BR2684_VCC(const struct atm_vcc *atmvcc)
{
	return (struct br2684_vcc *)(atmvcc->user_back);
}

static inline struct br2684_vcc *list_entry_brvcc(const struct list_head *le)
{
	return list_entry(le, struct br2684_vcc, brvccs);
}

/* Caller should hold read_lock(&devs_lock) */
static struct net_device *br2684_find_dev(const struct br2684_if_spec *s)
{
	struct list_head *lh;
	struct net_device *net_dev;
	switch (s->method) {
	case BR2684_FIND_BYNUM:
		list_for_each(lh, &br2684_devs) {
			net_dev = list_entry_brdev(lh);
			if (BRPRIV(net_dev)->number == s->spec.devnum)
				return net_dev;
		}
		break;
	case BR2684_FIND_BYIFNAME:
		list_for_each(lh, &br2684_devs) {
			net_dev = list_entry_brdev(lh);
			if (!strncmp(net_dev->name, s->spec.ifname, IFNAMSIZ))
				return net_dev;
		}
		break;
	}
	return NULL;
}

static int atm_dev_event(struct notifier_block *this, unsigned long event,
		 void *arg)
{
	struct atm_dev *atm_dev = arg;
	struct list_head *lh;
	struct net_device *net_dev;
	struct br2684_vcc *brvcc;
	struct atm_vcc *atm_vcc;
	unsigned long flags;

	pr_debug("event=%ld dev=%p\n", event, atm_dev);

	read_lock_irqsave(&devs_lock, flags);
	list_for_each(lh, &br2684_devs) {
		net_dev = list_entry_brdev(lh);

		list_for_each_entry(brvcc, &BRPRIV(net_dev)->brvccs, brvccs) {
			atm_vcc = brvcc->atmvcc;
			if (atm_vcc && brvcc->atmvcc->dev == atm_dev) {

				if (atm_vcc->dev->signal == ATM_PHY_SIG_LOST)
					netif_carrier_off(net_dev);
				else
					netif_carrier_on(net_dev);

			}
		}
	}
	read_unlock_irqrestore(&devs_lock, flags);

	return NOTIFY_DONE;
}

static struct notifier_block atm_dev_notifier = {
	.notifier_call = atm_dev_event,
};

/* chained vcc->pop function.  Check if we should wake the netif_queue */
static void br2684_pop(struct atm_vcc *vcc, struct sk_buff *skb)
{
	struct br2684_vcc *brvcc = BR2684_VCC(vcc);
	struct net_device *net_dev = skb->dev;

	pr_debug("(vcc %p ; net_dev %p )\n", vcc, net_dev);
	brvcc->old_pop(vcc, skb);

	if (!net_dev)
		return;

	if (atm_may_send(vcc, 0))
		netif_wake_queue(net_dev);

}
/*
 * Send a packet out a particular vcc.  Not to useful right now, but paves
 * the way for multiple vcc's per itf.  Returns true if we can send,
 * otherwise false
 */
static int br2684_xmit_vcc(struct sk_buff *skb, struct net_device *dev,
			   struct br2684_vcc *brvcc)
{
	struct br2684_dev *brdev = BRPRIV(dev);
	struct atm_vcc *atmvcc;
	int minheadroom = (brvcc->encaps == e_llc) ? 10 : 2;
	int err = 0;

	if (skb_headroom(skb) < minheadroom) {
		struct sk_buff *skb2 = skb_realloc_headroom(skb, minheadroom);
		brvcc->copies_needed++;
		dev_kfree_skb(skb);
		if (skb2 == NULL) {
			brvcc->copies_failed++;
			return 0;
		}
		skb = skb2;
	}

#if defined(TCSUPPORT_CPU_MT7510)
	if (br2684_xmit_hook){
		err = br2684_xmit_hook(skb, dev, brvcc);
		if (err){
			return 0;
		}
	}
	else 
#endif
	{
	if (brvcc->encaps == e_llc) {
		if (brdev->payload == p_bridged) {
			skb_push(skb, sizeof(llc_oui_pid_pad));
			skb_copy_to_linear_data(skb, llc_oui_pid_pad,
						sizeof(llc_oui_pid_pad));
		} else if (brdev->payload == p_routed) {
			unsigned short prot = ntohs(skb->protocol);

			skb_push(skb, sizeof(llc_oui_ipv4));
			switch (prot) {
			case ETH_P_IP:
				skb_copy_to_linear_data(skb, llc_oui_ipv4,
							sizeof(llc_oui_ipv4));
				break;
			case ETH_P_IPV6:
				skb_copy_to_linear_data(skb, llc_oui_ipv6,
							sizeof(llc_oui_ipv6));
				break;
			default:
				dev_kfree_skb(skb);
				return 0;
			}
		}
	} else { /* e_vc */
		if (brdev->payload == p_bridged) {
			skb_push(skb, 2);
			memset(skb->data, 0, 2);
		} else { /* p_routed */
//			skb_pull(skb, ETH_HLEN); //mark by tangping
		}
	}
	}

	skb_debug(skb);

	ATM_SKB(skb)->vcc = atmvcc = brvcc->atmvcc;
	pr_debug("atm_skb(%p)->vcc(%p)->dev(%p)\n", skb, atmvcc, atmvcc->dev);
	atomic_add(skb->truesize, &sk_atm(atmvcc)->sk_wmem_alloc);
	ATM_SKB(skb)->atm_options = atmvcc->atm_options;
	dev->stats.tx_packets++;
	dev->stats.tx_bytes += skb->len;
	if(atmvcc->send == NULL)
	{
		printk("\r\n[br2684_xmit_vcc]++++atmvcc->send == NULL++++");
		dev_kfree_skb(skb);
		return 0;
	}
	atmvcc->send(atmvcc, skb);

#if !defined(CONFIG_CPU_TC3162) && !defined(CONFIG_MIPS_TC3262)//xflu
	if (!atm_may_send(atmvcc, 0)) {
		netif_stop_queue(brvcc->device);
		/*check for race with br2684_pop*/
		if (atm_may_send(atmvcc, 0))
			netif_start_queue(brvcc->device);
	}

#endif
	return 1;
}

static inline struct br2684_vcc *pick_outgoing_vcc(const struct sk_buff *skb,
						   const struct br2684_dev *brdev)
{
	return list_empty(&brdev->brvccs) ? NULL : list_entry_brvcc(brdev->brvccs.next);	/* 1 vcc/dev right now */
}


#if defined(TCSUPPORT_CPU_MT7510)
netdev_tx_t br2684_start_xmit(struct sk_buff *skb,
				     struct net_device *dev)
#else
static netdev_tx_t br2684_start_xmit(struct sk_buff *skb,
				     struct net_device *dev)
#endif
{
	struct br2684_dev *brdev = BRPRIV(dev);
	struct br2684_vcc *brvcc;

	pr_debug("skb_dst(skb)=%p\n", skb_dst(skb));
	read_lock(&devs_lock);
	brvcc = pick_outgoing_vcc(skb, brdev);
	if (brvcc == NULL) {
		pr_debug("no vcc attached to dev %s\n", dev->name);
		dev->stats.tx_errors++;
		dev->stats.tx_carrier_errors++;
		/* netif_stop_queue(dev); */
		dev_kfree_skb(skb);
		read_unlock(&devs_lock);
		return NETDEV_TX_OK;
	}
	/*if the packet length < 60, pad upto 60 bytes. shnwind 2008.4.17*/
        if (skb->len < MIN_PKT_SIZE)
        {
           struct sk_buff *skb2=skb_copy_expand(skb, 0, MIN_PKT_SIZE - skb->len, GFP_ATOMIC);
           dev_kfree_skb(skb);
           if (skb2 == NULL) {
              brvcc->copies_failed++;
	      read_unlock(&devs_lock);
              return NETDEV_TX_OK;
           }
           skb = skb2;		
           memset(skb->tail, 0, MIN_PKT_SIZE - skb->len);		
           skb_put(skb, MIN_PKT_SIZE - skb->len);
        }
	if (!br2684_xmit_vcc(skb, dev, brvcc)) {
		/*
		 * We should probably use netif_*_queue() here, but that
		 * involves added complication.  We need to walk before
		 * we can run.
		 *
		 * Don't free here! this pointer might be no longer valid!
		 */
		dev->stats.tx_errors++;
		dev->stats.tx_fifo_errors++;
	}
	read_unlock(&devs_lock);
	return NETDEV_TX_OK;
}

#if defined(TCSUPPORT_CPU_MT7510)
EXPORT_SYMBOL(br2684_start_xmit);
#endif

/*
 * We remember when the MAC gets set, so we don't override it later with
 * the ESI of the ATM card of the first VC
 */
static int br2684_mac_addr(struct net_device *dev, void *p)
{
	int err = eth_mac_addr(dev, p);
	if (!err)
		BRPRIV(dev)->mac_was_set = 1;
	return err;
}

#ifdef CONFIG_ATM_BR2684_IPFILTER
/* this IOCTL is experimental. */
static int br2684_setfilt(struct atm_vcc *atmvcc, void __user * arg)
{
	struct br2684_vcc *brvcc;
	struct br2684_filter_set fs;

	if (copy_from_user(&fs, arg, sizeof fs))
		return -EFAULT;
	if (fs.ifspec.method != BR2684_FIND_BYNOTHING) {
		/*
		 * This is really a per-vcc thing, but we can also search
		 * by device.
		 */
		struct br2684_dev *brdev;
		read_lock(&devs_lock);
		brdev = BRPRIV(br2684_find_dev(&fs.ifspec));
		if (brdev == NULL || list_empty(&brdev->brvccs) ||
		    brdev->brvccs.next != brdev->brvccs.prev)	/* >1 VCC */
			brvcc = NULL;
		else
			brvcc = list_entry_brvcc(brdev->brvccs.next);
		read_unlock(&devs_lock);
		if (brvcc == NULL)
			return -ESRCH;
	} else
		brvcc = BR2684_VCC(atmvcc);
	memcpy(&brvcc->filter, &fs.filter, sizeof(brvcc->filter));
	return 0;
}

/* Returns 1 if packet should be dropped */
static inline int
packet_fails_filter(__be16 type, struct br2684_vcc *brvcc, struct sk_buff *skb)
{
	if (brvcc->filter.netmask == 0)
		return 0;	/* no filter in place */
	if (type == htons(ETH_P_IP) &&
	    (((struct iphdr *)(skb->data))->daddr & brvcc->filter.
	     netmask) == brvcc->filter.prefix)
		return 0;
	if (type == htons(ETH_P_ARP))
		return 0;
	/*
	 * TODO: we should probably filter ARPs too.. don't want to have
	 * them returning values that don't make sense, or is that ok?
	 */
	return 1;		/* drop */
}
#endif /* CONFIG_ATM_BR2684_IPFILTER */

static void br2684_close_vcc(struct br2684_vcc *brvcc)
{
	pr_debug("removing VCC %p from dev %p\n", brvcc, brvcc->device);
	write_lock_irq(&devs_lock);
	list_del(&brvcc->brvccs);
	write_unlock_irq(&devs_lock);
	brvcc->atmvcc->user_back = NULL;	/* what about vcc->recvq ??? */
	brvcc->old_push(brvcc->atmvcc, NULL);	/* pass on the bad news */
	kfree(brvcc);
	module_put(THIS_MODULE);
}
#if defined(CONFIG_CPU_TC3162) || defined(CONFIG_MIPS_TC3262)
static void br2684_destroy(struct atm_vcc *atmvcc)
{
	struct br2684_vcc *brvcc = BR2684_VCC(atmvcc);
	struct net_device *net_dev = brvcc->device;
	struct br2684_dev *brdev = BRPRIV(net_dev);
#ifdef CONFIG_SMUX
#if !defined(TCSUPPORT_CT)
	unsigned char ifNum = 0;
#endif
#endif

#ifdef CONFIG_SMUX
#if !defined(TCSUPPORT_CT) 
	if(check_smuxIf_exist_hook != NULL) {
		if((ifNum = check_smuxIf_exist_hook(brvcc->device)) > 0) {
			printk("\n==> Exist %d smux interfaces, just return and do not close PVC\n", ifNum);
			return;//If smux interface exist, just return and do not close PVC
		}
	}
#endif
#endif
	br2684_close_vcc(brvcc);
	if (list_empty(&brdev->brvccs)) {
			write_lock_irq(&devs_lock);
			list_del(&brdev->br2684_devs);
			write_unlock_irq(&devs_lock);
			unregister_netdev(net_dev);
			free_netdev(net_dev);
		}
}
#endif

#ifdef TCSUPPORT_SHARE_PVC
static unsigned char s_macaddr[8];
static int get_MAC_from_flash(unsigned char *mac_addr)
{
	char flash_mac_addr[6];
	int i;
	for (i=0; i<6; i++) {
		flash_mac_addr[i] = READ_FLASH_BYTE(flash_base + 0xff48 + i);
	}
	if( (flash_mac_addr[0] == 0) && (flash_mac_addr[1] == 0) && (flash_mac_addr[2] == 0) &&
	    (flash_mac_addr[3] == 0) && (flash_mac_addr[4] == 0) && (flash_mac_addr[5] == 0) ) {
		printk(KERN_INFO "The MAC address in flash is null!\n");
		return -1;
	}
	else
	{
		memcpy(mac_addr, flash_mac_addr, 6);
		printk("\n Mac = %x:%x:%x:%x:%x:%x",s_macaddr[0],s_macaddr[1],s_macaddr[2],s_macaddr[3],s_macaddr[4],s_macaddr[5]);
	}

	return 0;
}

struct atm_vcc* find_next_atmvcc(short vpi,int vci,struct atm_vcc* vcc)
{
	struct list_head *lh;
	struct net_device *net_dev;
	struct br2684_vcc *brvcc ;
	struct br2684_dev *brdev;
	struct atm_vcc *atmvcc;
	list_for_each(lh, &br2684_devs)
	{
		net_dev = list_entry_brdev(lh);
		brdev = BRPRIV(net_dev);
		brvcc = list_empty(&brdev->brvccs) ? NULL :list_entry_brvcc(brdev->brvccs.next);
		if (brvcc == NULL)
			continue;
		atmvcc = brvcc->atmvcc;
		if (atmvcc == NULL)
			continue;
		if (atmvcc->vpi == vpi && atmvcc->vci == vci && atmvcc != vcc)
		{
			return atmvcc;
		}
	}
	return NULL;
}

static void copy_to_others(short vpi,int vci,struct sk_buff *skb)
{
	struct list_head *lh;
	struct net_device *net_dev;
	struct br2684_vcc *brvcc ;
	struct br2684_dev *brdev;
	struct atm_vcc *atmvcc;
	struct sk_buff *new_skb;

	list_for_each(lh, &br2684_devs)
	{
		net_dev = list_entry_brdev(lh);
		brdev = BRPRIV(net_dev);
		brvcc = list_empty(&brdev->brvccs) ? NULL :list_entry_brvcc(brdev->brvccs.next);
		if (brvcc == NULL)
		{
			continue;
		}
		atmvcc = brvcc->atmvcc;
		if (atmvcc == NULL)
		{
			continue;
		}
		if (atmvcc->vpi != vpi || atmvcc->vci != vci )
		{
			continue;
		}
		new_skb = skb_copy(skb,GFP_ATOMIC);
		if (new_skb==NULL)
		{
			continue;
		}
		net_dev->stats.rx_packets++;
		net_dev->stats.rx_bytes += skb->len;
		new_skb->pkt_type = PACKET_BROADCAST;
		new_skb->dev = 	net_dev;
		#if defined(TCSUPPORT_CPU_MT7510)
		if (napi_enable)
		{
			netif_receive_skb(new_skb);
		}else
		#endif
		{
			netif_rx(new_skb);
		}
	}
	if (skb)
		dev_kfree_skb(skb);
	return ;
}

static void mod_share_atmdev(short vpi,int vci,struct sk_buff *skb)
{
	struct list_head *lh;
	struct net_device *net_dev;
	struct br2684_vcc *brvcc ;
	struct br2684_dev *brdev;
	struct atm_vcc *atmvcc;
	struct ethhdr* eth = eth_hdr(skb);
	struct net_device *bridge_dev = NULL;


	list_for_each(lh, &br2684_devs)
	{
		net_dev = list_entry_brdev(lh);
		brdev = BRPRIV(net_dev);
		brvcc = list_empty(&brdev->brvccs) ? NULL :list_entry_brvcc(brdev->brvccs.next);
		if (brvcc == NULL)
			continue;
		atmvcc = brvcc->atmvcc;
		if (atmvcc == NULL)
			continue;
		if (atmvcc->vpi == vpi && atmvcc->vci == vci && !compare_ether_addr(eth->h_dest, net_dev->dev_addr) )
		{
			skb->dev = net_dev;
			skb->pkt_type = PACKET_HOST;
			return ;
		}
		if (atmvcc->vpi == vpi && atmvcc->vci == vci && !compare_ether_addr(net_dev->dev_addr,s_macaddr))
		{
			bridge_dev = net_dev;
		}
	}
	if (bridge_dev)
	{
		skb->dev = bridge_dev;
		skb->pkt_type = PACKET_HOST;
	}
	return ;
}
#endif

/* when AAL5 PDU comes in: */
#ifndef TCSUPPORT_MT7510_FE
__IMEM
#endif
 static void br2684_push(struct atm_vcc *atmvcc, struct sk_buff *skb)
{
	struct br2684_vcc *brvcc = BR2684_VCC(atmvcc);
	struct net_device *net_dev = brvcc->device;
	struct br2684_dev *brdev = BRPRIV(net_dev);
	int err = 0;

	pr_debug("\n");

#if !defined(TCSUPPORT_CPU_MT7510)
#ifdef TCSUPPORT_RA_HWNAT
	int hwnatFwd = 0;
#endif
#endif


	if (unlikely(skb == NULL)) {
#if defined(CONFIG_CPU_TC3162) || defined(CONFIG_MIPS_TC3262)
		br2684_destroy(atmvcc);
#else
		/* skb==NULL means VCC is being destroyed */
		br2684_close_vcc(brvcc);
		if (list_empty(&brdev->brvccs)) {
			write_lock_irq(&devs_lock);
			list_del(&brdev->br2684_devs);
			write_unlock_irq(&devs_lock);
			unregister_netdev(net_dev);
			free_netdev(net_dev);
		}
#endif
		return;
	}
	skb_debug(skb);
	atm_return(atmvcc, skb->truesize);
	pr_debug("skb from brdev %p\n", brdev);

#if defined(TCSUPPORT_CPU_MT7510)
	// hardware handle mpoa header
	if (br2684_push_hook){
		err = br2684_push_hook(atmvcc, skb);
		if (err){
			goto error;
		}	
	} 
	// soft handle mpoa header
	else 
#endif
	{
	if (brvcc->encaps == e_llc) {
	//	if (skb->len > 7 && skb->data[7] == 0x01)
	//		__skb_trim(skb, skb->len - 4);

		/* accept packets that have "ipv[46]" in the snap header */
		if ((skb->len >= (sizeof(llc_oui_ipv4))) &&
		    (memcmp(skb->data, llc_oui_ipv4,
			    sizeof(llc_oui_ipv4) - BR2684_ETHERTYPE_LEN) == 0) &&
 				(brdev->payload == p_routed))//add this line to fix Bug#8296 --Trey
		{
			if (memcmp(skb->data + 6, ethertype_ipv6,
				   sizeof(ethertype_ipv6)) == 0)
				skb->protocol = htons(ETH_P_IPV6);
			else if (memcmp(skb->data + 6, ethertype_ipv4,
					sizeof(ethertype_ipv4)) == 0)
				skb->protocol = htons(ETH_P_IP);
			else
				goto error;
			skb_pull(skb, sizeof(llc_oui_ipv4));
			skb_reset_network_header(skb);
			skb->pkt_type = PACKET_HOST;
		/*
		 * Let us waste some time for checking the encapsulation.
		 * Note, that only 7 char is checked so frames with a valid FCS
		 * are also accepted (but FCS is not checked of course).
		 */
		} else if ((skb->len >= sizeof(llc_oui_pid_pad)) &&
			   (memcmp(skb->data, llc_oui_pid_pad, 7) == 0) &&
				(brdev->payload == p_bridged)) {
				if (skb->data[7] == 0x01)
					__skb_trim(skb, skb->len - 4);
			skb_pull(skb, sizeof(llc_oui_pid_pad));
			skb->protocol = eth_type_trans(skb, net_dev);

				#if !defined(TCSUPPORT_CPU_MT7510)
			#ifdef TCSUPPORT_RA_HWNAT
			hwnatFwd = 1;
			#endif
				#endif

			#ifdef TCSUPPORT_BRIDGE_FASTPATH
#if !defined(TCSUPPORT_CT) 
			skb->fb_flags |= FB_WAN_ENABLE;
#endif
			
			#endif
		} else
			goto error;

	} else { /* e_vc */
		if (brdev->payload == p_routed) {
			struct iphdr *iph;

			skb_reset_network_header(skb);
			iph = ip_hdr(skb);
			if (iph->version == 4)
				skb->protocol = htons(ETH_P_IP);
			else if (iph->version == 6)
				skb->protocol = htons(ETH_P_IPV6);
			else
				goto error;
			skb->pkt_type = PACKET_HOST;
		} else { /* p_bridged */
			/* first 2 chars should be 0 */
			if (*((u16 *) (skb->data)) != 0)
				goto error;
			skb_pull(skb, BR2684_PAD_LEN);
			skb->protocol = eth_type_trans(skb, net_dev);

				#if !defined(TCSUPPORT_CPU_MT7510)
#ifdef TCSUPPORT_RA_HWNAT
			hwnatFwd = 1;
#endif
				#endif

#ifdef TCSUPPORT_BRIDGE_FASTPATH
#if !defined(TCSUPPORT_CT) 
			skb->fb_flags |= FB_WAN_ENABLE;
#endif
#endif

		}
	}
	}

#ifdef CONFIG_ATM_BR2684_IPFILTER
	if (unlikely(packet_fails_filter(skb->protocol, brvcc, skb)))
		goto dropped;
#endif /* CONFIG_ATM_BR2684_IPFILTER */
	skb->dev = net_dev;
#ifdef TCSUPPORT_SHARE_PVC
	if (get_share_refcnt(atmvcc->vpi,atmvcc->vci) > 1)
	{
		if (skb->pkt_type == PACKET_BROADCAST ||skb->pkt_type == PACKET_MULTICAST )
		{
			return copy_to_others(atmvcc->vpi,atmvcc->vci,skb);
		}
		else
		{
			mod_share_atmdev(atmvcc->vpi,atmvcc->vci,skb);
		}
	}
	brdev = BRPRIV(skb->dev);
#endif
	ATM_SKB(skb)->vcc = atmvcc;	/* needed ? */
	pr_debug("received packet's protocol: %x\n", ntohs(skb->protocol));
	skb_debug(skb);
	/* sigh, interface is down? */
	if (unlikely(!(net_dev->flags & IFF_UP)))
		goto dropped;
	net_dev->stats.rx_packets++;
	net_dev->stats.rx_bytes += skb->len;
	memset(ATM_SKB(skb), 0, sizeof(struct atm_skb_data));

	#if !defined(TCSUPPORT_CPU_MT7510)
#ifdef TCSUPPORT_RA_HWNAT
	if (hwnatFwd) {
		if (ra_sw_nat_hook_set_magic)  
			ra_sw_nat_hook_set_magic(skb, FOE_MAGIC_ATM);

		if (ra_sw_nat_hook_rx != NULL) {
			if (ra_sw_nat_hook_rx(skb) == 0) 
				return;
		}
	}
#endif
	#endif


#if defined(TCSUPPORT_CPU_MT7510)
	if (napi_enable)
	{
		netif_receive_skb(skb);
	} 
	else 
#endif
	{
	netif_rx(skb);
	}

	return;

dropped:
	net_dev->stats.rx_dropped++;
	goto free_skb;
error:
	net_dev->stats.rx_errors++;
free_skb:
	dev_kfree_skb(skb);
}

/*
 * Assign a vcc to a dev
 * Note: we do not have explicit unassign, but look at _push()
 */
static int br2684_regvcc(struct atm_vcc *atmvcc, void __user * arg)
{
	struct sk_buff_head queue;
	int err;
	struct br2684_vcc *brvcc;
	struct sk_buff *skb, *tmp;
	struct sk_buff_head *rq;
	struct br2684_dev *brdev;
	struct net_device *net_dev;
	struct atm_backend_br2684 be;
	unsigned long flags;

	if (copy_from_user(&be, arg, sizeof be))
		return -EFAULT;

#if defined(TCSUPPORT_CPU_MT7510)
	if (br2684_init_hook){
		printk("enter br2684_init_hook function\n");
		err = br2684_init_hook(atmvcc, be.encaps);
		if (err){
			printk("br2684_init_hook: error detected\n");
			return err;
		} else {
			printk("br2684_init_hook: success\n");
		}
	} else {
		printk("br2684_init_hook function: (NULL)\n");
	}
#endif

	brvcc = kzalloc(sizeof(struct br2684_vcc), GFP_KERNEL);
	if (!brvcc)
		return -ENOMEM;
	write_lock_irq(&devs_lock);
	net_dev = br2684_find_dev(&be.ifspec);
	if (net_dev == NULL) {
		pr_err("tried to attach to non-existant device\n");
		err = -ENXIO;
		goto error;
	}
#ifdef CONFIG_NET_SCHED  /*Rodney_20091115*/
	atmvcc->_dev = net_dev;
#endif	
	brdev = BRPRIV(net_dev);
	if (atmvcc->push == NULL) {
		err = -EBADFD;
		goto error;
	}
	if (!list_empty(&brdev->brvccs)) {
		/* Only 1 VCC/dev right now */
		err = -EEXIST;
		goto error;
	}
	if (be.fcs_in != BR2684_FCSIN_NO ||
	    be.fcs_out != BR2684_FCSOUT_NO ||
	    be.fcs_auto || be.has_vpiid || be.send_padding ||
	    (be.encaps != BR2684_ENCAPS_VC &&
	     be.encaps != BR2684_ENCAPS_LLC) ||
	    be.min_size != 0) {
		err = -EINVAL;
		goto error;
	}
	pr_debug("vcc=%p, encaps=%d, brvcc=%p\n", atmvcc, be.encaps, brvcc);
	if (list_empty(&brdev->brvccs) && !brdev->mac_was_set) {
		unsigned char *esi = atmvcc->dev->esi;
		if (esi[0] | esi[1] | esi[2] | esi[3] | esi[4] | esi[5])
			memcpy(net_dev->dev_addr, esi, net_dev->addr_len);
		else
			net_dev->dev_addr[2] = 1;
	}
	list_add(&brvcc->brvccs, &brdev->brvccs);
	write_unlock_irq(&devs_lock);
	brvcc->device = net_dev;
	brvcc->atmvcc = atmvcc;
	atmvcc->user_back = brvcc;
	brvcc->encaps = (enum br2684_encaps)be.encaps;
	brvcc->old_push = atmvcc->push;
	brvcc->old_pop = atmvcc->pop;
	barrier();
	atmvcc->push = br2684_push;
	atmvcc->pop = br2684_pop;

	__skb_queue_head_init(&queue);
	rq = &sk_atm(atmvcc)->sk_receive_queue;

	spin_lock_irqsave(&rq->lock, flags);
	skb_queue_splice_init(rq, &queue);
	spin_unlock_irqrestore(&rq->lock, flags);

	skb_queue_walk_safe(&queue, skb, tmp) {
		struct net_device *dev = skb->dev;
		if(dev != NULL){
			dev->stats.rx_bytes -= skb->len;
			dev->stats.rx_packets--;
		}
		br2684_push(atmvcc, skb);
	}
	/* initialize netdev carrier state */
	if (atmvcc->dev->signal == ATM_PHY_SIG_LOST)
		netif_carrier_off(net_dev);
	else
		netif_carrier_on(net_dev);

	__module_get(THIS_MODULE);
	return 0;

error:
	write_unlock_irq(&devs_lock);
	kfree(brvcc);
	return err;
}

static const struct net_device_ops br2684_netdev_ops = {
	.ndo_start_xmit 	= br2684_start_xmit,
	.ndo_set_mac_address	= br2684_mac_addr,
	.ndo_change_mtu		= eth_change_mtu,
	.ndo_validate_addr	= eth_validate_addr,
};

static const struct net_device_ops br2684_netdev_ops_routed = {
	.ndo_start_xmit 	= br2684_start_xmit,
	.ndo_set_mac_address	= br2684_mac_addr,
	.ndo_change_mtu		= eth_change_mtu
};

static void br2684_setup(struct net_device *netdev)
{
	struct br2684_dev *brdev = BRPRIV(netdev);

	ether_setup(netdev);
	brdev->net_dev = netdev;

	netdev->netdev_ops = &br2684_netdev_ops;

	INIT_LIST_HEAD(&brdev->brvccs);
}

static void br2684_setup_routed(struct net_device *netdev)
{
	struct br2684_dev *brdev = BRPRIV(netdev);

	brdev->net_dev = netdev;
	netdev->hard_header_len = 0;
	netdev->netdev_ops = &br2684_netdev_ops_routed;
	netdev->addr_len = 0;
	netdev->mtu = 1500;
	netdev->type = ARPHRD_PPP;
	//netdev->flags = IFF_POINTOPOINT | IFF_NOARP | IFF_MULTICAST;
	netdev->flags = IFF_NOARP | IFF_MULTICAST;
	netdev->tx_queue_len = 100;
	INIT_LIST_HEAD(&brdev->brvccs);
}

static int br2684_create(void __user *arg)
{
	int err;
	struct net_device *netdev;
	struct br2684_dev *brdev;
	struct atm_newif_br2684 ni;
	enum br2684_payload payload;

	pr_debug("\n");

	if (copy_from_user(&ni, arg, sizeof ni))
		return -EFAULT;

	if (ni.media & BR2684_FLAG_ROUTED)
		payload = p_routed;
	else
		payload = p_bridged;
	ni.media &= 0xffff;	/* strip flags */

	if (ni.media != BR2684_MEDIA_ETHERNET || ni.mtu != 1500)
		return -EINVAL;

	netdev = alloc_netdev(sizeof(struct br2684_dev),
			      ni.ifname[0] ? ni.ifname : "nas%d",
			      (payload == p_routed) ?
			      br2684_setup_routed : br2684_setup);
	if (!netdev)
		return -ENOMEM;

	brdev = BRPRIV(netdev);

	pr_debug("registered netdev %s\n", netdev->name);
	/* open, stop, do_ioctl ? */
	err = register_netdev(netdev);
	if (err < 0) {
		pr_err("register_netdev failed\n");
		free_netdev(netdev);
		return err;
	}

	write_lock_irq(&devs_lock);

	brdev->payload = payload;

#if defined(TCSUPPORT_CPU_MT7510)
	if (br2684_config_hook){
		br2684_config_hook(payload, 0);
	} else {
		printk("br2684_config_hook function: (NULL)\n");
	}
#endif

	if (list_empty(&br2684_devs)) {
		/* 1st br2684 device */
		brdev->number = 1;
	} else
		brdev->number = BRPRIV(list_entry_brdev(br2684_devs.prev))->number + 1;

	list_add_tail(&brdev->br2684_devs, &br2684_devs);
	write_unlock_irq(&devs_lock);
	return 0;
}

/*
 * This handles ioctls actually performed on our vcc - we must return
 * -ENOIOCTLCMD for any unrecognized ioctl
 */
static int br2684_ioctl(struct socket *sock, unsigned int cmd,
			unsigned long arg)
{
	struct atm_vcc *atmvcc = ATM_SD(sock);
	void __user *argp = (void __user *)arg;
	atm_backend_t b;
	int err;
	switch (cmd) {
	case ATM_SETBACKEND:
	case ATM_NEWBACKENDIF:
		err = get_user(b, (atm_backend_t __user *) argp);
		if (err)
			return -EFAULT;
		if (b != ATM_BACKEND_BR2684)
			return -ENOIOCTLCMD;
		if (!capable(CAP_NET_ADMIN))
			return -EPERM;
		if (cmd == ATM_SETBACKEND)
			return br2684_regvcc(atmvcc, argp);
		else
			return br2684_create(argp);
#ifdef CONFIG_ATM_BR2684_IPFILTER
	case BR2684_SETFILT:
		if (atmvcc->push != br2684_push)
			return -ENOIOCTLCMD;
		if (!capable(CAP_NET_ADMIN))
			return -EPERM;
		err = br2684_setfilt(atmvcc, argp);

		return err;
#endif /* CONFIG_ATM_BR2684_IPFILTER */
	}
	return -ENOIOCTLCMD;
}

static struct atm_ioctl br2684_ioctl_ops = {
	.owner = THIS_MODULE,
	.ioctl = br2684_ioctl,
};

#ifdef CONFIG_PROC_FS
static void *br2684_seq_start(struct seq_file *seq, loff_t * pos)
	__acquires(devs_lock)
{
	read_lock(&devs_lock);
	return seq_list_start(&br2684_devs, *pos);
}

static void *br2684_seq_next(struct seq_file *seq, void *v, loff_t * pos)
{
	return seq_list_next(v, &br2684_devs, pos);
}

static void br2684_seq_stop(struct seq_file *seq, void *v)
	__releases(devs_lock)
{
	read_unlock(&devs_lock);
}

static int br2684_seq_show(struct seq_file *seq, void *v)
{
	const struct br2684_dev *brdev = list_entry(v, struct br2684_dev,
						    br2684_devs);
	const struct net_device *net_dev = brdev->net_dev;
	const struct br2684_vcc *brvcc;

	seq_printf(seq, "dev %.16s: num=%d, mac=%pM (%s)\n",
		   net_dev->name,
		   brdev->number,
		   net_dev->dev_addr,
		   brdev->mac_was_set ? "set" : "auto");

	list_for_each_entry(brvcc, &brdev->brvccs, brvccs) {
		seq_printf(seq, "  vcc %d.%d.%d: encaps=%s payload=%s"
			   ", failed copies %u/%u"
			   "\n", brvcc->atmvcc->dev->number,
			   brvcc->atmvcc->vpi, brvcc->atmvcc->vci,
			   (brvcc->encaps == e_llc) ? "LLC" : "VC",
			   (brdev->payload == p_bridged) ? "bridged" : "routed",
			   brvcc->copies_failed, brvcc->copies_needed);
#ifdef CONFIG_ATM_BR2684_IPFILTER
#define b1(var, byte)	((u8 *) &brvcc->filter.var)[byte]
#define bs(var)		b1(var, 0), b1(var, 1), b1(var, 2), b1(var, 3)
		if (brvcc->filter.netmask != 0)
			seq_printf(seq, "    filter=%d.%d.%d.%d/"
				   "%d.%d.%d.%d\n", bs(prefix), bs(netmask));
#undef bs
#undef b1
#endif /* CONFIG_ATM_BR2684_IPFILTER */
	}
	return 0;
}

static const struct seq_operations br2684_seq_ops = {
	.start = br2684_seq_start,
	.next = br2684_seq_next,
	.stop = br2684_seq_stop,
	.show = br2684_seq_show,
};

static int br2684_proc_open(struct inode *inode, struct file *file)
{
	return seq_open(file, &br2684_seq_ops);
}

static const struct file_operations br2684_proc_ops = {
	.owner = THIS_MODULE,
	.open = br2684_proc_open,
	.read = seq_read,
	.llseek = seq_lseek,
	.release = seq_release,
};

extern struct proc_dir_entry *atm_proc_root;	/* from proc.c */
#endif /* CONFIG_PROC_FS */

#if defined(TCSUPPORT_CPU_MT7510)
int br2684_init(void)
#else
static int __init br2684_init(void)
#endif
{
#ifdef CONFIG_PROC_FS
	struct proc_dir_entry *p;
	p = proc_create("br2684", 0, atm_proc_root, &br2684_proc_ops);
	if (p == NULL)
		return -ENOMEM;
#endif
	register_atm_ioctl(&br2684_ioctl_ops);
	register_atmdevice_notifier(&atm_dev_notifier);
#ifdef TCSUPPORT_SHARE_PVC
	memset(s_macaddr,0,sizeof(s_macaddr));
	get_MAC_from_flash(s_macaddr);
#endif
	return 0;
}


#if defined(TCSUPPORT_CPU_MT7510)
void br2684_exit(void)
#else
static void __exit br2684_exit(void)
#endif
{
	struct net_device *net_dev;
	struct br2684_dev *brdev;
	struct br2684_vcc *brvcc;
	deregister_atm_ioctl(&br2684_ioctl_ops);

#ifdef CONFIG_PROC_FS
	remove_proc_entry("br2684", atm_proc_root);
#endif


	unregister_atmdevice_notifier(&atm_dev_notifier);

	while (!list_empty(&br2684_devs)) {
		net_dev = list_entry_brdev(br2684_devs.next);
		brdev = BRPRIV(net_dev);
		while (!list_empty(&brdev->brvccs)) {
			brvcc = list_entry_brvcc(brdev->brvccs.next);
			br2684_close_vcc(brvcc);
		}

		list_del(&brdev->br2684_devs);
		unregister_netdev(net_dev);
		free_netdev(net_dev);
	}
}


#if defined(TCSUPPORT_CPU_MT7510)
EXPORT_SYMBOL(br2684_init);
EXPORT_SYMBOL(br2684_exit);
#endif


#if !defined(TCSUPPORT_CPU_MT7510)
module_init(br2684_init);
module_exit(br2684_exit);
#endif


MODULE_AUTHOR("Marcell GAL");
MODULE_DESCRIPTION("RFC2684 bridged protocols over ATM/AAL5");
MODULE_LICENSE("GPL");
