/* Copyright Statement:
 *
 * This software/firmware and related documentation ("MediaTek Software") are
 * protected under relevant copyright laws. The information contained herein
 * is confidential and proprietary to MediaTek Inc. and/or its licensors.
 * Without the prior written permission of MediaTek inc. and/or its licensors,
 * any reproduction, modification, use or disclosure of MediaTek Software,
 * and information contained herein, in whole or in part, shall be strictly prohibited.
 */
/* MediaTek Inc. (C) 2010. All rights reserved.
 *
 * BY OPENING THIS FILE, RECEIVER HEREBY UNEQUIVOCALLY ACKNOWLEDGES AND AGREES
 * THAT THE SOFTWARE/FIRMWARE AND ITS DOCUMENTATIONS ("MEDIATEK SOFTWARE")
 * RECEIVED FROM MEDIATEK AND/OR ITS REPRESENTATIVES ARE PROVIDED TO RECEIVER ON
 * AN "AS-IS" BASIS ONLY. MEDIATEK EXPRESSLY DISCLAIMS ANY AND ALL WARRANTIES,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE OR NONINFRINGEMENT.
 * NEITHER DOES MEDIATEK PROVIDE ANY WARRANTY WHATSOEVER WITH RESPECT TO THE
 * SOFTWARE OF ANY THIRD PARTY WHICH MAY BE USED BY, INCORPORATED IN, OR
 * SUPPLIED WITH THE MEDIATEK SOFTWARE, AND RECEIVER AGREES TO LOOK ONLY TO SUCH
 * THIRD PARTY FOR ANY WARRANTY CLAIM RELATING THERETO. RECEIVER EXPRESSLY ACKNOWLEDGES
 * THAT IT IS RECEIVER'S SOLE RESPONSIBILITY TO OBTAIN FROM ANY THIRD PARTY ALL PROPER LICENSES
 * CONTAINED IN MEDIATEK SOFTWARE. MEDIATEK SHALL ALSO NOT BE RESPONSIBLE FOR ANY MEDIATEK
 * SOFTWARE RELEASES MADE TO RECEIVER'S SPECIFICATION OR TO CONFORM TO A PARTICULAR
 * STANDARD OR OPEN FORUM. RECEIVER'S SOLE AND EXCLUSIVE REMEDY AND MEDIATEK'S ENTIRE AND
 * CUMULATIVE LIABILITY WITH RESPECT TO THE MEDIATEK SOFTWARE RELEASED HEREUNDER WILL BE,
 * AT MEDIATEK'S OPTION, TO REVISE OR REPLACE THE MEDIATEK SOFTWARE AT ISSUE,
 * OR REFUND ANY SOFTWARE LICENSE FEES OR SERVICE CHARGE PAID BY RECEIVER TO
 * MEDIATEK FOR SUCH MEDIATEK SOFTWARE AT ISSUE.
 *
 * The following software/firmware and/or related documentation ("MediaTek Software")
 * have been modified by MediaTek Inc. All revisions are subject to any receiver's
 * applicable license agreements with MediaTek Inc.
 */


#if 0
#define RAMDOM_READ 1<<0  //0x05 0xE0
#define CACHE_READ  1<<1  //0x31 0x3f

typedef struct
{
   u16 id;			//deviceid+menuid
   u8  addr_cycle;
   u8  iowidth;
   u16 totalsize;	
   u16 blocksize;
   u16 pagesize;
   u32 timmingsetting;
   char devciename[14];
   u32 advancedmode;   //
}flashdev_info,*pflashdev_info;



