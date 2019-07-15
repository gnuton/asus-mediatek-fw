/*
 * Bridge multicast support.
 *
 * Copyright (c) 2010 Herbert Xu <herbert@gondor.apana.org.au>
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the Free
 * Software Foundation; either version 2 of the License, or (at your option)
 * any later version.
 *
 */

#include <linux/err.h>
#include <linux/if_ether.h>
#include <linux/igmp.h>
#include <linux/jhash.h>
#include <linux/kernel.h>
#include <linux/log2.h>
#include <linux/netdevice.h>
#include <linux/netfilter_bridge.h>
#include <linux/random.h>
#include <linux/rculist.h>
#include <linux/skbuff.h>
#include <linux/slab.h>
#include <linux/timer.h>
#include <net/ip.h>
#if defined(CONFIG_IPV6) || defined(CONFIG_IPV6_MODULE)
#include <net/ipv6.h>
#include <net/mld.h>
#include <net/addrconf.h>
#include <net/ip6_checksum.h>
#endif
#ifdef TCSUPPORT_RA_HWNAT
#if defined(TCSUPPORT_XPON_IGMP) || defined(TCSUPPORT_MULTICAST_SPEED)
#include <linux/foe_hook.h>
#endif
#endif

#include "br_private.h"

#ifdef TCSUPPORT_IGMPSNOOPING_ENHANCE
static int snoopingdebug = 0;

#define DEBUGP_SNOOP(x, args...) if(snoopingdebug) printk(x, ## args)
static void br_multicast_leave_group(struct net_bridge * br,struct net_bridge_port * port,struct br_ip * group);
static void br_ip4_multicast_leave_group(struct net_bridge * br,struct net_bridge_port * port,__be32 group);
static void br_multicast_send_query(struct net_bridge *br,
				    struct net_bridge_port *port, u32 sent);
static void __br_multicast_send_query(struct net_bridge *br,
				      struct net_bridge_port *port,
				      struct br_ip *ip);
static void __br_multicast_enable_port(struct net_bridge_port *port);
#if defined(CONFIG_IPV6) || defined(CONFIG_IPV6_MODULE)
static void br_ip6_multicast_leave_group(struct net_bridge *br,
					 struct net_bridge_port *port,
					 const struct in6_addr *group);
#endif


#endif


#if defined(CONFIG_IPV6) || defined(CONFIG_IPV6_MODULE)
static inline int ipv6_is_local_multicast(const struct in6_addr *addr)
{
	if (ipv6_addr_is_multicast(addr) &&
	    IPV6_ADDR_MC_SCOPE(addr) <= IPV6_ADDR_SCOPE_LINKLOCAL)
		return 1;
	return 0;
}
#endif

static inline int br_ip_equal(const struct br_ip *a, const struct br_ip *b)
{
	if (a->proto != b->proto)
		return 0;
	switch (a->proto) {
	case htons(ETH_P_IP):
		return a->u.ip4 == b->u.ip4;
#if defined(CONFIG_IPV6) || defined(CONFIG_IPV6_MODULE)
	case htons(ETH_P_IPV6):
		return ipv6_addr_equal(&a->u.ip6, &b->u.ip6);
#endif
	}
	return 0;
}

static inline int __br_ip4_hash(struct net_bridge_mdb_htable *mdb, __be32 ip)
{
	return jhash_1word(mdb->secret, (__force u32)ip) & (mdb->max - 1);
}

#if defined(CONFIG_IPV6) || defined(CONFIG_IPV6_MODULE)
static inline int __br_ip6_hash(struct net_bridge_mdb_htable *mdb,
				const struct in6_addr *ip)
{
	return jhash2((__force u32 *)ip->s6_addr32, 4, mdb->secret) & (mdb->max - 1);
}
#endif

static inline int br_ip_hash(struct net_bridge_mdb_htable *mdb,
			     struct br_ip *ip)
{
	switch (ip->proto) {
	case htons(ETH_P_IP):
		return __br_ip4_hash(mdb, ip->u.ip4);
#if defined(CONFIG_IPV6) || defined(CONFIG_IPV6_MODULE)
	case htons(ETH_P_IPV6):
		return __br_ip6_hash(mdb, &ip->u.ip6);
#endif
	}
	return 0;
}

#ifdef TCSUPPORT_IGMPSNOOPING_ENHANCE

/*   merge form TC2 main trunck
 * Convert IP6 address to printable (loggable) representation.
 */
static char digits[] = "0123456789abcdef";
static int ip6round = 0;

char* ip6_sprintf(const struct in6_addr *addr)
{
	static char ip6buf[8][48];
	int i = 0;
	char *cp = NULL;
	const u_int16_t *a = (const u_int16_t *)addr;
	const u_int8_t *d = NULL;
	int dcolon = 0;

	ip6round = (ip6round + 1) & 7;
	cp = ip6buf[ip6round];

	for (i = 0; i < 8; i++) {
		if (dcolon == 1) {
			if (*a == 0) {
				if (i == 7)
					*cp++ = ':';
				a++;
				continue;
			} else
				dcolon = 2;
		}
		if (*a == 0) {
			if (dcolon == 0 && *(a + 1) == 0) {
				if (i == 0)
					*cp++ = ':';
				*cp++ = ':';
				dcolon = 1;
			} else {
				*cp++ = '0';
				*cp++ = ':';
			}
			a++;
			continue;
		}
		d = (const u_char *)a;
		{
			char ch[4] = {0};
			char i, j;
			ch[0] = digits[*d >> 4];
			ch[1] = digits[*d++ & 0xf];
			ch[2] = digits[*d >> 4];
			ch[3] = digits[*d & 0xf];
			for(i=0; i<4; i++)
			{
				if(ch[i] != '0')
					break;
			}
			if(i==4)
				*cp++ = digits[0];
			else
				for(j=i; j<4; j++) *cp++ = ch[j];
		}
		*cp++ = ':';
		a++;
	}
	*--cp = 0;
	return (ip6buf[ip6round]);
}

int get_snooping_debug()
{
	return snoopingdebug;
}
void set_snooping_debug(int value)
{
	snoopingdebug = value;
}

static inline int has_expired(const struct net_bridge *br,
				  const struct net_bridge_port_group *bpg)
{
	return time_before_eq((bpg->ageing_time + br->multicast_membership_interval+(br->quick_leave?0:2*HZ)), jiffies);
}

int br_mdb_fillbuf(struct net_bridge *br, void *buf,
		   unsigned long maxnum, unsigned long skip)
{
	struct __mc_fdb_entry *fe = buf;
	struct net_bridge_mdb_htable *mdb = NULL;
	struct net_bridge_port_group *bpg = NULL;
	int i = 0, num = 0;
	long result = 0;
	struct hlist_node *h = NULL;
	struct net_bridge_mdb_entry *f = NULL;
	
	mdb = br->mdb;
	if(!mdb)
		return 0;
	memset(buf, 0, maxnum*sizeof(struct __mc_fdb_entry));
	
	rcu_read_lock();
	spin_lock_bh(&br->multicast_lock);
	for (i = 0; i < mdb->max; i++) {
		hlist_for_each_entry_rcu(f, h, &mdb->mhash[i], hlist[mdb->ver]) {
			if (num >= maxnum)
				goto out;
			if (skip) {
				--skip;
				continue;
			}
			bpg = f->ports;
			while(bpg&&(num<maxnum)){
				if (has_expired(br, bpg)){
					bpg = bpg->next;
					continue;
				}
				if(bpg->version ==4){
					sprintf(fe->group_addr,NIPQUAD_FMT ,NIPQUAD(bpg->addr.u.ip4));
					sprintf(fe->src_addr, NIPQUAD_FMT, NIPQUAD(bpg->src_entry.src.s_addr));
				}
				else if(bpg->version == 6){
					strncpy(fe->group_addr,ip6_sprintf(&bpg->addr.u.ip6),sizeof(fe->group_addr));
					strncpy(fe->src_addr,ip6_sprintf(&bpg->src_entry.src6),sizeof(fe->src_addr));
				}
				fe->port_no = bpg->port->port_no;
				fe->version = bpg->version;
				memcpy(fe->group_mac, bpg->group_mac, ETH_ALEN);
				memcpy(fe->host_addr, bpg->port->macAddr.addr, ETH_ALEN);
				
				fe->filter_mode = bpg->src_entry.filt_mode;
				result = jiffies - bpg->ageing_time;
				fe->ageing_timer_value = jiffies_to_clock_t((result>0) ? result : 0);
				bpg = bpg->next;
				++fe;
				++num;
			}
			
		}
	}

 out:
	spin_unlock_bh(&br->multicast_lock);
	rcu_read_unlock();
	return num;
}
#endif

static struct net_bridge_mdb_entry *__br_mdb_ip_get(
	struct net_bridge_mdb_htable *mdb, struct br_ip *dst, int hash)
{
	struct net_bridge_mdb_entry *mp;
	struct hlist_node *p;

	hlist_for_each_entry_rcu(mp, p, &mdb->mhash[hash], hlist[mdb->ver]) {
		if (br_ip_equal(&mp->addr, dst))
			return mp;
	}

	return NULL;
}

static struct net_bridge_mdb_entry *br_mdb_ip_get(
	struct net_bridge_mdb_htable *mdb, struct br_ip *dst)
{
	if (!mdb)
		return NULL;

	return __br_mdb_ip_get(mdb, dst, br_ip_hash(mdb, dst));
}

static struct net_bridge_mdb_entry *br_mdb_ip4_get(
	struct net_bridge_mdb_htable *mdb, __be32 dst)
{
	struct br_ip br_dst;

	br_dst.u.ip4 = dst;
	br_dst.proto = htons(ETH_P_IP);

	return br_mdb_ip_get(mdb, &br_dst);
}

#if defined(CONFIG_IPV6) || defined(CONFIG_IPV6_MODULE)
static struct net_bridge_mdb_entry *br_mdb_ip6_get(
	struct net_bridge_mdb_htable *mdb, const struct in6_addr *dst)
{
	struct br_ip br_dst;

	ipv6_addr_copy(&br_dst.u.ip6, dst);
	br_dst.proto = htons(ETH_P_IPV6);

	return br_mdb_ip_get(mdb, &br_dst);
}
#endif

struct net_bridge_mdb_entry *br_mdb_get(struct net_bridge *br,
					struct sk_buff *skb)
{
	struct net_bridge_mdb_htable *mdb = br->mdb;
	struct br_ip ip;

	if (br->multicast_disabled)
		return NULL;

	if (BR_INPUT_SKB_CB(skb)->igmp)
		return NULL;

	ip.proto = skb->protocol;

	switch (skb->protocol) {
	case htons(ETH_P_IP):
		ip.u.ip4 = ip_hdr(skb)->daddr;
		break;
#if defined(CONFIG_IPV6) || defined(CONFIG_IPV6_MODULE)
	case htons(ETH_P_IPV6):
		ipv6_addr_copy(&ip.u.ip6, &ipv6_hdr(skb)->daddr);
		break;
#endif
	default:
		return NULL;
	}

	return br_mdb_ip_get(mdb, &ip);
}

static void br_mdb_free(struct rcu_head *head)
{
	struct net_bridge_mdb_htable *mdb =
		container_of(head, struct net_bridge_mdb_htable, rcu);
	struct net_bridge_mdb_htable *old = mdb->old;

	mdb->old = NULL;
	kfree(old->mhash);
	kfree(old);
}

static int br_mdb_copy(struct net_bridge_mdb_htable *new,
		       struct net_bridge_mdb_htable *old,
		       int elasticity)
{
	struct net_bridge_mdb_entry *mp;
	struct hlist_node *p;
	int maxlen;
	int len;
	int i;

	for (i = 0; i < old->max; i++)
		hlist_for_each_entry(mp, p, &old->mhash[i], hlist[old->ver])
			hlist_add_head(&mp->hlist[new->ver],
				       &new->mhash[br_ip_hash(new, &mp->addr)]);

	if (!elasticity)
		return 0;

	maxlen = 0;
	for (i = 0; i < new->max; i++) {
		len = 0;
		hlist_for_each_entry(mp, p, &new->mhash[i], hlist[new->ver])
			len++;
		if (len > maxlen)
			maxlen = len;
	}

	return maxlen > elasticity ? -EINVAL : 0;
}

static void br_multicast_free_pg(struct rcu_head *head)
{
	struct net_bridge_port_group *p =
		container_of(head, struct net_bridge_port_group, rcu);

	kfree(p);
}

static void br_multicast_free_group(struct rcu_head *head)
{
	struct net_bridge_mdb_entry *mp =
		container_of(head, struct net_bridge_mdb_entry, rcu);

	kfree(mp);
}

static void br_multicast_group_expired(unsigned long data)
{
	struct net_bridge_mdb_entry *mp = (void *)data;
	struct net_bridge *br = mp->br;
	struct net_bridge_mdb_htable *mdb;

        /*if call this function by ioctl,modify spin_lock to spin_lock_bh*/
	spin_lock(&br->multicast_lock);
	if (!netif_running(br->dev) || timer_pending(&mp->timer))
		goto out;

	if (!hlist_unhashed(&mp->mglist))
		hlist_del_init(&mp->mglist);

	if (mp->ports)
		goto out;

	mdb = br->mdb;
	hlist_del_rcu(&mp->hlist[mdb->ver]);
	mdb->size--;

	del_timer(&mp->query_timer);
	call_rcu_bh(&mp->rcu, br_multicast_free_group);

out:
	spin_unlock(&br->multicast_lock);
}

static void br_multicast_del_pg(struct net_bridge *br,
				struct net_bridge_port_group *pg)
{
	struct net_bridge_mdb_htable *mdb = br->mdb;
	struct net_bridge_mdb_entry *mp;
	struct net_bridge_port_group *p;
	struct net_bridge_port_group **pp;

	mp = br_mdb_ip_get(mdb, &pg->addr);
	if (WARN_ON(!mp))
		return;

	for (pp = &mp->ports; (p = *pp); pp = &p->next) {
		if (p != pg)
			continue;
	#ifdef TCSUPPORT_IGMPSNOOPING_ENHANCE
		if(pg->version == 4){
			DEBUGP_SNOOP("mc_fdb_delete delete dev=%s group=" NIPQUAD_FMT " src ip=" NIPQUAD_FMT "\n",  
			pg->port->dev->name, NIPQUAD(pg->addr.u.ip4),NIPQUAD(pg->src_entry.src.s_addr));
		}
		else if(pg->version == 6)
		{
			DEBUGP_SNOOP("mc_fdb_delete deleteV6 dev=%s group=[%s] src ip=[%s]\n",  
			pg->port->dev->name, ip6_sprintf(&pg->addr.u.ip6),ip6_sprintf(&pg->src_entry.src6));
		}	
	#endif
		rcu_assign_pointer(*pp, p->next);
		hlist_del_init(&p->mglist);
		del_timer(&p->timer);
		del_timer(&p->query_timer);
		call_rcu_bh(&p->rcu, br_multicast_free_pg);

		if (!mp->ports && hlist_unhashed(&mp->mglist) &&
		    netif_running(br->dev))
			mod_timer(&mp->timer, jiffies);
		#if defined(TCSUPPORT_XPON_IGMP) || defined(TCSUPPORT_MULTICAST_SPEED)
			igmp_hwnat_update_all(br);
		#endif
		return;
	}

	WARN_ON(1);
}

#ifdef TCSUPPORT_IGMPSNOOPING_ENHANCE
static void br_multicast_del_pg_byPort(struct net_bridge *br,
				struct net_bridge_port *port)
{
	struct net_bridge_mdb_htable *mdb = NULL;
	struct net_bridge_mdb_entry *mp = NULL;
	//struct net_bridge_port_group *p = NULL;
	struct hlist_node	*h = NULL;
	int i = 0;
	if(!br || !port)
		return;
	mdb = br->mdb;
	if(!mdb)
		return;

