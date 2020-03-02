/*
 ***************************************************************************
 * Ralink Tech Inc.
 * 4F, No. 2 Technology 5th Rd.
 * Science-based Industrial Park
 * Hsin-chu, Taiwan, R.O.C.
 *
 * (c) Copyright 2002-2006, Ralink Technology, Inc.
 *
 * All rights reserved. Ralink's source code is an unpublished work and the
 * use of a copyright notice does not imply otherwise. This source code
 * contains confidential trade secret material of Ralink Tech. Any attempt
 * or participation in deciphering, decoding, reverse engineering or in any
 * way altering the source code is stricitly prohibited, unless the prior
 * written consent of Ralink Technology, Inc. is obtained.
 ***************************************************************************

    Module Name:
    
    hook.c

    Abstract:

    Revision History:
    Who         When            What
    --------    ----------      ----------------------------------------------
    Name        Date            Modification logs
    Steven Liu  2006-10-06      Initial version
*/

#include <linux/version.h>
#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/types.h>
#include <linux/skbuff.h>
#include <linux/foe_hook.h>
#include <net/sock.h>

int (*ra_sw_nat_hook_rx) (struct sk_buff * skb) = NULL;
#ifdef TCSUPPORT_MT7510_FE
int (*ra_sw_nat_hook_tx) (struct sk_buff * skb, struct port_info * pinfo, int magic);
#else
int (*ra_sw_nat_hook_tx) (struct sk_buff * skb, int gmac_no) = NULL;
#endif
int (*ra_sw_nat_hook_free) (struct sk_buff * skb) = NULL;
int (*ra_sw_nat_hook_rxinfo) (struct sk_buff * skb, int magic, char *data, int data_length) = NULL;
int (*ra_sw_nat_hook_txq) (struct sk_buff * skb, int txq) = NULL;
int (*ra_sw_nat_hook_magic) (struct sk_buff * skb, int magic) = NULL;
int (*ra_sw_nat_hook_set_magic) (struct sk_buff * skb, int magic) = NULL;
int (*ra_sw_nat_hook_xfer) (struct sk_buff *skb, const struct sk_buff *prev_p) = NULL;
int (*ra_sw_nat_hook_is_alive_pkt)(unsigned int crsn) = NULL;
#ifdef TCSUPPORT_RA_HWNAT_ENHANCE_HOOK
int (*ra_sw_nat_hook_drop_packet) (struct sk_buff * skb) = NULL;
int (*ra_sw_nat_hook_clean_table) (void) = NULL;
#endif
int (*ra_sw_nat_hook_foeentry) (void * inputvalue,int operation) = NULL;
#ifdef TCSUPPORT_MT7510_FE
unsigned long (*ra_sw_nat_hook_gdm2_state) (int gdm2AddrIndex) = NULL;
EXPORT_SYMBOL(ra_sw_nat_hook_gdm2_state);
void (*ra_sw_nat_hook_gdm2_clear_state) () = NULL;
EXPORT_SYMBOL(ra_sw_nat_hook_gdm2_clear_state);

#ifdef TCSUPPORT_HWNAT_LED
int is_hwnat_led_enable = 1;
#else
int is_hwnat_led_enable = 0;
#endif // end of TCSUPPORT_HWNAT_LED
EXPORT_SYMBOL(is_hwnat_led_enable);
#endif // end of TCSUPPORT_MT7510_FE

