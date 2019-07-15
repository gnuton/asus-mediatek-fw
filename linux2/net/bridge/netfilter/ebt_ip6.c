/*
 *  ebt_ip6
 *
 *	Authors:
 *	Manohar Castelino <manohar.r.castelino@intel.com>
 *	Kuo-Lang Tseng <kuo-lang.tseng@intel.com>
 *	Jan Engelhardt <jengelh@medozas.de>
 *
 * Summary:
 * This is just a modification of the IPv4 code written by
 * Bart De Schuymer <bdschuym@pandora.be>
 * with the changes required to support IPv6
 *
 *  Jan, 2008
 */
#include <linux/ipv6.h>
#include <net/ipv6.h>
#include <linux/in.h>
#include <linux/module.h>
#include <net/dsfield.h>
#include <linux/netfilter/x_tables.h>
#include <linux/netfilter_bridge/ebtables.h>
#include <linux/netfilter_bridge/ebt_ip6.h>

struct tcpudphdr {
	__be16 src;
	__be16 dst;
};

static inline __be16 vlan_proto(const struct sk_buff *skb)
{
	return vlan_eth_hdr(skb)->h_vlan_encapsulated_proto;
}
static inline __be16 pppoe_proto(const struct sk_buff *skb)
{
	return *((__be16 *)(skb_mac_header(skb) + ETH_HLEN +
			    sizeof(struct pppoe_hdr)));
}

static bool
ebt_ip6_mt(const struct sk_buff *skb, struct xt_action_param *par)
{
	const struct ebt_ip6_info *info = par->matchinfo;
	const struct ipv6hdr *ih6;
	struct ipv6hdr _ip6h;
	const struct tcpudphdr *pptr;
	struct tcpudphdr _ports;	
	struct in6_addr tmp_addr;
	int i;

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
	ih6 = skb_header_pointer(skb, 0, sizeof(_ip6h), &_ip6h);
#endif
	
	if (ih6 == NULL)
		return false;
	
#if 1
	if (info->bitmask & EBT_IP6_TCLASS) {
		__u8 tc = ipv6_get_dsfield((struct ipv6hdr *)ih6);
	   if (FWINV(tc < info->tclass[0] || 
	   		 tc > info->tclass[1], EBT_IP6_TCLASS))
		return false;
	}
#else
	if (info->bitmask & EBT_IP6_TCLASS &&
	   FWINV(info->tclass != ipv6_get_dsfield((struct ipv6hdr *)ih6), EBT_IP6_TCLASS))
		//return false;
		return false;

#endif

#if 1
	for (i = 0; i < 4; i++)
		tmp_addr.in6_u.u6_addr32[i] = ih6->saddr.in6_u.u6_addr32[i] &
			info->smsk.in6_u.u6_addr32[i];
	if (info->bitmask & EBT_IP6_SOURCE &&
		FWINV((ipv6_addr_cmp(&tmp_addr, &info->saddr) != 0),
			EBT_IP6_SOURCE))
		return false;

	for (i = 0; i < 4; i++)
		tmp_addr.in6_u.u6_addr32[i] = ih6->daddr.in6_u.u6_addr32[i] &
			info->dmsk.in6_u.u6_addr32[i];
	if (info->bitmask & EBT_IP6_DEST &&
	   FWINV((ipv6_addr_cmp(&tmp_addr, &info->daddr) != 0), EBT_IP6_DEST))
		return false;
#else
	if (FWINV(ipv6_masked_addr_cmp(&ih6->saddr, &info->smsk,
				       &info->saddr), EBT_IP6_SOURCE) ||
	    FWINV(ipv6_masked_addr_cmp(&ih6->daddr, &info->dmsk,
				       &info->daddr), EBT_IP6_DEST))
		return false;	
#endif

	if (info->bitmask & EBT_IP6_PROTO) {
		uint8_t nexthdr = ih6->nexthdr;
		int offset_ph;

		offset_ph = ipv6_skip_exthdr(skb, sizeof(_ip6h), &nexthdr);
		if (offset_ph == -1)
			return false;
#if 1
		if ( FWINV((info->protocol[0] != nexthdr) && (info->protocol[1] != nexthdr), EBT_IP6_PROTO) )
			return false;
#else
		if (FWINV(info->protocol != nexthdr, EBT_IP6_PROTO))
			return false;
	
#endif
		if (!(info->bitmask & EBT_IP6_DPORT) &&
		    !(info->bitmask & EBT_IP6_SPORT)){		    
			return true;
		}
#if 1
		if(skb->protocol == htons(ETH_P_IP))
			pptr = (struct tcpudphdr *)skb_header_pointer(skb, offset_ph, sizeof(_ports), &_ports);
		else if((skb->protocol == htons(ETH_P_8021Q)) && (vlan_proto(skb) == htons(ETH_P_IP)))
			pptr = (struct tcpudphdr *)(skb_mac_header(skb) + VLAN_ETH_HLEN + offset_ph);
		else if((skb->protocol == htons(ETH_P_PPP_SES)) && (pppoe_proto(skb) == htons(0x0021)))
			pptr = (struct tcpudphdr *)(skb_mac_header(skb) + ETH_HLEN + PPPOE_SES_HLEN + offset_ph);
		else
			pptr = (struct tcpudphdr *)skb_header_pointer(skb, offset_ph, sizeof(_ports), &_ports);
#else
		pptr = skb_header_pointer(skb, offset_ph, sizeof(_ports),
					  &_ports);
#endif
		if (pptr == NULL)
			return false;
		if (info->bitmask & EBT_IP6_DPORT) {
			u32 dst = ntohs(pptr->dst);
			if (FWINV(dst < info->dport[0] ||
				  dst > info->dport[1], EBT_IP6_DPORT))
				return false;
		}

		if (info->bitmask & EBT_IP6_SPORT) {
			u32 src = ntohs(pptr->src);
			if (FWINV(src < info->sport[0] ||
				  src > info->sport[1], EBT_IP6_SPORT))
			return false;
		}
		return true;
	}
	return true;
}