	struct net_bridge_port_group *pg;
		struct hlist_node *p, *n;
	
                    /*if call this function by ioctl,modify spin_lock to spin_lock_bh*/
		spin_lock(&br->multicast_lock);
		hlist_for_each_entry_safe(pg, p, n, &port->mglist, mglist)
			br_multicast_del_pg(br, pg);
		spin_unlock(&br->multicast_lock);
#if 0
	rcu_read_lock();
	spin_lock(&br->multicast_lock);
	for(i=0; i<mdb->max; i++){
		hlist_for_each_entry_rcu(mp, h, &mdb->mhash[i], hlist[mdb->ver]){
			p = mp->ports;
			while(p){
				if (p->port->port_no == port->port_no){
					br_multicast_del_pg(br, p);	
				}
				p = p->next;
			}
		}
	}
	spin_unlock(&br->multicast_lock);
	rcu_read_unlock();
#endif	
}
EXPORT_SYMBOL(br_multicast_del_pg_byPort);

static void MultiIP2MAC(struct in6_addr *pIpaddr, unsigned char *mac)
{
	if(pIpaddr == NULL || mac == NULL)
		return;

	*mac = 0x33;
	*(mac + 1) = 0x33;
	*(mac + 2) = pIpaddr->s6_addr[12];
	*(mac + 3) = pIpaddr->s6_addr[13];
	*(mac + 4) = pIpaddr->s6_addr[14];
	*(mac + 5) = pIpaddr->s6_addr[15];

	return;
}

static void br_multicas_group_expired_query(struct net_bridge *br,
				    struct net_bridge_port *port, struct br_ip br_group)
{
	if (!netif_running(br->dev) || br->multicast_disabled)
		return;
	__br_multicast_send_query(br, port, &br_group);
}

#endif

static void br_multicast_port_group_expired(unsigned long data)
{
	struct net_bridge_port_group *pg = (void *)data;
	struct net_bridge *br = pg->port->br;

        /*if call this function by ioctl,modify spin_lock to spin_lock_bh*/
	spin_lock(&br->multicast_lock);
	if (!netif_running(br->dev) || timer_pending(&pg->timer) ||
	    hlist_unhashed(&pg->mglist))
		goto out;

#ifdef TCSUPPORT_IGMPSNOOPING_ENHANCE
	if (pg->leave_count > 0)
	{
			pg->leave_count--;
			br_multicas_group_expired_query(br, pg->port, pg->addr);
			mod_timer(&pg->timer, (jiffies + 2*HZ));
	}
	else
#endif		
	br_multicast_del_pg(br, pg);

out:
	spin_unlock(&br->multicast_lock);
}

static int br_mdb_rehash(struct net_bridge_mdb_htable **mdbp, int max,
			 int elasticity)
{
	struct net_bridge_mdb_htable *old = *mdbp;
	struct net_bridge_mdb_htable *mdb;
	int err;

	mdb = kmalloc(sizeof(*mdb), GFP_ATOMIC);
	if (!mdb)
		return -ENOMEM;

	mdb->max = max;
	mdb->old = old;

	mdb->mhash = kzalloc(max * sizeof(*mdb->mhash), GFP_ATOMIC);
	if (!mdb->mhash) {
		kfree(mdb);
		return -ENOMEM;
	}

	mdb->size = old ? old->size : 0;
	mdb->ver = old ? old->ver ^ 1 : 0;

	if (!old || elasticity)
		get_random_bytes(&mdb->secret, sizeof(mdb->secret));
	else
		mdb->secret = old->secret;

	if (!old)
		goto out;

	err = br_mdb_copy(mdb, old, elasticity);
	if (err) {
		kfree(mdb->mhash);
		kfree(mdb);
		return err;
	}

	call_rcu_bh(&mdb->rcu, br_mdb_free);

out:
	rcu_assign_pointer(*mdbp, mdb);

	return 0;
}

static struct sk_buff *br_ip4_multicast_alloc_query(struct net_bridge *br,
						    __be32 group)
{
	struct sk_buff *skb;
#ifdef TCSUPPORT_IGMPSNOOPING_ENHANCE
	struct igmpv3_query *ih = NULL;
#else
	struct igmphdr *ih;
#endif
	struct ethhdr *eth;
	struct iphdr *iph;

#ifdef TCSUPPORT_IGMPSNOOPING_ENHANCE
	struct rtable *rt = NULL;
	struct net_device *dev = NULL;
	
	dev = br->dev;
#endif
	skb = netdev_alloc_skb_ip_align(br->dev, sizeof(*eth) + sizeof(*iph) +
						 sizeof(*ih) + 4);
	if (!skb)
		goto out;

#ifdef TCSUPPORT_IGMPSNOOPING_ENHANCE
	{
		struct flowi fl = { .oif = dev->ifindex,
				    .nl_u = { .ip4_u = {
				    .daddr = IGMPV3_ALL_MCR } },
				    .proto = IPPROTO_IGMP };
		if (ip_route_output_key(dev_net(dev), &rt, &fl)) {
			kfree_skb(skb);
			return;
		}
	}
/*
	if (rt->rt_src == 0) {
		kfree_skb(skb);
		ip_rt_put(rt);
		return;
	}
	*/
#endif
	skb->protocol = htons(ETH_P_IP);

	skb_reset_mac_header(skb);
	eth = eth_hdr(skb);

	memcpy(eth->h_source, br->dev->dev_addr, 6);
	eth->h_dest[0] = 1;
	eth->h_dest[1] = 0;
	eth->h_dest[2] = 0x5e;
	eth->h_dest[3] = 0;
	eth->h_dest[4] = 0;
	eth->h_dest[5] = 1;
	eth->h_proto = htons(ETH_P_IP);
	skb_put(skb, sizeof(*eth));

	skb_set_network_header(skb, skb->len);
	iph = ip_hdr(skb);

	iph->version = 4;
	iph->ihl = 6;
	iph->tos = 0xc0;
	iph->tot_len = htons(sizeof(*iph) + sizeof(*ih) + 4);
	iph->id = 0;
	iph->frag_off = htons(IP_DF);
	iph->ttl = 1;
	iph->protocol = IPPROTO_IGMP;
#ifdef TCSUPPORT_IGMPSNOOPING_ENHANCE	
	iph->saddr = rt->rt_src;
	iph->daddr = htonl(0xe0000016U);//htonl(INADDR_ALLHOSTS_GROUP);0xe0000016U
#else
	iph->saddr = 0;
	iph->daddr = htonl(INADDR_ALLHOSTS_GROUP);
#endif
	((u8 *)&iph[1])[0] = IPOPT_RA;
	((u8 *)&iph[1])[1] = 4;
	((u8 *)&iph[1])[2] = 0;
	((u8 *)&iph[1])[3] = 0;
	ip_send_check(iph);
	skb_put(skb, 24);

	skb_set_transport_header(skb, skb->len);
#ifdef TCSUPPORT_IGMPSNOOPING_ENHANCE
	ih = igmpv3_query_hdr(skb);
#else
	ih = igmp_hdr(skb);
#endif
	ih->type = IGMP_HOST_MEMBERSHIP_QUERY;
	ih->code = (group ? br->multicast_last_member_interval :
			    br->multicast_query_response_interval) /
		   (HZ / IGMP_TIMER_SCALE);
	ih->group = group;
	ih->csum = 0;
#ifdef TCSUPPORT_IGMPSNOOPING_ENHANCE
	ih->csum = ip_compute_csum((void *)ih, sizeof(struct igmpv3_query));
#else
	ih->csum = ip_compute_csum((void *)ih, sizeof(struct igmphdr));
#endif
	skb_put(skb, sizeof(*ih));

	__skb_pull(skb, sizeof(*eth));

out:
	return skb;
}

#if defined(CONFIG_IPV6) || defined(CONFIG_IPV6_MODULE)
static struct sk_buff *br_ip6_multicast_alloc_query(struct net_bridge *br,
						    struct in6_addr *group)
{
	struct sk_buff *skb;
	struct ipv6hdr *ip6h;
	struct mld_msg *mldq;
	struct ethhdr *eth;
	u8 *hopopt;
	unsigned long interval;

	skb = netdev_alloc_skb_ip_align(br->dev, sizeof(*eth) + sizeof(*ip6h) +
						 8 + sizeof(*mldq));
	if (!skb)
		goto out;

	skb->protocol = htons(ETH_P_IPV6);

	/* Ethernet header */
	skb_reset_mac_header(skb);
	eth = eth_hdr(skb);

	memcpy(eth->h_source, br->dev->dev_addr, 6);
	//ipv6_eth_mc_map(group, eth->h_dest);
	eth->h_proto = htons(ETH_P_IPV6);
	skb_put(skb, sizeof(*eth));

	/* IPv6 header + HbH option */
	skb_set_network_header(skb, skb->len);
	ip6h = ipv6_hdr(skb);

	*(__force __be32 *)ip6h = htonl(0x60000000);
	ip6h->payload_len = htons(8 + sizeof(*mldq));
	ip6h->nexthdr = IPPROTO_HOPOPTS;
	ip6h->hop_limit = 1;
	//ipv6_addr_set(&ip6h->saddr, 0, 0, 0, 0);
	ipv6_addr_set(&ip6h->daddr, htonl(0xff020000), 0, 0, htonl(1));
	ipv6_dev_get_saddr(dev_net(br->dev),br->dev,
		&ip6h->daddr,0, &ip6h->saddr);
	ipv6_eth_mc_map(&ip6h->daddr, eth->h_dest);

	hopopt = (u8 *)(ip6h + 1);
	hopopt[0] = IPPROTO_ICMPV6;		/* next hdr */
	hopopt[1] = 0;				/* length of HbH */
	hopopt[2] = IPV6_TLV_ROUTERALERT;	/* Router Alert */
	hopopt[3] = 2;				/* Length of RA Option */
	hopopt[4] = 0;				/* Type = 0x0000 (MLD) */
	hopopt[5] = 0;
	hopopt[6] = IPV6_TLV_PAD0;		/* Pad0 */
	hopopt[7] = IPV6_TLV_PAD0;		/* Pad0 */

	skb_put(skb, sizeof(*ip6h) + 8);

	/* ICMPv6 */
	skb_set_transport_header(skb, skb->len);
	mldq = (struct mld_msg *) icmp6_hdr(skb);

	interval = ipv6_addr_any(group) ? br->multicast_last_member_interval :
					  br->multicast_query_response_interval;

	mldq->mld_type = ICMPV6_MGM_QUERY;
	mldq->mld_code = 0;
	mldq->mld_cksum = 0;
	mldq->mld_maxdelay = htons((u16)jiffies_to_msecs(interval));
	mldq->mld_reserved = 0;
	ipv6_addr_copy(&mldq->mld_mca, group);

	/* checksum */
	mldq->mld_cksum = csum_ipv6_magic(&ip6h->saddr, &ip6h->daddr,
					  sizeof(*mldq), IPPROTO_ICMPV6,
					  csum_partial(mldq,
						       sizeof(*mldq), 0));
	skb_put(skb, sizeof(*mldq));

	__skb_pull(skb, sizeof(*eth));

out:
	return skb;
}
#endif

static struct sk_buff *br_multicast_alloc_query(struct net_bridge *br,
						struct br_ip *addr)
{
	switch (addr->proto) {
	case htons(ETH_P_IP):
		return br_ip4_multicast_alloc_query(br, addr->u.ip4);
#if defined(CONFIG_IPV6) || defined(CONFIG_IPV6_MODULE)
	case htons(ETH_P_IPV6):
		return br_ip6_multicast_alloc_query(br, &addr->u.ip6);
#endif
	}
	return NULL;
}

static void br_multicast_send_group_query(struct net_bridge_mdb_entry *mp)
{
	struct net_bridge *br = mp->br;
	struct sk_buff *skb;

	skb = br_multicast_alloc_query(br, &mp->addr);
	if (!skb)
		goto timer;
#ifdef TCSUPPORT_IGMPSNOOPING_ENHANCE
	DEBUGP_SNOOP("group_query  dev=%s \n",	br->dev->name);
#endif
	netif_rx(skb);

timer:
	if (++mp->queries_sent < br->multicast_last_member_count)
		mod_timer(&mp->query_timer,
			  jiffies + br->multicast_last_member_interval);
}

static void br_multicast_group_query_expired(unsigned long data)
{
	struct net_bridge_mdb_entry *mp = (void *)data;
	struct net_bridge *br = mp->br;

        /*if call this function by ioctl,modify spin_lock to spin_lock_bh*/
	spin_lock(&br->multicast_lock);
	if (!netif_running(br->dev) || hlist_unhashed(&mp->mglist) ||
	    mp->queries_sent >= br->multicast_last_member_count)
		goto out;

	br_multicast_send_group_query(mp);

out:
	spin_unlock(&br->multicast_lock);
}

static void br_multicast_send_port_group_query(struct net_bridge_port_group *pg)
{
	struct net_bridge_port *port = pg->port;
	struct net_bridge *br = port->br;
	struct sk_buff *skb;

	skb = br_multicast_alloc_query(br, &pg->addr);
	if (!skb)
		goto timer;
#ifdef TCSUPPORT_IGMPSNOOPING_ENHANCE
	if(pg->version == 6)
		DEBUGP_SNOOP("port_group_query dev=%s group=[%s] src ip=[%s]\n",  
		pg->port->dev->name, ip6_sprintf(&pg->addr.u.ip6),ip6_sprintf(&pg->src_entry.src.s_addr));
	else
		DEBUGP_SNOOP("port_group_query dev=%s group=" NIPQUAD_FMT " src ip=" NIPQUAD_FMT"\n",  
		pg->port->dev->name, NIPQUAD(pg->addr.u.ip4),NIPQUAD(pg->src_entry.src.s_addr));
#endif

	br_deliver(port, skb);

timer:
	if (++pg->queries_sent < br->multicast_last_member_count)
		mod_timer(&pg->query_timer,
			  jiffies + br->multicast_last_member_interval);
}

static void br_multicast_port_group_query_expired(unsigned long data)
{
	struct net_bridge_port_group *pg = (void *)data;
	struct net_bridge_port *port = pg->port;
	struct net_bridge *br = port->br;

        /*if call this function by ioctl,modify spin_lock to spin_lock_bh*/
	spin_lock(&br->multicast_lock);
	if (!netif_running(br->dev) || hlist_unhashed(&pg->mglist) ||
	    pg->queries_sent >= br->multicast_last_member_count)
		goto out;

	br_multicast_send_port_group_query(pg);

out:
	spin_unlock(&br->multicast_lock);
}

static struct net_bridge_mdb_entry *br_multicast_get_group(
	struct net_bridge *br, struct net_bridge_port *port,
	struct br_ip *group, int hash)
{
	struct net_bridge_mdb_htable *mdb = br->mdb;
	struct net_bridge_mdb_entry *mp;
	struct hlist_node *p;
	unsigned count = 0;
	unsigned max;
	int elasticity;
	int err;

	hlist_for_each_entry(mp, p, &mdb->mhash[hash], hlist[mdb->ver]) {
		count++;
		if (unlikely(br_ip_equal(group, &mp->addr)))
			return mp;
	}

	elasticity = 0;
	max = mdb->max;

	if (unlikely(count > br->hash_elasticity && count)) {
		if (net_ratelimit())
			br_info(br, "Multicast hash table "
				"chain limit reached: %s\n",
				port ? port->dev->name : br->dev->name);

		elasticity = br->hash_elasticity;
	}

