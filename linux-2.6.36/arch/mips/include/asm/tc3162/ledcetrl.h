/*
** $Id: ledcetrl.h,v 1.4 2011/01/07 04:05:20 pork Exp $
*/
/************************************************************************
 *
 *	Copyright (C) 2006 Trendchip Technologies, Corp.
 *	All Rights Reserved.
 *
 * Trendchip Confidential; Need to Know only.
 * Protected as an unpublished work.
 *
 * The computer program listings, specifications and documentation
 * herein are the property of Trendchip Technologies, Co. and shall
 * not be reproduced, copied, disclosed, or used in whole or in part
 * for any reason without the prior express written permission of
 * Trendchip Technologeis, Co.
 *
 *************************************************************************/
/*
** $Log: ledcetrl.h,v $
** Revision 1.4  2011/01/07 04:05:20  pork
** commit TDI layer with Zarlink 2S1O
**
** Revision 1.3  2010/10/15 05:02:10  xmdai_nj
** #7017:add function for wlan button(main trunk)
**
** Revision 1.2  2010/06/11 00:31:06  xhshi
** #5964 support dare's new led and key requests
**
** Revision 1.1.1.1  2010/04/09 09:39:21  feiyan
** New TC Linux Make Flow Trunk
**
** Revision 1.3  2010/03/22 14:15:16  yzwang_nj
** [Bug#5128] Implement TR068 LED
**
** Revision 1.2  2010/03/19 07:16:59  xyyou
** # 5213 Add  RT3390 11n Webpage
** Support RT3390 AutoChannel feature
** Support RT3390 WMM feature
** # 5214 Support RT3390 wps feature
**      Add wps led spec&not spec
**
** Revision 1.1.1.1  2009/12/17 01:42:47  josephxu
** 20091217, from Hinchu ,with VoIP
**
** Revision 1.1.1.1  2007/04/12 09:42:03  ian
** TCLinuxTurnkey2007
**
** Revision 1.2  2006/07/06 07:24:57  lino
** update copyright year
**
** Revision 1.1.1.1  2005/11/02 05:45:38  lino
** no message
**
** Revision 1.3  2004/10/12 08:33:45  lino
** add 10M/100M ethernet led define
**
*/

#ifndef _LEDCETRL_H
#define _LEDCETRL_H

/*__________________________________________________________________________
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%      constant definition
%%________________________________________________________________________*/
#ifdef TCSUPPORT_GPIO_ECM
#define LED_TYPE_MAX_NO		16
	//define led flash peroid parameter
#define MAX_LED_FLASH_PERIOD		128
#define LED_FLASH_PERIOD_LOW		1
#define LED_FLASH_PERIOD_HIGH		0
#define MAX_LED_FLASH_MAP			8
	//define serial gpio control status
#define SLED_STATUS_REDAY			0x1<<31
	// define led interface type
#define LED_SERIAL					1
#define LED_PARALLEL				0
#endif
#ifdef TCSUPPORT_WLAN_LED_BY_SW
#define WLAN_DISCONNECT 0
#define WLAN_CONNECT 1
#define WLAN_BLINK 2
#define WLAN_DEFAULT 3
#endif
// define led mode
#define LED_MODE_NOT_USED			0
#define LED_MODE_ONOFF				1
#define LED_MODE_BLINK				2
#define LED_MODE_NOACT				3
#define LED_MODE_PULSE				4
/*20090811pork modified: add for sys reset gpio*/
#define LED_MODE_INPUT				5
#define LED_MODE_MASK				0xf
#define LED_MODE_BICOLOR			0x10

// define led blink speed
#define LED_SPEED_FAST				0
#define LED_SPEED_MED				1
#define LED_SPEED_SLOW				2
#define LED_SPEED_VERY_SLOW			3
#ifdef TCSUPPORT_WLAN_LED_BY_SW
#define LED_SPEED_FASTEST			4
#endif

// define software led no
#define LED_BASE 					0

#define LED_DSL_STATUS				(LED_BASE + 0)
#define LED_DSL_ACT_STATUS			(LED_BASE + 1)
#define LED_DSL_NOACT_STATUS		(LED_BASE + 2)
#define LED_DSL_IDLE_STATUS			(LED_BASE + 3)
#define LED_DSL_HANDSHAKE_STATUS	(LED_BASE + 4)
#define LED_DSL_TRAINING_STATUS		(LED_BASE + 5)
#define LED_DSL_SHOWTIME_STATUS		(LED_BASE + 6)

