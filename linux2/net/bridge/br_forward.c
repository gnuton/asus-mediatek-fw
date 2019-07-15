/*
 *	Forwarding decision
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

#include <linux/err.h>
#include <linux/slab.h>
#include <linux/kernel.h>
#include <linux/netdevice.h>
#include <linux/netpoll.h>
#include <linux/skbuff.h>
#include <linux/if_vlan.h>
#include <linux/netfilter_bridge.h>
#include "br_private.h"
#if defined(TCSUPPORT_HWNAT)
#include <linux/pktflow.h>
#endif
#ifdef TCSUPPORT_RA_HWNAT
#include <linux/foe_hook.h>
#endif

#if !defined(TCSUPPORT_CT) 
#ifdef CONFIG_PORT_BINDING
extern int (*portbind_sw_hook)(void);
extern int (*portbind_check_hook)(char *inIf, char *outIf);
#endif
#endif

static int deliver_clone(const struct net_bridge_port *prev,
			 struct sk_buff *skb,
			 void (*__packet_hook)(const struct net_bridge_port *p,
					       struct sk_buff *skb));

/* Don't forward packets to originating port or forwarding diasabled */
static inline int should_deliver(const struct net_bridge_port *p,
				 const struct sk_buff *skb)
{
	return (((p->flags & BR_HAIRPIN_MODE) || skb->dev != p->dev) &&
		p->state == BR_STATE_FORWARDING);
}

static inline unsigned packet_length(const struct sk_buff *skb)
{
	return skb->len - (skb->protocol == htons(ETH_P_8021Q) ? VLAN_HLEN : 0);
}

__IMEM int br_dev_queue_push_xmit(struct sk_buff *skb)
{
	/* drop mtu oversized packets except gso */
	if (packet_length(skb) > skb->dev->mtu && !skb_is_gso(skb))
		kfree_skb(skb);
	else {
		/* ip_fragment doesn't copy the MAC header */
		if (nf_bridge_maybe_copy_header(skb))
			kfree_skb(skb);
		else {
			skb_push(skb, ETH_HLEN);
			dev_queue_xmit(skb);
		}
	}

	return 0;
}

__IMEM int br_forward_finish(struct sk_buff *skb)
{
	return NF_HOOK(NFPROTO_BRIDGE, NF_BR_POST_ROUTING, skb, NULL, skb->dev,
		       br_dev_queue_push_xmit);

}

__IMEM static void __br_deliver(const struct net_bridge_port *to, struct sk_buff *skb)
{
	skb->dev = to->dev;

	if (unlikely(netpoll_tx_running(to->dev))) {
		if (packet_length(skb) > skb->dev->mtu && !skb_is_gso(skb))
			kfree_skb(skb);
		else {
			skb_push(skb, ETH_HLEN);
			br_netpoll_send_skb(to, skb);
		}
		return;
	}

	NF_HOOK(NFPROTO_BRIDGE, NF_BR_LOCAL_OUT, skb, NULL, skb->dev,
		br_forward_finish);
}

__IMEM static void __br_forward(const struct net_bridge_port *to, struct sk_buff *skb)
{
	struct net_device *indev;

	if (skb_warn_if_lro(skb)) {
		kfree_skb(skb);
		return;
	}

	indev = skb->dev;
	skb->dev = to->dev;
	skb_forward_csum(skb);

#ifdef CONFIG_QOS
#if defined(CONFIG_IMQ) || defined(CONFIG_IMQ_MODULE)
		skb->mark |= QOS_DEFAULT_MARK;
#endif
#endif
	NF_HOOK(NFPROTO_BRIDGE, NF_BR_FORWARD, skb, indev, skb->dev,
		br_forward_finish);
}

/* called with rcu_read_lock */
__IMEM void br_deliver(const struct net_bridge_port *to, struct sk_buff *skb)
{
	if (should_deliver(to, skb)) {
		__br_deliver(to, skb);
		return;
	}

	kfree_skb(skb);
}

/* called with rcu_read_lock */
__IMEM void br_forward(const struct net_bridge_port *to, struct sk_buff *skb, struct sk_buff *skb0)
{
	if (should_deliver(to, skb)) {
		if (skb0)
			deliver_clone(to, skb, __br_forward);
		else
			__br_forward(to, skb);
		return;
	}

	if (!skb0)
		kfree_skb(skb);
}