	if (mdb->size >= max) {
		max *= 2;
		if (unlikely(max >= br->hash_max)) {
			br_warn(br, "Multicast hash table maximum "
				"reached, disabling snooping: %s, %d\n",
				port ? port->dev->name : br->dev->name, max);
			err = -E2BIG;
disable:
			br->multicast_disabled = 1;
			goto err;
		}
	}

	if (max > mdb->max || elasticity) {
		if (mdb->old) {
			if (net_ratelimit())
				br_info(br, "Multicast hash table "
					"on fire: %s\n",
					port ? port->dev->name : br->dev->name);
			err = -EEXIST;
			goto err;
		}

		err = br_mdb_rehash(&br->mdb, max, elasticity);
		if (err) {
			br_warn(br, "Cannot rehash multicast "
				"hash table, disabling snooping: %s, %d, %d\n",
				port ? port->dev->name : br->dev->name,
				mdb->size, err);
			goto disable;
		}

		err = -EAGAIN;
		goto err;
	}

	return NULL;

err:
	mp = ERR_PTR(err);
	return mp;
}

#ifdef TCSUPPORT_IGMPSNOOPING_ENHANCE
static struct net_bridge_port_group *br_multicast_get_port_group(
	struct net_bridge *br, struct net_bridge_port *port,
	struct br_ip *group, int check_saddr)
{
	struct net_bridge_mdb_htable *mdb = br->mdb;
	struct net_bridge_mdb_entry *mp = NULL;
	struct net_bridge_port_group *pg = NULL;
	int hash = 0;

	if (!mdb || !port) {
		return NULL;
	}

	hash = br_ip_hash(mdb, group);

	mp = br_multicast_get_group(br, port, group, hash);
	if(unlikely(IS_ERR(mp)||!mp)){
		return NULL;
	}

        /*if call this function by ioctl,modify spin_lock to spin_lock_bh*/
	spin_lock(&br->multicast_lock);
	pg = mp->ports;
	while(pg){
		if(pg->port == port){ 
			if((check_saddr == 1) && (pg->src_entry.src.s_addr == port->src_entry.src.s_addr)){
				spin_unlock(&br->multicast_lock);
				return pg;
			}
			if(check_saddr == 0){
				spin_unlock(&br->multicast_lock);
				return pg;
			}
		}
		pg = pg->next;
	}
	spin_unlock(&br->multicast_lock);
	return NULL;
}
/*
		check the info is in port group or not.
	return:
		1: check OK
		0: fail.
*/
static int br_multicast_equal_port_group(struct net_bridge_port_group *pg, 
	struct net_bridge_port *port, struct br_ip *group)
{
	if(!pg || !port || !group)
		return 0;
	if((pg->version != port->version) ||(pg->port != port))
		return 0;

	if(port->version == 4)
	{
		if(pg->src_entry.src.s_addr == port->src_entry.src.s_addr)
			return 1;
	}
	else if(port->version == 6)
	{
		if(ipv6_addr_equal(&pg->src_entry.src6, &port->src_entry.src6))//group ip
			return 1;
	}
	
	return 0;
}
#endif
static struct net_bridge_mdb_entry *br_multicast_new_group(
	struct net_bridge *br, struct net_bridge_port *port,
	struct br_ip *group)
{
	struct net_bridge_mdb_htable *mdb = br->mdb;
	struct net_bridge_mdb_entry *mp;
	int hash;

	if (!mdb) {
		if (br_mdb_rehash(&br->mdb, BR_HASH_SIZE, 0))
			return NULL;
		goto rehash;
	}

	hash = br_ip_hash(mdb, group);
	mp = br_multicast_get_group(br, port, group, hash);
	switch (PTR_ERR(mp)) {
	case 0:
		break;

	case -EAGAIN:
rehash:
		mdb = br->mdb;
		hash = br_ip_hash(mdb, group);
		break;

	default:
		goto out;
	}

	mp = kzalloc(sizeof(*mp), GFP_ATOMIC);
	if (unlikely(!mp))
		goto out;

	mp->br = br;
	mp->addr = *group;
	setup_timer(&mp->timer, br_multicast_group_expired,
		    (unsigned long)mp);
	setup_timer(&mp->query_timer, br_multicast_group_query_expired,
		    (unsigned long)mp);

	hlist_add_head_rcu(&mp->hlist[mdb->ver], &mdb->mhash[hash]);
	mdb->size++;

out:
	return mp;
}

static int br_multicast_add_group(struct net_bridge *br,
				  struct net_bridge_port *port,
				  struct br_ip *group)
{
	struct net_bridge_mdb_entry *mp;
	struct net_bridge_port_group *p;
	struct net_bridge_port_group **pp;
	unsigned long now = jiffies;
	int err;

        /*if call this function by ioctl,modify spin_lock to spin_lock_bh*/
	spin_lock(&br->multicast_lock);
	if (!netif_running(br->dev) ||
	    (port && port->state == BR_STATE_DISABLED))
		goto out;

	mp = br_multicast_new_group(br, port, group);
	err = PTR_ERR(mp);
	if (unlikely(IS_ERR(mp) || !mp))
		goto err;

	if (!port) {
		if(hlist_unhashed(&mp->mglist))
			hlist_add_head(&mp->mglist, &br->mglist);
		mod_timer(&mp->timer, now + br->multicast_membership_interval);
		goto out;
	}

	for (pp = &mp->ports; (p = *pp); pp = &p->next) {
#ifdef TCSUPPORT_IGMPSNOOPING_ENHANCE	
		if(br_multicast_equal_port_group(p, port, group)){
			if(port->version == 4){
				DEBUGP_SNOOP("br_multicast_add_group update portgroup dev=%s group=" NIPQUAD_FMT " src ip=" NIPQUAD_FMT "\n", 
				port->dev->name, NIPQUAD(group->u.ip4),NIPQUAD(port->src_entry.src.s_addr));
				}
			else{
				DEBUGP_SNOOP("br_multicast_add_group updateV6 portgroup dev=%s group=[%s] src ip=[%s]\n", 
				port->dev->name, ip6_sprintf(&group->u.ip6),ip6_sprintf(&port->src_entry.src6));
				
			}
			memcpy(&p->src_entry, &port->src_entry, sizeof(port->src_entry));
			goto found;
		}		
#else
		if (p->port == port)
			goto found;
#endif

		if ((unsigned long)p->port < (unsigned long)port)
			break;
	}

	p = kzalloc(sizeof(*p), GFP_ATOMIC);
	err = -ENOMEM;
	if (unlikely(!p))
		goto err;

#ifdef TCSUPPORT_IGMPSNOOPING_ENHANCE
	if(port->version == 4){
		DEBUGP_SNOOP("br_multicast_add_group new portgroup dev=%s group=" NIPQUAD_FMT " src ip=" NIPQUAD_FMT "\n", 
			port->dev->name, NIPQUAD(group->u.ip4),NIPQUAD(port->src_entry.src.s_addr));
	}
	else{
		DEBUGP_SNOOP("br_multicast_add_group newV6 portgroup dev=%s group=[%s] src ip=[%s]\n", 
			port->dev->name, ip6_sprintf(&group->u.ip6), ip6_sprintf(&port->src_entry.src6));
		}
	memcpy(&p->src_entry, &port->src_entry, sizeof(port->src_entry)); 
	memcpy(p->group_mac, port->groupMacAddr.addr, sizeof(port->groupMacAddr.addr));
	memcpy(p->host_mac, port->macAddr.addr, sizeof(port->macAddr.addr));
	p->version = port->version;
#endif
	p->addr = *group;
	p->port = port;
	p->next = *pp;
	hlist_add_head(&p->mglist, &port->mglist);
	setup_timer(&p->timer, br_multicast_port_group_expired,
		    (unsigned long)p);
	setup_timer(&p->query_timer, br_multicast_port_group_query_expired,
		    (unsigned long)p);

	rcu_assign_pointer(*pp, p);
	#if defined(TCSUPPORT_XPON_IGMP) || defined(TCSUPPORT_MULTICAST_SPEED)
	igmp_hwnat_update_all(br);
	#ifdef TCSUPPORT_XPON_IGMP
	igmp_hwnat_multicast_undrop();
	#endif
	#endif
found:
#ifdef TCSUPPORT_IGMPSNOOPING_ENHANCE	
	p->ageing_time = now;
	p->leave_count = 3;
#endif
	mod_timer(&p->timer, now + br->multicast_membership_interval);
out:
	err = 0;

err:
	spin_unlock(&br->multicast_lock);
	return err;
}

static int br_ip4_multicast_add_group(struct net_bridge *br,
				      struct net_bridge_port *port,
				      __be32 group)
{
	struct br_ip br_group;

	if (ipv4_is_local_multicast(group))
		return 0;

	br_group.u.ip4 = group;
	br_group.proto = htons(ETH_P_IP);

	return br_multicast_add_group(br, port, &br_group);
}

#ifdef TCSUPPORT_IGMPSNOOPING_ENHANCE
static struct net_bridge_port_group *br_ip4_multicast_get_port_group(
	struct net_bridge *br, struct net_bridge_port *port,
	__be32 addr, int check_saddr){
		struct br_ip br_group;

		br_group.u.ip4 = addr;
		br_group.proto = htons(ETH_P_IP);
		
		return br_multicast_get_port_group(br, port, &br_group, check_saddr);
	}

static void br_ip4_igmpv3_leave_group(struct net_bridge *br,
					 struct net_bridge_port *port,__be32 group, 
					 struct net_bridge_port_group *pg)
{
		if(br->quick_leave){
                            /*if call this function by ioctl,modify spin_lock to spin_lock_bh*/
			spin_lock(&br->multicast_lock);
			br_multicast_del_pg(br, pg);
			spin_unlock(&br->multicast_lock);
		}
		else
			br_ip4_multicast_leave_group(br, port, group);
}

#endif

#if defined(CONFIG_IPV6) || defined(CONFIG_IPV6_MODULE)
static int br_ip6_multicast_add_group(struct net_bridge *br,
				      struct net_bridge_port *port,
				      const struct in6_addr *group)
{
	struct br_ip br_group;

	if (ipv6_is_local_multicast(group))
		return 0;

	ipv6_addr_copy(&br_group.u.ip6, group);
	br_group.proto = htons(ETH_P_IPV6);

	return br_multicast_add_group(br, port, &br_group);
}

#ifdef TCSUPPORT_IGMPSNOOPING_ENHANCE
static struct net_bridge_port_group *br_ip6_multicast_get_port_group(
	struct net_bridge *br, 
	struct net_bridge_port *port,
	const struct in6_addr *group,int check_saddr)
{
	struct br_ip br_group;

	ipv6_addr_copy(&br_group.u.ip6, group);
	br_group.proto = htons(ETH_P_IPV6);
		
	return br_multicast_get_port_group(br, port, &br_group, check_saddr);
}
static void br_ip6_mld_leave_group(struct net_bridge *br,
					 struct net_bridge_port *port,struct in6_addr *group, 
					 struct net_bridge_port_group *pg)
{
		if(br->quick_leave){
                            /*if call this function by ioctl,modify spin_lock to spin_lock_bh*/
			spin_lock(&br->multicast_lock);
			br_multicast_del_pg(br, pg);
			spin_unlock(&br->multicast_lock);
		}
		else
			br_ip6_multicast_leave_group(br, port, group);
}

#endif
#endif

static void br_multicast_router_expired(unsigned long data)
{
	struct net_bridge_port *port = (void *)data;
	struct net_bridge *br = port->br;

        /*if call this function by ioctl,modify spin_lock to spin_lock_bh*/
	spin_lock(&br->multicast_lock);
	if (port->multicast_router != 1 ||
	    timer_pending(&port->multicast_router_timer) ||
	    hlist_unhashed(&port->rlist))
		goto out;

	hlist_del_init_rcu(&port->rlist);

out:
	spin_unlock(&br->multicast_lock);
}

#ifdef TCSUPPORT_IGMPSNOOPING_ENHANCE
static void br_muticast_start_querier(struct net_bridge *br)
{
	struct net_bridge_port *port;

	br_multicast_open(br);

	list_for_each_entry(port,&br->port_list,list){
		if(port->state == BR_STATE_DISABLED ||
			port->state == BR_STATE_BLOCKING)
			continue;

		__br_multicast_enable_port(port);
	}
}
static void br_multicast_querier_expired(unsigned long data)
{
	struct net_bridge *br = (void *)data;
	
        /*if call this function by ioctl,modify spin_lock to spin_lock_bh*/
	spin_lock(&br->multicast_lock);
	if(!netif_running(br->dev) || br->multicast_disabled)
		goto out;

	br_muticast_start_querier(br);
out:
	spin_unlock(&br->multicast_lock);
}
#endif
static void br_multicast_local_router_expired(unsigned long data)
{
}

static void __br_multicast_send_query(struct net_bridge *br,
				      struct net_bridge_port *port,
				      struct br_ip *ip)
{
	struct sk_buff *skb;

	skb = br_multicast_alloc_query(br, ip);
	if (!skb)
		return;
#ifdef TCSUPPORT_IGMPSNOOPING_ENHANCE
			if(port)
			{
			if(htons(ETH_P_IPV6) == ip->proto)
				DEBUGP_SNOOP("multicast query dev=%s port_no=(%d) group=[%s]\n",  
				br->dev->name,port->port_no, ip6_sprintf(&ip->u.ip6));
			else
				DEBUGP_SNOOP("multicast query dev=%s port_no=(%d) group=" NIPQUAD_FMT "\n",  
				br->dev->name,port->port_no, NIPQUAD(ip->u.ip4));
			}	
			else
			{
			if(htons(ETH_P_IPV6) == ip->proto)
				DEBUGP_SNOOP("multicast query V6 dev=%s group=[%s]\n",  
				br->dev->name, ip6_sprintf(&ip->u.ip6));
			else
				DEBUGP_SNOOP("multicast query V6 dev=%s group=" NIPQUAD_FMT "\n",  
				br->dev->name, NIPQUAD(ip->u.ip4));
			}
#endif

	if (port) {
		__skb_push(skb, sizeof(struct ethhdr));
		skb->dev = port->dev;
		NF_HOOK(NFPROTO_BRIDGE, NF_BR_LOCAL_OUT, skb, NULL, skb->dev,
			dev_queue_xmit);
	} else
		netif_rx(skb);
}

static void br_multicast_send_query(struct net_bridge *br,
				    struct net_bridge_port *port, u32 sent)
{
	unsigned long time;
	struct br_ip br_group;

	if (!netif_running(br->dev) || br->multicast_disabled ||
	    timer_pending(&br->multicast_querier_timer))
		return;

	memset(&br_group.u, 0, sizeof(br_group.u));

	br_group.proto = htons(ETH_P_IP);
	__br_multicast_send_query(br, port, &br_group);

#if defined(CONFIG_IPV6) || defined(CONFIG_IPV6_MODULE)
	br_group.proto = htons(ETH_P_IPV6);
	__br_multicast_send_query(br, port, &br_group);
#endif

	time = jiffies;
	time += sent < br->multicast_startup_query_count ?
		br->multicast_startup_query_interval :
		br->multicast_query_interval;
	mod_timer(port ? &port->multicast_query_timer :
			 &br->multicast_query_timer, time);
}

static void br_multicast_port_query_expired(unsigned long data)
{
	struct net_bridge_port *port = (void *)data;
	struct net_bridge *br = port->br;

        /*if call this function by ioctl,modify spin_lock to spin_lock_bh*/
	spin_lock(&br->multicast_lock);
	if (port->state == BR_STATE_DISABLED ||
	    port->state == BR_STATE_BLOCKING)
		goto out;

	if (port->multicast_startup_queries_sent <
	    br->multicast_startup_query_count)
		port->multicast_startup_queries_sent++;

	br_multicast_send_query(port->br, port,
				port->multicast_startup_queries_sent);

out:
	spin_unlock(&br->multicast_lock);
}

