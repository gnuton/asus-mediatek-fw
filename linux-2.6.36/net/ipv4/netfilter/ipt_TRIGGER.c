/* Kernel module to match the port-ranges, trigger related port-ranges, 
 * and alters the destination to a local IP address. 
 * 
 * Copyright (C) 2003, CyberTAN Corporation 
 * All Rights Reserved. 
 * 
 * Description: 
 *   This is kernel module for port-triggering. 
 * 
 *   The module follows the Netfilter framework, called extended packet  
 *   matching modules.  
 */ 
 
#include <linux/types.h> 
#include <linux/ip.h> 
#include <linux/tcp.h> 
#include <linux/timer.h> 
#include <linux/module.h> 
#include <linux/netfilter.h> 
#include <linux/netdevice.h> 
#include <linux/if.h> 
#include <linux/inetdevice.h> 
#include <net/protocol.h> 
#include <net/checksum.h> 
 
#include <linux/netfilter_ipv4.h> 
#include <linux/netfilter_ipv4/ip_tables.h> 
#include <net/netfilter/nf_conntrack.h> 
#include <net/netfilter/nf_conntrack_core.h> 
#include <net/netfilter/nf_conntrack_tuple.h> 
#include <net/netfilter/nf_nat_rule.h> 
#include <linux/netfilter_ipv4/lockhelp.h> 
#ifdef CONFIG_NF_NAT_NEEDED 
#include <net/netfilter/nf_nat_rule.h> 
#else 
#include <linux/netfilter_ipv4/ip_nat_rule.h> 
#endif 
#include <linux/netfilter_ipv4/ipt_TRIGGER.h> 
 
/* This rwlock protects the main hash table, protocol/helper/expected 
 *    registrations, conntrack timers*/ 
 
#define ASSERT_READ_LOCK(x) MUST_BE_READ_LOCKED(&nf_conntrack_lock) 
#define ASSERT_WRITE_LOCK(x) MUST_BE_WRITE_LOCKED(&nf_conntrack_lock) 
 
#include <linux/netfilter_ipv4/listhelp.h> 
 
#if 0 
#define DEBUGP printk 
#else 
#define DEBUGP(format, args...) 
#endif 
 
struct ipt_trigger { 
        struct list_head list;          /* Trigger list */ 
        struct timer_list timeout;      /* Timer for list destroying */ 
        u_int32_t srcip;                /* Outgoing source address */ 
        u_int32_t dstip;                /* Outgoing destination address */ 
        u_int16_t mproto;               /* Trigger protocol */ 
        u_int16_t rproto;               /* Related protocol */ 
        struct ipt_trigger_ports ports; /* Trigger and related ports */ 
        u_int8_t reply;                 /* Confirm a reply connection */ 
}; 
 
LIST_HEAD(trigger_list); 
//DECLARE_LOCK(ip_trigger_lock); 
 
static void trigger_refresh(struct ipt_trigger *trig, unsigned long extra_jiffies) 
{ 
    DEBUGP("%s: \n", __FUNCTION__); 
    NF_CT_ASSERT(trig); 
	/*King(20120808): replace WRITE_LOCK with LOCK_BH, because nf_conntrack_lock is defined as spin lock in Linux
	  kernel-2.6.36 but rw lock in 2.6.22.15*/
	LOCK_BH(&nf_conntrack_lock);
    /* Need del_timer for race avoidance (may already be dying). */ 
    if (del_timer(&trig->timeout)) { 
        trig->timeout.expires = jiffies + extra_jiffies; 
        add_timer(&trig->timeout); 
    } 
 
	UNLOCK_BH(&nf_conntrack_lock);
} 
 
static void __del_trigger(struct ipt_trigger *trig) 
{ 
    DEBUGP("%s: \n", __FUNCTION__); 
    NF_CT_ASSERT(trig); 
    MUST_BE_WRITE_LOCKED(&nf_conntrack_lock); 
 
     /* delete from 'trigger_list' */ 
    list_del(&trig->list); 
    kfree(trig); 
} 
 
static void trigger_timeout(unsigned long ul_trig) 
{ 
   struct ipt_trigger *trig= (void *) ul_trig; 

   DEBUGP("trigger list %p timed out\n", trig); 
	/*King(20120808): replace WRITE_LOCK with LOCK_BH, because nf_conntrack_lock is defined as spin lock in Linux
	  kernel-2.6.36 but rw lock in 2.6.22.15*/
	LOCK_BH(&nf_conntrack_lock);
    __del_trigger(trig); 
	UNLOCK_BH(&nf_conntrack_lock);
} 
 