static int deliver_clone(const struct net_bridge_port *prev,
			 struct sk_buff *skb,
			 void (*__packet_hook)(const struct net_bridge_port *p,
					       struct sk_buff *skb))
{
	struct net_device *dev = BR_INPUT_SKB_CB(skb)->brdev;

	skb = skb_clone(skb, GFP_ATOMIC);
	if (!skb) {
		dev->stats.tx_dropped++;
		return -ENOMEM;
	}

	__packet_hook(prev, skb);
	return 0;
}

static struct net_bridge_port *maybe_deliver(
	struct net_bridge_port *prev, struct net_bridge_port *p,
	struct sk_buff *skb,
	void (*__packet_hook)(const struct net_bridge_port *p,
			      struct sk_buff *skb))
{
	int err;

	if (!should_deliver(p, skb))
		return prev;

	if (!prev)
		goto out;

	err = deliver_clone(prev, skb, __packet_hook);
	if (err)
		return ERR_PTR(err);

out:
	return p;
}

extern void tc3162wdog_kick(void);

/* called under bridge lock */
static void br_flood(struct net_bridge *br, struct sk_buff *skb,
		     struct sk_buff *skb0,
		     void (*__packet_hook)(const struct net_bridge_port *p,
					   struct sk_buff *skb))
{
	struct net_bridge_port *p;
	struct net_bridge_port *prev;

	prev = NULL;

#if defined(TCSUPPORT_HWNAT)
	pktflow_free(skb);
#endif
#ifdef TCSUPPORT_RA_HWNAT
	if (ra_sw_nat_hook_free)
		ra_sw_nat_hook_free(skb);
#endif
	tc3162wdog_kick();
	list_for_each_entry_rcu(p, &br->port_list, list) {
		prev = maybe_deliver(prev, p, skb, __packet_hook);
		if (IS_ERR(prev))
			goto out;
	}

	if (!prev)
		goto out;

	if (skb0)
		deliver_clone(prev, skb, __packet_hook);
	else
		__packet_hook(prev, skb);
	return;

out:
	if (!skb0)
		kfree_skb(skb);
}


/* called with rcu_read_lock */
void br_flood_deliver(struct net_bridge *br, struct sk_buff *skb)
{
	br_flood(br, skb, NULL, __br_deliver);
}

/* called under bridge lock */
void br_flood_forward(struct net_bridge *br, struct sk_buff *skb,
		      struct sk_buff *skb2)
{
	#if defined(TCSUPPORT_BRIDGE_FASTPATH)
	/*MARK sc_mac_learned flag, the flooding packets can't be learned into fastbridge table*/
	skb->sc_mac_learned |=FB_FLOOD_PKT;
	#endif

	br_flood(br, skb, skb2, __br_forward);
}

#ifdef CONFIG_BRIDGE_IGMP_SNOOPING
/* called with rcu_read_lock */
static void br_multicast_flood(struct net_bridge_mdb_entry *mdst,
			       struct sk_buff *skb, struct sk_buff *skb0,
			       void (*__packet_hook)(
					const struct net_bridge_port *p,
					struct sk_buff *skb))
{
	struct net_device *dev = BR_INPUT_SKB_CB(skb)->brdev;
	struct net_bridge *br = netdev_priv(dev);
	struct net_bridge_port *prev = NULL;
	struct net_bridge_port_group *p;
	struct hlist_node *rp;
#ifdef TCSUPPORT_IGMPSNOOPING_ENHANCE
	struct net_bridge_port *preport = NULL;
	int ret = 0;
	int check = 0;
	int num_record = 0;
#endif

	rp = rcu_dereference(br->router_list.first);
	p = mdst ? rcu_dereference(mdst->ports) : NULL;
	while (p || rp) {
		struct net_bridge_port *port, *lport, *rport;

		lport = p ? p->port : NULL;
		rport = rp ? hlist_entry(rp, struct net_bridge_port, rlist) :
			     NULL;

		port = (unsigned long)lport > (unsigned long)rport ?
		       lport : rport;
#ifdef TCSUPPORT_IGMPSNOOPING_ENHANCE
		num_record++;/*total muticast records counter*/
		if(((ret=br_multicast_port_pass(p, port, skb)) == 1) /*case 1: pass*/
				&& (port != preport)){
			preport = port;
#endif
		prev = maybe_deliver(prev, port, skb, __packet_hook);

		if (IS_ERR(prev))
			goto out;
#ifdef TCSUPPORT_IGMPSNOOPING_ENHANCE	
		}else if(ret == 2){
			check++; /**case 2: filt_mode =MCAST_EXCLUDE & skb's s_addr not equal the muticast record's s_addr**/
		}
#endif

		if ((unsigned long)lport >= (unsigned long)port)
			p = rcu_dereference(p->next);
		if ((unsigned long)rport >= (unsigned long)port)
			rp = rcu_dereference(rp->next);
	}