void br_multicast_add_port(struct net_bridge_port *port)
{
	port->multicast_router = 1;

	setup_timer(&port->multicast_router_timer, br_multicast_router_expired,
		    (unsigned long)port);
	setup_timer(&port->multicast_query_timer,
		    br_multicast_port_query_expired, (unsigned long)port);
}

void br_multicast_del_port(struct net_bridge_port *port)
{
	del_timer_sync(&port->multicast_router_timer);
}

static void __br_multicast_enable_port(struct net_bridge_port *port)
{
	port->multicast_startup_queries_sent = 0;

	if (try_to_del_timer_sync(&port->multicast_query_timer) >= 0 ||
	    del_timer(&port->multicast_query_timer))
		mod_timer(&port->multicast_query_timer, jiffies);
}

void br_multicast_enable_port(struct net_bridge_port *port)
{
	struct net_bridge *br = port->br;

        /*can not modify spin_lock to spin_lock_bh because of this function is called by a function already using spin_lock_bh*/
	spin_lock(&br->multicast_lock);
	if (br->multicast_disabled || !netif_running(br->dev))
		goto out;

	__br_multicast_enable_port(port);

out:
	spin_unlock(&br->multicast_lock);
}

void br_multicast_disable_port(struct net_bridge_port *port)
{
	struct net_bridge *br = port->br;
	struct net_bridge_port_group *pg;
	struct hlist_node *p, *n;

        /*can not modify spin_lock to spin_lock_bh because of this function is called by a function already using spin_lock_bh*/
	spin_lock(&br->multicast_lock);
	hlist_for_each_entry_safe(pg, p, n, &port->mglist, mglist)
		br_multicast_del_pg(br, pg);

	if (!hlist_unhashed(&port->rlist))
		hlist_del_init_rcu(&port->rlist);
	del_timer(&port->multicast_router_timer);
	del_timer(&port->multicast_query_timer);
	spin_unlock(&br->multicast_lock);
}

static int br_ip4_multicast_igmp3_report(struct net_bridge *br,
					 struct net_bridge_port *port,
					 struct sk_buff *skb)
{
	struct igmpv3_report *ih;
	struct igmpv3_grec *grec;
	int i;
	int len;
	int num;
	int type;
	int err = 0;
#ifdef TCSUPPORT_IGMPSNOOPING_ENHANCE	
	int num_src = 0;
	int dirty = 0;
	struct net_bridge_port_group *pg = NULL;
#endif
	__be32 group;

	if (!pskb_may_pull(skb, sizeof(*ih)))
		return -EINVAL;

	ih = igmpv3_report_hdr(skb);
	num = ntohs(ih->ngrec);
	len = sizeof(*ih);
#ifdef TCSUPPORT_IGMPSNOOPING_ENHANCE
	if(NULL == port)
		return -EINVAL;
	memset(&port->src_entry, 0, sizeof(port->src_entry));
#endif	
	for (i = 0; i < num; i++) {
		len += sizeof(*grec);
		if (!pskb_may_pull(skb, len))
			return -EINVAL;

		grec = (void *)(skb->data + len - sizeof(*grec));
		group = grec->grec_mca;
		type = grec->grec_type;

	#ifdef TCSUPPORT_IGMPSNOOPING_ENHANCE
		if(group == UPNP_MCAST)
			continue;
		DEBUGP_SNOOP("igmpv3 packet type=%d group=" NIPQUAD_FMT " ,grec_nsrcs=%d\n",
					type, NIPQUAD(group), (grec->grec_nsrcs));
	#endif
		
		len += ntohs(grec->grec_nsrcs) * 4;
		if (!pskb_may_pull(skb, len))
			return -EINVAL;

		/* We treat this as an IGMPv2 report for now. */
		switch (type) {
#ifndef TCSUPPORT_IGMPSNOOPING_ENHANCE
		case IGMPV3_MODE_IS_INCLUDE:
		case IGMPV3_MODE_IS_EXCLUDE:
		case IGMPV3_CHANGE_TO_INCLUDE:
		case IGMPV3_CHANGE_TO_EXCLUDE:
		case IGMPV3_ALLOW_NEW_SOURCES:
		case IGMPV3_BLOCK_OLD_SOURCES:
			break;
#else
		case IGMPV3_MODE_IS_INCLUDE:
		case IGMPV3_CHANGE_TO_INCLUDE:
		case IGMPV3_ALLOW_NEW_SOURCES:
			for(num_src=0; num_src<grec->grec_nsrcs; num_src++){
				port->src_entry.src.s_addr = grec->grec_src[num_src];
				pg =br_ip4_multicast_get_port_group(br, port, group, type==IGMPV3_ALLOW_NEW_SOURCES?1:0);
				if((NULL != pg) && (pg->src_entry.filt_mode == MCAST_EXCLUDE)){
                                             /*if call this function by ioctl,modify spin_lock to spin_lock_bh*/
					spin_lock(&br->multicast_lock);
					br_multicast_del_pg(br, pg);
					spin_unlock(&br->multicast_lock);
				}
				port->src_entry.filt_mode = MCAST_INCLUDE;
				err = br_ip4_multicast_add_group(br, port, group);
				if (err)
					goto out;
			}

			if(grec->grec_nsrcs == 0){
				if(IGMPV3_ALLOW_NEW_SOURCES == type)
					break;
				port->src_entry.src.s_addr = 0;
				pg =br_ip4_multicast_get_port_group(br, port, group, 1);
				if(pg){
					br_ip4_igmpv3_leave_group(br, port, group, pg);
				}
			}
			break;
		case IGMPV3_MODE_IS_EXCLUDE:
		case IGMPV3_CHANGE_TO_EXCLUDE:
		case IGMPV3_BLOCK_OLD_SOURCES:
			for(num_src=0; num_src<grec->grec_nsrcs; num_src++){
				dirty = 0;
				port->src_entry.src.s_addr = grec->grec_src[num_src];
				pg =br_ip4_multicast_get_port_group(br, port, group, 1);
				if((NULL!=pg) && (pg->src_entry.filt_mode == MCAST_INCLUDE)){
                                             /*if call this function by ioctl,modify spin_lock to spin_lock_bh*/
					spin_lock(&br->multicast_lock);
					br_multicast_del_pg(br, pg);
					spin_unlock(&br->multicast_lock);
					dirty = 1;
				}
				if((IGMPV3_BLOCK_OLD_SOURCES != type) && dirty){
					port->src_entry.filt_mode = MCAST_INCLUDE;
				}else{
					port->src_entry.filt_mode = MCAST_EXCLUDE;
				}
				err = br_ip4_multicast_add_group(br, port, group);
				if (err)
					goto out;
			}

			if(grec->grec_nsrcs == 0){
				if(type == IGMPV3_BLOCK_OLD_SOURCES)
					break;
				#if 0//not need to delete,just update
				pg =br_ip4_multicast_get_port_group(br, port, group, 0);
				if(pg){
					spin_lock(&br->multicast_lock);
					br_multicast_del_pg(br, pg);
					spin_unlock(&br->multicast_lock);
				}
				#endif
				port->src_entry.src.s_addr = 0;
				port->src_entry.filt_mode = MCAST_EXCLUDE;
				err = br_ip4_multicast_add_group(br, port, group);
				if (err)
					goto out;
			}
			break;
#endif
		default:
			continue;
		}
#ifndef TCSUPPORT_IGMPSNOOPING_ENHANCE
		err = br_ip4_multicast_add_group(br, port, group);
		if (err)
			break;
#endif
	}
#ifdef TCSUPPORT_IGMPSNOOPING_ENHANCE
out:
#endif
	return err;
}

#if defined(CONFIG_IPV6) || defined(CONFIG_IPV6_MODULE)
static int br_ip6_multicast_mld2_report(struct net_bridge *br,
					struct net_bridge_port *port,
					struct sk_buff *skb)
{
	struct icmp6hdr *icmp6h;
	struct mld2_grec *grec;
	struct net_bridge_port_group *pg = NULL;
	int i;
	int len;
	int num;
	int err = 0;
	int num_src = 0;

	if (!pskb_may_pull(skb, sizeof(*icmp6h)))
		return -EINVAL;

	icmp6h = icmp6_hdr(skb);
	num = ntohs(icmp6h->icmp6_dataun.un_data16[1]);
	len = sizeof(*icmp6h);

	for (i = 0; i < num; i++) {
		__be16 *nsrcs, _nsrcs;

		nsrcs = skb_header_pointer(skb,
					   len + offsetof(struct mld2_grec,
							 // grec_mca),
							   grec_nsrcs),
					   sizeof(_nsrcs), &_nsrcs);
		if (!nsrcs)
			return -EINVAL;

		if (!pskb_may_pull(skb,
				   len + sizeof(*grec) +
				   sizeof(struct in6_addr) * ntohs(*nsrcs)))
			return -EINVAL;

		grec = (struct mld2_grec *)(skb->data + len);
		len += sizeof(*grec) + sizeof(struct in6_addr) * ntohs(*nsrcs);

		DEBUGP_SNOOP("mld report(v2) type=%d group_addr=[%s]\n",
				grec->grec_type, ip6_sprintf(&grec->grec_mca));

		if(port)
			MultiIP2MAC(&grec->grec_mca, port->groupMacAddr.addr);
		/* We treat these as MLDv1 reports for now. */
		switch (grec->grec_type) {
		case MLD2_MODE_IS_EXCLUDE:
		case MLD2_CHANGE_TO_EXCLUDE:
		case MLD2_ALLOW_NEW_SOURCES:
			//ipv6_addr_copy(&port->src_entry.src6, &grec->grec_src[num]);
			br_ip6_multicast_add_group(br, port, &grec->grec_mca);
			break;
		case MLD2_MODE_IS_INCLUDE:
		case MLD2_CHANGE_TO_INCLUDE:
			if(grec->grec_nsrcs){
					//ipv6_addr_copy(&port->src_entry.src6, &grec->grec_src[num]);
					br_ip6_multicast_add_group(br, port, &grec->grec_mca);
				}
			else{
				pg = br_ip6_multicast_get_port_group(br, port, &grec->grec_mca, 0);
				if(pg){
					br_ip6_mld_leave_group(br, port, &grec->grec_mca, pg);
				}
			}
			break;
		case MLD2_BLOCK_OLD_SOURCES:
			pg = br_ip6_multicast_get_port_group(br, port, &grec->grec_mca, 0);
			if(pg)
				br_ip6_mld_leave_group(br, port, &grec->grec_mca, pg);
			break;

		default:
			continue;
		}
/*
		err = br_ip6_multicast_add_group(br, port, &grec->grec_mca);
		if (!err)
			break;
*/			
	}

	return err;
}
#endif

/*
 * Add port to rotuer_list
 *  list is maintained ordered by pointer value
 *  and locked by br->multicast_lock and RCU
 */
static void br_multicast_add_router(struct net_bridge *br,
				    struct net_bridge_port *port)
{
	struct net_bridge_port *p;
	struct hlist_node *n, *slot = NULL;

	hlist_for_each_entry(p, n, &br->router_list, rlist) {
		if ((unsigned long) port >= (unsigned long) p)
			break;
		slot = n;
	}

	if (slot)
		hlist_add_after_rcu(slot, &port->rlist);
	else
		hlist_add_head_rcu(&port->rlist, &br->router_list);
}

static void br_multicast_mark_router(struct net_bridge *br,
				     struct net_bridge_port *port)
{
	unsigned long now = jiffies;

	if (!port) {
		if (br->multicast_router == 1)
			mod_timer(&br->multicast_router_timer,
				  now + br->multicast_querier_interval);
		return;
	}

	if (port->multicast_router != 1)
		return;

	if (!hlist_unhashed(&port->rlist))
		goto timer;

	br_multicast_add_router(br, port);

timer:
	mod_timer(&port->multicast_router_timer,
		  now + br->multicast_querier_interval);
}

static void br_multicast_query_received(struct net_bridge *br,
					struct net_bridge_port *port,
					int saddr)
{
	if (saddr)
		mod_timer(&br->multicast_querier_timer,
			  jiffies + br->multicast_querier_interval);
	else if (timer_pending(&br->multicast_querier_timer))
		return;

	br_multicast_mark_router(br, port);
}

static int br_ip4_multicast_query(struct net_bridge *br,
				  struct net_bridge_port *port,
				  struct sk_buff *skb)
{
	struct iphdr *iph = ip_hdr(skb);
	struct igmphdr *ih = igmp_hdr(skb);
	struct net_bridge_mdb_entry *mp;
	struct igmpv3_query *ih3;
	struct net_bridge_port_group *p;
	struct net_bridge_port_group **pp;
	unsigned long max_delay;
	unsigned long now = jiffies;
	__be32 group;
	int err = 0;

         /*if call this function by ioctl,modify spin_lock to spin_lock_bh*/
	spin_lock(&br->multicast_lock);
	if (!netif_running(br->dev) ||
	    (port && port->state == BR_STATE_DISABLED))
		goto out;

	br_multicast_query_received(br, port, !!iph->saddr);

	group = ih->group;

	if (skb->len == sizeof(*ih)) {
		max_delay = ih->code * (HZ / IGMP_TIMER_SCALE);

		if (!max_delay) {
			max_delay = 10 * HZ;
			group = 0;
		}
	} else {
		if (!pskb_may_pull(skb, sizeof(struct igmpv3_query))) {
			err = -EINVAL;
			goto out;
		}

		ih3 = igmpv3_query_hdr(skb);
		if (ih3->nsrcs)
			goto out;

		max_delay = ih3->code ?
			    IGMPV3_MRC(ih3->code) * (HZ / IGMP_TIMER_SCALE) : 1;
	}

	if (!group)
		goto out;

	mp = br_mdb_ip4_get(br->mdb, group);
	if (!mp)
		goto out;

	max_delay *= br->multicast_last_member_count;

	if (!hlist_unhashed(&mp->mglist) &&
	    (timer_pending(&mp->timer) ?
	     time_after(mp->timer.expires, now + max_delay) :
	     try_to_del_timer_sync(&mp->timer) >= 0))
		mod_timer(&mp->timer, now + max_delay);

	for (pp = &mp->ports; (p = *pp); pp = &p->next) {
		if (timer_pending(&p->timer) ?
		    time_after(p->timer.expires, now + max_delay) :
		    try_to_del_timer_sync(&p->timer) >= 0)
			mod_timer(&mp->timer, now + max_delay);
	}

out:
	spin_unlock(&br->multicast_lock);
	return err;
}

#if defined(CONFIG_IPV6) || defined(CONFIG_IPV6_MODULE)
static int br_ip6_multicast_query(struct net_bridge *br,
				  struct net_bridge_port *port,
				  struct sk_buff *skb)
{
	struct ipv6hdr *ip6h = ipv6_hdr(skb);
	struct mld_msg *mld = (struct mld_msg *) icmp6_hdr(skb);
	struct net_bridge_mdb_entry *mp;
	struct mld2_query *mld2q;
	struct net_bridge_port_group *p, **pp;
	unsigned long max_delay;
	unsigned long now = jiffies;
	struct in6_addr *group = NULL;
	int err = 0;

         /*if call this function by ioctl,modify spin_lock to spin_lock_bh*/
	spin_lock(&br->multicast_lock);
	if (!netif_running(br->dev) ||
	    (port && port->state == BR_STATE_DISABLED))
		goto out;

	br_multicast_query_received(br, port, !ipv6_addr_any(&ip6h->saddr));