static unsigned int 
add_new_trigger(struct ipt_trigger *trig) 
{ 
    struct ipt_trigger *new = NULL; 
 
    DEBUGP("!!!!!!!!!!!! %s !!!!!!!!!!!\n", __FUNCTION__); 
	/*King(20120808): replace WRITE_LOCK with LOCK_BH, because nf_conntrack_lock is defined as spin lock in Linux
	    kernel-2.6.36 but rw lock in 2.6.22.15*/
		
	LOCK_BH(&nf_conntrack_lock);
    new = (struct ipt_trigger *) 
        kmalloc(sizeof(struct ipt_trigger), GFP_ATOMIC); 
 
    if (!new) { 
		UNLOCK_BH(&nf_conntrack_lock);
        DEBUGP("%s: OOM allocating trigger list\n", __FUNCTION__); 
        return -ENOMEM; 
    } 
 
    memset(new, 0, sizeof(*trig)); 
    INIT_LIST_HEAD(&new->list); 
    memcpy(new, trig, sizeof(*trig)); 
 
    /* add to global table of trigger */ 
    list_prepend(&trigger_list, &new->list); 

    /* add and start timer if required */ 
    init_timer(&new->timeout); 

    new->timeout.data = (unsigned long)new; 
    new->timeout.function = trigger_timeout; 
    new->timeout.expires = jiffies + (TRIGGER_TIMEOUT * HZ); 
    add_timer(&new->timeout); 
             
 	UNLOCK_BH(&nf_conntrack_lock);

    return 0; 
} 
 
static inline int trigger_out_matched(const struct ipt_trigger *i, 
        const u_int16_t proto, const u_int16_t dport) 
{ 
    /* DEBUGP("%s: i=%p, proto= %d, dport=%d.\n", __FUNCTION__, i, proto, dport); 
    DEBUGP("%s: Got one, mproto= %d, mport[0..1]=%d, %d.\n", __FUNCTION__,  
            i->mproto, i->ports.mport[0], i->ports.mport[1]); */ 
 
    return ((i->mproto == proto) && (i->ports.mport[0] <= dport)  
            && (i->ports.mport[1] >= dport)); 
} 
 
static unsigned int 
trigger_out(struct sk_buff *skb, 
                unsigned int hooknum, 
                const void *targinfo) 
{ 
    const struct ipt_trigger_info *info = targinfo; 
    struct ipt_trigger trig, *found = NULL; 
    const struct iphdr *iph = ip_hdr(skb); 
    struct tcphdr *tcph = (void *)iph + iph->ihl*4;     /* Might be TCP, UDP */ 
 
    DEBUGP("############# %s ############\n", __FUNCTION__); 
    /* Check if the trigger range has already existed in 'trigger_list'. */ 
    found = LIST_FIND(&trigger_list, trigger_out_matched, 
            struct ipt_trigger *, iph->protocol, ntohs(tcph->dest)); 

 
    if (found) { 
        /* Yeah, it exists. We need to update(delay) the destroying timer. */ 
        trigger_refresh(found, TRIGGER_TIMEOUT * HZ); 
        /* In order to allow multiple hosts use the same port range, we update 
           the 'saddr' after previous trigger has a reply connection. */ 
        if (found->reply) 
            found->srcip = iph->saddr; 
    } 
    else { 
        /* Create new trigger */ 
        memset(&trig, 0, sizeof(trig)); 
        trig.srcip = iph->saddr; 
        trig.mproto = iph->protocol; 
        trig.rproto = info->proto; 
        memcpy(&trig.ports, &info->ports, sizeof(struct ipt_trigger_ports)); 
        add_new_trigger(&trig); /* Add the new 'trig' to list 'trigger_list'. */ 
    } 
 
    return IPT_CONTINUE;        /* We don't block any packet. */ 
} 
 
static inline int trigger_in_matched(const struct ipt_trigger *i, 
        const u_int16_t proto, const u_int16_t dport) 
{ 
    /* DEBUGP("%s: i=%p, proto= %d, dport=%d.\n", __FUNCTION__, i, proto, dport); 
    DEBUGP("%s: Got one, rproto= %d, rport[0..1]=%d, %d.\n", __FUNCTION__,  
            i->rproto, i->ports.rport[0], i->ports.rport[1]); */ 
    u_int16_t rproto = i->rproto; 
 
    if (!rproto) 
        rproto = proto; 
 
    return ((rproto == proto) && (i->ports.rport[0] <= dport)  
            && (i->ports.rport[1] >= dport)); 
} 
 
static unsigned int 
trigger_in(struct sk_buff *skb, 
                unsigned int hooknum, 
                const void *targinfo) 
{ 
    struct ipt_trigger *found = NULL; 
    const struct iphdr *iph = ip_hdr(skb); 
    struct tcphdr *tcph = (void *)iph + iph->ihl*4;     /* Might be TCP, UDP */ 
    /* Check if the trigger-ed range has already existed in 'trigger_list'. */ 
    found = LIST_FIND(&trigger_list, trigger_in_matched, 
            struct ipt_trigger *, iph->protocol, ntohs(tcph->dest)); 
    if (found) { 
        DEBUGP("############# %s ############\n", __FUNCTION__); 
        /* Yeah, it exists. We need to update(delay) the destroying timer. */ 
        trigger_refresh(found, TRIGGER_TIMEOUT * HZ); 
        return NF_ACCEPT;       /* Accept it, or the imcoming packet could be  
                                   dropped in the FORWARD chain */ 
    } 
  
    return IPT_CONTINUE;        /* Our job is the interception. */ 
} 
 
