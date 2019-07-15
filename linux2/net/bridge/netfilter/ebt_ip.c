/*
 *  ebt_ip
 *
 *	Authors:
 *	Bart De Schuymer <bdschuym@pandora.be>
 *
 *  April, 2002
 *
 *  Changes:
 *    added ip-sport and ip-dport
 *    Innominate Security Technologies AG <mhopf@innominate.com>
 *    September, 2002
 */
#include <linux/ip.h>
#include <net/ip.h>
#include <linux/in.h>
#include <linux/module.h>
#include <linux/netfilter/x_tables.h>
#include <linux/netfilter_bridge/ebtables.h>
#include <linux/netfilter_bridge/ebt_ip.h>

struct tcpudphdr {
	__be16 src;
	__be16 dst;
};
#if 1  /*Rodney_20090724*/
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
static bool
ebt_ip_mt(const struct sk_buff *skb, struct xt_action_param *par)
{
	const struct ebt_ip_info *info = par->matchinfo;
	const struct iphdr *ih;
	struct iphdr _iph;
	const struct tcpudphdr *pptr;
	struct tcpudphdr _ports;
#if 1 /*Rodney_20090724*/
	if(skb->protocol == htons(ETH_P_IP))
		ih = skb_header_pointer(skb, 0, sizeof(_iph), &_iph);
	else if((skb->protocol == htons(ETH_P_8021Q)) && (vlan_proto(skb) == htons(ETH_P_IP)))
		ih = (struct iphdr *)(skb_mac_header(skb) + VLAN_ETH_HLEN);
	else if((skb->protocol == htons(ETH_P_PPP_SES)) && (pppoe_proto(skb) == htons(0x0021)))
		ih = (struct iphdr *)(skb_mac_header(skb) + ETH_HLEN +PPPOE_SES_HLEN);
	else
		ih = skb_header_pointer(skb, 0, sizeof(_iph), &_iph);
#else
	ih = skb_header_pointer(skb, 0, sizeof(_iph), &_iph);
#endif
	if (ih == NULL)
		return false;
#if 1  /*Rodney_20090724*/
	if (info->bitmask & EBT_IP_IPP){
		if (FWINV((ih->tos & 0xe0) < info->ipp[0] || (ih->tos & 0xe0) > info->ipp[1], EBT_IP_IPP))
			return false;
	}
	if (info->bitmask & EBT_IP_DSCP){
		if (FWINV((ih->tos & 0xfc) < info->dscp[0] || (ih->tos & 0xfc) > info->dscp[1], EBT_IP_DSCP))
			return false;
	}
	if (info->bitmask & EBT_IP_TOS &&
		FWINV((info->tos & 0x1e) != (ih->tos & 0x1e), EBT_IP_TOS))
#else
	if (info->bitmask & EBT_IP_TOS &&
	   FWINV(info->tos != ih->tos, EBT_IP_TOS))
#endif
		return false;
#if 0
	if (info->bitmask & EBT_IP_SOURCE &&
	   FWINV((ih->saddr & info->smsk) !=
	   info->saddr, EBT_IP_SOURCE))
		return false;
	if ((info->bitmask & EBT_IP_DEST) &&
	   FWINV((ih->daddr & info->dmsk) !=
	   info->daddr, EBT_IP_DEST))
		return false;
#else
	/*xyzhu_20100413*/
	if ( info->bitmask & EBT_IP_SOURCE &&
		FWINV( ((ih->saddr & info->smsk[0]) < info->saddr[0]) ||
			   ((ih->saddr & info->smsk[0]) > info->saddr[1]), EBT_IP_SOURCE ) ) {
		return false;
	}
	
	if ( info->bitmask & EBT_IP_DEST &&
		FWINV( ((ih->daddr & info->dmsk[0]) < info->daddr[0]) ||
			   ((ih->daddr & info->dmsk[0]) > info->daddr[1]), EBT_IP_DEST ) ) {
		return false;	   
	}
#endif
	if (info->bitmask & EBT_IP_PROTO) {
#if 1  /*Rodney_20090724*/
		if (FWINV((info->protocol[0] != ih->protocol) && (info->protocol[1] != ih->protocol), EBT_IP_PROTO))
#else
		if (FWINV(info->protocol != ih->protocol, EBT_IP_PROTO))
#endif
			return false;
		if (!(info->bitmask & EBT_IP_DPORT) &&
		    !(info->bitmask & EBT_IP_SPORT))
			return true;
		if (ntohs(ih->frag_off) & IP_OFFSET)
			return false;
#if 1  /*Rodney_20090724*/
		if(skb->protocol == htons(ETH_P_IP))
			pptr = (struct tcpudphdr *)skb_header_pointer(skb, ih->ihl*4, sizeof(_ports), &_ports);
		else if((skb->protocol == htons(ETH_P_8021Q)) && (vlan_proto(skb) == htons(ETH_P_IP)))
			pptr = (struct tcpudphdr *)(skb_mac_header(skb) + VLAN_ETH_HLEN + ih->ihl*4);
		else if((skb->protocol == htons(ETH_P_PPP_SES)) && (pppoe_proto(skb) == htons(0x0021)))
			pptr = (struct tcpudphdr *)(skb_mac_header(skb) + ETH_HLEN + PPPOE_SES_HLEN + ih->ihl*4);
		else
			pptr = (struct tcpudphdr *)skb_header_pointer(skb, ih->ihl*4, sizeof(_ports), &_ports);
#else
		pptr = skb_header_pointer(skb, ih->ihl*4,
					  sizeof(_ports), &_ports);
#endif
		if (pptr == NULL)
			return false;
		if (info->bitmask & EBT_IP_DPORT) {
			u32 dst = ntohs(pptr->dst);
			if (FWINV(dst < info->dport[0] ||
				  dst > info->dport[1],
				  EBT_IP_DPORT))
			return false;
		}
		if (info->bitmask & EBT_IP_SPORT) {
			u32 src = ntohs(pptr->src);
			if (FWINV(src < info->sport[0] ||
				  src > info->sport[1],
				  EBT_IP_SPORT))
			return false;
		}
	}
	return true;
}