static int ebt_ip6_mt_check(const struct xt_mtchk_param *par)
{
	const struct ebt_entry *e = par->entryinfo;
	struct ebt_ip6_info *info = par->matchinfo;

	if (e->ethproto != htons(ETH_P_IPV6) || e->invflags & EBT_IPROTO)
		return -EINVAL;
	if (info->bitmask & ~EBT_IP6_MASK || info->invflags & ~EBT_IP6_MASK)
		return -EINVAL;
	if (info->bitmask & (EBT_IP6_DPORT | EBT_IP6_SPORT)) {
		if (info->invflags & EBT_IP6_PROTO)
			return -EINVAL;	
#if 1
		if (info->protocol[0] != IPPROTO_TCP && info->protocol[1] != IPPROTO_TCP &&
					info->protocol[0] != IPPROTO_UDP && info->protocol[1] != IPPROTO_UDP &&
					info->protocol[0] != IPPROTO_UDPLITE && info->protocol[1] != IPPROTO_UDPLITE &&
					info->protocol[0] != IPPROTO_SCTP && info->protocol[1] != IPPROTO_SCTP &&
					info->protocol[0] != IPPROTO_DCCP && info->protocol[1] != IPPROTO_DCCP ) 
#else
		if (info->protocol != IPPROTO_TCP &&
		    info->protocol != IPPROTO_UDP &&
		    info->protocol != IPPROTO_UDPLITE &&
		    info->protocol != IPPROTO_SCTP &&
		    info->protocol != IPPROTO_DCCP)
#endif
			return -EINVAL;
	}
	if (info->bitmask & EBT_IP6_DPORT && info->dport[0] > info->dport[1])
		return -EINVAL;
	if (info->bitmask & EBT_IP6_SPORT && info->sport[0] > info->sport[1])
		return -EINVAL;
	return 0;
}

static struct xt_match ebt_ip6_mt_reg __read_mostly = {
	.name		= "ip6",
	.revision	= 0,
	.family		= NFPROTO_BRIDGE,
	.match		= ebt_ip6_mt,
	.checkentry	= ebt_ip6_mt_check,
	.matchsize	= sizeof(struct ebt_ip6_info),
	.me		= THIS_MODULE,
};

static int __init ebt_ip6_init(void)
{
	return xt_register_match(&ebt_ip6_mt_reg);
}

static void __exit ebt_ip6_fini(void)
{
	xt_unregister_match(&ebt_ip6_mt_reg);
}

module_init(ebt_ip6_init);
module_exit(ebt_ip6_fini);
MODULE_DESCRIPTION("Ebtables: IPv6 protocol packet match");
MODULE_AUTHOR("Kuo-Lang Tseng <kuo-lang.tseng@intel.com>");
MODULE_LICENSE("GPL");