static unsigned int 
trigger_dnat(struct sk_buff *skb, 
                unsigned int hooknum, 
                const void *targinfo) 
{ 
    struct ipt_trigger *found = NULL; 
    const struct iphdr *iph = ip_hdr(skb); 
    struct tcphdr *tcph = (void *)iph + iph->ihl*4;     /* Might be TCP, UDP */ 
    struct nf_conn *ct = NULL; 
    enum ip_conntrack_info ctinfo; 
    struct nf_nat_multi_range_compat newrange; 
 
    NF_CT_ASSERT(hooknum == NF_IP_PRE_ROUTING); 
    /* Check if the trigger-ed range has already existed in 'trigger_list'. */ 
    found = LIST_FIND(&trigger_list, trigger_in_matched, 
            struct ipt_trigger *, iph->protocol, ntohs(tcph->dest)); 
 
    if (!found || !found->srcip) 
        return IPT_CONTINUE;    /* We don't block any packet. */ 
 
    DEBUGP("############# %s ############\n", __FUNCTION__); 
    found->reply = 1;   /* Confirm there has been a reply connection. */ 
    ct = nf_ct_get(skb, &ctinfo); 
    NF_CT_ASSERT(ct && (ctinfo == IP_CT_NEW)); 
 
    DEBUGP("%s: got ", __FUNCTION__); 

 
    /* Alter the destination of imcoming packet. */ 
    newrange = ((struct nf_nat_multi_range_compat) 
            { 1, { { IP_NAT_RANGE_MAP_IPS, 
                     found->srcip, found->srcip, 
                     { 0 }, { 0 } 
                   } } }); 
 
    /* Hand modified range to generic setup. */ 
    return nf_nat_setup_info(ct, &newrange.range[0], IP_NAT_MANIP_DST); 
} 
 
static unsigned int 
trigger_target(struct sk_buff *skb,
			       const struct xt_action_param *par) 
{ 
    const struct ipt_trigger_info *info = par->targinfo; 
    const struct iphdr *iph = ip_hdr(skb); 
	unsigned int hooknum = par->hooknum; 
 
    /* DEBUGP("%s: type = %s\n", __FUNCTION__,  
            (info->type == IPT_TRIGGER_DNAT) ? "dnat" : 
            (info->type == IPT_TRIGGER_IN) ? "in" : "out"); */ 
 
    /* The Port-trigger only supports TCP and UDP. */ 
    if ((iph->protocol != IPPROTO_TCP) && (iph->protocol != IPPROTO_UDP)) 
        return IPT_CONTINUE; 
 
    if (info->type == IPT_TRIGGER_OUT) 
        return trigger_out(skb, hooknum, info); 
    else if (info->type == IPT_TRIGGER_IN) 
        return trigger_in(skb, hooknum, info); 
    else if (info->type == IPT_TRIGGER_DNAT) 
        return trigger_dnat(skb, hooknum, info); 
 
    return IPT_CONTINUE; 
} 
static bool 
trigger_check(const struct xt_mtchk_param *par)
{ 
     const struct ipt_trigger_info *info = par->matchinfo; 
     struct list_head *cur_item = NULL, *tmp_item = NULL; 
	 unsigned int hook_mask = par->hook_mask;
	 char *tablename = par->table;
		
        if ((strcmp(tablename, "mangle") == 0)) { 
                DEBUGP("trigger_check: bad table `%s'.\n", tablename); 
				return -EINVAL;
        } 
        if (hook_mask & ~((1 << NF_IP_PRE_ROUTING) | (1 << NF_IP_FORWARD))) { 
                DEBUGP("trigger_check: bad hooks %x.\n", hook_mask); 
				return -EINVAL;
        } 
	
        if (info->proto) { 
            if (info->proto != IPPROTO_TCP && info->proto != IPPROTO_UDP) { 
                DEBUGP("trigger_check: bad proto %d.\n", info->proto); 
				return -EINVAL;
            } 
        } 
        if (info->type == IPT_TRIGGER_OUT) { 
            if (!info->ports.mport[0] || !info->ports.rport[0]) { 
                DEBUGP("trigger_check: Try 'iptbles -j TRIGGER -h' for help.\n"); 
				return -EINVAL;
            } 
        } 
 
        /* Empty the 'trigger_list' */ 
        list_for_each_safe(cur_item, tmp_item, &trigger_list) { 
            struct ipt_trigger *trig = (void *)cur_item; 
 
            DEBUGP("%s: list_for_each_safe(): %p.\n", __FUNCTION__, trig); 
            del_timer(&trig->timeout); 
            __del_trigger(trig); 
        } 
		  return 0;
} 
 
 
static struct xt_target redirect_reg = {  
        .name           = "TRIGGER", 
        .family         = NFPROTO_IPV4, 
        .target         = trigger_target,  
        .targetsize     = sizeof(struct ipt_trigger_info), 
        .checkentry     = trigger_check, 
        .me             = THIS_MODULE, 
}; 
 
static int __init init(void) 
{ 
        return xt_register_target(&redirect_reg); 
} 
 
static void __exit fini(void) 
{ 
        xt_unregister_target(&redirect_reg); 
} 
 
module_init(init); 
module_exit(fini); 