	if (skb->len == sizeof(*mld)) {
		if (!pskb_may_pull(skb, sizeof(*mld))) {
			err = -EINVAL;
			goto out;
		}
		mld = (struct mld_msg *) icmp6_hdr(skb);
		max_delay = msecs_to_jiffies(htons(mld->mld_maxdelay));
		if (max_delay)
			group = &mld->mld_mca;
	} else if (skb->len >= sizeof(*mld2q)) {
		if (!pskb_may_pull(skb, sizeof(*mld2q))) {
			err = -EINVAL;
			goto out;
		}
		mld2q = (struct mld2_query *)icmp6_hdr(skb);
		if (!mld2q->mld2q_nsrcs)
			group = &mld2q->mld2q_mca;
		max_delay = mld2q->mld2q_mrc ? MLDV2_MRC(mld2q->mld2q_mrc) : 1;
	}

	if (!group)
		goto out;

	mp = br_mdb_ip6_get(br->mdb, group);
	if (!mp)
		goto out;

	max_delay *= br->multicast_last_member_count;
	if (!hlist_unhashed(&mp->mglist) &&
	    (timer_pending(&mp->timer) ?
	     time_after(mp->timer.expires, now + max_delay) :
	     try_to_del_timer_sync(&mp->timer) >= 0))
		mod_timer(&mp->timer, now + max_delay);

	for (pp = &mp->ports; (p = *pp); pp = &p->next) {
		if (timer_pending(&p->timer) ?
		    time_after(p->timer.expires, now + max_delay) :
		    try_to_del_timer_sync(&p->timer) >= 0)
			mod_timer(&mp->timer, now + max_delay);
	}

out:
	spin_unlock(&br->multicast_lock);
	return err;
}
#endif

static void br_multicast_leave_group(struct net_bridge *br,
				     struct net_bridge_port *port,
				     struct br_ip *group)
{
	struct net_bridge_mdb_htable *mdb;
	struct net_bridge_mdb_entry *mp;
	struct net_bridge_port_group *p;
	unsigned long now;
	unsigned long time;

         /*if call this function by ioctl,modify spin_lock to spin_lock_bh*/
	spin_lock(&br->multicast_lock);
	if (!netif_running(br->dev) ||
	    (port && port->state == BR_STATE_DISABLED) ||
	    timer_pending(&br->multicast_querier_timer))
		goto out;

	mdb = br->mdb;
	mp = br_mdb_ip_get(mdb, group);
	if (!mp)
		goto out;

	now = jiffies;
#ifdef TCSUPPORT_IGMPSNOOPING_ENHANCE
	time  =now + br->multicast_membership_interval*
		     br->multicast_last_member_interval;
	if(br->quick_leave)
#endif
	time = now + br->multicast_last_member_count *
		     br->multicast_last_member_interval;

	if (!port) {
		if (!hlist_unhashed(&mp->mglist) &&
		    (timer_pending(&mp->timer) ?
		     time_after(mp->timer.expires, time) :
		     try_to_del_timer_sync(&mp->timer) >= 0)) {
			mod_timer(&mp->timer, time);

			mp->queries_sent = 0;
			mod_timer(&mp->query_timer, now);
		}

		goto out;
	}

	for (p = mp->ports; p; p = p->next) {
#ifdef TCSUPPORT_IGMPSNOOPING_ENHANCE
/*
		if ((p->port != port) ||
			(p->src_entry.src.s_addr != port->src_entry.src.s_addr))
*/
		if(!br_multicast_equal_port_group(p, port, group))
#else
		if (p->port != port)
#endif
			continue;

#ifdef TCSUPPORT_IGMPSNOOPING_ENHANCE
		if(br->quick_leave){
			br_multicast_del_pg(br, p);
			goto out;
		}
#endif		
		
		if (!hlist_unhashed(&p->mglist) &&
		    (timer_pending(&p->timer) ?
		     time_after(p->timer.expires, time) :
		     try_to_del_timer_sync(&p->timer) >= 0)) {
			mod_timer(&p->timer, time);

			p->queries_sent = 0;
			mod_timer(&p->query_timer, now);
		}

		break;
	}

out:
	spin_unlock(&br->multicast_lock);
}

static void br_ip4_multicast_leave_group(struct net_bridge *br,
					 struct net_bridge_port *port,
					 __be32 group)
{
	struct br_ip br_group;

	if (ipv4_is_local_multicast(group))
		return;

	br_group.u.ip4 = group;
	br_group.proto = htons(ETH_P_IP);

	br_multicast_leave_group(br, port, &br_group);
}

#if defined(CONFIG_IPV6) || defined(CONFIG_IPV6_MODULE)
static void br_ip6_multicast_leave_group(struct net_bridge *br,
					 struct net_bridge_port *port,
					 const struct in6_addr *group)
{
	struct br_ip br_group;

	if (ipv6_is_local_multicast(group))
		return;

	ipv6_addr_copy(&br_group.u.ip6, group);
	br_group.proto = htons(ETH_P_IPV6);

	br_multicast_leave_group(br, port, &br_group);
}
#endif

static int br_multicast_ipv4_rcv(struct net_bridge *br,
				 struct net_bridge_port *port,
				 struct sk_buff *skb)
{
	struct sk_buff *skb2 = skb;
	struct iphdr *iph;
	struct igmphdr *ih;
	unsigned len;
	unsigned offset;
	int err;
#ifdef TCSUPPORT_IGMPSNOOPING_ENHANCE	
	struct net_bridge_port_group *pg = NULL;
#endif

	/* We treat OOM as packet loss for now. */
	if (!pskb_may_pull(skb, sizeof(*iph)))
		return -EINVAL;

	iph = ip_hdr(skb);

	if (iph->ihl < 5 || iph->version != 4)
		return -EINVAL;

	if (!pskb_may_pull(skb, ip_hdrlen(skb)))
		return -EINVAL;

	iph = ip_hdr(skb);

	if (unlikely(ip_fast_csum((u8 *)iph, iph->ihl)))
		return -EINVAL;

	if (iph->protocol != IPPROTO_IGMP)
		return 0;
#ifdef TCSUPPORT_IGMPSNOOPING_ENHANCE
	if(iph->daddr == UPNP_MCAST)//flooding UPNP packets
		return 0;
#endif

	len = ntohs(iph->tot_len);
	if (skb->len < len || len < ip_hdrlen(skb))
		return -EINVAL;

	if (skb->len > len) {
		skb2 = skb_clone(skb, GFP_ATOMIC);
		if (!skb2)
			return -ENOMEM;

		err = pskb_trim_rcsum(skb2, len);
		if (err)
			goto err_out;
	}

	len -= ip_hdrlen(skb2);
	offset = skb_network_offset(skb2) + ip_hdrlen(skb2);
	__skb_pull(skb2, offset);
	skb_reset_transport_header(skb2);

	err = -EINVAL;
	if (!pskb_may_pull(skb2, sizeof(*ih)))
		goto out;

	switch (skb2->ip_summed) {
	case CHECKSUM_COMPLETE:
		if (!csum_fold(skb2->csum))
			break;
		/* fall through */
	case CHECKSUM_NONE:
		skb2->csum = 0;
		if (skb_checksum_complete(skb2))
			goto out;
	}

	err = 0;

	BR_INPUT_SKB_CB(skb)->igmp = 1;
	ih = igmp_hdr(skb2);
#ifdef TCSUPPORT_IGMPSNOOPING_ENHANCE
	if(port){
		memcpy(port->macAddr.addr, eth_hdr(skb)->h_source,ETH_ALEN);
		memset(&port->src_entry, 0, sizeof(port->src_entry));
		port->version = 4;
	}
#endif
	switch (ih->type) {
	case IGMP_HOST_MEMBERSHIP_REPORT:
	case IGMPV2_HOST_MEMBERSHIP_REPORT:
		//ignore wan site control packet.
		if((skb2->dev != NULL) && (skb2->dev->name[0] == 'n')){
			//printk("\r\nignore wan site report packet(v1/v2)!");
			err = 0;
			goto out;
		}
		BR_INPUT_SKB_CB(skb2)->mrouters_only = 1;
		err = br_ip4_multicast_add_group(br, port, ih->group);
		break;
	case IGMPV3_HOST_MEMBERSHIP_REPORT:
		//ignore wan site control packet.
		if((skb2->dev != NULL) && (skb2->dev->name[0] == 'n')){
			//printk("\r\nignore wan site report packet(v3)!");
			err = 0;
			goto out;
		}
		err = br_ip4_multicast_igmp3_report(br, port, skb2);
		break;
	case IGMP_HOST_MEMBERSHIP_QUERY:
		err = br_ip4_multicast_query(br, port, skb2);
		break;
	case IGMP_HOST_LEAVE_MESSAGE:
		//ignore wan site control packet.
		if((skb2->dev != NULL) && (skb2->dev->name[0] == 'n')){
			//printk("\r\nignore wan site leave packet!");
			err = 0;
			goto out;
		}
	#ifdef TCSUPPORT_IGMPSNOOPING_ENHANCE	
		pg =br_ip4_multicast_get_port_group(br, port, ih->group, 1);
		if(pg){
			br_ip4_igmpv3_leave_group(br, port, ih->group, pg);
		}
	#else	
		br_ip4_multicast_leave_group(br, port, ih->group);
	#endif
		break;
	}

out:
	__skb_push(skb2, offset);
err_out:
	if (skb2 != skb)
		kfree_skb(skb2);
	return err;
}

#ifdef TCSUPPORT_IGMPSNOOPING_ENHANCE
/*
	to check if we should allow muticast packet pass.

	return:
	    0:	not allow
	    1:	allow
	    2:	pg's filt_mode = MCAST_EXCLUDE, and the skb(muticast packet)'s s_addr
	    		is not equel pg's s_addr, that means the skb is not be "EXCLUDE"
	    		(In this case, if skb is not in any of the "pg", we should let it pass)
*/
static  int br_multicast_ipv4_port_pass(struct net_bridge_port_group *pg,
					       struct net_bridge_port *p,
						   const struct sk_buff *skb){
	struct net_device *dev = BR_INPUT_SKB_CB(skb)->brdev;
	struct net_bridge *br = netdev_priv(dev);
	__be32 s_addr = 0;
		
		s_addr = ip_hdr(skb)->saddr;
		if((NULL != pg) &&(!has_expired(br, pg))){
			if((pg->src_entry.filt_mode == MCAST_INCLUDE)
					&& (pg->src_entry.src.s_addr == s_addr))
					return 1;
			else if(pg->src_entry.filt_mode == MCAST_EXCLUDE){
				if(0 == pg->src_entry.src.s_addr)
					return 1;
				else if(pg->src_entry.src.s_addr != s_addr)
					return 2;
				else if(pg->src_entry.src.s_addr == s_addr)
					return 0;
			}
		}
		return 0;

}

static int br_multicast_ipv4_should_drop(struct net_bridge *br, 
	const struct sk_buff *skb)
{
	struct iphdr *iph;
	struct igmphdr *ih;
	const unsigned char *dmac;
	const u8 multicast_address[ETH_ALEN] = { 0x01, 0x00, 0x5e, 0x00, 0x00, 0x00 };
	
	if (!pskb_may_pull(skb, sizeof(*iph)))
		return 0;

	iph = ip_hdr(skb);
	if (iph->protocol == IPPROTO_IGMP)
		return 0;

	if (iph->ihl < 5 || iph->version != 4)
		return 0;

	if (!pskb_may_pull(skb, ip_hdrlen(skb)))
		return 0;

	iph = ip_hdr(skb);

	if (unlikely(ip_fast_csum((u8 *)iph, iph->ihl)))
		return 0;
	
	if(iph->daddr == UPNP_MCAST)//flooding UPNP packets
		return 0;
	if(ipv4_is_local_multicast(iph->daddr))//flooding RIPv2 packets and so on, 224.0.0.*
		return 0;

	dmac = eth_hdr(skb)->h_dest;
	if (memcmp(multicast_address, dmac, 3) != 0)
		return 0;
	
	return 1;
}
#endif
#if defined(CONFIG_IPV6) || defined(CONFIG_IPV6_MODULE)
static int br_multicast_ipv6_rcv(struct net_bridge *br,
				 struct net_bridge_port *port,
				 struct sk_buff *skb)
{
	struct sk_buff *skb2 = skb;
	struct ipv6hdr *ip6h = NULL;
	struct icmp6hdr *icmp6h = NULL;
	struct net_bridge_port_group *pg = NULL;
	u8 nexthdr;
	unsigned len;
	int offset;
	int err;

	if (!pskb_may_pull(skb, sizeof(*ip6h)))
		return -EINVAL;

	ip6h = ipv6_hdr(skb);

	/*
	 * We're interested in MLD messages only.
	 *  - Version is 6
	 *  - MLD has always Router Alert hop-by-hop option
	 *  - But we do not support jumbrograms.
	 */
	if (ip6h->version != 6 ||
	    ip6h->nexthdr != IPPROTO_HOPOPTS ||
	    ip6h->payload_len == 0)
		return 0;

	len = ntohs(ip6h->payload_len) + sizeof(*ip6h);
	if (skb->len < len)
		return -EINVAL;

	nexthdr = ip6h->nexthdr;
	offset = ipv6_skip_exthdr(skb, sizeof(*ip6h), &nexthdr);

	if (offset < 0 || nexthdr != IPPROTO_ICMPV6)
		return 0;

	/* Okay, we found ICMPv6 header */
	skb2 = skb_clone(skb, GFP_ATOMIC);
	if (!skb2)
		return -ENOMEM;

	len -= offset - skb_network_offset(skb2);

	__skb_pull(skb2, offset);
	skb_reset_transport_header(skb2);

	err = -EINVAL;
	if (!pskb_may_pull(skb2, sizeof(*icmp6h)))
		goto out;

	icmp6h = icmp6_hdr(skb2);

	switch (icmp6h->icmp6_type) {
	case ICMPV6_MGM_QUERY:
	case ICMPV6_MGM_REPORT:
	case ICMPV6_MGM_REDUCTION:
	case ICMPV6_MLD2_REPORT:
		break;
	default:
		err = 0;
		goto out;
	}

	/* Okay, we found MLD message. Check further. */
	if (skb2->len > len) {
		err = pskb_trim_rcsum(skb2, len);
		if (err)
			goto out;
		err = -EINVAL;
	}
	ip6h = ipv6_hdr(skb2);

	switch (skb2->ip_summed) {
	case CHECKSUM_COMPLETE:
//		if (!csum_fold(skb2->csum))
		if(!csum_ipv6_magic(&ip6h->saddr,&ip6h->daddr,skb2->len,
			IPPROTO_ICMPV6,skb2->csum))
			break;
		/*FALLTHROUGH*/
	case CHECKSUM_NONE:
		//skb2->csum = 0;
		//if (skb_checksum_complete(skb2))
		skb2->csum = ~csum_unfold(csum_ipv6_magic(&ip6h->saddr,
											&ip6h->daddr,
											skb2->len,
											IPPROTO_ICMPV6,0));
		if(__skb_checksum_complete(skb2))
			goto out;
	}

	err = 0;

	BR_INPUT_SKB_CB(skb)->igmp = 1;
	if(port){
		struct mld_msg *mld = (struct mld_msg *)icmp6h;
		MultiIP2MAC(&mld->mld_mca, port->groupMacAddr.addr);
		memcpy(port->macAddr.addr, eth_hdr(skb)->h_source,ETH_ALEN);
		memset(&port->src_entry, 0, sizeof(port->src_entry));
		port->version = 6;
	}
	DEBUGP_SNOOP("MLD packet income type=%d host=" MAC_FMT " dstMac=" MAC_FMT "\n",  
			 icmp6h->icmp6_type, NMAC(eth_hdr(skb)->h_source),NMAC(eth_hdr(skb)->h_dest));