	if (!prev)
		goto out;
#ifdef TCSUPPORT_IGMPSNOOPING_ENHANCE
	/*if case 2's num equal muticast records, that means the current skb is in MCAST_EXCLUDE mode
	and it is not in any of the records, so	we should consider the skb is "INCLUDE" and allow it pass*/
	if((check!=0) && (check == num_record)){
		deliver_clone(prev, skb, __packet_hook);
		goto out;
	}
#endif

	if (skb0)
		deliver_clone(prev, skb, __packet_hook);
	else
		__packet_hook(prev, skb);
	return;

out:
	if (!skb0)
		kfree_skb(skb);
}

/* called with rcu_read_lock */
void br_multicast_deliver(struct net_bridge_mdb_entry *mdst,
			  struct sk_buff *skb)
{
	br_multicast_flood(mdst, skb, NULL, __br_deliver);
}

/* called with rcu_read_lock */
void br_multicast_forward(struct net_bridge_mdb_entry *mdst,
			  struct sk_buff *skb, struct sk_buff *skb2)
{
	br_multicast_flood(mdst, skb, skb2, __br_forward);
}

#if defined(CONFIG_PORT_BINDING) || defined(TCSUPPORT_PORTBIND)
static struct net_bridge_port *maybe_pb_deliver(
	struct net_bridge_port *prev, struct net_bridge_port *p,
#if !defined(TCSUPPORT_CT)
	struct net_bridge_port *pIN, 
#endif
	struct sk_buff *skb,
	void (*__packet_hook)(const struct net_bridge_port *p,
			      struct sk_buff *skb))
{
	int err = 0;
	struct net_device *indev = NULL;
	struct net_device *outdev = NULL;

	if (!should_deliver(p, skb))
		return prev;

	if (!prev)
		goto out;
#if !defined(TCSUPPORT_CT) 
	indev = outdev = NULL;
	if (pIN) {
		indev = pIN->dev;
	}
#endif
	if (prev) {
		outdev = prev->dev;
	}
	//printk("%s:indev->name is %s, outdev->name is %s.\n", __FUNCTION__, indev->name, outdev->name);
	/* in dev and out dev is not in the same group */
	if ( (indev == NULL) || 
		(outdev == NULL) ||
		(portbind_check_hook == NULL) ||
		((portbind_check_hook) && portbind_check_hook(indev->name, outdev->name)) ) {
		/* it has been checked, not check again */
		skb->portbind_mark |= MASK_OUT_DEV;
		err = deliver_clone(prev, skb, __packet_hook);

		if (err)
			return ERR_PTR(err);
	}

out:
	return p;
}
/* called under bridge lock */
static void br_pb_flood(struct net_bridge *br,
#if !defined(TCSUPPORT_CT)
 			struct net_bridge_port *pIN,
#endif
			struct sk_buff *skb, struct sk_buff *skb0,
		     void (*__packet_hook)(const struct net_bridge_port *p,
					   struct sk_buff *skb))
{
	struct net_bridge_port *p = NULL;
	struct net_bridge_port *prev = NULL;
#if !defined(TCSUPPORT_CT)
	struct net_device *indev = NULL;
	struct net_device *outdev = NULL;
#endif


#if defined(TCSUPPORT_HWNAT)
	pktflow_free(skb);
#endif
#ifdef TCSUPPORT_RA_HWNAT
	if (ra_sw_nat_hook_free)
		ra_sw_nat_hook_free(skb);
#endif
	list_for_each_entry_rcu(p, &br->port_list, list) {
#if !defined(TCSUPPORT_CT) 
		prev = maybe_pb_deliver(prev, p, pIN, skb, __packet_hook);
#endif
		if (IS_ERR(prev))
			goto out;
	}

	if (!prev)
		goto out;

#if !defined(TCSUPPORT_CT)
	indev = outdev = NULL;
	if (pIN) {
		indev = pIN->dev;
	}
	if (prev) {
		outdev = prev->dev;
	}
#endif


	
#if !defined(TCSUPPORT_CT) 
	if ( (prev != NULL) && 
		((indev == NULL) ||
		(outdev == NULL) ||
		(portbind_check_hook == NULL) || 
		((portbind_check_hook) && (portbind_check_hook(indev->name, outdev->name)))) )
#endif
 	{	
		if (skb0)
			deliver_clone(prev, skb, __packet_hook);
		else
			__packet_hook(prev, skb);
		return;
	}

out:
	if (!skb0)
		kfree_skb(skb);
}