static const flashdev_info gen_FlashTable[]={
	//micro
	{0xAA2C,  5,  8,  256,	128,  2048,  0x01113,  "MT29F2G08ABD",	0},
	{0xB12C,  4,  16, 128,	128,  2048,  0x01113,  "MT29F1G16ABC",	0},
	{0xBA2C,  5,  16, 256,	128,  2048,  0x01113,  "MT29F2G16ABD",	0}, 
	{0xAC2C,  5,  8,  512,	128,  2048,  0x01113,  "MT29F4G08ABC",	RAMDOM_READ|CACHE_READ},
	{0xA12C,	4,	8,	128,	128,	2048,	 0x01113,	 "MT29F1G08ABB",	0},
	{0xBC2C,	5,	16,	512,	128,	2048,	 0x01112,	 "MT29F4G16ABBDA",	RAMDOM_READ|CACHE_READ},
	//samsung 
	{0xBAEC,  5,  16, 256,	128,  2048,  0x01123,  "K522H1GACE",	0},
	{0xBCEC,  5,  16, 512,	128,  2048,  0x01123,  "K524G2GACB",	RAMDOM_READ},
	{0xDAEC,  5,  8,  256,	128,  2048,  0x33222,  "K9F2G08U0A",	0},
	{0xF1EC,  4,  8,  128,	128,  2048,  0x01123,  "K9F1G08U0A",	RAMDOM_READ},
	{0xAAEC,  5,  8,  256,	128,  2048,  0x01123,  "K9F2G08R0A",	RAMDOM_READ},
	//hynix
	{0xD3AD,  5,  8,  1024, 256,  2048,  0x44333,  "HY27UT088G2A",	0},
	{0xA1AD,  4,  8,  128,	128,  2048,  0x01123,  "H8BCSOPJOMCP",	0},
	{0xBCAD,  5,  16, 512,	128,  2048,  0x01123,  "H8BCSOUNOMCR",	0},
	{0xBAAD,  5,  16, 256,	128,  2048,  0x01123,  "H8BCSOSNOMCR",	0},
	//toshiba
	{0x9598,  5,  16, 816,	128,  2048,  0x00113,  "TY9C000000CMG", 0},
	{0x9498,  5,  16, 375,	128,  2048,  0x00113,  "TY9C000000CMG", 0},
	{0xBC98,	5,	16,	512,	128,	2048,	 0x02113,	 "TY58NYG2S8E",		RAMDOM_READ},
	{0xC198,  4,  16, 128,	128,  2048,  0x44333,  "TC58NWGOS8C",	0},
	{0xBA98,  5,  16, 256,	128,  2048,  0x02113,  "TC58NYG1S8C",	0},
	//st-micro
	{0xBA20,  5,  16, 256,	128,  2048,  0x01123,  "ND02CGR4B2DI6", 0},
	{0xBC20,	5,	16,	512,	128,	2048,	 0x01123,	 "ST04GR4B",	0},
	{0x0000,  0,  0,  0,	0,	  0,	 0,    "xxxxxxxxxxxxx", 0}
};
#endif
static const flashdev_info gen_FlashTable[]={
	//Zentel, A5U1GA31ATS
	{0x92f1, 0x809540, 4,  8, 128,	128,  2048,  0x44333,  "NAND1GA31ATS", 0}, //128M, 2K Page size
	//st
	{0x2075, 0x207520 ,4,  8, 32,	16,  512,  0x44333,  "NAND256W3A", 0}, //32M,512 Page size
	//micro
	{0x2CDA,  0x909504, 5,  8,  256,	128,  2048,  0x44333,  "MT29F2G08AAB",	0}, //256M, 2K Page Size
	//{0x2CDC,  0x909504, 5,  8,  512,	128,  2048,  0x44333,  "MT29F4G08AAC",	0}, //512M, 2K Page Size
	//samsung 
	{0xECDC,  0x109554, 5,  8, 512,	128,  2048,  0x44333,  "K9F4G08U0D",	0},//512M, 2K Page Size
	//toshiba	
	{0x98D1,  0x901576, 4,  8, 128,	128,  2048,  0x44333,  "TC58NVG0S3E",	0}, //128M
	{0x98D3,  0x902676, 5,  8, 1024,	256,  4096,  0x44333,  "TC58NVG3S0F",	0}, //1024M
	{0x98F1,  0x8015F2, 4,  8, 128, 128,  2048,  0x44333,  "TC58BVG0S3HTA",   0}, //128M, ECC free
	//Winbond
	{0xeff1,  0x809500, 4,  8, 128,	128,  2048,  0x44333,  "W29N01GV",	0}, //128M
	{0xeff1,  0x009500, 4,  8, 128, 128,  2048,  0x44333,  "W29N01HV",      0}, //128M
	//MXIC
	{0xc2f1,  0x801dc2, 4,  8, 128,	128,  2048,  0x44333,  "MX30LF1G08",	0}, //128M
	{0xc2f1,  0x809582, 4,  8, 128, 128,  2048,  0x44333,  "MX30LF1GE8AB",    0}, //128M, ECC free
	{0xc2f1,  0x809502, 4,  8, 128, 128,  2048,  0x44333,  "MX30LF1G18AC",    0}, //128M, 4 bit ECC
	//ESMT
	{0x92f1,  0x809540, 4,  8, 128,	128,  2048,  0x44333,  "F59L1G81A",	0}, //128M
	{0xC8D1,  0x809542, 4,  8, 128, 128,  2048,  0x44333,  "F59L1G81LA",     0}, //128M

	{0xFFFF,  0xFFF128, 4,  8, 128, 128,  2048,  0x44333,  "Generic128M",     0}, //128M
	{0x0000,  0,  0, 0,  0,	0,	  0,	 0,    "xxxxxxxxxxxxx", 0}
};