	switch (icmp6h->icmp6_type) {
	case ICMPV6_MGM_REPORT:
	    {
		if((skb2->dev != NULL) && (skb2->dev->name[0] == 'n')){
			//printk("\r\n[v6]ignore wan site report packet(v1)!");
			err = 0;
			goto out;
		}
		struct mld_msg *mld = (struct mld_msg *)icmp6h;
		BR_INPUT_SKB_CB(skb2)->mrouters_only = 1;
		err = br_ip6_multicast_add_group(br, port, &mld->mld_mca);
		break;
	    }
	case ICMPV6_MLD2_REPORT:
		if((skb2->dev != NULL) && (skb2->dev->name[0] == 'n')){
			//printk("\r\n[v6]ignore wan site report packet(v2)!");
			err = 0;
			goto out;
		}
		err = br_ip6_multicast_mld2_report(br, port, skb2);
		break;
	case ICMPV6_MGM_QUERY:
		err = br_ip6_multicast_query(br, port, skb2);
		break;
	case ICMPV6_MGM_REDUCTION:
	    {
			if((skb2->dev != NULL) && (skb2->dev->name[0] == 'n')){
			//printk("\r\n[v6]ignore wan site leave packet!");
				err = 0;
				goto out;
			}
			struct mld_msg *mld = (struct mld_msg *)icmp6h;
			pg = br_ip6_multicast_get_port_group(br, port, &mld->mld_mca, 0);
			if(pg){
				br_ip6_mld_leave_group(br, port, &mld->mld_mca, pg);
			}
	    }
	}

out:
	__skb_push(skb2, offset);
	if (skb2 != skb)
		kfree_skb(skb2);
	return err;
}

#ifdef TCSUPPORT_IGMPSNOOPING_ENHANCE
static  int br_multicast_ipv6_port_pass(struct net_bridge_port_group *pg,
					       struct net_bridge_port *p,
						   const struct sk_buff *skb){
		struct net_device *dev = BR_INPUT_SKB_CB(skb)->brdev;
		struct net_bridge *br = netdev_priv(dev);
		struct ipv6hdr *ip6h = NULL;
		unsigned char	group_mac[ETH_ALEN];
	
		if((NULL != pg) &&(!has_expired(br, pg))){
			ip6h = ipv6_hdr( skb);
			MultiIP2MAC(&ip6h->daddr, group_mac);
			if(!compare_ether_addr(group_mac, pg->group_mac))
			{
				return 1;
			}
		}
		
		return 0;
}

static int br_multicast_ipv6_should_drop(struct net_bridge *br, const struct sk_buff *skb)
{
	const unsigned char *dest = eth_hdr(skb)->h_dest;
	struct ipv6hdr *ip6h = NULL;
	u8 nexthdr = 0;
	int offset = 0;
	
	if (!pskb_may_pull(skb, sizeof(*ip6h)))
			return 0;

	ip6h = ipv6_hdr(skb);
	nexthdr = ip6h->nexthdr;
	if (nexthdr == IPPROTO_ICMPV6 
		|| ip6h->daddr.s6_addr16[0]== 0xFF02
		|| ip6h->daddr.s6_addr16[0]== 0xFF01)
		return 0;
	
	if((IPPROTO_UDP != nexthdr)
		&& (IPPROTO_FRAGMENT != nexthdr))
		return 0;
		
	if(nexthdr == IPPROTO_HOPOPTS){
		offset = ipv6_skip_exthdr(skb, sizeof(*ip6h), &nexthdr);
		if (nexthdr == IPPROTO_ICMPV6){
			return 0;
		}
	}

	/*IPv6 Multicast packet*/
	if(0x33 == dest[0] && 0x33 == dest[1])
		return 1;
	return 0;
}
#endif
#endif

#ifdef TCSUPPORT_IGMPSNOOPING_ENHANCE
int br_multicast_port_pass(struct net_bridge_port_group *pg,
					       struct net_bridge_port *p,
						   const struct sk_buff *skb){

	switch (skb->protocol) {
	case htons(ETH_P_IP):
		return br_multicast_ipv4_port_pass(pg, p, skb);
#if defined(CONFIG_IPV6) || defined(CONFIG_IPV6_MODULE)
	case htons(ETH_P_IPV6):
		return br_multicast_ipv6_port_pass(pg, p, skb);
#endif
	}
	return 0;
}
/**
	to judge if need drop a muticast packet.
**/
int br_multicast_should_drop(struct net_bridge *br, const struct sk_buff *skb)
{
	if (br->multicast_disabled)
		return 0;

	switch (skb->protocol) {
	case htons(ETH_P_IP):
		return br_multicast_ipv4_should_drop(br, skb);
#if defined(CONFIG_IPV6) || defined(CONFIG_IPV6_MODULE)
	case htons(ETH_P_IPV6):
		return br_multicast_ipv6_should_drop(br, skb);
#endif
	}
	return 0;
}

/*  
*	dump a muticast packet's information  
*/
void br_multicast_dump_packet_info(const struct sk_buff *skb, int checkPoint)
{
	struct iphdr *iph = NULL;
	struct igmphdr *ih = NULL;
	struct ipv6hdr *iph6 = NULL;
	u8 nexthdr = 0;
	if(snoopingdebug){
		switch (skb->protocol) {
			case htons(ETH_P_IP):
				iph = ip_hdr(skb);
				if(iph->version ==4){
					
					DEBUGP_SNOOP("----drop packet information-----checkpoint(%d)-------\n", checkPoint);
					DEBUGP_SNOOP("protocol = %d(1.ICMP;2.IGMP;17.UDP)\n", iph->protocol);
					DEBUGP_SNOOP("check packet saddr=" NIPQUAD_FMT " daddr=" NIPQUAD_FMT"\n",  
						 NIPQUAD(iph ->saddr),NIPQUAD(iph ->daddr));
					if(iph->protocol == IPPROTO_IGMP)
					{
						ih = igmp_hdr(skb);
						DEBUGP_SNOOP(" group=" NIPQUAD_FMT "\n", NIPQUAD(ih->group));
					}
					DEBUGP_SNOOP("------------ ---end of information------------\n");
				}
				break;
#if defined(CONFIG_IPV6) || defined(CONFIG_IPV6_MODULE)
				case htons(ETH_P_IPV6):
					iph6 = ipv6_hdr(skb);
					nexthdr = iph6->nexthdr;
					if(iph6->version == 6)
					{
						DEBUGP_SNOOP("----drop packet information--v6---checkpoint(%d)-------\n", checkPoint);
						DEBUGP_SNOOP("check packet saddr=[%s] daddr=[%s]\n",  
						 ip6_sprintf(&iph6->saddr),ip6_sprintf(&iph6->daddr));
						if(nexthdr == IPPROTO_ICMPV6){
							DEBUGP_SNOOP("this packet is normal ICMPv6\n");
						}
						if(nexthdr == IPPROTO_HOPOPTS){
							ipv6_skip_exthdr(skb, sizeof(*iph6), &nexthdr);
							if (nexthdr == IPPROTO_ICMPV6)
							{
								DEBUGP_SNOOP("this packet is MLD ICMPv6\n");
							}
						
						}
					DEBUGP_SNOOP("------------ ---end of information------------\n");	
					}
					break;
				default:	
					DEBUGP_SNOOP("------------unknow packet format------------\n");
#endif
			}
		}
}
#endif
int br_multicast_rcv(struct net_bridge *br, struct net_bridge_port *port,
		     struct sk_buff *skb)
{
	BR_INPUT_SKB_CB(skb)->igmp = 0;
	BR_INPUT_SKB_CB(skb)->mrouters_only = 0;

	if (br->multicast_disabled)
		return 0;

	switch (skb->protocol) {
	case htons(ETH_P_IP):
		return br_multicast_ipv4_rcv(br, port, skb);
#if defined(CONFIG_IPV6) || defined(CONFIG_IPV6_MODULE)
	case htons(ETH_P_IPV6):
		return br_multicast_ipv6_rcv(br, port, skb);
#endif
	}

	return 0;
}

static void br_multicast_query_expired(unsigned long data)
{
	struct net_bridge *br = (void *)data;

         /*if call this function by ioctl,modify spin_lock to spin_lock_bh*/
	spin_lock(&br->multicast_lock);
	if (br->multicast_startup_queries_sent <
	    br->multicast_startup_query_count)
		br->multicast_startup_queries_sent++;

	br_multicast_send_query(br, NULL, br->multicast_startup_queries_sent);

	spin_unlock(&br->multicast_lock);
}

void br_multicast_init(struct net_bridge *br)
{
	br->hash_elasticity = 4;
	br->hash_max = 512;

	br->multicast_router = 1;
	br->multicast_last_member_count = 2;
	br->multicast_startup_query_count = 2;

	br->multicast_last_member_interval = HZ;
	br->multicast_query_response_interval = 10 * HZ;
	br->multicast_startup_query_interval = 125 * HZ / 4;
	br->multicast_query_interval = 125 * HZ;
	br->multicast_querier_interval = 255 * HZ;
	br->multicast_membership_interval = 260 * HZ;

	spin_lock_init(&br->multicast_lock);
	setup_timer(&br->multicast_router_timer,
		    br_multicast_local_router_expired, 0);
	setup_timer(&br->multicast_querier_timer,
#ifdef TCSUPPORT_IGMPSNOOPING_ENHANCE
		    br_multicast_querier_expired, (unsigned long)br);
#else
		    br_multicast_local_router_expired, 0);
#endif
	setup_timer(&br->multicast_query_timer, br_multicast_query_expired,
		    (unsigned long)br);

	#if defined(TCSUPPORT_XPON_IGMP)|| defined(TCSUPPORT_MULTICAST_SPEED)
	igmp_hwnat_init(br);
	#endif
}

void br_multicast_open(struct net_bridge *br)
{
	br->multicast_startup_queries_sent = 0;

	if (br->multicast_disabled)
		return;

	mod_timer(&br->multicast_query_timer, jiffies);
}

void br_multicast_stop(struct net_bridge *br)
{
	struct net_bridge_mdb_htable *mdb;
	struct net_bridge_mdb_entry *mp;
	struct hlist_node *p, *n;
	u32 ver;
	int i;

	del_timer_sync(&br->multicast_router_timer);
	del_timer_sync(&br->multicast_querier_timer);
	del_timer_sync(&br->multicast_query_timer);

	spin_lock_bh(&br->multicast_lock);
	mdb = br->mdb;
	if (!mdb)
		goto out;

	br->mdb = NULL;

	ver = mdb->ver;
	for (i = 0; i < mdb->max; i++) {
		hlist_for_each_entry_safe(mp, p, n, &mdb->mhash[i],
					  hlist[ver]) {
			del_timer(&mp->timer);
			del_timer(&mp->query_timer);
			call_rcu_bh(&mp->rcu, br_multicast_free_group);
		}
	}

	if (mdb->old) {
		spin_unlock_bh(&br->multicast_lock);
		rcu_barrier_bh();
		spin_lock_bh(&br->multicast_lock);
		WARN_ON(mdb->old);
	}

	mdb->old = mdb;
	call_rcu_bh(&mdb->rcu, br_mdb_free);

out:
	spin_unlock_bh(&br->multicast_lock);
}

int br_multicast_set_router(struct net_bridge *br, unsigned long val)
{
	int err = -ENOENT;

	spin_lock_bh(&br->multicast_lock);
	if (!netif_running(br->dev))
		goto unlock;

	switch (val) {
	case 0:
	case 2:
		del_timer(&br->multicast_router_timer);
		/* fall through */
	case 1:
		br->multicast_router = val;
		err = 0;
		break;

	default:
		err = -EINVAL;
		break;
	}

unlock:
	spin_unlock_bh(&br->multicast_lock);

	return err;
}

/*accrodint to kernel 3.18,do not modify spin_lock to spin_lock_bh,so can not call this function by ioctl*/
int br_multicast_set_port_router(struct net_bridge_port *p, unsigned long val)
{
	struct net_bridge *br = p->br;
	int err = -ENOENT;

	spin_lock(&br->multicast_lock);
	if (!netif_running(br->dev) || p->state == BR_STATE_DISABLED)
		goto unlock;

	switch (val) {
	case 0:
	case 1:
	case 2:
		p->multicast_router = val;
		err = 0;

		if (val < 2 && !hlist_unhashed(&p->rlist))
			hlist_del_init_rcu(&p->rlist);

		if (val == 1)
			break;

		del_timer(&p->multicast_router_timer);

		if (val == 0)
			break;

		br_multicast_add_router(br, p);
		break;

	default:
		err = -EINVAL;
		break;
	}

unlock:
	spin_unlock(&br->multicast_lock);

	return err;
}

int br_multicast_toggle(struct net_bridge *br, unsigned long val)
{
	struct net_bridge_port *port;
	int err = 0;

	spin_lock_bh(&br->multicast_lock);
	if (br->multicast_disabled == !val)
		goto unlock;

	br->multicast_disabled = !val;
	if (br->multicast_disabled)
		goto unlock;

	if (!netif_running(br->dev))
		goto unlock;

	if (br->mdb) {
		if (br->mdb->old) {
			err = -EEXIST;
rollback:
			br->multicast_disabled = !!val;
			goto unlock;
		}

		err = br_mdb_rehash(&br->mdb, br->mdb->max,
				    br->hash_elasticity);
		if (err)
			goto rollback;
	}

	br_multicast_open(br);
	list_for_each_entry(port, &br->port_list, list) {
		if (port->state == BR_STATE_DISABLED ||
		    port->state == BR_STATE_BLOCKING)
			continue;

		__br_multicast_enable_port(port);
	}

unlock:
	spin_unlock_bh(&br->multicast_lock);

	return err;
}

int br_multicast_set_hash_max(struct net_bridge *br, unsigned long val)
{
	int err = -ENOENT;
	u32 old;

	spin_lock_bh(&br->multicast_lock);
	if (!netif_running(br->dev))
		goto unlock;

	err = -EINVAL;
	if (!is_power_of_2(val))
		goto unlock;
	if (br->mdb && val < br->mdb->size)
		goto unlock;

	err = 0;

	old = br->hash_max;
	br->hash_max = val;

	if (br->mdb) {
		if (br->mdb->old) {
			err = -EEXIST;
rollback:
			br->hash_max = old;
			goto unlock;
		}

		err = br_mdb_rehash(&br->mdb, br->hash_max,
				    br->hash_elasticity);
		if (err)
			goto rollback;
	}

unlock:
	spin_unlock_bh(&br->multicast_lock);

	return err;
}
////////////////////////////////////////////////////////////////////////////////////////////
#if defined(TCSUPPORT_XPON_IGMP) || defined(TCSUPPORT_MULTICAST_SPEED)
#define MUL_PROTO_IGMP 1
#define MUL_PROTO_MLD 2

static struct list_head hwnat_igmp_entry;
static unsigned int hwnat_igmp_flag = 1;
static unsigned int hwnat_age_time = 3000;
static spinlock_t	 hwnat_lock;
static struct net_bridge * hwnat_br = NULL;