#define LED_PPP_STATUS				(LED_BASE + 7)
#define LED_PPP_ACT_STATUS			(LED_BASE + 8)
#define LED_PPP_NOACT_STATUS		(LED_BASE + 9)

#define LED_USB_STATUS				(LED_BASE + 10)
#define LED_USB_ACT_STATUS			(LED_BASE + 11)
#define LED_USB_NOACT_STATUS		(LED_BASE + 12)

#define LED_WLAN_STATUS				(LED_BASE + 13)
#define LED_WLAN_ACT_STATUS			(LED_BASE + 14)
#define LED_WLAN_NOACT_STATUS		(LED_BASE + 15)

#define LED_ETHER_STATUS			(LED_BASE + 16)
#define LED_ETHER_ACT_STATUS		(LED_BASE + 17)
#define LED_ETHER_NOACT_STATUS		(LED_BASE + 18)

#define LED_FLASH_STATUS			(LED_BASE + 19)
#define LED_SYS_BOOT_STATUS			(LED_BASE + 20)
#define LED_SYS_STATUS				(LED_BASE + 21)
#define LED_SYS_INIT_STATUS			(LED_BASE + 22)

#define LED_ETHER_10M_STATUS		(LED_BASE + 23)
#define LED_ETHER_10M_ACT_STATUS	(LED_BASE + 24)
#define LED_ETHER_10M_NOACT_STATUS	(LED_BASE + 25)

#define LED_ETHER_100M_STATUS		(LED_BASE + 26)
#define LED_ETHER_100M_ACT_STATUS	(LED_BASE + 27)
#define LED_ETHER_100M_NOACT_STATUS	(LED_BASE + 28)

#define LED_LAN_RESET				(LED_BASE + 31)
//add for TR068 compliance
#define LED_INTERNET_STATUS		(LED_BASE + 33)
#define LED_INTERNET_ACT_STATUS		(LED_BASE + 34)
#define LED_INTERNET_NOACT_STATUS	(LED_BASE + 35)
#define LED_INTERNET_TRYING_STATUS	(LED_BASE + 38)
#define LED_TR68_PWR_BOOTING		(LED_BASE + 40)
#define LED_TR68_PWR_BOOTED		(LED_BASE + 41)
#define LED_WLAN_WPS_STATUS		(LED_BASE + 43)
#define LED_WLAN_WPS_ACT_STATUS	(LED_BASE + 44)
#define LED_WLAN_WPS_NOACT_STATUS	(LED_BASE + 45)

#define LED_VOIP_SLIC1_RESET (LED_BASE + 46)
#define LED_VOIP_SLIC2_RESET (LED_BASE + 47)
#define LED_DSL_ALARM (LED_BASE + 48)
#define LED_VOIP_HOOK1_STATUS (LED_BASE + 49)
#define LED_VOIP_HOOK2_STATUS (LED_BASE + 50)

#define LED_WLAN_RADIO                 	(LED_BASE + 57) 
#define GPIO_WLAN_WPS				(LED_BASE + 58)

//add by brian for gpio additional request
#define LED_PWR_FLASH				(LED_BASE + 59)


/*20090811 pork added: fit for linos LED setting*/
#define GPIO_SYS_RESET				(LED_BASE + 56)
#define LED_LAN1_RESET				(LED_BASE + 63)


#define mtkled_read_reg_word(reg) 			regRead32(reg)
#define mtkled_write_reg_word(reg, wdata) 	regWrite32(reg, wdata)
/*__________________________________________________________________________
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%      function declaration
%%________________________________________________________________________*/

void ledInit(void);
void ledSysInitOn(void);
void ledSysInitOff(void);
void ledTurnOn(uint8 led_no);
void ledTurnOff(uint8 led_no);
uint8 ledGetMode(uint8 led_no);
void ledSetMode(uint8 led_no, uint8 mode);
uint8 ledGetGpio(uint8 led_no);
void led_oen(uint8 led_no);
void led_ien(uint8 led_no);
//#define ledTurnOn(led_no)
//#define ledTurnOff(led_no)
int exModeMDIOGpioConf(uint8 mdc_gpio_num,uint8  mdio_gpio_num);
void exModeMDIOGpioQuery(uint8 * mdc_gpio_num,uint8 * mdio_gpio_num);
uint32 exModeMDIORead(uint32 reg);
void exModeMDIOWrite(uint32 reg, uint32 data);

void ledMtnInit(void);

int	ledTaskInit(void);
void ledTask(void);

#endif
