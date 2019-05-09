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

#ifndef _INT_SOURCE_H_
#define _INT_SOURCE_H_

enum
interrupt_source
	{
#if defined(CONFIG_MIPS_TC3262) && defined(TCSUPPORT_CT)
		DUMMY_INT,
#endif
		UART_INT,		//0 	IPL10
#if defined(CONFIG_MIPS_TC3262) && defined(TCSUPPORT_CT)
		PTM_B0_INT,		//1
		SI_SWINT1_INT0,	//2
		SI_SWINT1_INT1,	//3
#else
		RTC_ALARM_INT,	//1 	IPL29
		RTC_TICK_INT,	//2 	IPL31
		RESERVED0,		//3 	IPL30
#endif
		TIMER0_INT, 	//4 	IPL1
		TIMER1_INT, 	//5 	IPL5
		TIMER2_INT, 	//6 	IPL6
#if defined(CONFIG_MIPS_TC3262) && defined(TCSUPPORT_CT)
		SI_SWINT_INT0, 	//7
		SI_SWINT_INT1, 	//8
#else
		TIMER3_INT, 	//7 	IPL7
		TIMER4_INT, 	//8 	IPL8
#endif
		TIMER5_INT, 	//9 	IPL9
		GPIO_INT,		//10	IPL11
#if defined(CONFIG_MIPS_TC3262) && defined(TCSUPPORT_CT)
		RESERVED1,		//11	IPL20
		SI_PC1_INT, 	//12
		SI_PC_INT, 		//13
#else
		PCIE_A_INT,		//11	IPL20
		PCIE_SERR_INT,	//12	IPL21
		RESERVED3,		//13	IPL22
#endif
		APB_DMA0_INT,	//14	IPL12
#if defined(CONFIG_MIPS_TC3262) && defined(TCSUPPORT_CT)
		MAC1_INT,		//15	IPL13
#else
		APB_DMA1_INT,	//15	IPL13
#endif
		HSUART_INT,		//16	IPL23
#if defined(CONFIG_MIPS_TC3262) && defined(TCSUPPORT_CT)

		PTM_B1_INT,		//17
#else
		RESERVED5,		//17	IPL24
#endif
		DYINGGASP_INT,	//18	IPL25
		DMT_INT,		//19	IPL26
#if defined(CONFIG_MIPS_TC3262) && defined(TCSUPPORT_CT)
		USB20_INT,
#else
		ARBITER_ERR_INT,//20	IPL0
#endif
		MAC_INT,		//21	IPL3
		SAR_INT,		//22	IPL2
#if defined(CONFIG_MIPS_TC3262) && defined(TCSUPPORT_CT)
		USB11_INT,
#else
		USB_INT,		//23	IPL14
#endif
		PCI_A_INT,		//24
		PCI_B_INT,		//25
//		  RESERVED8,	  //24	  IPL27
//		  RESERVED9,	  //25	  IPL28
		XSLV0_INT,		//26	IPL15
		XSLV1_INT,		//27	IPL16
		XSLV2_INT,		//28	IPL17
#if defined(CONFIG_MIPS_TC3262) && defined(TCSUPPORT_CT)
		SI_TIMER1_INT,	//29
		SI_TIMER_INT,	//30
#else
		XAPB0_INT,		//29	IPL18
		XAPB1_INT,		//30	IPL19
#endif
		SWR_INT 		//31	IPL4
	};

#endif /* _INT_SOURCE_H_ */
