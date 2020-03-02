/*
 *	Handle incoming frames
 *	Linux ethernet bridge
 *
 *	Authors:
 *	Lennert Buytenhek		<buytenh@gnu.org>
 *
 *	This program is free software; you can redistribute it and/or
 *	modify it under the terms of the GNU General Public License
 *	as published by the Free Software Foundation; either version
 *	2 of the License, or (at your option) any later version.
 */

#include <linux/slab.h>
#include <linux/kernel.h>
#include <linux/netdevice.h>
#include <linux/etherdevice.h>
#include <linux/netfilter_bridge.h>
#include "br_private.h"

#if !defined(TCSUPPORT_CT) 
#ifdef CONFIG_PORT_BINDING
extern int (*portbind_sw_hook)(void);
extern int (*portbind_check_hook)(char *inIf, char *outIf);
#endif
#endif

#ifdef TCSUPPORT_EPON_MAPPING
extern int (*xpon_mode_get_hook)(void);
extern int (*epon_sfu_mapping_hook)(struct sk_buff *skb, int port);
#endif

/* Bridge group multicast address 802.1d (pg 51). */
const u8 br_group_address[ETH_ALEN] = { 0x01, 0x80, 0xc2, 0x00, 0x00, 0x00 };

#if defined(TCSUPPORT_VLAN_TAG)
extern int (*remove_vtag_hook)(struct sk_buff *skb, struct net_device *dev);
#endif

__IMEM static int br_pass_frame_up(struct sk_buff *skb)
{
	struct net_device *indev, *brdev = BR_INPUT_SKB_CB(skb)->brdev;
	struct net_bridge *br = netdev_priv(brdev);
	struct br_cpu_netstats *brstats = this_cpu_ptr(br->stats);

	u64_stats_update_begin(&brstats->syncp);
	brstats->rx_packets++;
	brstats->rx_bytes += skb->len;
	u64_stats_update_end(&brstats->syncp);

	indev = skb->dev;
	skb->dev = brdev;

	return NF_HOOK(NFPROTO_BRIDGE, NF_BR_LOCAL_IN, skb, indev, NULL,
		       netif_receive_skb);
}