#ifdef TCSUPPORT_RA_HWNAT
extern int (*hwnat_is_alive_pkt_hook)(struct sk_buff* skb);
extern int (*hwnat_skb_to_foe_hook)(struct sk_buff* skb);
extern int (*hwnat_set_special_tag_hook)(int index, int tag);
extern int (*hwnat_delete_foe_entry_hook)(int index); 
extern int (*hwnat_is_multicast_entry_hook)(int index ,unsigned char* grp_addr,unsigned char* src_addr,int type);
#ifdef TCSUPPORT_MULTICAST_SPEED
extern int (*multicast_speed_find_entry_hook)(int index);
extern int (*multicast_speed_learn_flow_hook)(struct sk_buff* skb);
extern int (*hwnat_set_rule_according_to_state_hook)(int index, int state,int mask);
#endif
extern int (*xpon_igmp_learn_flow_hook)(struct sk_buff* skb);
extern int (*hwnat_set_wlan_multicast_hook)(int index,int flag);
extern int (*wan_multicast_undrop_hook)(void);
#else
static int (*hwnat_is_alive_pkt_hook)(struct sk_buff* skb) = NULL;
static int (*hwnat_skb_to_foe_hook)(struct sk_buff* skb) = NULL;
static int (*hwnat_set_special_tag_hook)(int index, int tag) = NULL;
static int (*hwnat_delete_foe_entry_hook)(int index) = NULL; 
static int (*hwnat_is_multicast_entry_hook)(int index ,unsigned char* grp_addr,unsigned char* src_addr,int type) = NULL;
#ifdef TCSUPPORT_MULTICAST_SPEED
extern int (*multicast_speed_find_entry_hook)(int index);
static int (*multicast_speed_learn_flow_hook)(struct sk_buff* skb) = NULL;
static int (*hwnat_set_rule_according_to_state_hook)(int index, int state,int mask) = NULL;
#endif
static int (*hwnat_set_wlan_multicast_hook)(int index,int flag) = NULL;
static int (*xpon_igmp_learn_flow_hook)(struct sk_buff* skb) = NULL;
static int (*wan_multicast_undrop_hook)(void) = NULL;
#endif


struct list_head* igmp_hwnat_get_list(void)
{
	return &hwnat_igmp_entry;
}

int igmp_hwnat_debug_on(void)
{
	return hwnat_igmp_flag&0x02;
}

int igmp_hwnat_enable(void)
{
	return hwnat_igmp_flag&0x01;
}