static int ebt_ip_mt_check(const struct xt_mtchk_param *par)
{
	const struct ebt_ip_info *info = par->matchinfo;
	const struct ebt_entry *e = par->entryinfo;

	if (e->ethproto != htons(ETH_P_IP) ||
	   e->invflags & EBT_IPROTO)
		return -EINVAL;
	if (info->bitmask & ~EBT_IP_MASK || info->invflags & ~EBT_IP_MASK)
		return -EINVAL;
	if (info->bitmask & (EBT_IP_DPORT | EBT_IP_SPORT)) {
		if (info->invflags & EBT_IP_PROTO)
			return -EINVAL;
#if 1  /*Rodney_20090724*/
		if (info->protocol[0] != IPPROTO_TCP && info->protocol[1] != IPPROTO_TCP &&
		    info->protocol[0] != IPPROTO_UDP && info->protocol[1] != IPPROTO_UDP &&
		    info->protocol[0] != IPPROTO_UDPLITE && info->protocol[1] != IPPROTO_UDPLITE &&
		    info->protocol[0] != IPPROTO_SCTP && info->protocol[1] != IPPROTO_SCTP &&
		    info->protocol[0] != IPPROTO_DCCP && info->protocol[1] != IPPROTO_DCCP)
#else
		if (info->protocol != IPPROTO_TCP &&
		    info->protocol != IPPROTO_UDP &&
		    info->protocol != IPPROTO_UDPLITE &&
		    info->protocol != IPPROTO_SCTP &&
		    info->protocol != IPPROTO_DCCP)
#endif
			 return -EINVAL;
	}
	if (info->bitmask & EBT_IP_DPORT && info->dport[0] > info->dport[1])
		return -EINVAL;
	if (info->bitmask & EBT_IP_SPORT && info->sport[0] > info->sport[1])
		return -EINVAL;
	return 0;
}

static struct xt_match ebt_ip_mt_reg __read_mostly = {
	.name		= "ip",
	.revision	= 0,
	.family		= NFPROTO_BRIDGE,
	.match		= ebt_ip_mt,
	.checkentry	= ebt_ip_mt_check,
	.matchsize	= sizeof(struct ebt_ip_info),
	.me		= THIS_MODULE,
};

static int __init ebt_ip_init(void)
{
	return xt_register_match(&ebt_ip_mt_reg);
}

static void __exit ebt_ip_fini(void)
{
	xt_unregister_match(&ebt_ip_mt_reg);
}

module_init(ebt_ip_init);
module_exit(ebt_ip_fini);
MODULE_DESCRIPTION("Ebtables: IPv4 protocol packet match");
MODULE_LICENSE("GPL");