/* note: already called with rcu_read_lock */
__IMEM int br_handle_frame_finish(struct sk_buff *skb)
{
	const unsigned char *dest = eth_hdr(skb)->h_dest;
	struct net_bridge_port *p = br_port_get_rcu(skb->dev);
	struct net_bridge *br;
	struct net_bridge_fdb_entry *dst;
	struct net_bridge_mdb_entry *mdst;
	struct sk_buff *skb2;

	if (!p || p->state == BR_STATE_DISABLED)
		goto drop;

	/* insert into forwarding database after filtering to avoid spoofing */
	br = p->br;
#if defined(TCSUPPORT_HWNAT)
	br_fdb_update(br, p, eth_hdr(skb)->h_source, skb);
#else
	br_fdb_update(br, p, eth_hdr(skb)->h_source);
#endif
	if (is_multicast_ether_addr(dest) &&
	    br_multicast_rcv(br, p, skb))
		goto drop;

	if (p->state == BR_STATE_LEARNING)
		goto drop;

	BR_INPUT_SKB_CB(skb)->brdev = br->dev;

	/* The packet skb2 goes to the local host (NULL to skip). */
	skb2 = NULL;

	if (br->dev->flags & IFF_PROMISC)
		skb2 = skb;

	dst = NULL;

	if (is_multicast_ether_addr(dest)) {
		mdst = br_mdb_get(br, skb);
		if (mdst || BR_INPUT_SKB_CB_MROUTERS_ONLY(skb)) {
			if ((mdst && !hlist_unhashed(&mdst->mglist)) ||
			    br_multicast_is_router(br))
				skb2 = skb;
#if defined(CONFIG_PORT_BINDING) || defined(TCSUPPORT_PORTBIND)
#if !defined(TCSUPPORT_CT) 
		#if defined(TCSUPPORT_FTP_THROUGHPUT)
			if (portbind_sw_hook) 
		#else
			if (portbind_sw_hook && (portbind_sw_hook() == 1)) 
		#endif
			{	
				br_multicast_pb_forward(mdst, p, skb, skb2);
			}
#endif
			else {
				br_multicast_forward(mdst, skb, skb2);
			}
#else			
			br_multicast_forward(mdst, skb, skb2);
#endif
			skb = NULL;
			if (!skb2)
				goto out;
		} else
#ifdef TCSUPPORT_IGMPSNOOPING_ENHANCE
		{
#endif
			skb2 = skb;
#ifdef TCSUPPORT_IGMPSNOOPING_ENHANCE
			/*drop the muticast packet if it is not in the muticast table*/
			if(br_multicast_should_drop(br, skb)){
				br_multicast_dump_packet_info(skb, 1);
				goto up;
			}
		}	
#endif	
		br->dev->stats.multicast++;
	} else
	{
#if defined(CONFIG_PORT_BINDING) || defined(TCSUPPORT_PORTBIND)
#if !defined(TCSUPPORT_CT) 
	#if defined(TCSUPPORT_FTP_THROUGHPUT)
		if (portbind_sw_hook) 
	#else
		if (portbind_sw_hook && (portbind_sw_hook() == 1)) 
	#endif
		{
		//printk("In port is %s\n", p->dev->name);
			dst = __br_fdb_pb_get(br, p, dest);
		}
#endif
		else {
			dst = __br_fdb_get(br, dest);
		}
#else
		dst = __br_fdb_get(br, dest);
#endif

		if (dst && dst->is_local) {
		skb2 = skb;
		/* Do not forward the packet since it's local. */
		skb = NULL;
	}
	}

	if (skb) {
		if (dst)
			br_forward(dst->dst, skb, skb2);
		else
		{
#if defined(CONFIG_PORT_BINDING) || defined(TCSUPPORT_PORTBIND)
#if !defined(TCSUPPORT_CT) 
		#if defined(TCSUPPORT_FTP_THROUGHPUT)
			if (portbind_sw_hook) 
		#else
			if (portbind_sw_hook && (portbind_sw_hook() == 1)) 
		#endif
			{	
				br_flood_pb_forward(br, p, skb, skb2);
			}
#endif
			else {
				br_flood_forward(br, skb, skb2);
			}
#else
			br_flood_forward(br, skb, skb2);
#endif
		}
	}
#ifdef TCSUPPORT_IGMPSNOOPING_ENHANCE	
up:
#endif
	if (skb2)
		return br_pass_frame_up(skb2);

out:
	return 0;
drop:
	kfree_skb(skb);
	goto out;
}

/* note: already called with rcu_read_lock */
static int br_handle_local_finish(struct sk_buff *skb)
{
	struct net_bridge_port *p = br_port_get_rcu(skb->dev);

#if defined(TCSUPPORT_HWNAT)
	br_fdb_update(p->br, p, eth_hdr(skb)->h_source, skb);
#else
	br_fdb_update(p->br, p, eth_hdr(skb)->h_source);
#endif

	return 0;	 /* process further */
}

/* Does address match the link local multicast address.
 * 01:80:c2:00:00:0X
 */
static inline int is_link_local(const unsigned char *dest)
{
	__be16 *a = (__be16 *)dest;
	static const __be16 *b = (const __be16 *)br_group_address;
	static const __be16 m = cpu_to_be16(0xfff0);

	return ((a[0] ^ b[0]) | (a[1] ^ b[1]) | ((a[2] ^ b[2]) & m)) == 0;
}

/*
 * Return NULL if skb is handled
 * note: already called with rcu_read_lock
 */