#define IGMP_HWNAT_DEBUG(fmt,args...)  		\
	do{									\
		if(igmp_hwnat_debug_on())	\
    	{								\
    		printk("\r\n%s:"fmt,__FUNCTION__,##args);\
    	}								\
	}while(0)

void* igmp_hwnat_alloc(int size)
{
	void* ptr = NULL;
	if (size>0)
	{
		ptr = kzalloc(size, GFP_ATOMIC);
	}
	return ptr;

}

#ifdef TCSUPPORT_MULTICAST_SPEED
void igmp_hwnat_free(struct rcu_head *head)
{
	struct IGMP_HWNATEntry_s *entry
		= container_of(head, struct IGMP_HWNATEntry_s,rcu);
	if(entry)
		kfree(entry);
	
	return;
}
#else
void igmp_hwnat_free(void* ptr)
{
	if (ptr)
	 	kfree(ptr);

	ptr = NULL;
	return;
}
#endif

/**************************************************
Function: Get Port Mask Bit
Input: pointer to struct net_bridge_port
Return: 
	0-3: ethernet port mask
	8-11: wifi port mask
	-1: error
**************************************************/

int igmp_hwnat_get_port(struct net_bridge_port*  p)
{
	if (! p || !( p->dev)) 
	{
	if (! p) 
			IGMP_HWNAT_DEBUG("p == NULL");
		else
			IGMP_HWNAT_DEBUG("p->dev == NULL");
		return -1;
	}

	IGMP_HWNAT_DEBUG("%s:port name = ",p->dev->name);
	
	if ((p->dev->name[0] == 'e') && (p->dev->name[4] == '.'))
			return  (p->dev->name[5] - '1');
#ifdef TCSUPPORT_MULTICAST_SPEED
	if ((strlen(p->dev->name) == 3) && (strncmp(p->dev->name,"ra", 2) == 0) && 
		((p->dev->name[2] >= '0') && (p->dev->name[2] <= '7'))) 
	{
		return (p->dev->name[2] - '0')+HWNAT_WLAN_IF_BASE;
	}

	if ((strlen(p->dev->name) == 4) && (strncmp(p->dev->name,"rai", 3) == 0) && 
		((p->dev->name[3] >= '0') && (p->dev->name[3] <= '7'))) 
	{
		return  (p->dev->name[3] - '0')+HWNAT_WLAN_IF_BASE+HWNAT_WLAN_IF_NUM;
	}
#else
	if ((p->dev->name[0] == 'r') && (p->dev->name[1] == 'a'))
				return  (p->dev->name[5] - '0')+8;
#endif
	
	return -1;
}

/**************************************************
Function: Check if the port can receive the 
          multicast flow 
Input: 
	br: pointer to struct net_bridge
	port: pointer to struct net_bridge_port
	entry: pointer to struct IGMP_HWNATEntry_t
Return: 
	0: fail;  1: ok
**************************************************/

int igmp_hwnat_should_deliver(struct net_bridge *br,struct net_bridge_port *port,IGMP_HWNATEntry_t* entry)
{
	struct net_bridge_mdb_htable *mdb = br->mdb;
	struct net_bridge_mdb_entry *mp = NULL;
	struct net_bridge_port_group *pg = NULL;
	struct br_ip  group;
	int hash,flag = 0;
	char src[16];
	
	if (!mdb)
	{
		IGMP_HWNAT_DEBUG("mdb == NULL");
		return 0;
	}

	IGMP_HWNAT_DEBUG("entry->proto=%d",entry->proto);

	if (entry->proto == MUL_PROTO_IGMP)
		group.proto = htons(ETH_P_IP);
	else if (entry->proto == MUL_PROTO_MLD)
		group.proto = htons(ETH_P_IPV6);
	else
		return 0;
	
	memcpy(group.u.ip6.s6_addr,entry->grp_addr,16);

	hash = br_ip_hash(mdb, &group);
	mp = br_multicast_get_group(br, port, &group, hash);

	if (mp==NULL)
	{
		IGMP_HWNAT_DEBUG("mp == NULL");
		return 0;
	}

	memset(src,0,16);
	memcpy(src,entry->src_addr,16);
	pg = mp->ports;

	while(pg)
	{
		if (pg->port != port)
		{
			pg = pg->next;
			continue;
		}
		
		if (entry->proto==MUL_PROTO_IGMP)
		{
			if(pg->src_entry.filt_mode == MCAST_INCLUDE)
			{
				if (memcmp(&pg->src_entry.src.s_addr,src,4)==0)
					return 1;
			}
			else if(pg->src_entry.filt_mode == MCAST_EXCLUDE)
			{
				if(0 == pg->src_entry.src.s_addr)
					return 1;
				else if(memcmp(&pg->src_entry.src.s_addr,src,4))
					flag  = 2;
				else if(memcmp(&pg->src_entry.src.s_addr,src,4)==0)
					return 0;		
			}
		}
		if (entry->proto==MUL_PROTO_MLD)
			return 1;

		pg = pg->next;
	}

	if (flag == 2)
		return 1;
	return 0;
	
}


/**************************************************
Function: Get forwarded ports given a multicast
          group 
Input: 
	br: pointer to struct net_bridge
	entry: pointer to struct IGMP_HWNATEntry_t
Return: 
	0x0-0x0f0f: port mask
***************************************************/

int igmp_hwnat_port_mask(struct net_bridge *br,IGMP_HWNATEntry_t* entry)
{
	struct net_bridge_port *p = NULL;
	int port = 0,mask = 0;
	
	IGMP_HWNAT_DEBUG("enter");
	list_for_each_entry(p, &br->port_list, list)
	{
		if (igmp_hwnat_should_deliver(br,p,entry)==0)
			continue;	
		
		port = igmp_hwnat_get_port(p);
		
		if (port < 0 )
			 continue;
		
		mask |= 1<<(port);
	}	

	IGMP_HWNAT_DEBUG("mask = %d",mask);	
	
	return mask;
}

/**************************************************
Function: Delete a entry maintained by SW
Input: 
	entry: pointer to struct IGMP_HWNATEntry_t
Return: 
	  0: ok
**************************************************/
int igmp_hwnat_delete_entry(IGMP_HWNATEntry_t* entry)
{
    int timer_flag;
    if (entry == NULL)
    {
        IGMP_HWNAT_DEBUG("entry == NULL");
        return 0;
    }
    IGMP_HWNAT_DEBUG("enter");
    
    timer_flag = try_to_del_timer_sync(&entry->age_timer);
    if (-1 == timer_flag)
    {
        IGMP_HWNAT_DEBUG("try to delete timer when timer is running on other cpu \n");
    }
    else{
#ifdef TCSUPPORT_MULTICAST_SPEED
        list_del_rcu(&(entry->list));
        call_rcu_bh(&(entry->rcu), igmp_hwnat_free);
#else
        list_del(&entry->list);
        igmp_hwnat_free(entry);
#endif
    }
        return 0;
    
}

/**************************************************
Function: Delete a entry maintained by SW only called by timeout
old version of igmp_hwnat_delete_entry
Input: 
	entry: pointer to struct IGMP_HWNATEntry_t
Return: 
	  0: ok
**************************************************/

int igmp_hwnat_delete_entry_timer(IGMP_HWNATEntry_t* entry)
{
	if (entry == NULL)
	{
		IGMP_HWNAT_DEBUG("entry == NULL");
		return 0;
	}
	IGMP_HWNAT_DEBUG("enter");
	
	del_timer(&entry->age_timer);
	#ifdef TCSUPPORT_MULTICAST_SPEED
	list_del_rcu(&(entry->list));
	call_rcu_bh(&(entry->rcu), igmp_hwnat_free);
	#else
	list_del(&entry->list);
	igmp_hwnat_free(entry);
	#endif
	return 0;
}

/**************************************************
Function: Check if the multicast group is still 
          accelebrated  by HW
Input: 
	entry: pointer to struct IGMP_HWNATEntry_t
Return: 
	0: fail;  1: ok
**************************************************/

int igmp_hwnat_check_entry_valid(IGMP_HWNATEntry_t* entry)
{
	int valid = 0,type = 0;
	
	if (entry->proto == MUL_PROTO_MLD)
		type = 1;
	
	if (hwnat_is_multicast_entry_hook)
		valid = hwnat_is_multicast_entry_hook(entry->index,entry->grp_addr,entry->src_addr,type);
	
	return valid;
}

/**************************************************
Function: Get the foe index from skb
Input: 
	entry: pointer to struct sk_buff
Return: 
	foe entry index in hwnat
**************************************************/

int igmp_hwnat_flow_index(struct sk_buff* skb)
{
	int index = -1; 
	
	if (hwnat_skb_to_foe_hook && skb)
		index = hwnat_skb_to_foe_hook(skb);

	return index;
}

/**************************************************
Function: Clean the HW accelebration given
          the multicast group
Input: 
	entry: pointer to struct IGMP_HWNATEntry_t
Return: 
	0: ok
*************************************************/

int igmp_hwnat_delete_foe(IGMP_HWNATEntry_t* entry)
{
	if (igmp_hwnat_check_entry_valid(entry)==0)
	{
		IGMP_HWNAT_DEBUG("entry is not valid");
		return 0;
	}
	
	IGMP_HWNAT_DEBUG("index = %d ,mask = %x",entry->index,entry->mask);

	if (hwnat_delete_foe_entry_hook)
		hwnat_delete_foe_entry_hook(entry->index);

	return 0;
}

/**************************************************
Function: Delete the SW and HW maintained
          multicast flow
Input: 
	entry: pointer to struct IGMP_HWNATEntry_t
Return: 
	0: ok
**************************************************/

int igmp_hwnat_delete_flow(IGMP_HWNATEntry_t* entry)
{
	if (entry == NULL)
	{
		IGMP_HWNAT_DEBUG("entry == NUL");
		return 0;
	}
	
	IGMP_HWNAT_DEBUG("entry index = %d",entry->index);	
	
	igmp_hwnat_delete_foe(entry);
	igmp_hwnat_delete_entry(entry);
	return 0;
}

/**************************************************
Function: Clear all the SW and HW maintained
          multicast flow
Input: 
	N/A
Return: 
	0: ok
**************************************************/

int igmp_hwnat_clear_flows(void)
{
	IGMP_HWNATEntry_t* entry = NULL,*tmp = NULL;
	struct list_head* hwnat_flow = igmp_hwnat_get_list();
	
	IGMP_HWNAT_DEBUG("enter");
	
	spin_lock(&hwnat_lock);
	#ifdef TCSUPPORT_MULTICAST_SPEED
	list_for_each_entry_rcu(entry,hwnat_flow,list)
	#else
	list_for_each_entry_safe(entry,tmp,hwnat_flow,list)
	#endif
	{
		igmp_hwnat_delete_flow(entry);
	}
	spin_unlock(&hwnat_lock);
	return 0;
}
EXPORT_SYMBOL(igmp_hwnat_clear_flows);

#ifdef TCSUPPORT_MULTICAST_SPEED
/**************************************************
Function: Find the SW maintained entry given 
          foe entry index
Input: 
	index: foe entry index
Return: 
	0: ok
**************************************************/

IGMP_HWNATEntry_t* igmp_hwnat_find_entry_rcu(int index)
{
	IGMP_HWNATEntry_t* entry = NULL;
	struct list_head* hwnat_flow = igmp_hwnat_get_list();
	
	rcu_read_lock();
	
	list_for_each_entry_rcu(entry,hwnat_flow,list)
	{
		if (entry->index == index)
		{
			rcu_read_unlock();
			return entry;
		}
	}

	rcu_read_unlock();
	return NULL;
}
#endif
/**************************************************
Function: Find the SW maintained entry given 
          foe entry index
Input: 
	index: foe entry index
Return: 
	0: ok
**************************************************/

IGMP_HWNATEntry_t* igmp_hwnat_find_entry(int index)
{
	IGMP_HWNATEntry_t* entry = NULL;
	struct list_head* hwnat_flow = igmp_hwnat_get_list();

	list_for_each_entry_rcu(entry,hwnat_flow,list)
	{
		if (entry->index == index)
		{
			return entry;
	}
	}
	
	return NULL;
}
/**************************************************
Function: Callback function to check if the HW 
          mulitcast flow is still valid
Input: 
	entry: pointer to struct IGMP_HWNATEntry_t
Return: 
	0: ok
**************************************************/

void igmp_hwnat_timer_timeout(unsigned long arg)
{
	IGMP_HWNATEntry_t* entry = (IGMP_HWNATEntry_t* )arg;
	IGMP_HWNAT_DEBUG("enter");

	if (entry)
	{
		if (igmp_hwnat_check_entry_valid(entry)==0)
		{
			spin_lock(&hwnat_lock);
			igmp_hwnat_delete_entry_timer(entry);
			spin_unlock(&hwnat_lock);
		}
		else
		{
			mod_timer(&entry->age_timer,round_jiffies(jiffies) + hwnat_age_time);
		}
	}
	return;
}


/**************************************************
Function: Add a HW accelebrated multicast flow into
          SW maintained entry
Input: 
	entry: pointer to struct IGMP_HWNATEntry_t
Return: 
	0: ok
***************************************************/

IGMP_HWNATEntry_t* igmp_hwnat_add_flow(struct sk_buff* skb ,int proto,unsigned char* grp_addr, unsigned char* src_addr)
{
	IGMP_HWNATEntry_t* entry = NULL;
	struct list_head* hwnat_flow = igmp_hwnat_get_list();
	int index = igmp_hwnat_flow_index(skb);


	IGMP_HWNAT_DEBUG("index = %d",index);

	if (index < 0)
		return NULL;


	entry = (IGMP_HWNATEntry_t* )igmp_hwnat_alloc(sizeof(IGMP_HWNATEntry_t));
	
	if (entry==NULL)
	{
		IGMP_HWNAT_DEBUG("alloc entry fail");
		return NULL;
	}
	entry->index = index;
	entry->mask = 0;
	entry->proto = proto;
	memcpy(entry->grp_addr,grp_addr,16);
	memcpy(entry->src_addr,src_addr,16);
	
	
	#ifdef TCSUPPORT_MULTICAST_SPEED
	list_add_tail_rcu(&entry->list, hwnat_flow);	
	#else
	list_add_tail(&entry->list,hwnat_flow);
	#endif

	setup_timer(&entry->age_timer, igmp_hwnat_timer_timeout, (unsigned long)entry);	
	mod_timer(&entry->age_timer,round_jiffies(jiffies) + hwnat_age_time);
	
	return entry;
}



/**************************************************
Function: Clear all the SW and HW maintained
          multicast flow
Input: 
	entry: pointer to struct IGMP_HWNATEntry_t
Return: 
	0: ok
***************************************************/

int igmp_hwnat_update_flow(IGMP_HWNATEntry_t* entry ,int mask)
{

	IGMP_HWNAT_DEBUG("index = %d ,mask = %d ",entry->index,mask);
	
	if (hwnat_set_special_tag_hook)
		hwnat_set_special_tag_hook(entry->index,mask);

	entry->mask = mask;
	
	return 0;
}

/**************************************************
Function: Enable hwnat wlan multicast 
          accelebration give a multicast group
Input: 
	entry: pointer to struct IGMP_HWNATEntry_t
Return: 
	0: ok
**************************************************/

int igmp_hwnat_open_wlan(IGMP_HWNATEntry_t* entry)
{
	
	IGMP_HWNAT_DEBUG("enter");

	if (hwnat_set_wlan_multicast_hook)
		hwnat_set_wlan_multicast_hook(entry->index,1);
	
	return 0;
}

/**************************************************
Function: Disble hwnat wlan multicast 
          accelebration give a multicast group
Input: 
	entry: pointer to struct IGMP_HWNATEntry_t
Return: 
	0: ok
**************************************************/

int igmp_hwnat_close_wlan(IGMP_HWNATEntry_t* entry)
{
	IGMP_HWNAT_DEBUG("enter");

	if (hwnat_set_wlan_multicast_hook)
		hwnat_set_wlan_multicast_hook(entry->index,0);
	
	return 0;
}

#ifdef TCSUPPORT_MULTICAST_SPEED
int igmp_hwnat_update_hw_nat_info(IGMP_HWNATEntry_t* entry,unsigned long mask,int state)
{
	int i;
	unsigned long wlanmask;
	unsigned long masktemp = mask;
	entry->wifinum = 0;
	IGMP_HWNAT_DEBUG("state=%d,mask=%d",state,mask);
	switch(state)
	{
		//only state i and state iii need to know how much wifi interfaces
		case MULTICAST_SPEED_STATE_I:
		case MULTICAST_SPEED_STATE_III:
			//for multi ssid speed
			wlanmask = (masktemp>>HWNAT_WLAN_IF_BASE)&0x0ff;
			for(i = 0;i < HWNAT_WLAN_IF_MAXNUM; i++)
			{
				if(wlanmask&(1 << i))
					entry->wifinum++;
			}
			break;

		//fall through and do nothing
		case MULTICAST_SPEED_STATE_II:
		default:
			break;	
	}

	if(hwnat_set_rule_according_to_state_hook)
		hwnat_set_rule_according_to_state_hook(entry->index,state,mask);
	
	entry->mask = mask;

	return 0;
}
#endif
/**************************************************
Function: Sync the SW maintained multicast 
          flow with HW maintained flow
Input: 
	entry: pointer to struct net_bridge
Return: 
	0: ok
***************************************************/

int igmp_hwnat_update_all(struct net_bridge *br)
{
	IGMP_HWNATEntry_t* entry = NULL,*temp = NULL;
	struct list_head* hwnat_flow = igmp_hwnat_get_list();
	unsigned long mask,old_mask;
	#ifdef TCSUPPORT_MULTICAST_SPEED
	int interfaceflag;
	int masktemp;
	#endif
	if (igmp_hwnat_enable()==0)
		return 0;

	IGMP_HWNAT_DEBUG("enter");

	spin_lock(&hwnat_lock);

#ifdef TCSUPPORT_MULTICAST_SPEED
	list_for_each_entry_rcu(entry,hwnat_flow,list)
#else
	list_for_each_entry_safe(entry,temp,hwnat_flow,list)
#endif
	{
		if (igmp_hwnat_check_entry_valid(entry)==0)
		{
			igmp_hwnat_delete_entry(entry);
			continue;
		}

		mask = igmp_hwnat_port_mask(br,entry);
		old_mask = entry->mask;
		if (mask != old_mask)
		{
		#ifdef TCSUPPORT_MULTICAST_SPEED
			masktemp = mask;
			interfaceflag = (masktemp&0x0f) >0?1:0;//compute lan interface
			interfaceflag |= (((masktemp>>HWNAT_WLAN_IF_BASE)&0x0ff) >0?1:0)<<1;//compute wlan interface
			switch (interfaceflag)
			{
				case MULTICAST_SPEED_STATE_I:
					igmp_hwnat_update_hw_nat_info(entry,mask,MULTICAST_SPEED_STATE_I);	
				break;

				case MULTICAST_SPEED_STATE_II:
					igmp_hwnat_update_hw_nat_info(entry,mask,MULTICAST_SPEED_STATE_II);
				break;
				
				case MULTICAST_SPEED_STATE_III:
					igmp_hwnat_update_hw_nat_info(entry,mask,MULTICAST_SPEED_STATE_III);
				break;

				case MULTICAST_SPEED_STATE_IV:
					igmp_hwnat_delete_flow(entry);
				break;

				default://do nothing
					break;					
			}
				
		#else
			if ((mask&0x0f)==0)
				igmp_hwnat_delete_flow(entry);

			if ((mask&0x0f) != (old_mask&0x0f) && (mask&0x0f)>0)
				igmp_hwnat_update_flow(entry,mask);
			
			if (((mask>>8)&0x0f) > 0 && ((old_mask>>8)&0x0f) == 0)
				igmp_hwnat_open_wlan(entry);

			if (((mask>>8)&0x0f) == 0 && ((old_mask>>8)&0x0f) > 0)
				igmp_hwnat_close_wlan(entry);
		#endif
		}
	}

	spin_unlock(&hwnat_lock);

	return 0;
}

/**************************************************
Function: Check if the addr is multicast addr 
Input: 
	entry: pointer to mac address 
Return: 
	0: fail; 1: ok
***************************************************/

int igmp_hwnat_is_flow_pkt(char* dst)
{
	char mac[3] = {0x01,0x00,0x5e};
		
	if (memcmp(dst,mac,3)==0)
		return 1;
	
	if (dst[0]==0x33 && dst[1] == 0x33)
		return 1;
	
	return 0;
}

/**************************************************
Function: SW learn the multicast flow from
          passed skb by hw_nat module
Input: 
	entry: pointer to struct sk_buff
Return: 
	0: ok
***************************************************/

int igmp_hwnat_learn_flow(struct sk_buff* skb)
{
	unsigned char dest_addr[16],src_addr[16];
	short int proto = 0;
	struct iphdr*  ih;
	struct ipv6hdr* i6h;
	unsigned short eth_type;
	unsigned char* buff = skb_mac_header(skb)+18;
	IGMP_HWNATEntry_t* entry = NULL;
	int index;
#ifdef TCSUPPORT_MULTICAST_SPEED	
	struct ethhdr *eth;
	struct vlan_ethhdr *vlan_eth;
	char *dst;
	
#endif
	if (igmp_hwnat_enable()==0)
		return 0;	

IGMP_HWNAT_DEBUG("name=%s",skb->dev->name);

#ifdef TCSUPPORT_MULTICAST_SPEED
	if((strncmp(skb->dev->name,"eth", 3) == 0))
	{
		vlan_eth = vlan_eth_hdr(skb);
		buff = skb_mac_header(skb)+ ETH_HLEN + VLAN_HLEN;
		if(vlan_eth)
		{
			dst = vlan_eth->h_dest;
			eth_type = vlan_eth->h_vlan_encapsulated_proto;
		}
		else
		{
			printk("\r\n%s:vlan_eth == NULL,return",__FUNCTION__);
		return 0;
		}
	}
	else
	{
		eth =(struct ethhdr *)skb->data;
		buff = skb_mac_header(skb)+ ETH_HLEN;
		if(eth)
		{
			dst = eth->h_dest;
			eth_type = eth->h_proto;
		}
		else
		{
			printk("\r\n%s:eth == NULL,return",__FUNCTION__);
			return 0;
		}	
	}
	
	if (igmp_hwnat_is_flow_pkt(dst)==0)
	{
		IGMP_HWNAT_DEBUG("hw nat rule not match pkt");
		return 0;
	}
#else

	if (igmp_hwnat_is_flow_pkt(vlan_eth_hdr(skb)->h_dest)==0)
		return 0;
	
	eth_type = vlan_eth_hdr(skb)->h_vlan_encapsulated_proto;
#endif	

	IGMP_HWNAT_DEBUG("%s:eth_type=%x",eth_type);
	memset(dest_addr,0,16);
	memset(src_addr,0,16);
	
	if (eth_type==htons(ETH_P_IP))
	{
		proto = MUL_PROTO_IGMP;
		ih = (struct iphdr*)buff;
		memcpy(dest_addr,&ih->daddr,4);
		memcpy(src_addr,&ih->saddr,4);
	}
	else if(eth_type==htons(ETH_P_IPV6))
	{
		proto = MUL_PROTO_MLD;
		i6h = (struct ipv6hdr*)buff;
		memcpy(dest_addr, i6h->daddr.s6_addr,16);
		memcpy(src_addr, i6h->saddr.s6_addr,16);	
	}
	else
	{
		return  0;
	}

	index = igmp_hwnat_flow_index(skb);
	
	spin_lock(&hwnat_lock);
	#ifdef TCSUPPORT_MULTICAST_SPEED
	entry = igmp_hwnat_find_entry_rcu(index);
	#else
	entry = igmp_hwnat_find_entry(index);	
	#endif

	if (entry != NULL)
		igmp_hwnat_delete_entry(entry);

	igmp_hwnat_add_flow(skb,proto,dest_addr,src_addr);
	
	spin_unlock(&hwnat_lock);

	if (hwnat_br)
		igmp_hwnat_update_all(hwnat_br);

	return 0;
}

/**************************************************
Function: Clean all dropped multicast flow by HW
Input: 
	N/A
Return: 
	0: ok
***************************************************/

int igmp_hwnat_multicast_undrop(void)
{
	if (wan_multicast_undrop_hook)
		wan_multicast_undrop_hook();
		
	return 0;
}

int igmp_hwnat_read_proc(char *buf, char **start, off_t off, int count,int *eof, void *data)
{
	int len = 0;
	IGMP_HWNATEntry_t* entry = NULL;
	struct list_head* hwnat_flow = igmp_hwnat_get_list();

	len = sprintf(buf,"flag = %d  time = %d \n",hwnat_igmp_flag,hwnat_age_time);
	len += sprintf(buf+len,"index  type  mask  wlannum	grp_addr   src_addr \n");
	#ifdef TCSUPPORT_MULTICAST_SPEED
	rcu_read_lock();
	#else
	spin_lock(&hwnat_lock);
	#endif
#ifdef TCSUPPORT_MULTICAST_SPEED
	list_for_each_entry_rcu(entry,hwnat_flow,list)
#else
	list_for_each_entry(entry,hwnat_flow,list)
#endif
	{
	#ifdef TCSUPPORT_MULTICAST_SPEED
		if(MUL_PROTO_IGMP == entry->proto)
	{
			len += sprintf(buf+len,"%d	%d	%d	%d	%u.%u.%u.%u   %u.%u.%u.%u  \n",entry->index,entry->proto,entry->mask,entry->wifinum
							,entry->grp_addr[0],entry->grp_addr[1],entry->grp_addr[2],entry->grp_addr[3],
							entry->src_addr[0],entry->src_addr[1],entry->src_addr[2],entry->src_addr[3]);
	}
		else
		{
			len += sprintf(buf+len,"%d	%d	%d	%d	%s	 %s  \n",entry->index,entry->proto,entry->mask,entry->wifinum
							,ip6_sprintf((struct in6_addr*)(entry->grp_addr)),ip6_sprintf((struct in6_addr*)(entry->src_addr)));
		}
	#else
	
		len += sprintf(buf+len,"%d  %d  %d  %d  %u.%u.%u.%u   %u.%u.%u.%u  \n",entry->index,entry->proto,entry->mask,entry->wifinum
							,entry->grp_addr[0],entry->grp_addr[1],entry->grp_addr[2],entry->grp_addr[3],
							entry->src_addr[0],entry->src_addr[1],entry->src_addr[2],entry->src_addr[3]);
		
	#endif	
	}
#ifndef TCSUPPORT_MULTICAST_SPEED
	spin_unlock(&hwnat_lock);
#else
	rcu_read_unlock();
#endif

	*start = buf + off;
	if (len < off + count)
		*eof = 1;
	len -= off;
	if (len > count)
		len = count ;
	if (len <0)
		len = 0;
		
	return len;

}
static int igmp_hwnat_write_proc(struct file *file, const char *buffer, unsigned long count, void *data)
{
	char buff[32],cmd[8];
	int len,flag;
	
	if (count > 32)
		len = 32;
	else
		len = count;

	memset(buff,0,32);
	memset(cmd,0,8);
	if (copy_from_user(buff, buffer, len - 1))
		return -EFAULT;

	
	sscanf(buff,"%s %d",cmd,&flag);
#ifdef TCSUPPORT_MULTICAST_SPEED
	if (memcmp(cmd,"switch",4)==0)
	{
		hwnat_igmp_flag &= 0xfffffffe;
		hwnat_igmp_flag |= ((flag > 0? 1:0));
	}
	
	if (memcmp(cmd,"debug",4)==0)
	{
		hwnat_igmp_flag &= 0xfffffffd;
		hwnat_igmp_flag |= (((flag > 0? 1:0)) << 1);
	}
	
	if (memcmp(cmd,"default",4)==0)
	{
		hwnat_igmp_flag = 1;
		hwnat_age_time =3000;
	}
#endif
	if (memcmp(cmd,"flag",4)==0)
		hwnat_igmp_flag = flag;


	if (memcmp(cmd,"time",4)==0)
		hwnat_age_time = flag;	
		
	return len;
}


void igmp_hwnat_init(struct net_bridge *br)
{
	struct proc_dir_entry *hwnat_proc = NULL;

	if(hwnat_br)
		return;

	INIT_LIST_HEAD(&hwnat_igmp_entry);
	spin_lock_init(&hwnat_lock);
#ifdef TCSUPPORT_MULTICAST_SPEED
	multicast_speed_learn_flow_hook = igmp_hwnat_learn_flow;
	multicast_speed_find_entry_hook	= igmp_hwnat_find_entry;

#endif
	xpon_igmp_learn_flow_hook = igmp_hwnat_learn_flow;

	hwnat_proc = create_proc_entry("tc3162/igmp_hwnat", 0, NULL);
	hwnat_proc->read_proc = igmp_hwnat_read_proc;
	hwnat_proc->write_proc = igmp_hwnat_write_proc;
	hwnat_br = br;
	return;
}

void igmp_hwnat_fini(void)
{
	igmp_hwnat_clear_flows();
	remove_proc_entry("tc3162/igmp_hwnat",0);	
	return;
}

#endif
///////////////////////////////////////////////////////////////////////////////////////////