/* called under bridge lock */
void br_flood_pb_forward(struct net_bridge *br, 
#if !defined(TCSUPPORT_CT)
			struct net_bridge_port *p,
#endif
			struct sk_buff *skb, struct sk_buff *skb2)
{
	#if defined(TCSUPPORT_BRIDGE_FASTPATH)
	/*MARK sc_mac_learned flag, the flooding packets can't be learned into fastbridge table*/
	skb->sc_mac_learned |=FB_FLOOD_PKT;
	#endif
#if !defined(TCSUPPORT_CT) 
	br_pb_flood(br, p, skb, skb2, __br_forward);
#endif
}
static void br_multicast_pb_flood(struct net_bridge_mdb_entry *mdst,
#if !defined(TCSUPPORT_CT)
 				 struct net_bridge_port *pIN,
#endif
			       struct sk_buff *skb, struct sk_buff *skb0,
			       void (*__packet_hook)(
					const struct net_bridge_port *p,
					struct sk_buff *skb))
{
	struct net_device *dev = BR_INPUT_SKB_CB(skb)->brdev;
	struct net_bridge *br = netdev_priv(dev);
	struct net_bridge_port *prev = NULL;
	struct net_bridge_port_group *p = NULL;
	struct hlist_node *rp = NULL;
	struct net_device *indev = NULL;
	struct net_device *outdev = NULL;
#ifdef TCSUPPORT_IGMPSNOOPING_ENHANCE
	struct net_bridge_port *preport = NULL;
	int ret = 0;
	int check = 0;
	int num_record = 0;
#endif	

	rp = rcu_dereference(br->router_list.first);
	p = mdst ? rcu_dereference(mdst->ports) : NULL;
	while (p || rp) {
		struct net_bridge_port *port = NULL, *lport = NULL, *rport = NULL;

		lport = p ? p->port : NULL;
		rport = rp ? hlist_entry(rp, struct net_bridge_port, rlist) :
			     NULL;

		port = (unsigned long)lport > (unsigned long)rport ?
		       lport : rport;
#ifdef TCSUPPORT_IGMPSNOOPING_ENHANCE
		num_record++;

		if(((ret=br_multicast_port_pass(p, port, skb)) == 1) 
				&& (port != preport)){
			preport = port;
#endif					

#if !defined(TCSUPPORT_CT) 
		prev = maybe_pb_deliver(prev, port, pIN, skb, __packet_hook);
#endif

#ifdef TCSUPPORT_IGMPSNOOPING_ENHANCE	
		}else if(ret == 2){
			check++;
		}
#endif				
		if (IS_ERR(prev))
			goto out;

		if ((unsigned long)lport >= (unsigned long)port)
			p = rcu_dereference(p->next);
		if ((unsigned long)rport >= (unsigned long)port)
			rp = rcu_dereference(rp->next);
	}

	if (!prev)
		goto out;

	indev = outdev = NULL;
#if !defined(TCSUPPORT_CT) 
	if (pIN) {
		indev = pIN->dev;
	}
#endif
	if (prev) {
		outdev = prev->dev;
	}
	
	if ( (prev != NULL) && 
		((indev == NULL) ||
		(outdev == NULL) ||
		(portbind_check_hook == NULL) || 
		((portbind_check_hook) && (portbind_check_hook(indev->name, outdev->name)))) ) {
#ifdef TCSUPPORT_IGMPSNOOPING_ENHANCE
		/*Information can reference ' br_multicast_flood' */
		if((check!=0) && (check == num_record)){
			deliver_clone(prev, skb, __packet_hook);
			goto out;
		}
#endif

		if (skb0)
			deliver_clone(prev, skb, __packet_hook);
		else
			__packet_hook(prev, skb);

		return;
	}

out:
	if (!skb0)
		kfree_skb(skb);
}

void br_multicast_pb_forward(struct net_bridge_mdb_entry *mdst,
#if !defined(TCSUPPORT_CT)
struct net_bridge_port *p,
#endif
			  struct sk_buff *skb, struct sk_buff *skb2)
{
#if !defined(TCSUPPORT_CT) 
	br_multicast_pb_flood(mdst, p, skb, skb2, __br_forward);
#endif
}

#endif
#endif