//#if defined(TCSUPPORT_XPON_IGMP) || defined(TCSUPPORT_MULTICAST_SPEED)
int (*hwnat_is_alive_pkt_hook)(struct sk_buff* skb) = NULL;
int (*hwnat_skb_to_foe_hook)(struct sk_buff* skb) = NULL;
int (*hwnat_set_special_tag_hook)(int index, int tag) = NULL;
int (*hwnat_delete_foe_entry_hook)(int index) = NULL;
int (*hwnat_is_multicast_entry_hook)(int index ,unsigned char* grp_addr,unsigned char* src_addr,int type) = NULL;
int (*hwnat_is_drop_entry_hook)(int index ,unsigned char* grp_addr,unsigned char* src_addr,int type) = NULL;
int  (*multicast_speed_find_entry_hook)(int index) = NULL;
int  (*multicast_speed_learn_flow_hook)(struct sk_buff* skb) = NULL;
int  (*hwnat_set_rule_according_to_state_hook)(int index, int state,int mask) = NULL;
int  (*hwnat_set_recover_info_hook)(struct sk_buff* skb,struct sock *sk,int flag) = NULL;
int  (*xpon_igmp_learn_flow_hook)(struct sk_buff* skb) = NULL;
int (*hwnat_set_wlan_multicast_hook)(int index ,int flag) = NULL;
int (*wan_multicast_drop_hook)(struct sk_buff* skb) = NULL;
int (*wan_multicast_undrop_hook)(void) = NULL;
int (*wan_mvlan_change_hook)(void) = NULL;
EXPORT_SYMBOL(hwnat_is_alive_pkt_hook);
EXPORT_SYMBOL(hwnat_skb_to_foe_hook);
EXPORT_SYMBOL(hwnat_set_special_tag_hook);
EXPORT_SYMBOL(hwnat_delete_foe_entry_hook);
EXPORT_SYMBOL(hwnat_is_multicast_entry_hook);
EXPORT_SYMBOL(hwnat_is_drop_entry_hook);
EXPORT_SYMBOL(multicast_speed_find_entry_hook);
EXPORT_SYMBOL(multicast_speed_learn_flow_hook);
EXPORT_SYMBOL(hwnat_set_rule_according_to_state_hook);
EXPORT_SYMBOL(hwnat_set_recover_info_hook);
EXPORT_SYMBOL(xpon_igmp_learn_flow_hook);
EXPORT_SYMBOL(hwnat_set_wlan_multicast_hook);
EXPORT_SYMBOL(wan_multicast_drop_hook);
EXPORT_SYMBOL(wan_multicast_undrop_hook);
EXPORT_SYMBOL(wan_mvlan_change_hook);
//#endif

EXPORT_SYMBOL(ra_sw_nat_hook_rx);
EXPORT_SYMBOL(ra_sw_nat_hook_tx);
EXPORT_SYMBOL(ra_sw_nat_hook_free);
EXPORT_SYMBOL(ra_sw_nat_hook_rxinfo);
EXPORT_SYMBOL(ra_sw_nat_hook_txq);
EXPORT_SYMBOL(ra_sw_nat_hook_magic);
EXPORT_SYMBOL(ra_sw_nat_hook_set_magic);
EXPORT_SYMBOL(ra_sw_nat_hook_xfer);
EXPORT_SYMBOL(ra_sw_nat_hook_is_alive_pkt);
#ifdef TCSUPPORT_RA_HWNAT_ENHANCE_HOOK
EXPORT_SYMBOL(ra_sw_nat_hook_drop_packet);
EXPORT_SYMBOL(ra_sw_nat_hook_clean_table);
#endif
EXPORT_SYMBOL(ra_sw_nat_hook_foeentry);

#ifndef TCSUPPORT_IPSEC_PASSTHROUGH
#include <net/mtk_esp.h>
//when not open vpn passthrough function,below function do nothing
void
ipsec_esp_ouput_finish_pt(ipsec_finishpara_t* inputParams)
{
	return;
}

void ipsec_esp_input_finish_pt(ipsec_finishpara_t* inputParams)
{
	return;
}
int ipsec_esp_output_pt(ipsec_para_t* ipsecparams)
{
	return -1;
}

int ipsec_esp_input_pt(ipsec_para_t* ipsecparams)
{
	return -1;
}

EXPORT_SYMBOL(ipsec_esp_input_pt);
EXPORT_SYMBOL(ipsec_esp_input_finish_pt);
EXPORT_SYMBOL(ipsec_esp_output_pt);
EXPORT_SYMBOL(ipsec_esp_ouput_finish_pt);
#endif