__IMEM struct sk_buff *br_handle_frame(struct sk_buff *skb)
{
	struct net_bridge_port *p;
	const unsigned char *dest = eth_hdr(skb)->h_dest;
	int (*rhook)(struct sk_buff *skb);

#if defined(TCSUPPORT_VLAN_TAG) //Byron
	struct net_bridge *br;
	struct vlan_hdr *vhdr;
	u16 vlan_id; // vlan_id
	u16 vlan_tci; // Vlan field
#endif

	if (skb->pkt_type == PACKET_LOOPBACK)
		return skb;

	if (!is_valid_ether_addr(eth_hdr(skb)->h_source))
		goto drop;

	skb = skb_share_check(skb, GFP_ATOMIC);
	if (!skb)
		return NULL;

	p = br_port_get_rcu(skb->dev);

	if (unlikely(is_link_local(dest))) {
		/* Pause frames shouldn't be passed up by driver anyway */
		if (skb->protocol == htons(ETH_P_PAUSE))
			goto drop;

		/* If STP is turned off, then forward */
		if (p->br->stp_enabled == BR_NO_STP && dest[5] == 0)
			goto forward;

		if (NF_HOOK(NFPROTO_BRIDGE, NF_BR_LOCAL_IN, skb, skb->dev,
			    NULL, br_handle_local_finish))
			return NULL;	/* frame consumed by filter */
		else
			return skb;	/* continue processing */
	}

#if defined(TCSUPPORT_VLAN_TAG)
	br = p->br;
	if (br->rm_vlantag == true) {
		if((skb->protocol==htons(ETH_P_8021Q)) && (skb->dev->name[0]=='n')){

			vhdr = (struct vlan_hdr *)skb->data;
			vlan_tci = ntohs(vhdr->h_vlan_TCI);
			vlan_id = vlan_tci & VLAN_VID_MASK;

			// if 8021q active & vlan_id match to do remove
			// when 8021q active only vlan_id match from WAN to LAN
			// this procedure will handle 8021q de-active. VLAN pkt can transparent from WAN to LAN, Byron
			if(skb->vlan_tags[0]==vlan_id){
				if (remove_vtag_hook) {
					if (remove_vtag_hook(skb, skb->dev) == -1) {
						/* must free skb !! */					
						kfree_skb(skb);					
						return -1;
					}
				}
			}
		}
	}
#endif

forward:
	switch (p->state) {
	case BR_STATE_FORWARDING:
#if 1 //defined(CONFIG_PORT_BINDING) || defined(TCSUPPORT_REDIRECT_WITH_PORTMASK)
		/*_____________________________________________
		** remark packet from different lan interfac,  
		** use the highest 4 bits.
		**
		** eth0	  	0x10000000
		** eth0.1 	0x10000000
		** eth0.2 	0x20000000
		** eth0.3 	0x30000000
		** eth0.4 	0x40000000
		** ra0	  	0x50000000
		** ra1    	0x60000000
		** ra2    	0x70000000
		** ra3    	0x80000000
		** usb0   	0x90000000
		** wds0~3  	0xA0000000
		**_________________________________________
		*/
#define		WLAN_DEV_OFFSET 		5
#define		USB_DEV_OFFSET		9
#define		WDS_DEV_OFFSET		10
#define		DEV_OFFSET			28
		switch (skb->dev->name[0]) {
			case 'e':
		#ifdef TCSUPPORT_TC2031
				/* device name format must be eth0 */
				skb->mark |= 0x10000000;
		#else
				/* device name format must be eth0.x */
				if (skb->dev->name[4] == '.')
					skb->mark |= (skb->dev->name[5] - '0') << DEV_OFFSET;
		#endif
#ifdef TCSUPPORT_EPON_MAPPING
				if(xpon_mode_get_hook && epon_sfu_mapping_hook && (2 == xpon_mode_get_hook()) ){
					//printk("EPONMAP: %s skb->dev->name[5]=%s \n", __FUNCTION__, skb->dev->name);
					if (skb->dev->name[4] != '.'){
						epon_sfu_mapping_hook(skb, 0); // only one lan port
					}else{
						epon_sfu_mapping_hook(skb, (skb->dev->name[5] - '1') );
					}
				}
#endif
				break;
			case 'r':
				/* device name must be rax */
				skb->mark |= ((skb->dev->name[2] - '0') + WLAN_DEV_OFFSET) << DEV_OFFSET;
				break;
			case 'u':
				/* device name must be usbx */
				skb->mark |= ((skb->dev->name[3] - '0') + USB_DEV_OFFSET) << DEV_OFFSET;
				break;
			case 'w':
				/* device name must be wdsx */
				skb->mark |= (WDS_DEV_OFFSET) << DEV_OFFSET;
				break;
			default:
				break;
		}
#endif	
		rhook = rcu_dereference(br_should_route_hook);
		if (rhook != NULL) {
			if (rhook(skb))
				return skb;
			dest = eth_hdr(skb)->h_dest;
		}
		/* fall through */
	case BR_STATE_LEARNING:
		if (!compare_ether_addr(p->br->dev->dev_addr, dest))
			skb->pkt_type = PACKET_HOST;

		NF_HOOK(NFPROTO_BRIDGE, NF_BR_PRE_ROUTING, skb, skb->dev, NULL,
			br_handle_frame_finish);
		break;
	default:
drop:
		kfree_skb(skb);
	}
	return NULL;
}
