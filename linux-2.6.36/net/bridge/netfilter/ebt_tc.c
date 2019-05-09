#include <linux/module.h>
#include <linux/skbuff.h>
#include <linux/ipv6.h>
#include <net/ipv6.h>
#include <linux/in.h>
#include <net/dsfield.h>
#include <linux/if_vlan.h>
#include <linux/netfilter/x_tables.h>
#include <linux/netfilter_bridge/ebtables.h>
#include <linux/netfilter_bridge/ebt_tc.h>
#ifdef CONFIG_QOS
#include <linux/qos_type.h>
#endif
//#define QOS_WANIF_MARK	0xff000

#if 1
static inline __be16 vlan_proto(const struct sk_buff *skb)
{
	return vlan_eth_hdr(skb)->h_vlan_encapsulated_proto;
}
static inline __be16 pppoe_proto(const struct sk_buff *skb)
{
	return *((__be16 *)(skb_mac_header(skb) + ETH_HLEN +
			    sizeof(struct pppoe_hdr)));
}
#endif
/*
static int ebt_target_tc(struct sk_buff **pskb, unsigned int hooknr,
   const struct net_device *in, const struct net_device *out,
   const void *data, unsigned int datalen)
 */
 
static int
ebt_tc_mt(const struct sk_buff *skb, struct xt_action_param *par)
{
	struct ebt_tc_info *tcinfo = par->matchinfo;
	const struct ipv6hdr *ih6 = NULL;
	struct ipv6hdr _ip6h;

#ifdef CONFIG_QOS
	__u8 tos = 0;
	int rule_no = 0;
#endif
	
#if 1  
	if(skb->protocol == htons(ETH_P_IPV6))
		ih6 = (struct ipv6hdr *)skb_header_pointer(skb, 0, sizeof(_ip6h), &_ip6h);
	else if((skb->protocol == htons(ETH_P_8021Q)) && (vlan_proto(skb) == htons(ETH_P_IPV6)))
		ih6 = (struct ipv6hdr *)(skb_mac_header(skb) + VLAN_ETH_HLEN);
	else if((skb->protocol == htons(ETH_P_PPP_SES)) && (pppoe_proto(skb) == htons(0x0021)))
		ih6 = (struct ipv6hdr *)(skb_mac_header(skb) + ETH_HLEN +PPPOE_SES_HLEN);
	else
		ih6 = (struct ipv6hdr *)skb_header_pointer(skb, 0, sizeof(_ip6h), &_ip6h);
#else
	ih6 = skb_header_pointer(*pskb, 0, sizeof(_ip6h), &_ip6h);

#endif
	
	if ( ih6 == NULL ) 
		return NF_DROP;
	
	if (!skb_make_writable(skb, sizeof(struct ipv6hdr)))
		return NF_DROP;

#if 0	
	if ( (*pskb)->mark & QOS_WANIF_MARK ) {
		tos = tcinfo->tc;
		//printk("tos is %d\n", tos);
		(*pskb)->mark |= (tos << 20);
		//printk("mark is %x\n", (tos<<20));
		return tcinfo->target | ~EBT_VERDICT_BITS;
	}
#endif
#ifdef CONFIG_QOS
	rule_no = ((skb)->mark & QOS_RULE_INDEX_MARK) >> 12;
	if (0 == qostype_chk(EBT_CHK_TYPE, rule_no, NULL, 0)) {
		tos = tcinfo->tc;
		set_tos(rule_no, tos);
		return tcinfo->target | ~EBT_VERDICT_BITS;
	}
	else {
		unset_tos(rule_no);
	}
#endif
	ipv6_change_dsfield((struct ipv6hdr *)ih6, /*0xFF*/0x0, tcinfo->tc);

    return tcinfo->target | ~EBT_VERDICT_BITS;
}

/*
static int ebt_target_tc_check(const char *tablename, unsigned int hookmask,
   const struct ebt_entry *e, void *data, unsigned int datalen)
*/
static int ebt_tc_mt_check(const struct xt_mtchk_param *par)
{
	struct ebt_tc_info *info = par->matchinfo;

	//printk("==>ebt_target_tc_check(): info->tc is 0x%x\n", info->tc);
/*
	if (datalen != sizeof(struct ebt_tc_info))
		return -EINVAL;
*/
	if (BASE_CHAIN && info->target == EBT_RETURN)
		return -EINVAL;
//	CLEAR_BASE_CHAIN_BIT;
	if (INVALID_TARGET)
		return -EINVAL;
	return 0;
}

static struct xt_target tc_target __read_mostly=
{
	.name		= "tc",
	.revision	= 0,
	.family		= NFPROTO_BRIDGE,
	.target		= ebt_tc_mt,
	.checkentry	= ebt_tc_mt_check,
	.targetsize	= sizeof(struct ebt_tc_info),
	.me		= THIS_MODULE,
};

static int __init ebt_tc_init(void)
{
	return xt_register_target(&tc_target);
}

static void __exit ebt_tc_fini(void)
{
	xt_unregister_target(&tc_target);
}

module_init(ebt_tc_init);
module_exit(ebt_tc_fini);
MODULE_LICENSE("GPL");
