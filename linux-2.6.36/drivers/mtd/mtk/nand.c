/******************************************************************************
* mt6573_nand.c - MT6573 NAND Flash Device Driver
 *
* Copyright 2009-2010 MediaTek Co.,Ltd.
 *
* DESCRIPTION:
* 	This file provid the other drivers nand relative functions
 *
* modification history
* ----------------------------------------
* v2.0, 11 Feb 2010, mtk02528 written
* ----------------------------------------
******************************************************************************/


#include <linux/slab.h>
#include <linux/init.h>
#include <linux/module.h>
#include <linux/delay.h>
#include <linux/errno.h>
#include <linux/sched.h>
#include <linux/types.h>
#include <linux/wait.h>
#include <linux/spinlock.h>
#include <linux/interrupt.h>
#include <linux/mtd/mtd.h>
#include <linux/mtd/nand.h>
#include <linux/mtd/partitions.h>
#include <linux/mtd/nand_ecc.h>
#include <linux/dma-mapping.h>
#include <linux/jiffies.h>
#include <linux/platform_device.h>
#include <linux/proc_fs.h>
#include <linux/time.h>

#include <asm/io.h>
#include <asm/cacheflush.h>
#include <asm/uaccess.h>

#include <linux/miscdevice.h>
#include <linux/scatterlist.h>

//#include <mach/mt6573.h>
// #include <mach/mtk_nand_device.h>
//#include <mach/dma.h>
//#include <mach/mt6573_devs.h>
//#include <mach/mt6573_reg_base.h>
#include "mt6573_typedefs.h"
/* Koshi for mt6573 porting */
//#include <mach/mt6573_pll.h>
/*JL*/
//#include <mach/mt6573_nand.h>
#include "mt6573_nand.h"
/* Koshi for mt6573 porting */
#include "../ralink/bmt.h"
// #include <mach/partition.h>

/* Added for TCM used */
//#include <asm/tcm.h>
#include <asm/system.h>
//#include "partition_define.h"
#include "nand_devicelist.h"
//#include "nand_customer.h"
#include <linux/mtd/map.h>
#include <asm/tc3162/tc3162.h>

#define VERSION  	"v2.0"
#define MODULE_NAME	"# MT6573 NAND #"
#define PROCNAME    "driver/nand"
#define PROCNAME_ECC    "driver/nand_ecc"


//#define NAND_ECC_TEST
//#define USE_AHB_MODE 1
BOOL g_bUseAHBMode=true;
//#if USE_AHB_MODE
BOOL g_bAutoFMT=true;
BOOL g_bHwEcc=true;
BOOL g_bOOB_Test=false;
BOOL g_bReadEraseStatus=false;
#ifdef NAND_ECC_TEST
int g_hw_ecc_bit = 4;
int g_spare_size = 16;
#endif
//#else
//BOOL g_bHwEcc=false;
//#endif
#define BMT_BAD_BLOCK_INDEX_OFFSET (1)
#ifdef TCSUPPORT_NAND_BMT
#define POOL_GOOD_BLOCK_PERCENT 8/100
#define SLAVE_IMAGE_OFFSET 0xf00000
static int bmt_pool_size = 0;
static bmt_struct *g_bmt = NULL;
static init_bbt_struct *g_bbt = NULL;
extern int nand_logic_size;
#endif

#define _MTK_NAND_DUMMY_DRIVER_

#ifndef NAND_OTP_SUPPORT
#define NAND_OTP_SUPPORT 0
#endif

#if NAND_OTP_SUPPORT

#define SAMSUNG_OTP_SUPPORT     1
#define OTP_MAGIC_NUM           0x4E3AF28B
#define SAMSUNG_OTP_PAGE_NUM    6

static const unsigned int Samsung_OTP_Page[SAMSUNG_OTP_PAGE_NUM] = {0x15, 0x16, 0x17, 0x18, 0x19, 0x1b};

static struct mt6573_otp_config g_mt6573_otp_fuc;
static spinlock_t g_OTPLock;

#define OTP_MAGIC           'k'

/* NAND OTP IO control number */
#define OTP_GET_LENGTH 		_IOW(OTP_MAGIC, 1, int)
#define OTP_READ 	        _IOW(OTP_MAGIC, 2, int)
#define OTP_WRITE 			_IOW(OTP_MAGIC, 3, int)

#define FS_OTP_READ         0
#define FS_OTP_WRITE        1

/* NAND OTP Error codes */
#define OTP_SUCCESS                   0
#define OTP_ERROR_OVERSCOPE          -1
#define OTP_ERROR_TIMEOUT            -2
#define OTP_ERROR_BUSY               -3
#define OTP_ERROR_NOMEM              -4
#define OTP_ERROR_RESET              -5

#endif

#if NAND_OTP_SUPPORT
struct mt6573_otp_config
{
	u32 (* OTPRead)         (u32 PageAddr, void *BufferPtr, void *SparePtr);
	u32 (* OTPWrite)        (u32 PageAddr, void *BufferPtr, void *SparePtr);
	u32 (* OTPQueryLength)  (u32 *Length);
};

struct otp_ctl
{
    unsigned int QLength;
    unsigned int Offset;
    unsigned int Length;
    char *BufferPtr;
    unsigned int status;
};
#endif

#define BLANK_PAGE_FIXUP	1

/*******************************************************************************
 * Macro definition 
 *******************************************************************************/
//#define NFI_SET_REG32(reg, value)   (DRV_WriteReg32(reg, DRV_Reg32(reg) | (value))) 
//#define NFI_SET_REG16(reg, value)   (DRV_WriteReg16(reg, DRV_Reg16(reg) | (value)))
//#define NFI_CLN_REG32(reg, value)   (DRV_WriteReg32(reg, DRV_Reg32(reg) & (~(value))))
//#define NFI_CLN_REG16(reg, value)   (DRV_WriteReg16(reg, DRV_Reg16(reg) & (~(value))))

#define NFI_SET_REG32(reg, value) \
do {	\
	g_value = (DRV_Reg32(reg) | (value));\
	DRV_WriteReg32(reg, g_value); \
} while(0)

#define NFI_SET_REG16(reg, value) \
do {	\
	g_value = (DRV_Reg16(reg) | (value));\
	DRV_WriteReg16(reg, g_value); \
} while(0)

#define NFI_CLN_REG32(reg, value) \
do {	\
	g_value = (DRV_Reg32(reg) & (~(value)));\
	DRV_WriteReg32(reg, g_value); \
} while(0)

#define NFI_CLN_REG16(reg, value) \
do {	\
	g_value = (DRV_Reg16(reg) & (~(value)));\
	DRV_WriteReg16(reg, g_value); \
} while(0)

#define PIO_BIG_ENDIAN (DRV_Reg16(NFI_CNFG_REG16) & CNFG_PIO_BIG_ENDIAN)


#define NFI_WAIT_STATE_DONE(state) do{;}while (__raw_readl(NFI_STA_REG32) & state)
#define NFI_WAIT_TO_READY()  do{;}while (!(__raw_readl(NFI_STA_REG32) & STA_BUSY2READY))


#define NAND_SECTOR_SIZE (512)
#define OOB_PER_SECTOR      (16)
#define OOB_AVAI_PER_SECTOR (8)

#ifdef TCSUPPORT_NAND_BMT
#define BMT_POOL_SIZE       (80)
#else
#define BMT_POOL_SIZE       (0)
#endif

#define PMT_POOL_SIZE	(2)

#define K0_TO_K1(x)			(((uint32)x) | 0xA0000000)

/*******************************************************************************
 * Gloable Varible Definition
 *******************************************************************************/
#ifdef NAND_PFM
static suseconds_t g_PFM_R = 0;
static suseconds_t g_PFM_W = 0;
static suseconds_t g_PFM_E = 0;
static u32 g_PFM_RNum = 0;
static u32 g_PFM_RD = 0;
static u32 g_PFM_WD = 0;
static struct timeval g_now;

#define PFM_BEGIN(time) \
do_gettimeofday(&g_now); \
(time) = g_now;

#define PFM_END_R(time, n) \
do_gettimeofday(&g_now); \
g_PFM_R += (g_now.tv_sec * 1000000 + g_now.tv_usec) - (time.tv_sec * 1000000 + time.tv_usec); \
g_PFM_RNum += 1; \
g_PFM_RD += n; \
MSG(PERFORMANCE, "%s - Read PFM: %lu, data: %d, ReadOOB: %d (%d, %d)\n", MODULE_NAME , g_PFM_R, g_PFM_RD, g_kCMD.pureReadOOB, g_kCMD.pureReadOOBNum, g_PFM_RNum);

#define PFM_END_W(time, n) \
do_gettimeofday(&g_now); \
g_PFM_W += (g_now.tv_sec * 1000000 + g_now.tv_usec) - (time.tv_sec * 1000000 + time.tv_usec); \
g_PFM_WD += n; \
MSG(PERFORMANCE, "%s - Write PFM: %lu, data: %d\n", MODULE_NAME, g_PFM_W, g_PFM_WD);

#define PFM_END_E(time) \
do_gettimeofday(&g_now); \
g_PFM_E += (g_now.tv_sec * 1000000 + g_now.tv_usec) - (time.tv_sec * 1000000 + time.tv_usec); \
MSG(PERFORMANCE, "%s - Erase PFM: %lu\n", MODULE_NAME, g_PFM_E);
#else
#define PFM_BEGIN(time)
#define PFM_END_R(time, n)
#define PFM_END_W(time, n)
#define PFM_END_E(time)
#endif

/* MT6573 NAND Driver */
struct mt6573_nand_host_hw mt6573_nand_hw = {
    .nfi_bus_width          = 8,
	.nfi_access_timing		= NFI_DEFAULT_ACCESS_TIMING,
	.nfi_cs_num				= NFI_CS_NUM,
	.nand_sec_size			= 512,
	.nand_sec_shift			= 9,
	.nand_ecc_size			= 2048,
	.nand_ecc_bytes			= 32,
	.nand_ecc_mode			= NAND_ECC_NONE,
};

#ifdef TCSUPPORT_DUAL_IMAGE_ENHANCE
extern int offset;
#endif


static struct mtd_partition mt6573_partitions[] = {
	{									 	/* First partition */
		  name 	     : "NAND Flash",	 	/* Section */
		  size	  	 : 0x0,		 		 	/* Size  */
		  offset     : 0				 	/* Offset from start of flash- location 0x0*/
	},
};


#define TIMEOUT_1   0x1fff
#define TIMEOUT_2   0x8ff
#define TIMEOUT_3   0xffff
#define TIMEOUT_4   5000   //PIO

#define NFI_ISSUE_COMMAND(cmd, col_addr, row_addr, col_num, row_num) \
   do { \
      DRV_WriteReg(NFI_CMD_REG16,cmd);\
      while (DRV_Reg32(NFI_STA_REG32) & STA_CMD_STATE);\
      DRV_WriteReg32(NFI_COLADDR_REG32, col_addr);\
      DRV_WriteReg32(NFI_ROWADDR_REG32, row_addr);\
      DRV_WriteReg(NFI_ADDRNOB_REG16, col_num | (row_num<<ADDR_ROW_NOB_SHIFT));\
      while (DRV_Reg32(NFI_STA_REG32) & STA_ADDR_STATE);\
   }while(0);

//-------------------------------------------------------------------------------
static struct completion g_comp_AHB_Done;
static struct mt6573_CMD g_kCMD;
static u32 g_u4ChipVer;
bool g_bInitDone;
static int g_i4Interrupt;
static bool g_bcmdstatus;
static u32 g_value = 0;
static int g_page_size;

static u8 *local_buffer_16_align_r;       // 16 byte aligned buffer, for HW issue
static u8 local_buffer_r[4096+32];
static u8 *local_buffer_16_align_w;       // 16 byte aligned buffer, for HW issue
static u8 local_buffer_w[4096+32];

extern void nand_release_device(struct mtd_info *mtd);
extern int nand_get_device(struct nand_chip *chip, struct mtd_info *mtd, int new_state);

extern unsigned int (*ranand_read_byte)(unsigned long long);
extern unsigned int (*ranand_read_dword)(unsigned long long);

#ifdef TCSUPPORT_NAND_BMT
static bmt_struct *g_bmt;
#endif
struct mt6573_nand_host *host;

//extern struct mtd_partition g_pasStatic_Partition[] ;
//extern int part_num;
#ifdef PMT
extern void part_init_pmt(struct mtd_info *mtd, u8 *buf);
extern struct mtd_partition g_exist_Partition[] ;
#endif
int manu_id;
int dev_id;

static u8 local_oob_buf[234];

#ifdef _MTK_NAND_DUMMY_DRIVER_
int dummy_driver_debug;
#endif


void dump_buf(uint8_t *buf, int len)
{
	int i;
	printk("len=%d\n",len);

	for(i = 0; i < (len); i++){
		if (i>0 && !(i%16)) {
			printk("\n");
		}
		printk("%x ", *buf++);
	}
		
	printk("\n");
}

void nand_enable_clock(void)
{
    //(void)hwEnableClock(MT65XX_PDN_PERI_NFI, "NAND");
}

void nand_disable_clock(void)
{
    //(void)hwDisableClock(MT65XX_PDN_PERI_NFI, "NAND");
}

static struct nand_ecclayout nand_oob_16 = {
	.eccbytes = 8,
	.eccpos = {8, 9, 10, 11, 12, 13, 14, 15},
	.oobfree = {{4,3}, {0, 0}}
};

struct nand_ecclayout nand_oob_64 = {
	.eccbytes = 32,
	.eccpos = {32, 33, 34, 35, 36, 37, 38, 39,
        40, 41, 42, 43, 44, 45, 46, 47,
        48, 49, 50, 51, 52, 53, 54, 55,
        56, 57, 58, 59, 60, 61, 62, 63},
	.oobfree = {{4, 4}, {9, 7}, {17, 7}, {25, 6}, {0, 0}}
};

struct nand_ecclayout nand_oob_128 = {
	.eccbytes = 64,
	.eccpos = {
        64, 65, 66, 67, 68, 69, 70, 71, 
        72, 73, 74, 75, 76, 77, 78, 79,
        80, 81, 82, 83, 84, 85, 86, 86,
        88, 89, 90, 91, 92, 93, 94, 95,
        96, 97, 98, 99, 100, 101, 102, 103,
        104, 105, 106, 107, 108, 109, 110, 111,
        112, 113, 114, 115, 116, 117, 118, 119,
        120, 121, 122, 123, 124, 125, 126, 127},
	.oobfree = {{4, 4}, {9, 7}, {17, 7}, {25, 7}, {33, 7}, {41, 7}, {49, 7}, {57, 6}}
};

flashdev_info devinfo;

static void mt6573_nand_configure_fdm(u16 u2FDMSize);


void dump_nfi(void)
{
#if __DEBUG_NAND
    printk(KERN_INFO "NFI_ACCCON: 0x%x\n",  DRV_Reg32(NFI_ACCCON_REG32));
    printk(KERN_INFO "NFI_PAGEFMT: 0x%x\n", DRV_Reg16(NFI_PAGEFMT_REG16));
    printk(KERN_INFO "NFI_CNFG: 0x%x\n", DRV_Reg16(NFI_CNFG_REG16));
    printk(KERN_INFO "NFI_CON: 0x%x\n", DRV_Reg16(NFI_CON_REG16));
    printk(KERN_INFO "NFI_STRDATA: 0x%x\n", DRV_Reg16(NFI_STRDATA_REG16));
    printk(KERN_INFO "NFI_ADDRCNTR: 0x%x\n", DRV_Reg16(NFI_ADDRCNTR_REG16));
    printk(KERN_INFO "NFI_FIFOSTA: 0x%x\n", DRV_Reg16(NFI_FIFOSTA_REG16));
    printk(KERN_INFO "NFI_ADDRNOB: 0x%x\n", DRV_Reg16(NFI_ADDRNOB_REG16));
    printk(KERN_INFO "NFI_FDM_0L: 0x%x\n", DRV_Reg32(NFI_FDM0L_REG32));
    printk(KERN_INFO "NFI_STA: 0x%x\n", DRV_Reg32(NFI_STA_REG32));
    printk(KERN_INFO "NFI_FDM_0M: 0x%x\n", DRV_Reg32(NFI_FDM0M_REG32));
    printk(KERN_INFO "NFI_IOCON: 0x%x\n", DRV_Reg16(NFI_IOCON_REG16));
    printk(KERN_INFO "NFI_BYTELEN: 0x%x\n", DRV_Reg16(NFI_BYTELEN_REG16));
    printk(KERN_INFO "NFI_COLADDR: 0x%x\n", DRV_Reg32(NFI_COLADDR_REG32));
    printk(KERN_INFO "NFI_ROWADDR: 0x%x\n", DRV_Reg32(NFI_ROWADDR_REG32));
    printk(KERN_INFO "ECC_ENCCNFG: 0x%x\n", DRV_Reg32(ECC_ENCCNFG_REG32));
    printk(KERN_INFO "ECC_ENCCON: 0x%x\n", DRV_Reg16(ECC_ENCCON_REG16));
    printk(KERN_INFO "ECC_DECCNFG: 0x%x\n", DRV_Reg32(ECC_DECCNFG_REG32));
    printk(KERN_INFO "ECC_DECCON: 0x%x\n", DRV_Reg16(ECC_DECCON_REG16));
    printk(KERN_INFO "NFI_CSEL: 0x%x\n", DRV_Reg16(NFI_CSEL_REG16));
	//ECC

	printk(KERN_INFO "NFI_STRADDR: 0x%x\n", DRV_Reg32(NFI_STRADDR_REG32));
	printk(KERN_INFO "ECC_DECDIADDR: 0x%x\n", DRV_Reg32(ECC_DECDIADDR_REG32));
	printk(KERN_INFO "ECC_FDMADDR_REG32: 0x%x\n", DRV_Reg32(ECC_FDMADDR_REG32));
	printk(KERN_INFO "ECC_DECFSM_REG32: 0x%x\n", DRV_Reg32(ECC_DECFSM_REG32));
	printk(KERN_INFO "ECC_SYNSTA_REG32: 0x%x\n", DRV_Reg32(ECC_SYNSTA_REG32));
	printk(KERN_INFO "ECC_DECNFIDI_REG32: 0x%x\n", DRV_Reg32(ECC_DECNFIDI_REG32));
	printk(KERN_INFO "ECC_SYN0_REG32: 0x%x\n", DRV_Reg32(ECC_SYN0_REG32));
    // printk(KERN_INFO "NFI clock register: 0x%x: %s\n", DRV_Reg32((volatile u32 *)0x00000000),
    //         (DRV_Reg32((volatile u32 *)0xF0039300) & (1 << 17)) ? "miss" : "OK");
#endif
}


bool get_device_info(u16 id, u32 ext_id, flashdev_info *pdevinfo)
{
	u32 index;
	for(index=0;gen_FlashTable[index].id!=0;index++)
	{
	    //if(id==gen_FlashTable[index].id && ext_id == gen_FlashTable[index].ext_id)
	    if (id == gen_FlashTable[index].id || gen_FlashTable[index].id == 0xFFFF) 
        {
        	ext_id = ((gen_FlashTable[index].ext_id&0xFF)==0xFF)?(ext_id|0xFF) : ext_id;
					if(ext_id == gen_FlashTable[index].ext_id || gen_FlashTable[index].ext_id == 0xFFF128){
	    	pdevinfo->id = gen_FlashTable[index].id;
	    	pdevinfo->ext_id = gen_FlashTable[index].ext_id;
			pdevinfo->blocksize = gen_FlashTable[index].blocksize;
			pdevinfo->addr_cycle = gen_FlashTable[index].addr_cycle;
			pdevinfo->iowidth = gen_FlashTable[index].iowidth;
			pdevinfo->timmingsetting = gen_FlashTable[index].timmingsetting;
			pdevinfo->advancedmode = gen_FlashTable[index].advancedmode;
			pdevinfo->pagesize = gen_FlashTable[index].pagesize;
	        pdevinfo->totalsize = gen_FlashTable[index].totalsize;
			memcpy(pdevinfo->devciename,gen_FlashTable[index].devciename,sizeof(pdevinfo->devciename));
		if (gen_FlashTable[index].id == 0xFFFF)
		{
			printk(KERN_INFO "Device not found, ID: %x, try %s setting\n", id, pdevinfo->devciename);
		}
		else
		{
			printk(KERN_INFO "Device found in MTK table, ID: %x\n", id);
		}
	        goto find;		
		}
	}
	}
#if 0
    for (index = 0; cust_FlashTable[index].id != 0; index++)
    {
        if (id == cust_FlashTable[index].id)
        {
            pdevinfo->id = cust_FlashTable[index].id;
            pdevinfo->blocksize = cust_FlashTable[index].blocksize;
            pdevinfo->addr_cycle = cust_FlashTable[index].addr_cycle;
            pdevinfo->iowidth = cust_FlashTable[index].iowidth;
            pdevinfo->timmingsetting = cust_FlashTable[index].timmingsetting;
            pdevinfo->advancedmode = cust_FlashTable[index].advancedmode;
            pdevinfo->pagesize = cust_FlashTable[index].pagesize;
            pdevinfo->totalsize = cust_FlashTable[index].totalsize;
            memcpy(pdevinfo->devciename, cust_FlashTable[index].devciename, sizeof(pdevinfo->devciename));
            printk(KERN_INFO "Device found in customer table, ID: %x\n", id);

            goto find;
        }
    }
#endif

find:
	if(0==pdevinfo->id)
	{
        printk(KERN_INFO "Device not found, ID: %x\n", id);
	    return false;
	}
	else
	{
		return true;
	}
}
/******************************************************************************
 * mt6573_nand_irq_handler
 * 
 * DESCRIPTION:
 *   NAND interrupt handler!
 * 
 * PARAMETERS: 
 *   int irq
 *   void *dev_id
 * 
 * RETURNS: 
 *   IRQ_HANDLED : Successfully handle the IRQ  
 * 
 * NOTES: 
 *   None
 * 
 ******************************************************************************/
/* Modified for TCM used */
//static __tcmfunc irqreturn_t mt6573_nand_irq_handler(int irqno, void *dev_id)
static irqreturn_t mt6573_nand_irq_handler(int irqno, void *dev_id)
{
   u16 u16IntStatus = DRV_Reg16(NFI_INTR_REG16);
   	(void)irqno;

    if (u16IntStatus & (u16)INTR_AHB_DONE_EN)
	{
    	complete(&g_comp_AHB_Done);
    } 
    return IRQ_HANDLED;
}

/******************************************************************************
 * ECC_Config
 * 
 * DESCRIPTION:
 *   Configure HW ECC!
 * 
 * PARAMETERS: 
 *   struct mt6573_nand_host_hw *hw
 * 
 * RETURNS: 
 *   None  
 * 
 * NOTES: 
 *   None
 * 
 ******************************************************************************/
static int ECC_Config(struct mt6573_nand_host_hw *hw)
{
	u32 u4ENCODESize;
	u32 u4DECODESize;

	u32 timeout = 0xFFFF;

    DRV_WriteReg16(ECC_DECCON_REG16, DEC_DE);
    do{
		timeout--;
		if(timeout == 0){
			printk("NFI ECC Config: ECC_DECIDLE timeout\n");
			return -1;
		}
	}while (!DRV_Reg16(ECC_DECIDLE_REG16));
 
    DRV_WriteReg16(ECC_ENCCON_REG16, ENC_DE);
    do{;}while (!DRV_Reg32(ECC_ENCIDLE_REG32));

	/* setup FDM register base */
	DRV_WriteReg32(ECC_FDMADDR_REG32, NFI_FDM0L_REG32);

    /* Sector + FDM */
    u4ENCODESize = (hw->nand_sec_size + 8) << 3;
    /* Sector + FDM + YAFFS2 meta data bits */
	u4DECODESize = ((hw->nand_sec_size + 8) << 3) + 4 * 13; 

	/* configure ECC decoder && encoder*/
	DRV_WriteReg32(ECC_DECCNFG_REG32,
		ECC_CNFG_ECC4|DEC_CNFG_NFI|DEC_CNFG_EMPTY_EN|DEC_CNFG_BURST_EN |
		(u4DECODESize << DEC_CNFG_CODE_SHIFT));

	DRV_WriteReg32(ECC_ENCCNFG_REG32, 
		ECC_CNFG_ECC4|ENC_CNFG_NFI|
		(u4ENCODESize << ENC_CNFG_MSG_SHIFT));


//#if USE_AHB_MODE
	if(g_bUseAHBMode)
		NFI_SET_REG32(ECC_DECCNFG_REG32, DEC_CNFG_CORRECT);
	else
		NFI_SET_REG32(ECC_DECCNFG_REG32, DEC_CNFG_EL);

	return 0;
}

#ifdef NAND_ECC_TEST
static void ECC_Config_All_Bits(int hw_ecc_bit)
{
	int ecc_bit, ecc_bytes, spare_size, fdm_meta_size;
	u32 u4ENCODESize;
	u32 u4DECODESize;
	u32 ecc_conf;

	if(hw_ecc_bit < 4 || hw_ecc_bit > 16){
		printk("hw_ecc_bit is out of range:%d\n", hw_ecc_bit);
		printk("hw_ecc_bit should be 4,6,8,10,12,14,16\n");
		return;
	}

	//spare_size = 16 * (devinfo.pagesize / 512);
	spare_size = g_spare_size;

	ecc_bit = hw_ecc_bit*13;
	ecc_bytes = (ecc_bit + (1<<3)-1)>>3;

	if(ecc_bytes > spare_size)
    {
    	printk("ecc_bytes:%d > spare_size:%d\n", ecc_bytes, spare_size);
		return;
	}

	fdm_meta_size = spare_size - ecc_bytes;
    if(fdm_meta_size > 8)
    {
        fdm_meta_size = 8;
    }
	printk("ECC_Config_All_Bits:spare_size=%d,ecc_bytes=%d, fdm_meta_size=%d\n",spare_size, ecc_bytes, fdm_meta_size);
	g_hw_ecc_bit = hw_ecc_bit;
	
	ecc_conf = (hw_ecc_bit - 4)/2;

	NFI_CLN_REG32(ECC_DECCNFG_REG32, ECC_CNFG_ECC_MASK);
	NFI_SET_REG32(ECC_DECCNFG_REG32, ecc_conf);

	NFI_CLN_REG32(ECC_ENCCNFG_REG32, ECC_CNFG_ECC_MASK);
	NFI_SET_REG32(ECC_ENCCNFG_REG32, ecc_conf);


	mt6573_nand_configure_fdm(fdm_meta_size); //FDM SIZE=FDM ECC SIZE

	/*Configure spare size*/
	NFI_CLN_REG16(NFI_PAGEFMT_REG16, PAGEFMT_SPARE_MASK);

	switch(g_spare_size)
    {
        case 16:
            NFI_SET_REG16(NFI_PAGEFMT_REG16, PAGEFMT_SPARE_16 << PAGEFMT_SPARE_SHIFT);
            break;
        case 26:
            NFI_SET_REG16(NFI_PAGEFMT_REG16, PAGEFMT_SPARE_26 << PAGEFMT_SPARE_SHIFT);
            break;
        case 27:
            NFI_SET_REG16(NFI_PAGEFMT_REG16, PAGEFMT_SPARE_27 << PAGEFMT_SPARE_SHIFT);
            break;
        case 28:
            NFI_SET_REG16(NFI_PAGEFMT_REG16, PAGEFMT_SPARE_28 << PAGEFMT_SPARE_SHIFT);
            break;
        default:
            break;
    }

	u4ENCODESize = (fdm_meta_size<<3)+(1<<(9+3));

	
	printk("ECC_Config_All_Bits:u4ENCODESize=%x\n",u4ENCODESize);
    /* Set-up ECC encode message size = data + FDM_ECC */
	NFI_CLN_REG32(ECC_ENCCNFG_REG32, ENC_CNFG_MSG_MASK);
	NFI_SET_REG32(ECC_ENCCNFG_REG32, u4ENCODESize << ENC_CNFG_MSG_SHIFT);
	

    /* Set-up ECC decode message size = ECC message + T*13 */
    u4DECODESize = u4ENCODESize + ecc_bit;
	printk("ECC_Config_All_Bits:u4DECODESize=%x\n",u4DECODESize);
    NFI_CLN_REG32(ECC_DECCNFG_REG32, DEC_CNFG_CODE_MASK);
	NFI_SET_REG32(ECC_DECCNFG_REG32, u4DECODESize << DEC_CNFG_CODE_SHIFT);

	dump_nfi();	
	return;
	
}
#endif

/******************************************************************************
 * ECC_Decode_Start
 * 
 * DESCRIPTION:
 *   HW ECC Decode Start !
 * 
 * PARAMETERS: 
 *   None
 * 
 * RETURNS: 
 *   None  
 * 
 * NOTES: 
 *   None
 * 
 ******************************************************************************/
static void ECC_Decode_Start(void)
{
   	/* wait for device returning idle */
	while(!(DRV_Reg16(ECC_DECIDLE_REG16) & DEC_IDLE));
	DRV_WriteReg16(ECC_DECCON_REG16, DEC_EN);
}

/******************************************************************************
 * ECC_Decode_End
 * 
 * DESCRIPTION:
 *   HW ECC Decode End !
 * 
 * PARAMETERS: 
 *   None
 * 
 * RETURNS: 
 *   None  
 * 
 * NOTES: 
 *   None
 * 
 ******************************************************************************/
static void ECC_Decode_End(void)
{
   /* wait for device returning idle */
	while(!(DRV_Reg16(ECC_DECIDLE_REG16) & DEC_IDLE));
	DRV_WriteReg16(ECC_DECCON_REG16, DEC_DE);
}

/******************************************************************************
 * ECC_Encode_Start
 * 
 * DESCRIPTION:
 *   HW ECC Encode Start !
 * 
 * PARAMETERS: 
 *   None
 * 
 * RETURNS: 
 *   None  
 * 
 * NOTES: 
 *   None
 * 
 ******************************************************************************/
static void ECC_Encode_Start(void)
{
   /* wait for device returning idle */
	while(!(DRV_Reg32(ECC_ENCIDLE_REG32) & ENC_IDLE));
	mb();
	DRV_WriteReg16(ECC_ENCCON_REG16, ENC_EN);
}

/******************************************************************************
 * ECC_Encode_End
 * 
 * DESCRIPTION:
 *   HW ECC Encode End !
 * 
 * PARAMETERS: 
 *   None
 * 
 * RETURNS: 
 *   None  
 * 
 * NOTES: 
 *   None
 * 
 ******************************************************************************/
static void ECC_Encode_End(void)
{
   /* wait for device returning idle */
	while(!(DRV_Reg32(ECC_ENCIDLE_REG32) & ENC_IDLE));
	mb();
	DRV_WriteReg16(ECC_ENCCON_REG16, ENC_DE);
}

/******************************************************************************
 * mt6573_nand_check_bch_error
 * 
 * DESCRIPTION:
 *   Check BCH error or not !
 * 
 * PARAMETERS: 
 *   struct mtd_info *mtd
 *	 u8* pDataBuf
 *	 u32 u4SecIndex
 *	 u32 u4PageAddr
 * 
 * RETURNS: 
 *   None  
 * 
 * NOTES: 
 *   None
 * 
 ******************************************************************************/
static bool mt6573_nand_check_bch_error(
	struct mtd_info *mtd, u8* pDataBuf, u32 u4SecIndex, u32 u4PageAddr)
{
	bool bRet = true;
	u16 u2SectorDoneMask = 1 << u4SecIndex;
	u32 u4ErrorNumDebug, i, u4ErrNum, u4ErrorNumDebug1;
	u32 timeout = 0xFFFF;
    u32 correct_count = 0;
	// int el;
//#if !USE_AHB_MODE
	#if 0
	u32 au4ErrBitLoc[6];
	u32 u4ErrByteLoc, u4BitOffset;
	u32 u4ErrBitLoc1th, u4ErrBitLoc2nd;
	#endif
//#endif

	//4 // Wait for Decode Done
	while (0 == (u2SectorDoneMask & DRV_Reg16(ECC_DECDONE_REG16)))
	{       
		timeout--;
		if (0 == timeout)
		{
			printk("mt6573_nand_check_bch_error return timeout \n");
			//dump_nfi();
			return false;
		}
	}
//#if (USE_AHB_MODE)
	
	if(g_bUseAHBMode){
		u4ErrorNumDebug = DRV_Reg32(ECC_DECENUM0_REG32);
		u4ErrorNumDebug1 = DRV_Reg32(ECC_DECENUM1_REG32);
		if ((0 != (u4ErrorNumDebug & 0xFFFFF)) || (0 != (u4ErrorNumDebug1 & 0xFFFFF)))
	    {
			for (i = 0; i <= u4SecIndex; ++i)
	        {
	        	if(i<4){
					u4ErrNum = DRV_Reg32(ECC_DECENUM0_REG32) >> (i*5);
	        	}
				else{
					u4ErrNum = DRV_Reg32(ECC_DECENUM1_REG32) >> ((i-4)*5);
				}
				u4ErrNum &= 0x1F;
	            correct_count += u4ErrNum;
	            
				if (0x1F == u4ErrNum)
	            {
					mtd->ecc_stats.failed++;
					bRet = false;
					printk("UnCorrectable at PageAddr=%d, Sector=%d\n", u4PageAddr, i);
				} 
	            else 
	            {
	                if (u4ErrNum)
	                {
					    printk("Correct %d at PageAddr=%d, Sector=%d\n", u4ErrNum, u4PageAddr, i);
	                }
				}
			}
	        if ((correct_count > 2) && bRet)
	        {
					mtd->ecc_stats.corrected++;
			}
	        else
	        {
	            //printk("Less than 2 bit error, ignore\n");
			}
		}
	}
	else{
		#if 0 //correct function for PIO mode need develop
		/* We will manually correct the error bits in the last sector, not all the sectors of the page!*/
		memset(au4ErrBitLoc, 0x0, sizeof(au4ErrBitLoc));
		u4ErrorNumDebug = DRV_Reg32(ECC_DECENUM0_REG32);
		u4ErrNum = DRV_Reg32(ECC_DECENUM0_REG32) >> (u4SecIndex*5);
		u4ErrNum &= 0x1F;
	    
		if (u4ErrNum)
	    {
			if (0x1F == u4ErrNum)
	        {
				mtd->ecc_stats.failed++;
				bRet = false;
				printk("UnCorrectable at PageAddr=%d\n", u4PageAddr);
			} 
	        else 
	        {
				for (i = 0; i < ((u4ErrNum+1)>>1); ++i)
	            {
					au4ErrBitLoc[i] = DRV_Reg32(ECC_DECEL0_REG32 + i);
					u4ErrBitLoc1th = au4ErrBitLoc[i] & 0x1FFF;
	                
					if (u4ErrBitLoc1th < 0x1000)
	                {
						u4ErrByteLoc = u4ErrBitLoc1th/8;
						u4BitOffset = u4ErrBitLoc1th%8;
						pDataBuf[u4ErrByteLoc] = pDataBuf[u4ErrByteLoc]^(1<<u4BitOffset);
						mtd->ecc_stats.corrected++;
					} 
	                else 
	                {
						mtd->ecc_stats.failed++;
						printk("UnCorrectable ErrLoc=%d\n", au4ErrBitLoc[i]);
					}
					u4ErrBitLoc2nd = (au4ErrBitLoc[i] >> 16) & 0x1FFF;
					if (0 != u4ErrBitLoc2nd)
	                {
						if (u4ErrBitLoc2nd < 0x1000)
	                    {
							u4ErrByteLoc = u4ErrBitLoc2nd/8;
							u4BitOffset = u4ErrBitLoc2nd%8;
							pDataBuf[u4ErrByteLoc] = pDataBuf[u4ErrByteLoc]^(1<<u4BitOffset);
							mtd->ecc_stats.corrected++;
						} 
	                    else 
	                    {
							mtd->ecc_stats.failed++;
							printk("UnCorrectable High ErrLoc=%d\n", au4ErrBitLoc[i]);
						}
					}
				}
			}
			if (0 == (DRV_Reg16(ECC_DECFER_REG16) & (1 << u4SecIndex)))
	        {
				bRet = false;
				printk("mt6573_nand_check_bch_error return false 1111\n");
			}
		}
		#endif
	}
	
	return bRet;
}

/******************************************************************************
 * mt6573_nand_RFIFOValidSize
 * 
 * DESCRIPTION:
 *   Check the Read FIFO data bytes !
 * 
 * PARAMETERS: 
 *   u16 u2Size
 * 
 * RETURNS: 
 *   None   
 * 
 * NOTES: 
 *   None
 *
 ******************************************************************************/
static bool mt6573_nand_RFIFOValidSize(u16 u2Size)
{
	u32 timeout = 0xFFFF;
	while (FIFO_RD_REMAIN(DRV_Reg16(NFI_FIFOSTA_REG16)) < u2Size)
    {
		timeout--;
		if (0 == timeout){
			return false;
		}
	}
	return true;
}

/******************************************************************************
 * mt6573_nand_WFIFOValidSize
 * 
 * DESCRIPTION:
 *   Check the Write FIFO data bytes !
 * 
 * PARAMETERS: 
 *   u16 u2Size
 * 
 * RETURNS: 
 *   None   
 * 
 * NOTES: 
 *   None
 *
 ******************************************************************************/
static bool mt6573_nand_WFIFOValidSize(u16 u2Size)
{
	u32 timeout = 0xFFFF;
	while (FIFO_WR_REMAIN(DRV_Reg16(NFI_FIFOSTA_REG16)) > u2Size)
    {
		timeout--;
		if (0 == timeout)
        {
			return false;
		}
	}
	return true;
}

/******************************************************************************
 * mt6573_nand_status_ready
 * 
 * DESCRIPTION:
 *   Indicate the NAND device is ready or not ! 
 * 
 * PARAMETERS: 
 *   u32 u4Status
 * 
 * RETURNS: 
 *   None   
 * 
 * NOTES: 
 *   None
 *
 ******************************************************************************/
static bool mt6573_nand_status_ready(u32 u4Status)
{
	u32 timeout = 0xFFFF;
	while ((DRV_Reg32(NFI_STA_REG32) & u4Status) != 0)
    {
		timeout--;
		if (0 == timeout)
        {
			return false;
		}
	}
	return true;
}

/******************************************************************************
 * mt6573_nand_reset
 * 
 * DESCRIPTION:
 *   Reset the NAND device hardware component ! 
 * 
 * PARAMETERS: 
 *   struct mt6573_nand_host *host (Initial setting data)
 * 
 * RETURNS: 
 *   None   
 * 
 * NOTES: 
 *   None
 *
 ******************************************************************************/
static bool mt6573_nand_reset(void)
{
    // HW recommended reset flow
    int timeout = 0xFFFF;
    if (DRV_Reg16(NFI_MASTERSTA_REG16)) // master is busy
    {
    		mb();
        DRV_WriteReg16(NFI_CON_REG16, CON_FIFO_FLUSH | CON_NFI_RST);
        while (DRV_Reg16(NFI_MASTERSTA_REG16))
        {
            timeout--;
            if (!timeout)
            {
                MSG(INIT, "Wait for NFI_MASTERSTA timeout\n");
            }
        }
    }
	/* issue reset operation */
	mb();
	DRV_WriteReg16(NFI_CON_REG16, CON_FIFO_FLUSH | CON_NFI_RST);

	return mt6573_nand_status_ready(STA_NFI_FSM_MASK|STA_NAND_BUSY) &&
		   mt6573_nand_RFIFOValidSize(0) &&
		   mt6573_nand_WFIFOValidSize(0);
}

/******************************************************************************
 * mt6573_nand_set_mode
 * 
 * DESCRIPTION:
 *    Set the oepration mode ! 
 * 
 * PARAMETERS: 
 *   u16 u2OpMode (read/write) 
 * 
 * RETURNS: 
 *   None   
 * 
 * NOTES: 
 *   None
 *
 ******************************************************************************/
static void mt6573_nand_set_mode(u16 u2OpMode)
{
	u16 u2Mode = DRV_Reg16(NFI_CNFG_REG16);
	u2Mode &= ~CNFG_OP_MODE_MASK;
	u2Mode |= u2OpMode;
	DRV_WriteReg16(NFI_CNFG_REG16, u2Mode);
}

/******************************************************************************
 * mt6573_nand_set_autoformat
 * 
 * DESCRIPTION:
 *    Enable/Disable hardware autoformat ! 
 * 
 * PARAMETERS: 
 *   bool bEnable (Enable/Disable)
 * 
 * RETURNS: 
 *   None   
 * 
 * NOTES: 
 *   None
 *
 ******************************************************************************/
static void mt6573_nand_set_autoformat(bool bEnable)
{
	if (g_bAutoFMT && bEnable)
    {
		NFI_SET_REG16(NFI_CNFG_REG16, CNFG_AUTO_FMT_EN);
	}
    else
    {
		NFI_CLN_REG16(NFI_CNFG_REG16, CNFG_AUTO_FMT_EN);
	}
}

/******************************************************************************
 * mt6573_nand_configure_fdm
 * 
 * DESCRIPTION:
 *   Configure the FDM data size ! 
 * 
 * PARAMETERS: 
 *   u16 u2FDMSize
 * 
 * RETURNS: 
 *   None   
 * 
 * NOTES: 
 *   None
 *
 ******************************************************************************/
static void mt6573_nand_configure_fdm(u16 u2FDMSize)
{
	NFI_CLN_REG16(NFI_PAGEFMT_REG16, PAGEFMT_FDM_MASK | PAGEFMT_FDM_ECC_MASK);
	NFI_SET_REG16(NFI_PAGEFMT_REG16, u2FDMSize << PAGEFMT_FDM_SHIFT);
	NFI_SET_REG16(NFI_PAGEFMT_REG16, u2FDMSize << PAGEFMT_FDM_ECC_SHIFT);
}

/******************************************************************************
 * mt6573_nand_configure_lock
 * 
 * DESCRIPTION:
 *   Configure the NAND lock ! 
 * 
 * PARAMETERS: 
 *   u16 u2FDMSize
 * 
 * RETURNS: 
 *   None   
 * 
 * NOTES: 
 *   None
 *
 ******************************************************************************/
static void mt6573_nand_configure_lock(void)
{
	u32 u4WriteColNOB = 2;
	u32 u4WriteRowNOB = 3;
	u32 u4EraseColNOB = 0;
	u32 u4EraseRowNOB = 3;
	DRV_WriteReg16(NFI_LOCKANOB_REG16, 
		(u4WriteColNOB << PROG_CADD_NOB_SHIFT)  |
		(u4WriteRowNOB << PROG_RADD_NOB_SHIFT)  |
		(u4EraseColNOB << ERASE_CADD_NOB_SHIFT) |
		(u4EraseRowNOB << ERASE_RADD_NOB_SHIFT));

	if (CHIPVER_ECO_1 == g_u4ChipVer)
    {
		int i;
		for (i = 0; i < 16; ++i)
        {
			DRV_WriteReg32(NFI_LOCK00ADD_REG32 + (i << 1), 0xFFFFFFFF);
			DRV_WriteReg32(NFI_LOCK00FMT_REG32 + (i << 1), 0xFFFFFFFF);
		}
		//DRV_WriteReg16(NFI_LOCKANOB_REG16, 0x0);
		DRV_WriteReg32(NFI_LOCKCON_REG32, 0xFFFFFFFF);
		DRV_WriteReg16(NFI_LOCK_REG16, NFI_LOCK_ON);
	}	
}

static bool mt6573_nand_pio_ready(void)
{
    int count = 0;
    while ( !(DRV_Reg16(NFI_PIO_DIRDY_REG16) & 1) )
    {
        count++;
        if (count > 0xffff)
        {
            printk("PIO_DIRDY timeout\n");
            return false;
        }
    }

    return true;
}

/******************************************************************************
 * mt6573_nand_set_command
 * 
 * DESCRIPTION:
 *    Send hardware commands to NAND devices ! 
 * 
 * PARAMETERS: 
 *   u16 command 
 * 
 * RETURNS: 
 *   None   
 * 
 * NOTES: 
 *   None
 *
 ******************************************************************************/
static bool mt6573_nand_set_command(u16 command)
{
	/* Write command to device */
	mb();
	
	DRV_WriteReg16(NFI_CMD_REG16, command);
	return mt6573_nand_status_ready(STA_CMD_STATE);
}

/******************************************************************************
 * mt6573_nand_set_address
 * 
 * DESCRIPTION:
 *    Set the hardware address register ! 
 * 
 * PARAMETERS: 
 *   struct nand_chip *nand, u32 u4RowAddr 
 * 
 * RETURNS: 
 *   None   
 * 
 * NOTES: 
 *   None
 *
 ******************************************************************************/
static bool mt6573_nand_set_address(u32 u4ColAddr, u32 u4RowAddr, u16 u2ColNOB, u16 u2RowNOB)
{
	u32 coladdr = u4ColAddr, rowaddr = u4RowAddr;
	/* fill cycle addr */
	mb();
	
	DRV_WriteReg32(NFI_COLADDR_REG32, coladdr);
	DRV_WriteReg32(NFI_ROWADDR_REG32, rowaddr);
	DRV_WriteReg16(NFI_ADDRNOB_REG16, u2ColNOB|(u2RowNOB << ADDR_ROW_NOB_SHIFT));
	return mt6573_nand_status_ready(STA_ADDR_STATE);
}

/******************************************************************************
 * mt6573_nand_check_RW_count
 * 
 * DESCRIPTION:
 *    Check the RW how many sectors ! 
 * 
 * PARAMETERS: 
 *   u16 u2WriteSize 
 * 
 * RETURNS: 
 *   None   
 * 
 * NOTES: 
 *   None
 *
 ******************************************************************************/
static bool mt6573_nand_check_RW_count(u16 u2WriteSize)
{
	u32 timeout = 0xFFFF;
	u16 u2SecNum = u2WriteSize >> 9;
    
	while (ADDRCNTR_CNTR(DRV_Reg16(NFI_ADDRCNTR_REG16)) < u2SecNum)
    {
		timeout--;
		if (0 == timeout)
        {
            printk("[%s] timeout\n", __FUNCTION__);
			return false;
		}
	}
	return true;
}

/******************************************************************************
 * mt6573_nand_ready_for_read
 * 
 * DESCRIPTION:
 *    Prepare hardware environment for read ! 
 * 
 * PARAMETERS: 
 *   struct nand_chip *nand, u32 u4RowAddr 
 * 
 * RETURNS: 
 *   None   
 * 
 * NOTES: 
 *   None
 *
 ******************************************************************************/
static bool mt6573_nand_ready_for_read(struct nand_chip *nand, u32 u4RowAddr, u32 u4ColAddr, bool full, u8 *buf)
{
	/* Reset NFI HW internal state machine and flush NFI in/out FIFO */	
	bool bRet = false;
	u16 sec_num = 1 << (nand->page_shift - 9);
    u32 col_addr = u4ColAddr;
	u32 colnob=2, rownob;

	
    if (nand->options & NAND_BUSWIDTH_16)
        col_addr /= 2;

	if (!mt6573_nand_reset())
    {
		goto cleanup;
	}
	if(g_bHwEcc){
    /* Enable HW ECC */
    NFI_SET_REG16(NFI_CNFG_REG16, CNFG_HW_ECC_EN);
	}else{
		NFI_CLN_REG16(NFI_CNFG_REG16, CNFG_HW_ECC_EN);
	}

	mt6573_nand_set_mode(CNFG_OP_READ);
	NFI_SET_REG16(NFI_CNFG_REG16, CNFG_READ_EN);
	DRV_WriteReg16(NFI_CON_REG16, sec_num << CON_NFI_SEC_SHIFT);

    if (full)
    {
    	if(g_bUseAHBMode){
		NFI_SET_REG16(NFI_CNFG_REG16, CNFG_AHB);
		DRV_WriteReg32(NFI_STRADDR_REG32, virt_to_phys(buf));
    	}
	else{
    		NFI_CLN_REG16(NFI_CNFG_REG16, CNFG_AHB);
	}

	if(g_bHwEcc){	
        NFI_SET_REG16(NFI_CNFG_REG16, CNFG_HW_ECC_EN);
	}else{
		NFI_CLN_REG16(NFI_CNFG_REG16, CNFG_HW_ECC_EN);
	}

    }
    else
    {
        NFI_CLN_REG16(NFI_CNFG_REG16, CNFG_HW_ECC_EN);
        NFI_CLN_REG16(NFI_CNFG_REG16, CNFG_AHB);
    }

	mt6573_nand_set_autoformat(full);
    if (full){
		if(g_bHwEcc){
			ECC_Decode_Start();
		}
    }
	if((devinfo.pagesize == 512) && (u4ColAddr == devinfo.pagesize)){ // read oob for 512 page size
		if (!mt6573_nand_set_command(NAND_CMD_READOOB))
		{
			goto cleanup;
		}
	}
	else{

		if (!mt6573_nand_set_command(NAND_CMD_READ0))
		{
			goto cleanup;
		}
	}

	if(devinfo.pagesize == 512)
		colnob = 1;
	else
		colnob = 2;

	rownob=devinfo.addr_cycle - colnob;

	//1 FIXED ME: For Any Kind of AddrCycle
	if (!mt6573_nand_set_address(col_addr, u4RowAddr, colnob, rownob))
    {
		goto cleanup;
	}
	
	if(devinfo.pagesize != 512){
		if (!mt6573_nand_set_command(NAND_CMD_READSTART))
		{
			goto cleanup;
		}
	}

	if (!mt6573_nand_status_ready(STA_NAND_BUSY))
    {
		goto cleanup;
	}

	bRet = true;
	
cleanup:
	return bRet;
}

/**********************************************************
Description : SAL_NFI_Pointer_Operation
Input       : 0
Output      : 0
***********************************************************/
static void SAL_NFI_Pointer_Operation(u16 command)
{
#if 0
   kal_uint32  reg_val = 0;

   DRV_WriteReg(NFI_CMD, ptr_cmd);
   while (DRV_Reg32(NFI_STA) & STA_CMD_STATE);
   reg_val = DRV_Reg(NFI_CON);
   reg_val |= CON_NFI_RST;
   DRV_WriteReg(NFI_CON, reg_val);
#endif
   	mb();
	
	DRV_WriteReg16(NFI_CMD_REG16, command);
	mt6573_nand_status_ready(STA_CMD_STATE);

	NFI_SET_REG16(NFI_CON_REG16, CON_NFI_RST);
	
}

/******************************************************************************
 * mt6573_nand_ready_for_write
 * 
 * DESCRIPTION:
 *    Prepare hardware environment for write ! 
 * 
 * PARAMETERS: 
 *   struct nand_chip *nand, u32 u4RowAddr 
 * 
 * RETURNS: 
 *   None   
 * 
 * NOTES: 
 *   None
 *
 ******************************************************************************/
static bool mt6573_nand_ready_for_write(
	struct nand_chip *nand, u32 u4RowAddr, u32 col_addr, bool full, u8 *buf)
{
	bool bRet = false;
	u32 sec_num = 1 << (nand->page_shift - 9);
	u32 colnob=2, rownob;
	
    if (nand->options & NAND_BUSWIDTH_16)
        col_addr /= 2;


	/* Reset NFI HW internal state machine and flush NFI in/out FIFO */	
	if (!mt6573_nand_reset())
    {
		return false;
	}



	mt6573_nand_set_mode(CNFG_OP_PRGM);
	
	NFI_CLN_REG16(NFI_CNFG_REG16, CNFG_READ_EN);
	
	DRV_WriteReg16(NFI_CON_REG16, sec_num << CON_NFI_SEC_SHIFT);

    if (full)
    {
	if(g_bUseAHBMode){
		NFI_SET_REG16(NFI_CNFG_REG16, CNFG_AHB);
		DRV_WriteReg32(NFI_STRADDR_REG32, virt_to_phys(buf));
	}
	else{
		NFI_CLN_REG16(NFI_CNFG_REG16, CNFG_AHB);
	}

	if(g_bHwEcc){
	NFI_SET_REG16(NFI_CNFG_REG16, CNFG_HW_ECC_EN);
	}else{
		NFI_CLN_REG16(NFI_CNFG_REG16, CNFG_HW_ECC_EN);
	}
	}
	else
	{
	    NFI_CLN_REG16(NFI_CNFG_REG16, CNFG_HW_ECC_EN);
	    NFI_CLN_REG16(NFI_CNFG_REG16, CNFG_AHB);
	}

	mt6573_nand_set_autoformat(full);

	if (full){
		if(g_bHwEcc){
			ECC_Encode_Start();
		}
    	}


	if(devinfo.pagesize == 512){
		if(col_addr == devinfo.pagesize){		//write oob
			SAL_NFI_Pointer_Operation(0x50);
		}
		else{
			SAL_NFI_Pointer_Operation(0);
		}
	}


	if (!mt6573_nand_set_command(NAND_CMD_SEQIN)){
		goto cleanup;
	}

	if(devinfo.pagesize == 512)
		colnob = 1;
	else
		colnob = 2;

	rownob=devinfo.addr_cycle - colnob;

	//1 FIXED ME: For Any Kind of AddrCycle
	if (!mt6573_nand_set_address(col_addr, u4RowAddr, colnob, rownob)){
		goto cleanup;
	}

	if (!mt6573_nand_status_ready(STA_NAND_BUSY)){
		goto cleanup;
	}

	bRet = true;
cleanup:

	return bRet;
}

static bool mt6573_nand_check_dececc_done(u32 u4SecNum)
{
    u32 timeout, dec_mask;
    timeout = 0xffff;
    dec_mask = (1<<u4SecNum)-1;
    while((dec_mask != (DRV_Reg(ECC_DECDONE_REG16) & 0xFF)) && timeout>0){
        timeout--;
    }
    if(timeout == 0){
        //MSG(VERIFY, "ECC_DECDONE: timeout\n");
		//dump_nfi();
	
        return false;
    }
    return true;
}

/******************************************************************************
 * mt6573_nand_read_page_data
 * 
 * DESCRIPTION:
 *   Fill the page data into buffer ! 
 * 
 * PARAMETERS: 
 *   u8* pDataBuf, u32 u4Size
 * 
 * RETURNS: 
 *   None   
 * 
 * NOTES: 
 *   None
 *
 ******************************************************************************/
static bool mt6573_nand_dma_read_data(struct mtd_info *mtd, u8 *buf, u32 length)
{
    int interrupt_en = g_i4Interrupt;
    int timeout = 0xffff;
#if 0
    struct scatterlist sg;
    enum dma_data_direction dir = DMA_FROM_DEVICE;
    
    sg_init_one(&sg, buf, length);
	dma_map_sg(&(mtd->dev), &sg, 1, dir);
#endif

	NFI_CLN_REG16(NFI_CNFG_REG16, CNFG_BYTE_RW);
	// DRV_WriteReg32(NFI_STRADDR_REG32, __virt_to_phys(pDataBuf));
 
    if ((unsigned int)buf % 16)		// TODO: can not use AHB mode here
    {
        printk(KERN_INFO "Un-16-aligned address\n");
        NFI_CLN_REG16(NFI_CNFG_REG16, CNFG_DMA_BURST_EN);
    }
    else
    {
        NFI_SET_REG16(NFI_CNFG_REG16, CNFG_DMA_BURST_EN);
    }

    DRV_Reg16(NFI_INTR_REG16);
    DRV_WriteReg16(NFI_INTR_EN_REG16, INTR_AHB_DONE_EN);

	//dump_nfi();
	//printk("NFI_STRADDR_REG32=%x\n", DRV_Reg32(NFI_STRADDR_REG32));

    if (interrupt_en) 
    {
	    init_completion(&g_comp_AHB_Done);
	}
	//dmac_inv_range(pDataBuf, pDataBuf + u4Size);
	mb();
	NFI_SET_REG16(NFI_CON_REG16, CON_NFI_BRD);
   
	if (interrupt_en) 
    {
	    if (!wait_for_completion_timeout(&g_comp_AHB_Done, 10))
        {
            MSG(READ, "wait for completion timeout happened @ [%s]: %d\n", __FUNCTION__, __LINE__);
			printk( "[%s] wait for completion timeout happened\n", __FUNCTION__);
            dump_nfi();
            return false;
        }
        while ( (length >> 9) > ((DRV_Reg16(NFI_BYTELEN_REG16) & 0xf000) >> 12) )
        {
		    timeout--;
		    if (0 == timeout)
            {
                printk(KERN_ERR "[%s] poll BYTELEN error\n", __FUNCTION__);
			    return false; //4  // AHB Mode Time Out!
			}
		}	
    } 
    else 
    {
        while (!DRV_Reg16(NFI_INTR_REG16))
        {
		    timeout--;

		    if (0 == timeout)
            {
                printk(KERN_ERR "[%s] poll nfi_intr error\n", __FUNCTION__);
                dump_nfi();
			    return false; //4  // AHB Mode Time Out!
            }
        }
        while ( (length >> 9) > ((DRV_Reg16(NFI_BYTELEN_REG16) & 0xf000) >> 12) )
        {
		    timeout--;

		    if (0 == timeout)
            {
                printk( "[%s] poll BYTELEN error\n", __FUNCTION__);
                dump_nfi();
			    return false; //4  // AHB Mode Time Out!
			}
		}
	}

#if 0
	dma_unmap_sg(&(mtd->dev), &sg, 1, dir);
#endif

	return true;
}

static bool mt6573_nand_mcu_read_data(u8 *buf, u32 length)
{
    int timeout = 0xffff;
	u32 i, sec_num, sec_idx, temp;
	u32* buf32 = (u32 *)buf;
	int oob_per_sector = 16;
#ifdef TESTTIME		
	unsigned long long time1,time2;
    time1 = sched_clock();
#endif
    if ((u32)buf % 4 || length % 4 || oob_per_sector % 4)
	    NFI_SET_REG16(NFI_CNFG_REG16, CNFG_BYTE_RW);
    else
        NFI_CLN_REG16(NFI_CNFG_REG16, CNFG_BYTE_RW);

    //DRV_WriteReg32(NFI_STRADDR_REG32, 0);
    mb();
	NFI_SET_REG16(NFI_CON_REG16, CON_NFI_BRD);

	#ifdef NAND_ECC_TEST
	oob_per_sector = g_spare_size;
	#endif
    if ((u32)buf % 4 || length % 4 || oob_per_sector % 4)
    {
    	if(g_bAutoFMT || (length < NAND_SECTOR_SIZE)){
	        for (i = 0; (i < (length))&&(timeout > 0);)
	        {
	    		//if (FIFO_RD_REMAIN(DRV_Reg16(NFI_FIFOSTA_REG16)) >= 4)
	    		if (DRV_Reg16(NFI_PIO_DIRDY_REG16) & 1)
	            {
	            	if(PIO_BIG_ENDIAN)
						*buf++ = (u8)(DRV_Reg32(NFI_DATAR_REG32)>>24);
					else
	    				*buf++ = (u8)DRV_Reg32(NFI_DATAR_REG32);
					
	    			i++;
	    		} 
	            else 
	            {
	    			timeout--;
	    		}
	    		if (0 == timeout)
	            {
	                printk(KERN_ERR "[%s] timeout\n", __FUNCTION__);
	                dump_nfi();
	    			return false;
	    		}
	    	}
    	}
		else{
			sec_num = length / NAND_SECTOR_SIZE;
			for(sec_idx = 0 ; sec_idx < sec_num ; sec_idx++)
			{
				timeout = 0xFFFF;
				for (i = 0; (i < (NAND_SECTOR_SIZE))&&(timeout > 0);)
		        {
		    		//if (FIFO_RD_REMAIN(DRV_Reg16(NFI_FIFOSTA_REG16)) >= 4)
		    		if (DRV_Reg16(NFI_PIO_DIRDY_REG16) & 1)
		            {
		    			
						if(PIO_BIG_ENDIAN)
							*buf++ = (u8)(DRV_Reg32(NFI_DATAR_REG32)>>24);
						else
							*buf++ = (u8)DRV_Reg32(NFI_DATAR_REG32);
		    			
		    			i++;
		    		} 
		            else 
		            {
		    			timeout--;
		    		}
		    		if (0 == timeout)
		            {
		                printk(KERN_ERR "[%s] timeout\n", __FUNCTION__);
		                dump_nfi();
		    			return false;
		    		}
		    	}
				for (i = 0; (i < (oob_per_sector))&&(timeout > 0);)
		        {
		    		//if (FIFO_RD_REMAIN(DRV_Reg16(NFI_FIFOSTA_REG16)) >= 4)
		    		if (DRV_Reg16(NFI_PIO_DIRDY_REG16) & 1)
		            {
		    			if(PIO_BIG_ENDIAN)
							*buf++ = (u8)(DRV_Reg32(NFI_DATAR_REG32)>>24);
						else
							*buf++ = (u8)DRV_Reg32(NFI_DATAR_REG32);
						
		    			i++;
		    		} 
		            else 
		            {
		    			timeout--;
		    		}
		    		if (0 == timeout)
		            {
		                printk(KERN_ERR "[%s] timeout\n", __FUNCTION__);
		                dump_nfi();
		    			return false;
		    		}
		    	}
    	 	}
		}
    }
    else
    {
    	if(g_bAutoFMT || (length < NAND_SECTOR_SIZE)){
	        for (i = 0; (i < (length >> 2))&&(timeout > 0);)
	        {
	    		//if (FIFO_RD_REMAIN(DRV_Reg16(NFI_FIFOSTA_REG16)) >= 4)
	    		if (DRV_Reg16(NFI_PIO_DIRDY_REG16) & 1)
	            {
	    			*buf32++ = DRV_Reg32(NFI_DATAR_REG32);
	    			i++;
	    		} 
	            else 
	            {
	    			timeout--;
	    		}
	    		if (0 == timeout)
	            {
	                printk(KERN_ERR "[%s] timeout\n", __FUNCTION__);
	                dump_nfi();
	    			return false;
	    		}
	    	}
    	}
	else{
		sec_num = length / NAND_SECTOR_SIZE;
		for(sec_idx = 0 ; sec_idx < sec_num ; sec_idx++)
		{
			timeout = 0xFFFF;
			for (i = 0; (i < (NAND_SECTOR_SIZE >> 2))&&(timeout > 0);)
		        {
		    		//if (FIFO_RD_REMAIN(DRV_Reg16(NFI_FIFOSTA_REG16)) >= 4)
		    		if (DRV_Reg16(NFI_PIO_DIRDY_REG16) & 1)
		            {
		    			*buf32++ = DRV_Reg32(NFI_DATAR_REG32);
		    			i++;
		    		} 
		            else 
		            {
		    			timeout--;
		    		}
		    		if (0 == timeout)
		            {
		                printk(KERN_ERR "[%s] timeout\n", __FUNCTION__);
		                dump_nfi();
		    			return false;
		    		}
		    	}
			for (i = 0; (i < (oob_per_sector >> 2))&&(timeout > 0);)
		        {
		    		//if (FIFO_RD_REMAIN(DRV_Reg16(NFI_FIFOSTA_REG16)) >= 4)
		    		if (DRV_Reg16(NFI_PIO_DIRDY_REG16) & 1)
		            {
		    			temp = DRV_Reg32(NFI_DATAR_REG32);
		    			i++;
		    		} 
		            else 
		            {
		    			timeout--;
		    		}
		    		if (0 == timeout)
		            {
		                printk(KERN_ERR "[%s] timeout\n", __FUNCTION__);
		                dump_nfi();
		    			return false;
		    		}
		    	}
			
    	 	}
	}
	
     }
#ifdef TESTTIME		
	time2 = sched_clock()-time1;
	if(!readdatatime)
	{
	   readdatatime=(time2);
	}
#endif
    return true;
}

static bool mt6573_nand_read_page_data(struct mtd_info *mtd, u8* pDataBuf, u32 u4Size)
{
	if(g_bUseAHBMode)
		return mt6573_nand_dma_read_data(mtd, pDataBuf, u4Size);
	else
    //return mt6573_nand_mcu_read_data(mtd, pDataBuf, u4Size);
		return mt6573_nand_mcu_read_data(pDataBuf, u4Size);

}	

/******************************************************************************
 * mt6573_nand_write_page_data
 * 
 * DESCRIPTION:
 *   Fill the page data into buffer ! 
 * 
 * PARAMETERS: 
 *   u8* pDataBuf, u32 u4Size
 * 
 * RETURNS: 
 *   None   
 * 
 * NOTES: 
 *   None
 *
 ******************************************************************************/
static bool mt6573_nand_dma_write_data(struct mtd_info *mtd, u8 *pDataBuf, u32 u4Size)
{
	int i4Interrupt = g_i4Interrupt;	//g_i4Interrupt;
	u32 timeout = 0xFFFF;
#if 0
	struct scatterlist sg;
	enum dma_data_direction dir = DMA_TO_DEVICE;
	//u16 reg_status = 0;

    sg_init_one(&sg, pDataBuf, u4Size);
	dma_map_sg(&(mtd->dev), &sg, 1, dir);
#endif

	NFI_CLN_REG16(NFI_CNFG_REG16, CNFG_BYTE_RW);
	DRV_Reg16(NFI_INTR_REG16);
	DRV_WriteReg16(NFI_INTR_EN_REG16, 0);
	// DRV_WriteReg32(NFI_STRADDR_REG32, (u32*)virt_to_phys(pDataBuf));
    
    if ((unsigned int)pDataBuf % 16)		// TODO: can not use AHB mode here
    {
        printk(KERN_INFO "Un-16-aligned address\n");
        NFI_CLN_REG16(NFI_CNFG_REG16, CNFG_DMA_BURST_EN);
    }
    else
    {
        NFI_SET_REG16(NFI_CNFG_REG16, CNFG_DMA_BURST_EN);
    }
    
	if (i4Interrupt) 
	{
		init_completion(&g_comp_AHB_Done);
		DRV_Reg16(NFI_INTR_REG16);
		DRV_WriteReg16(NFI_INTR_EN_REG16, INTR_AHB_DONE_EN);
	}
	//dmac_clean_range(pDataBuf, pDataBuf + u4Size);
	mb();
	NFI_SET_REG16(NFI_CON_REG16, CON_NFI_BWR);
	
   
	if (i4Interrupt) 
	{
		if (!wait_for_completion_timeout(&g_comp_AHB_Done, 10))
		{
		    MSG(READ, "wait for completion timeout happened @ [%s]: %d\n", __FUNCTION__, __LINE__);
			printk("wait for completion timeout happened @ [%s]: %d\n", __FUNCTION__, __LINE__);
		    dump_nfi();
		    return false;
		}
		// wait_for_completion(&g_comp_AHB_Done);
	} 
    else 
    {
        while ( (u4Size >> 9) > ((DRV_Reg16(NFI_BYTELEN_REG16) & 0xf000) >> 12) )
        {
			timeout--;
			if (0 == timeout)
            {
                printk( "[%s] poll BYTELEN error\n", __FUNCTION__);
				return false; //4  // AHB Mode Time Out!
			}
		}
	}	

#if 0	
	dma_unmap_sg(&(mtd->dev), &sg, 1, dir);
#endif

    return true;
}

static bool mt6573_nand_mcu_write_data(struct mtd_info *mtd, const u8 *buf, u32 length)
{
	u32 timeout = 0xFFFF;
	u32 i, sec_idx, sec_num;	
	u32* pBuf32, *pOOBBuf32 = NULL;
	int oob_per_sector = 16;
	u8* pOOBBuf = NULL;
	u32 data_w;
	NFI_CLN_REG16(NFI_CNFG_REG16, CNFG_BYTE_RW);
	mb();
	NFI_SET_REG16(NFI_CON_REG16, CON_NFI_BWR);
	pBuf32 = (u32*)buf;
	#ifdef NAND_ECC_TEST
	oob_per_sector = g_spare_size;
	#endif
    
    if ((u32)buf % 4 || length % 4 || oob_per_sector % 4)
	    NFI_SET_REG16(NFI_CNFG_REG16, CNFG_BYTE_RW);
    else
        NFI_CLN_REG16(NFI_CNFG_REG16, CNFG_BYTE_RW);

    if ((u32)buf % 4 || length % 4 || oob_per_sector % 4)
    {
    	if(g_bAutoFMT || (length < NAND_SECTOR_SIZE)){
	        for (i = 0; (i < (length))&&(timeout > 0);)
	        {
	            if (DRV_Reg16(NFI_PIO_DIRDY_REG16) & 1)
	            {
				    if(PIO_BIG_ENDIAN){
						data_w = (*buf) << 24;
						DRV_WriteReg32(NFI_DATAW_REG32, data_w);
						buf++;
				    }
					else{
				    	DRV_WriteReg32(NFI_DATAW_REG32, *buf++);
					}
					
	    			i++;
	    		} 
	            else 
	            {
	    			timeout--;
	    		}
	    		if (0 == timeout)
	            {
	                printk(KERN_ERR "[%s] timeout\n", __FUNCTION__);
	                dump_nfi();
	    			return false;
	    		}
	    	}
    	}
		else{
			if(g_bOOB_Test){
				pOOBBuf = local_oob_buf;
			}
			sec_num = length / NAND_SECTOR_SIZE;
			for(sec_idx = 0 ; sec_idx < sec_num ; sec_idx++)
			{
				for (i = 0; (i < (NAND_SECTOR_SIZE))&&(timeout > 0);)
		        {
		            if (DRV_Reg16(NFI_PIO_DIRDY_REG16) & 1)
		            {
		            	if(PIO_BIG_ENDIAN){
							data_w = (*buf) << 24;
							DRV_WriteReg32(NFI_DATAW_REG32, data_w);
							buf++;
					    }
						else{
					    	DRV_WriteReg32(NFI_DATAW_REG32, *buf++);
						}
		    			i++;
		    		} 
		            else 
		            {
		    			timeout--;
		    		}
		    		if (0 == timeout)
		            {
		                printk(KERN_ERR "[%s] timeout\n", __FUNCTION__);
		                dump_nfi();
		    			return false;
		    		}
		    	}
				for (i = 0; (i < (oob_per_sector))&&(timeout > 0);)
		        {
		            if (DRV_Reg16(NFI_PIO_DIRDY_REG16) & 1)
		            {
		            	if(g_bOOB_Test && pOOBBuf != NULL){
							if(PIO_BIG_ENDIAN){
								data_w = (*pOOBBuf) << 24;
								DRV_WriteReg32(NFI_DATAW_REG32, data_w);
								pOOBBuf++;
							}
							else{
								DRV_WriteReg32(NFI_DATAW_REG32, *pOOBBuf++);
							}
		            	}
						else{
					    	DRV_WriteReg32(NFI_DATAW_REG32, 0xff);
						}
		    			i++;
		    		} 
		            else 
		            {
		    			timeout--;
		    		}
		    		if (0 == timeout)
		            {
		                printk(KERN_ERR "[%s] timeout\n", __FUNCTION__);
		                dump_nfi();
		    			return false;
		    		}
		    	}
			}
			
		}
    }
    else
    {
    	if(g_bAutoFMT || (length < NAND_SECTOR_SIZE)){
		 for (i = 0; (i < (length >> 2)) && (timeout > 0); )
	        {
			    // if (FIFO_WR_REMAIN(DRV_Reg16(NFI_FIFOSTA_REG16)) <= 12)
	            if (DRV_Reg16(NFI_PIO_DIRDY_REG16) & 1)
	            {
				    DRV_WriteReg32(NFI_DATAW_REG32, *pBuf32++);
				    i++;
			    } 
	            else 
	            {
				    timeout--;
			    }
			    if (0 == timeout)
	            {
	                    printk(KERN_ERR "[%s] timeout\n", __FUNCTION__);
	                    dump_nfi();
	        			return false;
			    }
		    }
    	}
	else{
		if(g_bOOB_Test){
			pOOBBuf32 = (u32*)local_oob_buf;
		}
    		sec_num = length / NAND_SECTOR_SIZE;
		for(sec_idx = 0 ; sec_idx < sec_num ; sec_idx++)
		{
			timeout = 0xFFFF;
			for (i = 0; (i < (NAND_SECTOR_SIZE >> 2)) && (timeout > 0); )
			{
				if (DRV_Reg16(NFI_PIO_DIRDY_REG16) & 1)
				{
					    DRV_WriteReg32(NFI_DATAW_REG32, *pBuf32++);
					    i++;
				} 
				else 
				{
				    timeout--;
				}
				if (0 == timeout)
				{
		                    printk(KERN_ERR "[%s] timeout\n", __FUNCTION__);
		                    dump_nfi();
					
		        			return false;
				}
			}
			for (i = 0; (i < (oob_per_sector >> 2)) && (timeout > 0); )
			{
				if (DRV_Reg16(NFI_PIO_DIRDY_REG16) & 1)
				{
					if(g_bOOB_Test && (pOOBBuf32 != NULL)){
						DRV_WriteReg32(NFI_DATAW_REG32, *pOOBBuf32++);
					}
					else{
						DRV_WriteReg32(NFI_DATAW_REG32, 0xffffffff);					   
					}
					 i++;
				} 
				else 
				{
				    timeout--;
				}
				if (0 == timeout)
				{
		                    printk(KERN_ERR "[%s] timeout\n", __FUNCTION__);
		                    dump_nfi();
		        			return false;
				}
			}
    	 	}
	}
	
		
	        
    }

	return true;
}


static bool mt6573_nand_write_page_data(struct mtd_info *mtd, u8* buf, u32 size)
{
	if(g_bUseAHBMode)
		return mt6573_nand_dma_write_data(mtd, buf, size);
	else
		return mt6573_nand_mcu_write_data(mtd, buf, size);
}

/******************************************************************************
 * mt6573_nand_read_fdm_data
 * 
 * DESCRIPTION:
 *   Read a fdm data ! 
 * 
 * PARAMETERS: 
 *   u8* pDataBuf, u32 u4SecNum
 * 
 * RETURNS: 
 *   None   
 * 
 * NOTES: 
 *   None
 *
 ******************************************************************************/
static void mt6573_nand_read_fdm_data(u8* pDataBuf, u32 u4SecNum)
{
	u32 i;
	u32* pBuf32 = (u32*)pDataBuf;

    if (pBuf32)
    {
    	for (i = 0; i < u4SecNum; ++i)
    	{
    		*pBuf32++ = DRV_Reg32(NFI_FDM0L_REG32 + (i<<1));
    		*pBuf32++ = DRV_Reg32(NFI_FDM0M_REG32 + (i<<1));
    		//*pBuf32++ = DRV_Reg32((u32)NFI_FDM0L_REG32 + (i<<3));
    		//*pBuf32++ = DRV_Reg32((u32)NFI_FDM0M_REG32 + (i<<3));
    	}
    }
}

/******************************************************************************
 * mt6573_nand_write_fdm_data
 * 
 * DESCRIPTION:
 *   Write a fdm data ! 
 * 
 * PARAMETERS: 
 *   u8* pDataBuf, u32 u4SecNum
 * 
 * RETURNS: 
 *   None   
 * 
 * NOTES: 
 *   None
 *
 ******************************************************************************/
static u8 fdm_buf[64];
static void mt6573_nand_write_fdm_data(struct nand_chip *chip, u8* pDataBuf, u32 u4SecNum)
{
	u32 i, j;
    u8 checksum = 0;
    bool empty = true;
    struct nand_oobfree *free_entry;
    u32* pBuf32;

    memcpy(fdm_buf, pDataBuf, u4SecNum * 8);
	
//	printk("mt6573_nand_write_fdm_data enter\n");
    free_entry = chip->ecc.layout->oobfree;
    for (i = 0; i < MTD_MAX_OOBFREE_ENTRIES && free_entry[i].length; i++)
    {
        for (j = 0; j < free_entry[i].length; j++)
        {
            if (pDataBuf[free_entry[i].offset + j] != 0xFF)
                empty = false;
            checksum ^= pDataBuf[free_entry[i].offset + j];
        }
    }

    if (!empty)
    {
        fdm_buf[free_entry[i-1].offset + free_entry[i-1].length] = checksum;
    }


    	pBuf32 = (u32*)fdm_buf;
	for (i = 0; i < u4SecNum; ++i)
	{
		DRV_WriteReg32(NFI_FDM0L_REG32 + (i<<1), *pBuf32++);
		DRV_WriteReg32(NFI_FDM0M_REG32 + (i<<1), *pBuf32++);		
		//DRV_WriteReg32((u32)NFI_FDM0L_REG32 + (i<<3), *pBuf32++);
		//DRV_WriteReg32((u32)NFI_FDM0M_REG32 + (i<<3), *pBuf32++);			
	}
}

/******************************************************************************
 * mt6573_nand_stop_read
 * 
 * DESCRIPTION:
 *   Stop read operation ! 
 * 
 * PARAMETERS: 
 *   None
 * 
 * RETURNS: 
 *   None   
 * 
 * NOTES: 
 *   None
 *
 ******************************************************************************/
static void mt6573_nand_stop_read(void)
{
	NFI_CLN_REG16(NFI_CON_REG16, CON_NFI_BRD);
    mt6573_nand_reset();
	if(g_bHwEcc){
		ECC_Decode_End();
	}
    DRV_WriteReg16(NFI_INTR_EN_REG16, 0);
}

/******************************************************************************
 * mt6573_nand_stop_write
 * 
 * DESCRIPTION:
 *   Stop write operation ! 
 * 
 * PARAMETERS: 
 *   None
 * 
 * RETURNS: 
 *   None   
 * 
 * NOTES: 
 *   None
 *
 ******************************************************************************/
static void mt6573_nand_stop_write(void)
{
	NFI_CLN_REG16(NFI_CON_REG16, CON_NFI_BWR);
	if(g_bHwEcc){
		ECC_Encode_End();
	}
    DRV_WriteReg16(NFI_INTR_EN_REG16, 0);
}

/******************************************************************************
 * mt6573_nand_exec_read_page
 * 
 * DESCRIPTION:
 *   Read a page data ! 
 * 
 * PARAMETERS: 
 *   struct mtd_info *mtd, u32 u4RowAddr, u32 u4PageSize, 
 *   u8* pPageBuf, u8* pFDMBuf
 * 
 * RETURNS: 
 *   None   
 * 
 * NOTES: 
 *   None
 *
 ******************************************************************************/
int mt6573_nand_exec_read_page(
	struct mtd_info *mtd, u32 u4RowAddr, u32 u4PageSize, u8* pPageBuf, u8* pFDMBuf)
{
    u8 *buf;
	int bRet = 0;
	struct nand_chip *nand = mtd->priv;
	u32 u4SecNum = u4PageSize >> 9;
#ifdef NAND_PFM
	struct timeval pfm_time_read;
#endif
	PFM_BEGIN(pfm_time_read);

	buf = local_buffer_16_align_r;


	if (mt6573_nand_ready_for_read(nand, u4RowAddr, 0, true, buf))
	{
		if (!mt6573_nand_read_page_data(mtd, buf, u4PageSize))
		{
			printk("mt6573_nand_read_page_data return false\n");
			bRet = -1;
		}


        
		if (!mt6573_nand_status_ready(STA_NAND_BUSY))
		{
			printk("mt6573_nand_status_ready return false\n");
			bRet = -1;
		}

		//dump_buf(local_buffer_16_align, u4PageSize);
		if(g_bHwEcc){		
			if(!mt6573_nand_check_dececc_done(u4SecNum))
			{
				bRet = -1;//ECC Done error
			}
		}       
        
		mt6573_nand_read_fdm_data(pFDMBuf, u4SecNum);

		if(g_bHwEcc){
			if (!mt6573_nand_check_bch_error(mtd, buf, u4SecNum - 1, u4RowAddr))
			{
				bRet = -1; //ECC Done error
			}
		}
		mt6573_nand_stop_read();
	}
	else
		printk("mt6573 nand isn't ready for read\n");
	
    if (buf == local_buffer_16_align_r)
        memcpy(pPageBuf, buf, u4PageSize);


	PFM_END_R(pfm_time_read, u4PageSize + 32);
	return bRet;
}

/******************************************************************************
 * mt6573_nand_exec_write_page
 * 
 * DESCRIPTION:
 *   Write a page data ! 
 * 
 * PARAMETERS: 
 *   struct mtd_info *mtd, u32 u4RowAddr, u32 u4PageSize, 
 *   u8* pPageBuf, u8* pFDMBuf
 * 
 * RETURNS: 
 *   None   
 * 
 * NOTES: 
 *   None
 *
 ******************************************************************************/
int mt6573_nand_exec_write_page(
	struct mtd_info *mtd, u32 u4RowAddr, u32 u4PageSize, u8* pPageBuf, u8* pFDMBuf)
{
	struct nand_chip *chip = mtd->priv;
	u32 u4SecNum = u4PageSize >> 9;
    u8 *buf;
    u8 status;

    //MSG(WRITE, "mt6573_nand_exec_write_page, page: 0x%x\n", u4RowAddr);
#ifdef _MTK_NAND_DUMMY_DRIVER_
    if (dummy_driver_debug)
    {
	    unsigned long long time = sched_clock();
        if (!((time * 123 + 59 ) % 32768))
        {
            printk(KERN_INFO "[NAND_DUMMY_DRIVER] Simulate write error at page: 0x%x\n", u4RowAddr);
            return -EIO;
        }
    }
#endif
    
#ifdef NAND_PFM
	struct timeval pfm_time_write;
#endif
	PFM_BEGIN(pfm_time_write);		

	memcpy(local_buffer_16_align_w, pPageBuf, mtd->writesize);
	buf = local_buffer_16_align_w;


    if (mt6573_nand_ready_for_write(chip, u4RowAddr, 0, true, buf))
	{

		mt6573_nand_write_fdm_data(chip, pFDMBuf, u4SecNum);

			
		(void)mt6573_nand_write_page_data(mtd, buf, u4PageSize);
		(void)mt6573_nand_check_RW_count(u4PageSize);
		mt6573_nand_stop_write();
        (void)mt6573_nand_set_command(NAND_CMD_PAGEPROG);
		while(DRV_Reg32(NFI_STA_REG32) & STA_NAND_BUSY);

		
	}
	else
		printk("mt6573 nand isn't ready for write\n");
	
	PFM_END_W(pfm_time_write, u4PageSize + 32);

    status = chip->waitfunc(mtd, chip);
  
    if (status & NAND_STATUS_FAIL){ 
        return -EIO;
    }
    else
        return 0;
}

#ifdef BLANK_PAGE_FIXUP
static int mt6573_nand_read_oob_raw(struct mtd_info *mtd, uint8_t * buf, int page_addr, int len);
static int mt6573_nand_erase(struct mtd_info *mtd, int page);
static int check_ecc_0(struct mtd_info *mtd, int page)
{
	struct nand_chip *chip = mtd->priv;
	u8 local_oob[NAND_MAX_OOBSIZE];

	// for 4 bits ecc protection, the all 0xff is 1b 98 20 26 ff fc 6e 87
	if (chip->ecc.layout->eccbytes == 32)
	{
		if (mt6573_nand_read_oob_raw(mtd, local_oob, page, mtd->oobsize) == 0)
		{
			int i;
#if 0
			printk("check_ecc_0 %x\n", page);
			for (i = 0; i < 64; i++)
			{
				printk("%02X ", local_oob[i]);
				if (((i+1) & 0x1f) == 0x0)
					printk("\n");
			}
#endif
			for (i = 0; i < 64; i++)
			{
				switch (i & 0xf)
				{
				case 8:
					if (local_oob[i] != 0x1b)
						return 0;
					else
						break;
				case 9:
					if (local_oob[i] != 0x98)
						return 0;
					else
						break;
				case 10:
					if (local_oob[i] != 0x20)
						return 0;
					else
						break;
				case 11:
					if (local_oob[i] != 0x26)
						return 0;
					else
						break;
				case 12:
					if (local_oob[i] != 0xff)
						return 0;
					else
						break;
				case 13:
					if (local_oob[i] != 0xfc)
						return 0;
					else
						break;
				case 14:
					if (local_oob[i] != 0x6e)
						return 0;
					else
						break;
				case 15:
					if (local_oob[i] != 0x87)
						return 0;
					else
						break;
				default:
					break;
				}
			}
		}
	}
	else
	{
		printk("Not support FIX_ECC_0 now\n");
		return 0;
	}
	//printk("clean page with ECC at %x\n", page);
	return 1;
}

static void fix_ecc_0(struct mtd_info *mtd, int page)
{
	struct nand_chip *chip = mtd->priv;
	u8 *block_buf = NULL;
	u8 *data_buf = NULL;
	u8 *oob_buf = NULL;
	int i = 0, j = 0, data_is_empty = 1, oob_is_empty = 1, status = 0;
	int page_per_block_shift = chip->phys_erase_shift - chip->page_shift;
	int page_per_block = 1 << page_per_block_shift;
	int start_page = (page >> page_per_block_shift) << page_per_block_shift;

	//printk("fix ecc 0 in page %x\n", page);
	block_buf = (unsigned char *) kmalloc(((mtd->writesize + mtd->oobsize) * page_per_block), GFP_KERNEL);
	if(!block_buf)
	{
		printk("%s:can not allocate buffer\n", __func__);
		return;
	}
	memset(block_buf, 0xff, ((mtd->writesize + mtd->oobsize) * page_per_block));

	// read all pages in the block
	for(i = 0; i < page_per_block; i++)
	{
		data_buf = (block_buf + (i * (mtd->writesize + mtd->oobsize)));
		oob_buf = (block_buf + (i * (mtd->writesize + mtd->oobsize)) + mtd->writesize);
		status = mt6573_nand_exec_read_page(mtd, (start_page + i), mtd->writesize, data_buf, oob_buf);
		if (0 != status)
		{
			printk("%s: fix_ecc_0 0x%x read data error\n", __func__, (start_page + i));
			kfree(block_buf);
			return;
		}
	}

	data_buf = (block_buf + ((page - start_page) * (mtd->writesize + mtd->oobsize)));
	for (i = 0; i < mtd->writesize; i++)
	{
		if (data_buf[i] != 0xFF)
		{
			data_is_empty = 0;
			break;
		}
	}

	if (!data_is_empty)
	{
		printk("%s: fix_ecc_0 0x%x isn't real blank page\n", __func__, page);
		kfree(block_buf);
		return;
	}

	// erase the block
	status = mt6573_nand_erase(mtd, start_page);
	if (0 != status)
	{
		printk("%s: fix_ecc_0 0x%x erase error\n", __func__, start_page);
		kfree(block_buf);
		return;
	}

	// program, skip all 0xff pages
	for(i = 0; i < page_per_block; i++)
	{
		data_is_empty = 1;
		data_buf = (block_buf + (i * (mtd->writesize + mtd->oobsize)));
		oob_buf = (block_buf + (i * (mtd->writesize + mtd->oobsize)) + mtd->writesize);
		for (j = 0; j < mtd->writesize; j++)
		{
			if (data_buf[j] != 0xFF)
			{
				data_is_empty = 0;
				break;
			}
		}

		if (0 != data_is_empty)
		{
			oob_is_empty = 1;
			for (j = 0; j < mtd->oobsize; j++)
			{
				if (oob_buf[j] != 0xFF)
				{
					oob_is_empty = 0;
					break;
				}
			}
		}

		if (!data_is_empty || !oob_is_empty)
		{
			// write page
			status = mt6573_nand_exec_write_page(mtd, (start_page + i), mtd->writesize, data_buf, oob_buf);
			if (0 != status)
			{
				printk("%s: fix_ecc_0 0x%x write error \n", __func__, (start_page + i));
				kfree(block_buf);
				return;
			}
#if 0
			{
				printk("fixed page %x\n", start_page + i);
				printk("data_buf %x\n", mtd->writesize);
				for (j = 0; j < mtd->writesize; j++)
				{
					printk("%02X ", data_buf[j]);
					if (((j+1) & 0x1f) == 0x0)
						printk("\n");
				}

				printk("oob_buf %x\n", mtd->oobsize);
				for (j = 0; j < mtd->oobsize; j++)
				{
					printk("%02X ", oob_buf[j]);
					if (((j+1) & 0x1f) == 0x0)
						printk("\n");
				}
			}
#endif
		}
	}

	kfree(block_buf);
	return;
}
#endif

/******************************************************************************
 *
 * Write a page to a logical address
 *
 *****************************************************************************/
static int mt6573_nand_write_page(struct mtd_info *mtd, struct nand_chip *chip, 
        const u8 *buf, int page, int cached, int raw)
{
    int page_per_block = 1 << (chip->phys_erase_shift - chip->page_shift);
    int block = page / page_per_block;
    u16 page_in_block = page % page_per_block;
	u16 phy_block_bbt;
    int mapped_block = get_mapping_block_index(block, &phy_block_bbt);

	//printk("mt6573_nand_write_page enter: page addr 0x%x\n", page_in_block + mapped_block * page_per_block);
	#ifdef TCSUPPORT_NAND_BMT
    // write bad index into oob
    #if 0
    if (mapped_block != block)
    {
        set_bad_index_to_oob(chip->oob_poi, block);
    }
    else 
    {
        set_bad_index_to_oob(chip->oob_poi, FAKE_INDEX);
    }
	#endif
	if(block_is_in_bmt_region(mapped_block))
	{
		memcpy(chip->oob_poi + OOB_INDEX_OFFSET, &phy_block_bbt, OOB_INDEX_SIZE);
	}
	#endif

#ifdef BLANK_PAGE_FIXUP
	if (check_ecc_0(mtd, (page_in_block + (mapped_block * page_per_block))))
	{
		fix_ecc_0(mtd, (page_in_block + (mapped_block * page_per_block)));
	}
#endif

    if (mt6573_nand_exec_write_page(mtd, page_in_block + mapped_block * page_per_block, mtd->writesize, (u8 *)buf, chip->oob_poi))
    {
        MSG(INIT, "write fail at block: 0x%x, page: 0x%x\n", mapped_block, page_in_block);
        if (update_bmt((page_in_block + mapped_block * page_per_block) << chip->page_shift, 
                    UPDATE_WRITE_FAIL, (u8 *)buf, chip->oob_poi))
        {
            MSG(INIT, "Update BMT success\n");
            return 0;
        }
        else
        {
            MSG(INIT, "Update BMT fail\n");
            return -EIO;
        }
    }

    return 0;
}


//-------------------------------------------------------------------------------
/*
static void mt6573_nand_command_sp(
	struct mtd_info *mtd, unsigned int command, int column, int page_addr)
{
	g_u4ColAddr	= column;	
	g_u4RowAddr	= page_addr;

	switch(command)
	{
	case NAND_CMD_STATUS:
		break;
			
	case NAND_CMD_READID:
		break;

	case NAND_CMD_RESET:
		break;
			
	case NAND_CMD_RNDOUT:
	case NAND_CMD_RNDOUTSTART:
	case NAND_CMD_RNDIN:
	case NAND_CMD_CACHEDPROG:
	case NAND_CMD_STATUS_MULTI:
	default:
		break;
	}

}
*/
#ifdef TCSUPPORT_NAND_BMT
static int mt6573_nand_erase_mapping_page(struct mtd_info *mtd, int page)
{
    // get mapping 
    struct nand_chip *chip = mtd->priv;
    int page_per_block = 1 << (chip->phys_erase_shift - chip->page_shift);
    int page_in_block = page % page_per_block;
    int block = page / page_per_block;
	u16 phy_block_bbt;
 
    int mapped_block = get_mapping_block_index(block, &phy_block_bbt);

	return (page_in_block + page_per_block * mapped_block); 
}


static int mt6573_nand_erase_status(struct mtd_info *mtd, int page)
{
	struct nand_chip *chip = mtd->priv;

    if (update_bmt( page << chip->page_shift, 
                UPDATE_ERASE_FAIL, NULL, NULL))
    {
        MSG(INIT, "Erase fail at block page addr: 0x%x, update BMT success\n", page);
        return 0;
    }
    else
    {
        MSG(INIT, "Erase fail at block page addr: 0x%x, update BMT fail\n", page);
        return NAND_STATUS_FAIL;
    }
    

    return 0;
}
#endif

/******************************************************************************
 * mt6573_nand_command_bp
 * 
 * DESCRIPTION:
 *   Handle the commands from MTD ! 
 * 
 * PARAMETERS: 
 *   struct mtd_info *mtd, unsigned int command, int column, int page_addr
 * 
 * RETURNS: 
 *   None   
 * 
 * NOTES: 
 *   None
 *
 ******************************************************************************/
static void mt6573_nand_command_bp(struct mtd_info *mtd, unsigned int command,
			 int column, int page_addr)
{
	struct nand_chip* nand = mtd->priv;
#ifdef NAND_PFM
	struct timeval pfm_time_erase;
#endif
	int       timeout;
	int	page_address = page_addr;


	//printk("mt6573_nand_command_bp:0x%x, 0x%x, 0x%x\n", command, column, page_addr);
    switch (command) 
    {
        case NAND_CMD_SEQIN:
		    /* Reset g_kCMD */
		//if (g_kCMD.u4RowAddr != page_addr) {
			memset(g_kCMD.au1OOB, 0xFF, sizeof(g_kCMD.au1OOB));
			g_kCMD.pDataBuf = NULL;
        //}
		    g_kCMD.u4RowAddr = page_addr;
		    g_kCMD.u4ColAddr = column;
            break;

        case NAND_CMD_PAGEPROG:
           	if (g_kCMD.pDataBuf || (0xFF != g_kCMD.au1OOB[0])) 
    		{
           		u8* pDataBuf = g_kCMD.pDataBuf ? g_kCMD.pDataBuf : nand->buffers->databuf;
    			mt6573_nand_exec_write_page(mtd, g_kCMD.u4RowAddr, mtd->writesize, pDataBuf, g_kCMD.au1OOB);
    			g_kCMD.u4RowAddr = (u32)-1;
    			g_kCMD.u4OOBRowAddr = (u32)-1;
            }
            break;

        case NAND_CMD_READOOB:
    		g_kCMD.u4RowAddr = page_addr;        	
    		g_kCMD.u4ColAddr = column + mtd->writesize;
    		#ifdef NAND_PFM
    		g_kCMD.pureReadOOB = 1;
    		g_kCMD.pureReadOOBNum += 1;
    		#endif
			break;
			
        case NAND_CMD_READ0:
    		g_kCMD.u4RowAddr = page_addr;        	
    		g_kCMD.u4ColAddr = column;
    		#ifdef NAND_PFM
    		g_kCMD.pureReadOOB = 0;
    		#endif		
			break;

        case NAND_CMD_ERASE1:
    		PFM_BEGIN(pfm_time_erase);
			#ifdef TCSUPPORT_NAND_BMT
			page_address = mt6573_nand_erase_mapping_page(mtd, page_addr);
			#endif
    		(void)mt6573_nand_reset();
            mt6573_nand_set_mode(CNFG_OP_ERASE);
    		(void)mt6573_nand_set_command(NAND_CMD_ERASE1);

			if(devinfo.pagesize == 512){
				(void)mt6573_nand_set_address(0,page_address,0,devinfo.addr_cycle-1);
			}
			else{
				(void)mt6573_nand_set_address(0,page_address,0,devinfo.addr_cycle-2);
			}
			#ifdef TCSUPPORT_NAND_BMT
			g_kCMD.u4RowAddr = page_address;			
			#endif
            break;
            
        case NAND_CMD_ERASE2:
       	    (void)mt6573_nand_set_command(NAND_CMD_ERASE2);
			while(DRV_Reg32(NFI_STA_REG32) & STA_NAND_BUSY);
		    PFM_END_E(pfm_time_erase);
			#ifdef TCSUPPORT_NAND_BMT
			g_bReadEraseStatus = true;
			#endif
            break;
            
        case NAND_CMD_STATUS:
            (void)mt6573_nand_reset(); 
            NFI_CLN_REG16(NFI_CNFG_REG16, CNFG_BYTE_RW);		           	
			mt6573_nand_set_mode(CNFG_OP_SRD);
            mt6573_nand_set_mode(CNFG_READ_EN);
            NFI_CLN_REG16(NFI_CNFG_REG16, CNFG_AHB);
            NFI_CLN_REG16(NFI_CNFG_REG16, CNFG_HW_ECC_EN);
		    (void)mt6573_nand_set_command(NAND_CMD_STATUS);
        	NFI_CLN_REG16(NFI_CON_REG16, CON_NFI_NOB_MASK);
        	mb();
			DRV_WriteReg16(NFI_CON_REG16, CON_NFI_SRD|(1 << CON_NFI_NOB_SHIFT));
            g_bcmdstatus = true;            
            break;
            
        case NAND_CMD_RESET:
       	    (void)mt6573_nand_reset();
			//mt6573_nand_exec_reset_device();
            break;

		case NAND_CMD_READID: 
            mt6573_nand_reset();
            /* Disable HW ECC */
            NFI_CLN_REG16(NFI_CNFG_REG16, CNFG_HW_ECC_EN);
            NFI_CLN_REG16(NFI_CNFG_REG16, CNFG_AHB);

			#if 1
			/* Reset NFI state machine */
			mt6573_nand_reset();

			/* Issue NAND chip reset command for Micron's MCP */
			NFI_ISSUE_COMMAND(NAND_CMD_RESET, 0, 0, 0, 0);

			timeout = TIMEOUT_4;

			while(timeout)
		        timeout--;
			#endif

    
            /* Disable 16-bit I/O */
            //NFI_CLN_REG16(NFI_PAGEFMT_REG16, PAGEFMT_DBYTE_EN);
		
			NFI_SET_REG16(NFI_CNFG_REG16, CNFG_READ_EN|CNFG_BYTE_RW);
		    (void)mt6573_nand_reset();
			mt6573_nand_set_mode(CNFG_OP_SRD);
		    (void)mt6573_nand_set_command(NAND_CMD_READID);
		    (void)mt6573_nand_set_address(0,0,1,0);
		    mb();
			DRV_WriteReg16(NFI_CON_REG16, CON_NFI_SRD);
			while(DRV_Reg32(NFI_STA_REG32) & STA_DATAR_STATE);
			break;
            
        default:
            BUG();        
            break;
    }
 }

/******************************************************************************
 * mt6573_nand_select_chip
 * 
 * DESCRIPTION:
 *   Select a chip ! 
 * 
 * PARAMETERS: 
 *   struct mtd_info *mtd, int chip
 * 
 * RETURNS: 
 *   None   
 * 
 * NOTES: 
 *   None
 *
 ******************************************************************************/
static void mt6573_nand_select_chip(struct mtd_info *mtd, int chip)
{

	if (chip == -1 && false == g_bInitDone)
	{
		struct nand_chip *nand = mtd->priv;
		/* Setup PageFormat */
		if (4096 == mtd->writesize) {
	       		NFI_SET_REG16(NFI_PAGEFMT_REG16, (PAGEFMT_SPARE_16 << PAGEFMT_SPARE_SHIFT) | PAGEFMT_4K);
	            nand->cmdfunc = mt6573_nand_command_bp;		
		} else if (2048 == mtd->writesize) {
	       		NFI_SET_REG16(NFI_PAGEFMT_REG16, (PAGEFMT_SPARE_16 << PAGEFMT_SPARE_SHIFT) | PAGEFMT_2K);
	            nand->cmdfunc = mt6573_nand_command_bp;
	    } else if (512 == mtd->writesize) {
	       		NFI_SET_REG16(NFI_PAGEFMT_REG16, (PAGEFMT_SPARE_16 << PAGEFMT_SPARE_SHIFT) | PAGEFMT_512);
		       	//nand->cmdfunc = mt6573_nand_command_sp;
		       	nand->cmdfunc = mt6573_nand_command_bp;
	    }
		g_bInitDone = true;
	}
    switch(chip)
    {
	case -1:
		break;
	case 0: 
	case 1:
		DRV_WriteReg16(NFI_CSEL_REG16, chip);
		break;
    }
}

/******************************************************************************
 * mt6573_nand_read_byte
 * 
 * DESCRIPTION:
 *   Read a byte of data ! 
 * 
 * PARAMETERS: 
 *   struct mtd_info *mtd
 * 
 * RETURNS: 
 *   None   
 * 
 * NOTES: 
 *   None
 *
 ******************************************************************************/
static uint8_t mt6573_nand_read_byte(struct mtd_info *mtd)
{
#if 0
	//while(0 == FIFO_RD_REMAIN(DRV_Reg16(NFI_FIFOSTA_REG16)));
	/* Check the PIO bit is ready or not */
    u32 timeout = TIMEOUT_4;
    uint8_t retval = 0;
    WAIT_NFI_PIO_READY(timeout);   

    retval = DRV_Reg8(NFI_DATAR_REG32);
    MSG(INIT, "mt6573_nand_read_byte (0x%x)\n", retval);
    
    if(g_bcmdstatus)
    {
        NFI_SET_REG16(NFI_CNFG_REG16, CNFG_AHB);
        NFI_SET_REG16(NFI_CNFG_REG16, CNFG_HW_ECC_EN);
        g_bcmdstatus = false;
    }
    
    return retval;
#endif
    uint8_t retval = 0;
	int value = 0;
    
    if (!mt6573_nand_pio_ready())
    {
        printk("pio ready timeout\n");
        retval = false;
    }

    if(g_bcmdstatus)
    {
     	if(PIO_BIG_ENDIAN){
	        value = DRV_Reg8(NFI_DATAR_REG32);
			retval = (uint8_t)(value >> 24);
		}
		else{
			retval = DRV_Reg8(NFI_DATAR_REG32);
		}
        NFI_CLN_REG16(NFI_CON_REG16, CON_NFI_NOB_MASK); 
        mt6573_nand_reset();
	if(g_bUseAHBMode){        
		NFI_SET_REG16(NFI_CNFG_REG16, CNFG_AHB);
	}

	if(g_bHwEcc){
		NFI_SET_REG16(NFI_CNFG_REG16, CNFG_HW_ECC_EN);
	}else{
		NFI_CLN_REG16(NFI_CNFG_REG16, CNFG_HW_ECC_EN);
	}
        g_bcmdstatus = false;
    }
    else{
		//printk("retval=%x\n",DRV_Reg8(NFI_DATAR_REG32));
        if(PIO_BIG_ENDIAN){
	        value = DRV_Reg8(NFI_DATAR_REG32);
			retval = (uint8_t)(value >> 24);
		}
		else{
			retval = DRV_Reg8(NFI_DATAR_REG32);
		}
    }
	
//printk("retval=%x\n",retval);
	#ifdef TCSUPPORT_NAND_BMT
	if(g_bReadEraseStatus){
		//printk("mt6573_nand_read_byte:%x\n", g_kCMD.u4RowAddr);
		if (retval & NAND_STATUS_FAIL){ 
			mt6573_nand_erase_status(mtd, g_kCMD.u4RowAddr);
		}
		g_bReadEraseStatus = false;
	}
	#endif
    return retval;
}

/******************************************************************************
 * mt6573_nand_read_buf
 * 
 * DESCRIPTION:
 *   Read NAND data ! 
 * 
 * PARAMETERS: 
 *   struct mtd_info *mtd, uint8_t *buf, int len
 * 
 * RETURNS: 
 *   None   
 * 
 * NOTES: 
 *   None
 *
 ******************************************************************************/
static void mt6573_nand_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
{
	struct nand_chip* nand = (struct nand_chip*)mtd->priv;
	struct mt6573_CMD* pkCMD = &g_kCMD;
	u32 u4ColAddr = pkCMD->u4ColAddr;
	u32 u4PageSize = mtd->writesize;
	
		
	if (u4ColAddr < u4PageSize) 
	{
		if ((u4ColAddr == 0) && (len >= u4PageSize)) 
		{
			mt6573_nand_exec_read_page(mtd, pkCMD->u4RowAddr, u4PageSize, 
									   buf, pkCMD->au1OOB);
			if (len > u4PageSize) 
			{
				u32 u4Size = min(len - u4PageSize, sizeof(pkCMD->au1OOB));
				memcpy(buf + u4PageSize, pkCMD->au1OOB, u4Size);
			}
		} 
		else 
		{
			mt6573_nand_exec_read_page(mtd, pkCMD->u4RowAddr, u4PageSize, 
									   nand->buffers->databuf, pkCMD->au1OOB);
			memcpy(buf, nand->buffers->databuf + u4ColAddr, len);
		}
		pkCMD->u4OOBRowAddr = pkCMD->u4RowAddr;
	} 
	else 
	{
		u32 u4Offset = u4ColAddr - u4PageSize;
		u32 u4Size = min(len - u4Offset, sizeof(pkCMD->au1OOB));
		if (pkCMD->u4OOBRowAddr != pkCMD->u4RowAddr) 
		{
			mt6573_nand_exec_read_page(mtd, pkCMD->u4RowAddr, u4PageSize,
									   nand->buffers->databuf, pkCMD->au1OOB);
			pkCMD->u4OOBRowAddr = pkCMD->u4RowAddr;
		}
		memcpy(buf, pkCMD->au1OOB + u4Offset, u4Size);
	}
	//dump_buf(buf, len);
	pkCMD->u4ColAddr += len;	
}

/******************************************************************************
 * mt6573_nand_write_buf
 * 
 * DESCRIPTION:
 *   Write NAND data !  
 * 
 * PARAMETERS: 
 *   struct mtd_info *mtd, const uint8_t *buf, int len
 * 
 * RETURNS: 
 *   None   
 * 
 * NOTES: 
 *   None
 *
 ******************************************************************************/
static void mt6573_nand_write_buf(struct mtd_info *mtd, const uint8_t *buf, int len)
{
	struct mt6573_CMD* pkCMD = &g_kCMD;
	u32 u4ColAddr = pkCMD->u4ColAddr;
	u32 u4PageSize = mtd->writesize;
    int i4Size, i;

//printk("mt6573_nand_write_buf enter\n");

	if (u4ColAddr >= u4PageSize) 
    {
	    u32 u4Offset = u4ColAddr - u4PageSize;
		u8* pOOB = pkCMD->au1OOB + u4Offset;
		i4Size = min(len, (int)(sizeof(pkCMD->au1OOB) - u4Offset));
        
		for (i = 0; i < i4Size; i++) 
        {
			pOOB[i] &= buf[i];
		}
	} 
    else 
    {
		pkCMD->pDataBuf = (u8*)buf;
    }
    
	pkCMD->u4ColAddr += len;	
}	

/******************************************************************************
 * mt6573_nand_write_page_hwecc
 * 
 * DESCRIPTION:
 *   Write NAND data with hardware ecc ! 
 * 
 * PARAMETERS: 
 *   struct mtd_info *mtd, struct nand_chip *chip, const uint8_t *buf
 * 
 * RETURNS: 
 *   None   
 * 
 * NOTES: 
 *   None
 *
 ******************************************************************************/
static void mt6573_nand_write_page_hwecc(struct mtd_info *mtd, struct nand_chip *chip, const uint8_t *buf)
{
//printk("mt6573_nand_write_page_hwecc enter\n");
	mt6573_nand_write_buf(mtd, buf, mtd->writesize);
	mt6573_nand_write_buf(mtd, chip->oob_poi, mtd->oobsize);
}

/******************************************************************************
 * mt6573_nand_read_page_hwecc
 * 
 * DESCRIPTION:
 *   Read NAND data with hardware ecc ! 
 * 
 * PARAMETERS: 
 *   struct mtd_info *mtd, struct nand_chip *chip, uint8_t *buf
 * 
 * RETURNS: 
 *   None   
 * 
 * NOTES: 
 *   None
 *
 ******************************************************************************/
static int mt6573_nand_read_page_hwecc(struct mtd_info *mtd, struct nand_chip *chip, uint8_t *buf, int page)
{
#if 0
	mt6573_nand_read_buf(mtd, buf, mtd->writesize);
	mt6573_nand_read_buf(mtd, chip->oob_poi, mtd->oobsize);
#else
	struct mt6573_CMD* pkCMD = &g_kCMD;
	u32 u4ColAddr = pkCMD->u4ColAddr;
	u32 u4PageSize = mtd->writesize;
	#ifdef TCSUPPORT_NAND_BMT
	u32 u4RowAddr = pkCMD->u4RowAddr;
	int page_per_block = 1 << (chip->phys_erase_shift - chip->page_shift);
	int block = u4RowAddr / page_per_block;
	u16 page_in_block = u4RowAddr % page_per_block;
	u16 phy_block_bbt;
	int mapped_block = get_mapping_block_index(block, &phy_block_bbt);

	//printk("mt6573_nand_read_page_hwecc:page=%x,u4ColAddr=%x,block=%x,mapped_block=%x\n", u4RowAddr, u4ColAddr,block, mapped_block);
	//if(mapped_block != block)
	//	printk("detected bad block:%d,mapped_block=%d\n",block, mapped_block);
	
	if (u4ColAddr == 0) 
    {
        mt6573_nand_exec_read_page(mtd, page_in_block + mapped_block * page_per_block, u4PageSize, buf, chip->oob_poi);
        pkCMD->u4ColAddr += u4PageSize + mtd->oobsize;
	}
	#else
		
	if (u4ColAddr == 0) 
    {
        mt6573_nand_exec_read_page(mtd, pkCMD->u4RowAddr, u4PageSize, buf, chip->oob_poi);
        pkCMD->u4ColAddr += u4PageSize + mtd->oobsize;
	}
	#endif
#endif
	return 0;
}
#if 0
/******************************************************************************
 *
 * Read a page to a logical address
 *
 *****************************************************************************/
static int mt6573_nand_read_page(struct mtd_info *mtd, struct nand_chip *chip, u8 *buf, int page)
{
    int page_per_block = 1 << (chip->phys_erase_shift - chip->page_shift);
    int block = page / page_per_block;
    u16 page_in_block = page % page_per_block;
    int mapped_block = get_mapping_block_index(block);

    if (mt6573_nand_exec_read_page(mtd, page_in_block + mapped_block * page_per_block,
                mtd->writesize, buf, chip->oob_poi))
        return 0;
  /*  else
        return -EIO;*/
    return 0;
}
#endif
/******************************************************************************
 *
 * Erase a block at a logical address
 *
 *****************************************************************************/
int mt6573_nand_erase_hw(struct mtd_info *mtd, int page)
{
    struct nand_chip *chip = (struct nand_chip *)mtd->priv;
    
#ifdef _MTK_NAND_DUMMY_DRIVER_
    if (dummy_driver_debug)
    {
	    unsigned long long time = sched_clock();
        if (!((time * 123 + 59 ) % 1024))
        {
            printk(KERN_INFO "[NAND_DUMMY_DRIVER] Simulate erase error at page: 0x%x\n", page);
            return NAND_STATUS_FAIL;
        }
    }
#endif

    chip->erase_cmd(mtd, page);

    return chip->waitfunc(mtd, chip);
}

static int mt6573_nand_erase(struct mtd_info *mtd, int page)
{
    // get mapping 
    struct nand_chip *chip = mtd->priv;
    int page_per_block = 1 << (chip->phys_erase_shift - chip->page_shift);
    int page_in_block = page % page_per_block;
    int block = page / page_per_block;
	u16 phy_block_bbt;
 
    int mapped_block = get_mapping_block_index(block, &phy_block_bbt);

    int status = mt6573_nand_erase_hw(mtd, page_in_block + page_per_block * mapped_block);

    if (status & NAND_STATUS_FAIL)
    {
        if (update_bmt( (page_in_block + mapped_block * page_per_block) << chip->page_shift, 
                    UPDATE_ERASE_FAIL, NULL, NULL))
        {
            MSG(INIT, "Erase fail at block: 0x%x, update BMT success\n", mapped_block);
            return 0;
        }
        else
        {
            MSG(INIT, "Erase fail at block: 0x%x, update BMT fail\n", mapped_block);
            return NAND_STATUS_FAIL;
        }
    }

    return 0;
}



/******************************************************************************
 * mt6573_nand_read_multi_page_cache
 *
 * description:
 *   read multi page data using cache read
 *
 * parameters:
 *   struct mtd_info *mtd, struct nand_chip *chip, int page, struct mtd_oob_ops *ops
 *
 * returns:
 *   none
 *
 * notes:
 *   only available for nand flash support cache read.
 *   read main data only.
 *
 *****************************************************************************/
#if 0
static int mt6573_nand_read_multi_page_cache(struct mtd_info *mtd, struct nand_chip *chip,
        int page, struct mtd_oob_ops *ops)
{
    int res = -EIO;
    int len = ops->len;
    struct mtd_ecc_stats stat = mtd->ecc_stats;
    uint8_t *buf = ops->datbuf;

    if (!mt6573_nand_ready_for_read(chip, page, 0, true, buf))
        return -EIO;

    while (len > 0)
    {
        mt6573_nand_set_mode(CNFG_OP_CUST);
        DRV_WriteReg16(NFI_CON_REG16, 8 << CON_NFI_SEC_SHIFT);

        if (len > mtd->writesize)               // remained more than one page
        {
            if (!mt6573_nand_set_command(0x31))      // todo: add cache read command
                goto ret;
        }
        else
        {
            if (!mt6573_nand_set_command(0x3f))      // last page remained
                goto ret;
        }

        mt6573_nand_status_ready(STA_NAND_BUSY);

#ifdef USE_AHB_MODE
        //if (!mt6573_nand_dma_read_data(buf, mtd->writesize))
        if (!mt6573_nand_read_page_data(mtd, buf, mtd->writesize))
            goto ret;
#else
        if (!mt6573_nand_mcu_read_data(buf, mtd->writesize))
            goto ret;
#endif

        // get ecc error info
        mt6573_nand_check_bch_error(mtd, buf, 3, page);
        ECC_Decode_End();

        page++;
        len -= mtd->writesize;
        buf += mtd->writesize;
        ops->retlen += mtd->writesize;

        if (len > 0)
        {
            ECC_Decode_Start();
            mt6573_nand_reset();
        }

    }

    res = 0;

ret:
    mt6573_nand_stop_read();

    if (res)
        return res;

    if (mtd->ecc_stats.failed > stat.failed)
    {
        printk(KERN_INFO "ecc fail happened\n");
        return -EBADMSG;
    }

	return  mtd->ecc_stats.corrected - stat.corrected ? -EUCLEAN: 0;
}
#endif

/******************************************************************************
 * mt6573_nand_read_oob_raw
 *
 * DESCRIPTION:
 *   Read oob data
 *
 * PARAMETERS:
 *   struct mtd_info *mtd, const uint8_t *buf, int addr, int len 
 *
 * RETURNS:
 *   None
 *
 * NOTES:
 *   this function read raw oob data out of flash, so need to re-organise 
 *   data format before using.
 *   len should be times of 8, call this after nand_get_device.
 *   Should notice, this function read data without ECC protection.
 *
 *****************************************************************************/
static int mt6573_nand_read_oob_raw(struct mtd_info *mtd, uint8_t *buf, int page_addr, int len)
{
    struct nand_chip *chip = (struct nand_chip *)mtd->priv;
    u32 col_addr = 0;
    u32 sector = 0;
    int res = 0;
    u32 colnob=2, rawnob;
	int randomread =0;
    int read_len = 0;

    if (len > 128 || len % OOB_AVAI_PER_SECTOR || !buf)
    {
        printk(KERN_WARNING "[%s] invalid parameter, len: %d, buf: %p\n",
                __FUNCTION__, len, buf);
        return -EINVAL;
    }
    if(len>16)
    {
        randomread=1;
    }
	if(!randomread||!(devinfo.advancedmode & RAMDOM_READ))
	{
		//Always read from here
	    while (len > 0)
	    {
	        read_len = min(len, OOB_PER_SECTOR);
	        col_addr = NAND_SECTOR_SIZE + sector * (NAND_SECTOR_SIZE + OOB_PER_SECTOR); // TODO: Fix this hard-code 16
		
			if (!mt6573_nand_ready_for_read(chip, page_addr, col_addr, false, NULL))
	        {
	            printk("mt6573_nand_ready_for_read return failed\n");
	            res = -EIO;
	            goto error;
	        }
	        if (!mt6573_nand_mcu_read_data(buf + OOB_PER_SECTOR * sector, read_len))    // TODO: and this 8
	        {
	            printk("mt6573_nand_mcu_read_data return failed\n");
	            res = -EIO;
	            goto error;
	        }
	        mt6573_nand_stop_read();
			//dump_data(buf + 16 * sector,16);
	        sector++;
	        len -= read_len;
			
	    }
	}
    else  //should be 64
	{
	    col_addr = NAND_SECTOR_SIZE;
	    if (chip->options & NAND_BUSWIDTH_16)
	    {
	        col_addr /= 2;
	    }
		
		if (!mt6573_nand_reset())
	    {
			goto error;
		}

		mt6573_nand_set_mode(0x6000);
		NFI_SET_REG16(NFI_CNFG_REG16, CNFG_READ_EN);
	    DRV_WriteReg16(NFI_CON_REG16, 4 << CON_NFI_SEC_SHIFT);


	    NFI_CLN_REG16(NFI_CNFG_REG16, CNFG_AHB);
	    NFI_CLN_REG16(NFI_CNFG_REG16, CNFG_HW_ECC_EN);


		mt6573_nand_set_autoformat(false);
		

		if (!mt6573_nand_set_command(NAND_CMD_READ0))
	    {
			goto error;
		}
		
		if(devinfo.pagesize == 512)
			colnob = 1;
		else
			colnob = 2;

		rawnob=devinfo.addr_cycle - colnob;

		//1 FIXED ME: For Any Kind of AddrCycle
		if (!mt6573_nand_set_address(col_addr, page_addr, colnob, rawnob))
	    {
			goto error;
		}

		if (!mt6573_nand_set_command(NAND_CMD_READSTART))
	    {
			goto error;
		}
		if (!mt6573_nand_status_ready(STA_NAND_BUSY))
	    {
			goto error;
		}
		

		read_len = min(len, OOB_PER_SECTOR);
		if (!mt6573_nand_mcu_read_data(buf + OOB_PER_SECTOR * sector, read_len))    // TODO: and this 8
		{
			printk(KERN_WARNING "mt6573_nand_mcu_read_data return failed first 16\n");
			res = -EIO;
			goto error;
		}
		sector++;
		len -= read_len;
		mt6573_nand_stop_read();
		while(len>0)
		{
		    read_len = min(len, 16);
			if (!mt6573_nand_set_command(0x05))
			{
				goto error;
			}

			col_addr =  NAND_SECTOR_SIZE + sector * (NAND_SECTOR_SIZE + 16);
			if (chip->options & NAND_BUSWIDTH_16)
		    {
		        col_addr /= 2;
		    }
			DRV_WriteReg32(NFI_COLADDR_REG32, col_addr);
			DRV_WriteReg16(NFI_ADDRNOB_REG16, 2);
	        DRV_WriteReg16(NFI_CON_REG16, 4 << CON_NFI_SEC_SHIFT);

			if( !mt6573_nand_status_ready(STA_ADDR_STATE))
			{
				goto error;
			}

			if (!mt6573_nand_set_command(0xE0))
		    {
				goto error;
			}
			if (!mt6573_nand_status_ready(STA_NAND_BUSY))
		    {
				goto error;
			}
			if (!mt6573_nand_mcu_read_data(buf + OOB_PER_SECTOR * sector, read_len))    // TODO: and this 8
			{
				printk(KERN_WARNING "mt6573_nand_mcu_read_data return failed first 16\n");
				res = -EIO;
				goto error;
			}
			mt6573_nand_stop_read();
			sector++;
			len -= read_len;
		}
		//dump_data(&testbuf[16],16);
		//printk(KERN_ERR "\n");
	}
error:
    NFI_CLN_REG16(NFI_CON_REG16, CON_NFI_BRD);
    return res;
}

static int mt6573_nand_write_oob_raw(struct mtd_info *mtd, const uint8_t *buf, int page_addr, int len)
{
    struct nand_chip *chip = mtd->priv;
    // int i;
    u32 col_addr = 0;
    u32 sector = 0;
    // int res = 0;
    // u32 colnob=2, rawnob=devinfo.addr_cycle-2;
	// int randomread =0;
    int write_len = 0;
    int status;
//printk("mt6573_nand_write_oob_raw enter\n");
    if (len > 128 || len % OOB_AVAI_PER_SECTOR || !buf)
    {
        printk(KERN_WARNING "[%s] invalid parameter, len: %d, buf: %p\n",
                __FUNCTION__, len, buf);
        return -EINVAL;
    }

    while (len > 0)
    {
        write_len = min(len, OOB_PER_SECTOR);
        col_addr = sector * (NAND_SECTOR_SIZE + OOB_PER_SECTOR) + NAND_SECTOR_SIZE;
        if (!mt6573_nand_ready_for_write(chip, page_addr, col_addr, false, NULL))
        {
            return -EIO;
        }
        
        if (!mt6573_nand_mcu_write_data(mtd, buf + sector * OOB_PER_SECTOR, write_len))
        {
            return -EIO;
        }
        
		(void)mt6573_nand_check_RW_count(write_len);
	    NFI_CLN_REG16(NFI_CON_REG16, CON_NFI_BWR);
        (void)mt6573_nand_set_command(NAND_CMD_PAGEPROG);
		
        while(DRV_Reg32(NFI_STA_REG32) & STA_NAND_BUSY);		
	
        status = chip->waitfunc(mtd, chip);
        if (status & NAND_STATUS_FAIL)
        {
            printk(KERN_INFO "status: %d\n", status);
            return -EIO;
        }

        len -= write_len;
        sector++;
    }

    return 0;
}

static int mt6573_nand_write_oob_hw(struct mtd_info *mtd, struct nand_chip *chip, int page)
{
    // u8 *buf = chip->oob_poi;
    int i, iter;

    memcpy(local_oob_buf, chip->oob_poi, mtd->oobsize);
//printk("mt6573_nand_write_oob_hw enter\n");
    // copy ecc data
    if(mtd->oobsize > 16){
	    for (i = 0; i < chip->ecc.layout->eccbytes; i++)
	    {
	        iter = (i / OOB_AVAI_PER_SECTOR) * OOB_PER_SECTOR + OOB_AVAI_PER_SECTOR + i % OOB_AVAI_PER_SECTOR;
	        local_oob_buf[iter] = chip->oob_poi[chip->ecc.layout->eccpos[i]];
	        // chip->oob_poi[chip->ecc.layout->eccpos[i]] = local_oob_buf[iter];
	    }

	    // copy FDM data
	    for (i = 0; i < (chip->ecc.layout->eccbytes / OOB_AVAI_PER_SECTOR); i++)
	    {
	        memcpy(&local_oob_buf[i * OOB_PER_SECTOR], &chip->oob_poi[i * OOB_AVAI_PER_SECTOR], OOB_AVAI_PER_SECTOR);
	    }
    }

    return mt6573_nand_write_oob_raw(mtd, local_oob_buf, page, mtd->oobsize);
}

static int mt6573_nand_write_oob(struct mtd_info *mtd, struct nand_chip *chip, int page)
{
    int page_per_block = 1 << (chip->phys_erase_shift - chip->page_shift);
    int block = page / page_per_block;
    u16 page_in_block = page % page_per_block;
	u16 phy_block_bbt;
    int mapped_block = get_mapping_block_index(block,&phy_block_bbt);
	 int i, iter;


	if(g_bOOB_Test){
		memcpy(local_oob_buf, chip->oob_poi, mtd->oobsize);
		if(mtd->oobsize > 16){
		    // copy ecc data
		    for (i = 0; i < chip->ecc.layout->eccbytes; i++)
		    {
		        iter = (i / OOB_AVAI_PER_SECTOR) * OOB_PER_SECTOR + OOB_AVAI_PER_SECTOR + i % OOB_AVAI_PER_SECTOR;
		        local_oob_buf[iter] = chip->oob_poi[chip->ecc.layout->eccpos[i]];
		        // chip->oob_poi[chip->ecc.layout->eccpos[i]] = local_oob_buf[iter];
		    }

		    // copy FDM data
		    for (i = 0; i < (chip->ecc.layout->eccbytes / OOB_AVAI_PER_SECTOR); i++)
		    {
		        memcpy(&local_oob_buf[i * OOB_PER_SECTOR], &chip->oob_poi[i * OOB_AVAI_PER_SECTOR], OOB_AVAI_PER_SECTOR);
		    }

		}
			
		return 0;
	}

	#ifdef TCSUPPORT_NAND_BMT
    // write bad index into oob
    #if 0
    if (mapped_block != block)
    {
        set_bad_index_to_oob(chip->oob_poi, block);
    }
    else 
    {
        set_bad_index_to_oob(chip->oob_poi, FAKE_INDEX);
    }
	#endif
	if(block_is_in_bmt_region(mapped_block))
	{
		memcpy(chip->oob_poi + OOB_INDEX_OFFSET, &phy_block_bbt, OOB_INDEX_SIZE);
	}
	#endif

    if (mt6573_nand_write_oob_hw(mtd, chip, page_in_block + mapped_block * page_per_block /* page */))
    {
        MSG(INIT, "write oob fail at block: 0x%x, page: 0x%x\n", mapped_block, page_in_block);
        if (update_bmt((page_in_block + mapped_block * page_per_block) << chip->page_shift, 
                    UPDATE_WRITE_FAIL, NULL, chip->oob_poi))
        {
            MSG(INIT, "Update BMT success\n");
            return 0;
        }
        else
        {
            MSG(INIT, "Update BMT fail\n");
            return -EIO;
        }
    }
    return 0;
}

int mt6573_nand_block_markbad_hw(struct mtd_info *mtd, loff_t offset, u32 bmt_block)
{
    struct nand_chip *chip = mtd->priv;
    int block = (int)offset >> chip->phys_erase_shift;
    int page = block * (1 << (chip->phys_erase_shift - chip->page_shift));
    int ret;
	unsigned int bad_flag_offset = 0;

    u8 buf[8];
    memset(buf, 0xFF, 8);
	if(bmt_block)
		bad_flag_offset = BMT_BAD_BLOCK_INDEX_OFFSET;
	else{
		if(chip->page_shift == 9)  //512B page size
			bad_flag_offset = 6;
		else
			bad_flag_offset = 0;
	}
	buf[bad_flag_offset] = 0;

    ret = mt6573_nand_write_oob_raw(mtd, buf, page, 8);
    return ret;
}

static int mt6573_nand_block_markbad(struct mtd_info *mtd, loff_t offset)
{
    struct nand_chip *chip = mtd->priv;
    int block = (int)offset >> chip->phys_erase_shift;
    int mapped_block;
    int ret;
	u16 phy_block_bbt;

    nand_get_device(chip, mtd, FL_WRITING);

    mapped_block = get_mapping_block_index(block, &phy_block_bbt);
    ret = mt6573_nand_block_markbad_hw(mtd, mapped_block << chip->phys_erase_shift, 0);

    nand_release_device(mtd);

    return ret;
}

int mt6573_nand_read_oob_hw(struct mtd_info *mtd,struct nand_chip *chip, int page)
{
    int i;
    u8 iter = 0;
#ifdef TESTTIME
	unsigned long long time1,time2;

	time1 = sched_clock();
#endif
    
    if (mt6573_nand_read_oob_raw(mtd, chip->oob_poi, page, mtd->oobsize))
    {
        printk( "[%s]mt6573_nand_read_oob_raw return failed\n", __FUNCTION__);
        return -EIO;
    }
	//dump_buf(chip->oob_poi, mtd->oobsize);
#ifdef TESTTIME
    time2= sched_clock()-time1;
	if(!readoobflag)
	{  
	   readoobflag=1;
	   printk(KERN_ERR "[%s] time is %llu",__FUNCTION__,time2);
	}
#endif	
	if(mtd->oobsize== 16) //Page size is 512 bytes
		return 0;

    // adjust to ecc physical layout to memory layout
    /*********************************************************/
    /* FDM0 | ECC0 | FDM1 | ECC1 | FDM2 | ECC2 | FDM3 | ECC3 */
    /*  8B  |  8B  |  8B  |  8B  |  8B  |  8B  |  8B  |  8B  */
    /*********************************************************/

    
    memcpy(local_oob_buf, chip->oob_poi, mtd->oobsize);

    // copy ecc data
    for (i = 0; i < chip->ecc.layout->eccbytes; i++)
    {
        iter = (i / OOB_AVAI_PER_SECTOR) * OOB_PER_SECTOR + OOB_AVAI_PER_SECTOR + i % OOB_AVAI_PER_SECTOR;
        chip->oob_poi[chip->ecc.layout->eccpos[i]] = local_oob_buf[iter];
    }

    // copy FDM data
    for (i = 0; i < (chip->ecc.layout->eccbytes / OOB_AVAI_PER_SECTOR); i++)
    {
        memcpy(&chip->oob_poi[i * OOB_AVAI_PER_SECTOR], &local_oob_buf[i * OOB_PER_SECTOR], OOB_AVAI_PER_SECTOR);
    }

    return 0;
}

static int mt6573_nand_read_oob(struct mtd_info *mtd,struct nand_chip *chip, int page, int sndcmd)
{
    int page_per_block = 1 << (chip->phys_erase_shift - chip->page_shift);
    int block = page / page_per_block;
    u16 page_in_block = page % page_per_block;
	u16 phy_block_bbt;
    int mapped_block = get_mapping_block_index(block, &phy_block_bbt);

    mt6573_nand_read_oob_hw(mtd, chip, page_in_block + mapped_block * page_per_block);

    return 0;       // the return value is sndcmd
}


int mt6573_nand_block_bad_hw(struct mtd_info *mtd, loff_t ofs, u32 bmt_block)
{
    struct nand_chip *chip = (struct nand_chip *)mtd->priv;
	int page_addr = (int)(ofs >> chip->page_shift);
    unsigned int page_per_block = 1 << (chip->phys_erase_shift - chip->page_shift);
	unsigned int bad_flag_offset = 0;
    unsigned char oob_buf[8];
    page_addr &= ~(page_per_block - 1);

    if (mt6573_nand_read_oob_raw(mtd, oob_buf, page_addr, sizeof(oob_buf)))
    {
        printk(KERN_WARNING "mt6573_nand_read_oob_raw return error\n");
        return 1;
    }

	if(bmt_block)
		bad_flag_offset = BMT_BAD_BLOCK_INDEX_OFFSET;
	else{
		if(chip->page_shift == 9)  //512B page size
			bad_flag_offset = 6;
		else
			bad_flag_offset = 0;
	}

	
	if( oob_buf[bad_flag_offset] != 0xff){
 		printk(KERN_WARNING "Bad block detected at 0x%x, oob_buf[%d] is 0x%x\n", page_addr,bad_flag_offset, oob_buf[bad_flag_offset]);
        // dump_nfi();
        return 1;
	}

    return 0;        // everything is OK, good block
}


static int mt6573_nand_block_bad(struct mtd_info *mtd, loff_t ofs, int getchip)
{
    int chipnr = 0;
    
    struct nand_chip *chip = (struct nand_chip *)mtd->priv;
    int block = (int)ofs >> chip->phys_erase_shift;
    int mapped_block;
	u16 phy_block_bbt;

    int ret;

    if (getchip) {
		chipnr = (int)(ofs >> chip->chip_shift);
		nand_get_device(chip, mtd, FL_READING);
		/* Select the NAND device */
		chip->select_chip(mtd, chipnr);
	}

    mapped_block = get_mapping_block_index(block, &phy_block_bbt);

    ret = mt6573_nand_block_bad_hw(mtd, mapped_block << chip->phys_erase_shift, 0);

	#ifdef TCSUPPORT_NAND_BMT
    if (ret)
    {
        //MSG(INIT, "Unmapped bad block: 0x%x\n", mapped_block);
        if (update_bmt(mapped_block << chip->phys_erase_shift, UPDATE_UNMAPPED_BLOCK, NULL, NULL))
        {
            //MSG(INIT, "Update BMT success\n");
            ret = 0;
        }
        else
        {
            //MSG(INIT, "Update BMT fail\n");
            ret = 1;
        }
    }
	#endif

    if (getchip)
    {
        nand_release_device(mtd);
    }

    return ret;
}


/******************************************************************************
 * mt6573_nand_verify_buf
 * 
 * DESCRIPTION:
 *   Verify the NAND write data is correct or not ! 
 * 
 * PARAMETERS: 
 *   struct mtd_info *mtd, const uint8_t *buf, int len
 * 
 * RETURNS: 
 *   None   
 * 
 * NOTES: 
 *   None
 *
 ******************************************************************************/
#ifdef CONFIG_MTD_NAND_VERIFY_WRITE

char gacBuf[4096 + 128];

static int mt6573_nand_verify_buf(struct mtd_info *mtd, const uint8_t *buf, int len)
{
#if 1
	struct nand_chip* chip = (struct nand_chip*)mtd->priv;
	struct mt6573_CMD* pkCMD = &g_kCMD;
	u32 u4PageSize = mtd->writesize;
	u32 *pSrc, *pDst;
	int i;

    mt6573_nand_exec_read_page(mtd, pkCMD->u4RowAddr, u4PageSize, gacBuf, gacBuf + u4PageSize);

	pSrc = (u32*)buf;
	pDst = (u32*)gacBuf;
	len = len/sizeof(u32);
	for (i = 0; i < len; ++i) 
    {
		if (*pSrc != *pDst) 
        {
			MSG(VERIFY, "mt6573_nand_verify_buf page fail at page %d\n", pkCMD->u4RowAddr);
            return -1;
		}
		pSrc++;
		pDst++;
	}
    
	pSrc = (u32*)chip->oob_poi;
	pDst = (u32*)(gacBuf + u4PageSize);
    
	if ((pSrc[0] != pDst[0]) || (pSrc[1] != pDst[1]) ||
	    (pSrc[2] != pDst[2]) || (pSrc[3] != pDst[3]) ||
	    (pSrc[4] != pDst[4]) || (pSrc[5] != pDst[5]))
	    // TODO: Ask Designer Why?
	    //(pSrc[6] != pDst[6]) || (pSrc[7] != pDst[7])) 
    {
        MSG(VERIFY, "mt6573_nand_verify_buf oob fail at page %d\n", pkCMD->u4RowAddr);
		MSG(VERIFY, "0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x\n", 
		    pSrc[0], pSrc[1], pSrc[2], pSrc[3], pSrc[4], pSrc[5], pSrc[6], pSrc[7]);
		MSG(VERIFY, "0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x\n", 
		    pDst[0], pDst[1], pDst[2], pDst[3], pDst[4], pDst[5], pDst[6], pDst[7]);
		return -1;		
    }
	/*
	for (i = 0; i < len; ++i) {
		if (*pSrc != *pDst) {
			printk(KERN_ERR"mt6573_nand_verify_buf oob fail at page %d\n", g_kCMD.u4RowAddr);
			return -1;
		}
		pSrc++;
		pDst++;
	}
	*/
	//printk(KERN_INFO"mt6573_nand_verify_buf OK at page %d\n", g_kCMD.u4RowAddr);
	
	return 0;
#else
    return 0;
#endif
}
#endif

/******************************************************************************
 * mt6573_nand_init_hw
 * 
 * DESCRIPTION:
 *   Initial NAND device hardware component ! 
 * 
 * PARAMETERS: 
 *   struct mt6573_nand_host *host (Initial setting data)
 * 
 * RETURNS: 
 *   None   
 * 
 * NOTES: 
 *   None
 *
 ******************************************************************************/
static int mt6573_nand_init_hw(struct mt6573_nand_host *host)
{
	struct mt6573_nand_host_hw *hw = host->hw;
	

    MSG(INIT, "Enable NFI Clock\n");
    nand_enable_clock();

	g_bInitDone = false;
    /* Get the HW_VER */
    //g_u4ChipVer = DRV_Reg32(CONFIG_BASE);
	g_kCMD.u4OOBRowAddr  = (u32)-1;

    /* Set default NFI access timing control */
	DRV_WriteReg32(NFI_ACCCON_REG32, hw->nfi_access_timing);
	DRV_WriteReg16(NFI_CNFG_REG16, 0);
	DRV_WriteReg16(NFI_PAGEFMT_REG16, 0);
	
    /* Reset the state machine and data FIFO, because flushing FIFO */
	(void)mt6573_nand_reset();
	
    /* Set the ECC engine */
    if(hw->nand_ecc_mode == NAND_ECC_HW)
	{
		MSG(INIT, "%s : Use HW ECC\n", MODULE_NAME);
		if(g_bHwEcc){
		NFI_SET_REG32(NFI_CNFG_REG16, CNFG_HW_ECC_EN);
		}
		if(ECC_Config(host->hw))
			return -1;
   		mt6573_nand_configure_fdm(8);
		mt6573_nand_configure_lock();
	}

	/*set pio mode as big endian, sycn as dma mode*/
	//NFI_SET_REG32(NFI_CNFG_REG16, CNFG_PIO_BIG_ENDIAN);
	/* Initilize interrupt. Clear interrupt, read clear. */
    DRV_Reg16(NFI_INTR_REG16);
	
    /* Interrupt arise when read data or program data to/from AHB is done. */
	DRV_WriteReg16(NFI_INTR_EN_REG16, 0);

	return 0;
}

//-------------------------------------------------------------------------------
static int mt6573_nand_dev_ready(struct mtd_info *mtd)
{	
    return !(DRV_Reg32(NFI_STA_REG32) & STA_NAND_BUSY);
}

static void mt6573_nand_enable_hwecc(struct mtd_info *mtd, int mode)
{
}


static int mt6573_nand_correct_data(struct mtd_info *mtd, u_char *dat,
				     u_char *read_ecc, u_char *calc_ecc)
{
	return 0;
}

static int mt6573_nand_calculate_ecc(struct mtd_info *mtd, const u_char *dat, u_char *ecc_code)
{
	return 0;
}



unsigned int ra_nand_read_byte(unsigned long long from)
{
	unsigned char ch;
	size_t retlen;
	//ramtd_nand_read(ranfc_mtd, (loff_t)from, 1, &retlen, &ch);
	host->mtd.read(&(host->mtd), (loff_t)from, 1, &retlen, &ch);
	return ch;
}


unsigned int ra_nand_read_dword(unsigned long long from)
{
	unsigned char data[5];
	unsigned long dword;
	size_t retlen;
	int ret = 0, i;
	
	host->mtd.read(&(host->mtd), (loff_t)from, 4, &retlen, data);
	if (ret != 0)
		return -1;

	dword = 0;	
	for (i=0; i<4; i++) {
		dword += (unsigned long)data[i];
		if (i<3)
			dword <<= 8;
	}
	return dword;
}

#ifdef NAND_ECC_TEST
/******************************************************************************
 * mt6573_nand_proc_read
 * 
 * DESCRIPTION: 
 *   Read the proc file to get the interrupt scheme setting ! 
 * 
 * PARAMETERS: 
 *   char *page, char **start, off_t off, int count, int *eof, void *data
 * 
 * RETURNS: 
 *   None
 * 
 * NOTES: 
 *   None
 * 
 ******************************************************************************/
static int mt6573_nand_ecc_proc_read(char *page, char **start, off_t off,
	int count, int *eof, void *data)
{
    int len;	
	if (off > 0) 
    {
		return 0;
	}
	// return sprintf(page, "Interrupt-Scheme is %d\n", g_i4Interrupt);
    len = sprintf(page, "hw ecc is %d bit,spare size is %d\n", g_hw_ecc_bit, g_spare_size);
	
    return len;
}

int mt6573_nand_ecc_test(int max_errors);

/******************************************************************************
 * mt6573_nand_proc_write
 * 
 * DESCRIPTION: 
 *   Write the proc file to set the interrupt scheme ! 
 * 
 * PARAMETERS: 
 *   struct file* file, const char* buffer,	unsigned long count, void *data
 * 
 * RETURNS: 
 *   None
 * 
 * NOTES: 
 *   None
 * 
 ******************************************************************************/
static int mt6573_nand_ecc_proc_write(struct file* file, const char* buffer,
	unsigned long count, void *data)
{
	char buf[16];
	int len = count, n;

	if (len >= sizeof(buf)) 
    {
		len = sizeof(buf) - 1;
	}

	if (copy_from_user(buf, buffer, len)) 
    {
		return -EFAULT;
	}

	buf[len] = '\0';

	if(buf[0] == 'T'){
		n = simple_strtol(buf+1, NULL, 10);
		mt6573_nand_ecc_test(n);
	}
	else if(buf[0] == 'S'){
		n = simple_strtol(buf+1, NULL, 10);
		if(n == 16 || n == 26 || n == 27 || n == 28){
			g_spare_size = n;
			//ECC_Config_All_Bits(g_hw_ecc_bit);
		}
		else{
			printk("spare size must be 16/26/27/28\n");
		}
	}
	else{

		n = simple_strtol(buf, NULL, 10);

		ECC_Config_All_Bits(n);
	}

	return len;
}
#if 1

/******************************************************************************
 * mt6573_nand_read_oob_raw
 *
 * DESCRIPTION:
 *   Read oob data
 *
 * PARAMETERS:
 *   struct mtd_info *mtd, const uint8_t *buf, int addr, int len 
 *
 * RETURNS:
 *   None
 *
 * NOTES:
 *   this function read raw oob data out of flash, so need to re-organise 
 *   data format before using.
 *   len should be times of 8, call this after nand_get_device.
 *   Should notice, this function read data without ECC protection.
 *
 *****************************************************************************/
static int mt6573_nand_read_oob_raw_more(struct mtd_info *mtd, uint8_t *buf, int page_addr, int len)
{
    struct nand_chip *chip = (struct nand_chip *)mtd->priv;
    u32 col_addr = 0;
    u32 sector = 0;
    int res = 0;
	int randomread =0;
    int read_len = 0;
	int oob_per_sector = g_spare_size;

    if (len > 232 || len % OOB_AVAI_PER_SECTOR || !buf)
    {
        printk(KERN_WARNING "[%s] invalid parameter, len: %d, buf: %p\n",
                __FUNCTION__, len, buf);
        return -EINVAL;
    }
    if(len>16)
    {
        randomread=1;
    }
	/*TOSHIBA TC58NVG3S0F 4K Page size*/
	/*Spare erea is 232 Bytes, oob per sector is 29=232/8*/
	if(!randomread||!(devinfo.advancedmode & RAMDOM_READ))
	{
		//Always read from here
	    while (len > 0)
	    {
	        read_len = min(len, oob_per_sector);
	        col_addr = NAND_SECTOR_SIZE + sector * (NAND_SECTOR_SIZE + oob_per_sector); // TODO: Fix this hard-code 16
			//printk("mt6573_nand_read_oob_raw_more: page_addr=%d,col_addr=%d, readlen=%d\n", page_addr,col_addr, read_len);
			if (!mt6573_nand_ready_for_read(chip, page_addr, col_addr, false, NULL))
	        {
	            printk("mt6573_nand_ready_for_read return failed\n");
	            res = -EIO;
	            goto error;
	        }
	        if (!mt6573_nand_mcu_read_data(buf + oob_per_sector * sector, read_len))    // TODO: and this 8
	        {
	            printk("mt6573_nand_mcu_read_data return failed\n");
	            res = -EIO;
	            goto error;
	        }
	        mt6573_nand_stop_read();
			//dump_data(buf + 16 * sector,16);
	        sector++;
	        len -= read_len;
			
	    }
	}
    
	
error:
    NFI_CLN_REG16(NFI_CON_REG16, CON_NFI_BRD);
    return res;
}
#if 0
static int mt6573_nand_write_oob_raw_more(struct mtd_info *mtd, const uint8_t *buf, int page_addr, int len)
{
    struct nand_chip *chip = mtd->priv;
    // int i;
    u32 col_addr = 0;
    u32 sector = 0;
    // int res = 0;
    // u32 colnob=2, rawnob=devinfo.addr_cycle-2;
	// int randomread =0;
    int write_len = 0;
    int status;
	int oob_per_sector = g_spare_size;
	
//printk("mt6573_nand_write_oob_raw enter\n");
    if (len > 232 || len % OOB_AVAI_PER_SECTOR || !buf)
    {
        printk(KERN_WARNING "[%s] invalid parameter, len: %d, buf: %p\n",
                __FUNCTION__, len, buf);
        return -EINVAL;
    }

    while (len > 0)
    {
        write_len = min(len, oob_per_sector);
        col_addr = sector * (NAND_SECTOR_SIZE + oob_per_sector) + NAND_SECTOR_SIZE;
        if (!mt6573_nand_ready_for_write(chip, page_addr, col_addr, false, NULL))
        {
            return -EIO;
        }
        
        if (!mt6573_nand_mcu_write_data(mtd, buf + sector * oob_per_sector, write_len))
        {
            return -EIO;
        }
		(void)mt6573_nand_check_RW_count(write_len);
	    NFI_CLN_REG16(NFI_CON_REG16, CON_NFI_BWR);
        (void)mt6573_nand_set_command(NAND_CMD_PAGEPROG);
		
        while(DRV_Reg32(NFI_STA_REG32) & STA_NAND_BUSY);		
	
        status = chip->waitfunc(mtd, chip);
        if (status & NAND_STATUS_FAIL)
        {
            printk(KERN_INFO "status: %d\n", status);
            return -EIO;
        }

        len -= write_len;
        sector++;
    }

    return 0;
}
#endif
/**********************************************************
Description : CM_ECC_Invert_Bits
Input       : 
Output      : 0
***********************************************************/
void CM_ECC_Invert_Bits(unsigned char* buff_ptr, unsigned int bit_pos)
{
    unsigned int byte_pos   = 0;
    unsigned char  byte_val   = 0;
    unsigned char  temp_val   = 0;
    unsigned int invert_bit = 0;

    byte_pos = bit_pos >> 3;
    invert_bit = bit_pos & ((1<<3)-1);
    byte_val = buff_ptr[byte_pos];    
    temp_val = byte_val & (1 << invert_bit);
    
    if(temp_val > 0)
        byte_val &= ~temp_val;
    else
        byte_val |= (1 << invert_bit);
    buff_ptr[byte_pos] = byte_val; 
   
}




//char oob_buf[234] = {0};
//char read_buf[4097] = {0};

#define DATA_BUF_SIZE (4096+234+1)

int mt6573_nand_ecc_test(int max_errors)
{
	int block_index, page_addr, i, oob_size, error=0;
	struct nand_chip *chip = (struct nand_chip *)host->mtd.priv;
	int page_per_block = 1 << (chip->phys_erase_shift - chip->page_shift);
	int page_size = 1 << chip->page_shift;
	int block_size = 1 << chip->phys_erase_shift;

	int ecc_error_bit, hw_ecc_bits = g_hw_ecc_bit;
	int result = 0, sector_num = 0;
	int max_error_bits = g_hw_ecc_bit;
	
	unsigned long long  offset, len;
	char *data_buffer = NULL;
	char *read_buf = NULL;

	char *size_4K_page_data = NULL;

	size_4K_page_data = kmalloc(4097, GFP_KERNEL);
	if(!size_4K_page_data){
		printk("alloc read_buf buffer failed!\n");
		return -1;
	}
	memset(size_4K_page_data,0x5a, 4097);
	read_buf = kmalloc(4097, GFP_KERNEL);
	if(!read_buf){
		printk("alloc read_buf buffer failed!\n");
		return -1;
	}

	//g_spare_size = 26;
	if(max_errors){
		max_error_bits = max_errors;
	}

	
	printk("page_per_block=%d, page_size=%d, block_size=%d\n", page_per_block, page_size, block_size);
	//1.Select a random block and erase it
	//get_random_bytes??
	//block_index = random() % (chip->chipsize/(1 << chip->phys_erase_shift));
	block_index = 0;
	
	printk("block_index=%d\n", block_index);

	mt6573_nand_erase(&(host->mtd), block_index*page_per_block);
	
	

	//2.Write a page data with HW_ECC on
	g_bAutoFMT = true;
	g_bHwEcc = true;
	g_bUseAHBMode = true;
	g_bOOB_Test = false;

	/*Write to 2nd Page*/
	page_addr = block_index*page_per_block+1;
	offset = (unsigned long long)(page_addr*page_size);

	printk("write offset=%llu\n", offset);
	
	host->mtd.write(&(host->mtd), (loff_t)offset, (size_t)page_size, (size_t *)&len, size_4K_page_data);
	

	//3.Read the page main data and oob data
	data_buffer = kmalloc(DATA_BUF_SIZE, GFP_KERNEL);
	if(!data_buffer){
		printk("alloc data buffer failed!\n");
		return -1;
	}
	memset(data_buffer, 0, DATA_BUF_SIZE);
	host->mtd.read(&(host->mtd), (loff_t)offset, (size_t)page_size, (size_t *)&len, data_buffer);

	for (i=0; i<page_size; i++) {
			if (data_buffer[i] != size_4K_page_data[i]) {
				printk("basic write read test fail, i=%d\n", i);
				//err++;
				
#if 0
					printk("*************RBuf***************\n");
					dump_buf(data_buffer, page_size);
					//printk("**************WBuf**************\n");
					//dump_buf(size_4K_page_data, (int)oob_size);
					//printk("****************************\n");
#endif
				result = -1;
				goto end;
			}
		}

	//read oob...
	oob_size = (1 << (chip->page_shift - 9)) * g_spare_size;
	
	mt6573_nand_read_oob_raw_more(&(host->mtd), data_buffer+page_size, page_addr, oob_size);


	for(ecc_error_bit = 1; ecc_error_bit <= max_errors; ecc_error_bit++){
		
		//4.Create the test data with 4~16 bit error for every sector
		for(sector_num = 0; sector_num < (page_size/NAND_SECTOR_SIZE); sector_num++){
			CM_ECC_Invert_Bits(data_buffer, sector_num*NAND_SECTOR_SIZE*8+ecc_error_bit*200);
		}
		#if 1
		error =0;

		for (i=0; i<page_size; i++) {
			if (data_buffer[i] != size_4K_page_data[i]) {
				error++;
			}
		}
		printk("%d bit error test\n", error);
		#endif
				
		//5.Write the test data to the next page in PIO mode and HW_ECC is off
		g_bAutoFMT = false;
		g_bHwEcc = false;
		g_bUseAHBMode = false;
		g_bOOB_Test = true;

		page_addr++;//Select the next page
		offset = (unsigned long long)(page_addr*page_size);
		//mt6573_nand_write_oob_raw_more(&(host->mtd), data_buffer+page_size, page_addr, oob_size);

		
		memcpy(local_oob_buf, data_buffer+page_size, oob_size);
		
		host->mtd.write(&(host->mtd), (loff_t)offset, (size_t)page_size, (size_t *)&len, data_buffer);

		//6.Read the data from the next page when HW_ECC is on
		g_bAutoFMT = true;
		g_bHwEcc = true;
		g_bUseAHBMode = true;
		g_bOOB_Test = false;

		memset(read_buf, 0, 4097);
		
		host->mtd.read(&(host->mtd), (loff_t)offset, (size_t)page_size, (size_t *)&len, read_buf);

		if(ecc_error_bit <= hw_ecc_bits){

			//7.Check whether the error bit be corrected
			for (i=0; i<page_size; i++) {
				if (read_buf[i] != size_4K_page_data[i]) {
					printk("%d bit ecc correct test fail, i=%d\n", ecc_error_bit, i);
					//err++;
					result = -1;
					goto end;
				}
			}
			printk("%d bit error test PASS\n", error);
		}
		else{
			#if 0
			printk("%d bit error, more than hw ecc bits,ignore\n", error);
			uncorrect_num = 0;
			for (i=0; i<page_size; i++) {
				if (read_buf[i] != size_4K_page_data[i]) {
					//printk("%d bit ecc correct test fail, i=%d\n", ecc_error_bit, i);
					uncorrect_num++;
				}
			}
			if(uncorrect_num)
				printk("%d bit error test: uncorrect_num=%d\n", error, uncorrect_num);
			else
				printk("%d bit error test PASS\n", error);
			#endif
		}
		printk("**********************************************\n");
		
	}

	
end:
	if(size_4K_page_data){
		kfree(size_4K_page_data);
	}

	if(read_buf){
		kfree(read_buf);
	}
	if(data_buffer){
		kfree(data_buffer);
	}
	if(result){
		printk("NAND ECC Test Fail!!\n");
	}
	else{
		printk("NAND ECC Test PASS!!\n");
	}

	return result;	
}

#endif
#endif


/******************************************************************************
 * mt6573_nand_proc_read
 * 
 * DESCRIPTION: 
 *   Read the proc file to get the interrupt scheme setting ! 
 * 
 * PARAMETERS: 
 *   char *page, char **start, off_t off, int count, int *eof, void *data
 * 
 * RETURNS: 
 *   None
 * 
 * NOTES: 
 *   None
 * 
 ******************************************************************************/
static int mt6573_nand_proc_read(char *page, char **start, off_t off,
	int count, int *eof, void *data)
{
    int len;
	int nand_mode = 0;
	if (off > 0) 
    {
		return 0;
	}

	nand_mode = (g_bAutoFMT << 3) | (g_bHwEcc << 2) | (g_i4Interrupt << 1) | g_bUseAHBMode;
	// return sprintf(page, "Interrupt-Scheme is %d\n", g_i4Interrupt);
	len = sprintf(page, "%d\n", nand_mode);
    len += sprintf(page + len, "Name: %s, ID: 0x%x (ext: 0x%x), total size: %dMiB, page size: %d B\n", devinfo.devciename, devinfo.id,
    		devinfo.ext_id, devinfo.totalsize, devinfo.pagesize);
    len += sprintf(page + len, "Current Interrupt is %s, working in %s mode \nHW_ECC is %s, AUTO_FMT is %s \nOOB_Test is %s\n", 
		g_i4Interrupt ? "ON" : "OFF", 
		g_bUseAHBMode? "DMA" : "PIO", g_bHwEcc? "ON" : "OFF", g_bAutoFMT? "ON" : "OFF", g_bOOB_Test? "ON" : "OFF");


    return len;
}


/******************************************************************************
 * mt6573_nand_proc_write
 * 
 * DESCRIPTION: 
 *   Write the proc file to set the interrupt scheme ! 
 * 
 * PARAMETERS: 
 *   struct file* file, const char* buffer,	unsigned long count, void *data
 * 
 * RETURNS: 
 *   None
 * 
 * NOTES: 
 *   None
 * 
 ******************************************************************************/
static int mt6573_nand_proc_write(struct file* file, const char* buffer,
	unsigned long count, void *data)
{
    struct mtd_info *mtd = &host->mtd;
	char buf[16];
	int len = count, n;

	if (len >= sizeof(buf)) 
    {
		len = sizeof(buf) - 1;
	}

	if (copy_from_user(buf, buffer, len)) 
    {
		return -EFAULT;
	}

	buf[len] = '\0';
	if (buf[0] == 'I') 
    {
        // sync before switching between polling and interrupt, 
		n = simple_strtol(buf+1, NULL, 10);
 
        if ((n > 0 && !g_i4Interrupt) || 
            (n == 0 && g_i4Interrupt))
        {
            nand_get_device((struct nand_chip *)mtd->priv, mtd, FL_READING);

            g_i4Interrupt = n;
            
            if (g_i4Interrupt)
			{
				DRV_Reg16(NFI_INTR_REG16);
                enable_irq(MT6573_NFI_IRQ_LINE);
            }
            else{
                disable_irq(MT6573_NFI_IRQ_LINE);
            	}
            
            nand_release_device(mtd);
    	} 
    } 

    if (buf[0] == 'D')
    {
#ifdef _MTK_NAND_DUMMY_DRIVER_
        printk(KERN_INFO "Enable dummy driver\n");
        dummy_driver_debug = 1;
#endif
    } 
	
#ifdef NAND_PFM
	if (buf[0] == 'P') 
    {
        /* Reset values */
		g_PFM_R = 0;
		g_PFM_W = 0;
		g_PFM_E = 0;
		g_PFM_RD = 0;
		g_PFM_WD = 0;
		g_kCMD.pureReadOOBNum = 0;
	}
#endif

	//AHB/PIO mode Switch
	if(buf[0] == 'A'){
        // sync before switching between polling and interrupt, 
		n = simple_strtol(buf+1, NULL, 10);
 
	        if ((n == 1 && !g_bUseAHBMode) || 
	            (n == 0 && g_bUseAHBMode))
	        {
	            nand_get_device((struct nand_chip *)mtd->priv, mtd, FL_READING);

			if(n){
				g_bUseAHBMode = true;
			}
			else{
				g_bUseAHBMode = false;
			}
			
	            
	            nand_release_device(mtd);
		} 
	}

	//HW_ECC Switch
	if(buf[0] == 'E'){
        // sync before switching between polling and interrupt, 
		n = simple_strtol(buf+1, NULL, 10);
 
	        if ((n == 1 && !g_bHwEcc) || 
	            (n == 0 && g_bHwEcc))
	        {
	            nand_get_device((struct nand_chip *)mtd->priv, mtd, FL_READING);

			if(n){
				g_bHwEcc = true;
				NFI_SET_REG16(NFI_CNFG_REG16, CNFG_HW_ECC_EN);
			}
			else{
				g_bHwEcc = false;
				NFI_CLN_REG16(NFI_CNFG_REG16, CNFG_HW_ECC_EN);
			}
			
	            
	            nand_release_device(mtd);
		} 
	}

	//AUTO_FMT Switch
	if(buf[0] == 'F'){
        // sync before switching between polling and interrupt, 
		n = simple_strtol(buf+1, NULL, 10);
 
	        if ((n == 1 && !g_bAutoFMT) || 
	            (n == 0 && g_bAutoFMT))
	        {
	            nand_get_device((struct nand_chip *)mtd->priv, mtd, FL_READING);

			if(n){
				g_bAutoFMT = true;
				mt6573_nand_set_autoformat(true);
			}
			else{
				g_bAutoFMT = false;
				mt6573_nand_set_autoformat(false);
			}
			
	            
	            nand_release_device(mtd);
		} 
	}

	//OOB Test Switch
	if(buf[0] == 'O'){
        // sync before switching between polling and interrupt, 
		n = simple_strtol(buf+1, NULL, 10);
 
	        if ((n == 1 && !g_bOOB_Test) || 
	            (n == 0 && g_bOOB_Test))
	        {
	            nand_get_device((struct nand_chip *)mtd->priv, mtd, FL_READING);

			if(n){
				g_bOOB_Test = true;				
			}
			else{
				g_bOOB_Test = false;				
			}
			
	            
	            nand_release_device(mtd);
		} 
	}

	return len;
}
#ifdef TCSUPPORT_NAND_BMT
int calc_bmt_pool_size(struct mtd_info *mtd)
{
	struct nand_chip *nand = mtd->priv;
    int chip_size = nand->chipsize;
    int block_size = 1 << nand->phys_erase_shift;
    int total_block = chip_size / block_size;
    int last_block = total_block - 1;
    
    u16 valid_block_num = 0;
    u16 need_valid_block_num = total_block * POOL_GOOD_BLOCK_PERCENT;
#if 0
    printk("need_valid_block_num:%d \n", need_valid_block_num);
    printk("total block:%d \n", total_block);
#endif
    for(;last_block > 0; --last_block)
    {
        if(mt6573_nand_block_bad_hw(mtd, last_block * block_size, BAD_BLOCK_RAW))
        {
            continue;
    
        }
        else
        {
            valid_block_num++;
            if(valid_block_num == need_valid_block_num)
            {
                break;
            }

        }

    }

    return (total_block - last_block);
    
}
#endif

static int mt6573_nand_setup(struct mt6573_nand_host_hw *hw)
{
	//struct mt6573_nand_host_hw *hw;
	struct mtd_info *mtd;
	struct nand_chip *nand_chip;
	int err = 0;
    int id;
    u32 ext_id;
    u8 ext_id1, ext_id2, ext_id3;
	int num;
	/* OSBNB00043636: to Fix NAND DualImage , tclinux related MTD partition can't be programmed issue 20130313 Byron */
#if defined(TCSUPPORT_DUAL_IMAGE_ENHANCE)
	u32 erase_unit;
#endif

	/***********************************/
	//return -1;
	/********************************/
	/* Allocate memory for the device structure (and zero it) */
	host = kzalloc(sizeof(struct mt6573_nand_host), GFP_KERNEL);	
	if (!host) 
	{
		MSG(INIT, "mt6573_nand: failed to allocate device structure.\n");
		return -ENOMEM;
	}

	/* for 32bytes alignment */
	local_buffer_16_align_r = local_buffer_r + 32 - ((u32)local_buffer_r % 32);
	/* flush cache_page */
	dma_cache_inv(((unsigned long) local_buffer_16_align_r), 4096);
	/* Un-cache memory */
	local_buffer_16_align_r = ((u8 *) K0_TO_K1(local_buffer_16_align_r));
	printk( "Allocate 16 byte aligned buffer_r: %p\n", local_buffer_16_align_r);

	/* for 32bytes alignment */
	local_buffer_16_align_w = local_buffer_w + 32 - ((u32)local_buffer_w % 32);
	/* flush cache_page */
	dma_cache_inv(((unsigned long) local_buffer_16_align_w), 4096);
	/* Un-cache memory */
	local_buffer_16_align_w = ((u8 *) K0_TO_K1(local_buffer_16_align_w));
	printk( "Allocate 16 byte aligned buffer_w: %p\n", local_buffer_16_align_w);

	host->hw = hw;
	
	/* init mtd data structure */
	nand_chip  = &host->nand_chip;
	nand_chip->priv = host;		/* link the private data structures */
	
	mtd        = &host->mtd;	
	mtd->priv  = nand_chip;
	mtd->owner = THIS_MODULE;
	mtd->name  = "MT6573-Nand";

    hw->nand_ecc_mode = NAND_ECC_HW;

	/* Set address of NAND IO lines */
	nand_chip->IO_ADDR_R 	    = (void __iomem*)NFI_DATAR_REG32;
	nand_chip->IO_ADDR_W 	    = (void __iomem*)NFI_DATAW_REG32;
	nand_chip->chip_delay 	    = 20;			/* 20us command delay time */
	nand_chip->ecc.mode 	    = hw->nand_ecc_mode;	/* enable ECC */

	nand_chip->read_byte        = mt6573_nand_read_byte;
	nand_chip->read_buf		    = mt6573_nand_read_buf;
	nand_chip->write_buf	    = mt6573_nand_write_buf;
#ifdef CONFIG_MTD_NAND_VERIFY_WRITE	
	nand_chip->verify_buf       = mt6573_nand_verify_buf;
#endif
    nand_chip->select_chip      = mt6573_nand_select_chip;
    nand_chip->dev_ready 	    = mt6573_nand_dev_ready;
	nand_chip->cmdfunc 		    = mt6573_nand_command_bp;	
   	nand_chip->ecc.read_page    = mt6573_nand_read_page_hwecc;
	nand_chip->ecc.write_page   = mt6573_nand_write_page_hwecc;


    nand_chip->ecc.layout	    = &nand_oob_64;
    nand_chip->ecc.size		    = hw->nand_ecc_size;	//2048
    nand_chip->ecc.bytes	    = hw->nand_ecc_bytes;	//32
	//nand_chip->options		    = NAND_USE_FLASH_BBT;
	nand_chip->options		 = NAND_SKIP_BBTSCAN;
	//nand_chip->options		 = NAND_USE_FLASH_BBT | NAND_NO_AUTOINCR;
								/*
							   BBT_AUTO_REFRESH      | 
		                       NAND_NO_SUBPAGE_WRITE | 
		                       NAND_NO_AUTOINCR;
		                       */

    // For BMT, we need to revise driver architecture
    nand_chip->write_page       = mt6573_nand_write_page;
    nand_chip->ecc.write_oob    = mt6573_nand_write_oob;
    //nand_chip->read_page        = mt6573_nand_read_page;
    nand_chip->ecc.read_oob     = mt6573_nand_read_oob;
    nand_chip->block_markbad    = mt6573_nand_block_markbad;   // need to add nand_get_device()/nand_release_device().
    //nand_chip->erase            = mt6573_nand_erase;
    nand_chip->block_bad        = mt6573_nand_block_bad;

	nand_chip->ecc.calculate = mt6573_nand_calculate_ecc;
	nand_chip->ecc.correct   = mt6573_nand_correct_data;
	nand_chip->ecc.hwctl	    = mt6573_nand_enable_hwecc;


	err = mt6573_nand_init_hw(host);
	if(err != 0){
		MSG(INIT, "Init HW fail! \r\n");
		goto out;
	}
	/* Select the device */
	nand_chip->select_chip(mtd, 0);

	/*
	 * Reset the chip, required by some chips (e.g. Micron MT29FxGxxxxx)
	 * after power-up
	 */
	nand_chip->cmdfunc(mtd, NAND_CMD_RESET, -1, -1);
	

	/* Send the command for reading device ID */
	nand_chip->cmdfunc(mtd, NAND_CMD_READID, 0x00, -1);
	


	/* Read manufacturer and device IDs */
	manu_id = nand_chip->read_byte(mtd);
	dev_id = nand_chip->read_byte(mtd);
	printk("manu_id=%x, dev_id=%x\n", manu_id , dev_id);

	ext_id1 = nand_chip->read_byte(mtd);
	ext_id2 = nand_chip->read_byte(mtd);
	ext_id3 = nand_chip->read_byte(mtd);
    ext_id = ext_id1 << 16 | ext_id2 << 8 | ext_id3;

	printk("ext_id=%x,\n", ext_id );

	//Check NAND Info
	// id = (dev_id<<8)|manu_id;
	id = dev_id | (manu_id << 8);
	if(!get_device_info(id, ext_id, &devinfo))
	{
        MSG(INIT, "Not Support this Device! \r\n");
	}

    if (devinfo.pagesize == 4096) {
        nand_chip->ecc.layout = &nand_oob_128;
	nand_chip->ecc.size = 4096;
	nand_chip->ecc.bytes = 64;
    } else if (devinfo.pagesize == 2048) {
        nand_chip->ecc.layout = &nand_oob_64;
	nand_chip->ecc.size = 2048;
	nand_chip->ecc.bytes = 32;
    } else if (devinfo.pagesize == 512) {
        nand_chip->ecc.layout = &nand_oob_16;
	nand_chip->ecc.size = 512;
	nand_chip->ecc.bytes = 8;
    }
    MSG(INIT, "[NAND] pagesz:%d eccsz: %d, oobsz: %d\n", 
        nand_chip->ecc.size, nand_chip->ecc.bytes, sizeof(g_kCMD.au1OOB));

	MSG(INIT, "Support this Device in MTK table! %x \r\n",id);
    hw->nfi_bus_width = devinfo.iowidth;
	DRV_WriteReg32(NFI_ACCCON_REG32, devinfo.timmingsetting);

	/* 16-bit bus width */
	if (hw->nfi_bus_width == 16)
	{
	    MSG(INIT, "%s : Set the 16-bit I/O settings!\n", MODULE_NAME);
		nand_chip->options |= NAND_BUSWIDTH_16;
	}
    /*  register NFI IRQ handler. */
    err = request_irq(MT6573_NFI_IRQ_LINE, (irq_handler_t)mt6573_nand_irq_handler, 0, 
                     "mt6573-nand", NULL);
    if (0 != err) 
	{
        MSG(INIT, "%s : Request IRQ fail: err = %d\n", MODULE_NAME, err);
        goto out;
    }

    if (g_i4Interrupt)
        enable_irq(MT6573_NFI_IRQ_LINE);
    else
        disable_irq(MT6573_NFI_IRQ_LINE);
#if 0
    if (devinfo.advancedmode & CACHE_READ)
    {
        nand_chip->ecc.read_multi_page_cache = NULL;
        // nand_chip->ecc.read_multi_page_cache = mt6573_nand_read_multi_page_cache;
    	// MSG(INIT, "Device %x support cache read \r\n",id);
    }
    else
        nand_chip->ecc.read_multi_page_cache = NULL;
#endif
	/* Scan to find existance of the device */
	if (nand_scan(mtd, hw->nfi_cs_num)) 
	{
		MSG(INIT, "%s : nand_scan fail.\n", MODULE_NAME);
		err = -ENXIO;
		goto out;
	}

	g_page_size = mtd->writesize;
	//platform_set_drvdata(pdev, host);
    
    if (hw->nfi_bus_width == 16)
	{
		NFI_SET_REG16(NFI_PAGEFMT_REG16, PAGEFMT_DBYTE_EN);
	}
	nand_chip->select_chip(mtd, 0);

	//printk("phys_erase_shift=%d,page_shift=%d,oob size=%d, mtd size=%x, chip size=%x, chip->numchips = %d\n",nand_chip->phys_erase_shift,nand_chip->page_shift, mtd->oobsize, 
	//	mtd->size,nand_chip->chipsize, nand_chip->numchips);
  
    //nand_chip->chipsize -= (BMT_POOL_SIZE) << nand_chip->phys_erase_shift;
    mtd->size = nand_chip->chipsize;

	if (IS_NANDFLASH) {
		//map->fldrv_priv = ra;
		ranand_read_byte = ra_nand_read_byte;
		ranand_read_dword = ra_nand_read_dword;
	}

	
#ifdef TCSUPPORT_NAND_BMT	
	bmt_pool_size = calc_bmt_pool_size(mtd);
	printk("bmt pool size: %d \n", bmt_pool_size);
	nand_chip->chipsize -= (bmt_pool_size) << nand_chip->phys_erase_shift;
	if (!g_bmt)
	{
		if ( !(g_bmt = init_bmt(nand_chip, bmt_pool_size)) )
		{
			printk("Error: init bmt failed \n");
			return -1;
		}
	}

	if (!g_bbt)
	{
		if ( !(g_bbt = start_init_bbt()) )
		{
			printk("Error: init bbt failed \n");
			return -1;
		}
	}

	if(write_bbt_or_bmt_to_flash() != 0)
	{
		printk("Error: save bbt or bmt to nand failed \n");
		return -1;
	}

	if(create_badblock_table_by_bbt())
	{
		printk("Error: create bad block table failed \n");
		return -1;
	}
	
	mtd->size = nand_logic_size;	
#endif
	
#ifdef CONFIG_MTD_PARTITIONS


		/* Register the partitions */
	if (IS_SPIFLASH) {
		num = ARRAY_SIZE(mt6573_partitions);
		mt6573_partitions[ num-1 ].size = mtd->size;
		add_mtd_partitions(mtd, mt6573_partitions, num);
	}

	//err = add_mtd_partitions(mtd, g_pasStatic_Partition, part_num);
#else

	err = add_mtd_device(mtd);

#endif

#ifdef _MTK_NAND_DUMMY_DRIVER_
    dummy_driver_debug = 0;
#endif

	if (IS_NANDFLASH){
#ifdef TCSUPPORT_DUAL_IMAGE_ENHANCE
		
		offset = mtd->size/2;
		/* OSBNB00043636: to Fix NAND DualImage , tclinux related MTD partition can't be programmed issue 20130313 Byron */
		erase_unit = devinfo.blocksize;
		erase_unit = erase_unit << 10;
		offset = (offset/(erase_unit)*(erase_unit));
		printk("nandinit = offset:%x\n", offset);
		printk("nand_logic_size 0%x ,mtd->size 0x%x erase_unit=0x%x , offset=0x%x \n",nand_logic_size,mtd->size,erase_unit,offset);
#endif
	}	

	/* Successfully!! */
	if (!err)
	{
        MSG(INIT, "[mt6573_nand] probe successfully!\n");
        nand_disable_clock();
		return err;
	}

	/* Fail!! */
out:
	MSG(INIT, "[NFI] mt6573_nand_probe fail, err = %d!\n", err);
	
	nand_release(mtd);
	
	//platform_set_drvdata(pdev, NULL);
	
	kfree(host);

    nand_disable_clock();
	return err;
}


/*NAND Dev*/
/*=======================================================================*/
/* MT6573 NAND                                                           */
/*=======================================================================*/

#define NFI_base    0x1FBE0000
#define NFIECC_base 0x1FBE1000
static struct resource mt6573_resource_nand[] = {
	{
		.start		= NFI_base,
		.end		= NFI_base + 0x220,
		.flags		= IORESOURCE_MEM,
	},
	{
		.start		= NFIECC_base,
		.end		= NFIECC_base + 0x150,
		.flags		= IORESOURCE_MEM,
	},
	{
		.start		= MT6573_NFI_IRQ_LINE,
		.flags		= IORESOURCE_IRQ,
	},
	{
		.start		= MT6573_NFIECC_IRQ_LINE,
		.flags		= IORESOURCE_IRQ,
	},
};

static struct platform_device mt6573_nand_dev = {
    .name = "mt6573-nand",
    .id   = 0,
   	.num_resources	= ARRAY_SIZE(mt6573_resource_nand),
   	.resource		= mt6573_resource_nand,
    .dev            = {
        .platform_data = &mt6573_nand_hw,
    },
};


int mt6573_nand_dev_register(void)
{
	int retval = 0;

    retval = platform_device_register(&mt6573_nand_dev);
    if (retval != 0) {
        printk(KERN_ERR "register nand device fail\n");        
    }
	return retval;

}


/******************************************************************************
 * mt6573_nand_probe
 * 
 * DESCRIPTION:
 *   register the nand device file operations ! 
 * 
 * PARAMETERS: 
 *   struct platform_device *pdev : device structure
 * 
 * RETURNS: 
 *   0 : Success   
 * 
 * NOTES: 
 *   None
 *
 ******************************************************************************/
static int mt6573_nand_probe(struct platform_device *pdev)
{
	struct mt6573_nand_host_hw *hw;		
    struct resource *res = pdev->resource;	
	int err = 0;


 
    hw = (struct mt6573_nand_host_hw*)pdev->dev.platform_data;
    BUG_ON(!hw);

	if (pdev->num_resources != 4 ||
	    res[0].flags != IORESOURCE_MEM || 
	    res[1].flags != IORESOURCE_MEM ||
	    res[2].flags != IORESOURCE_IRQ ||
   	    res[3].flags != IORESOURCE_IRQ)
   	{
		MSG(INIT, "%s: invalid resource type\n", __FUNCTION__);
		return -ENODEV;
	}

	/* Request IO memory */
	if (!request_mem_region(res[0].start,
				            res[0].end - res[0].start + 1, 
				            pdev->name)) 
	{
		return -EBUSY;
	}
	if (!request_mem_region(res[1].start,
				            res[1].end - res[1].start + 1, 
				            pdev->name)) 
	{
		return -EBUSY;
	}
	err = mt6573_nand_setup(hw);
	if(!err){
		platform_set_drvdata(pdev, host);
		
	}
	else{
		platform_set_drvdata(pdev, NULL);
	}
	return err;
}
/******************************************************************************
 * mt6573_nand_suspend
 * 
 * DESCRIPTION:
 *   Suspend the nand device! 
 * 
 * PARAMETERS: 
 *   struct platform_device *pdev : device structure
 * 
 * RETURNS: 
 *   0 : Success
 * 
 * NOTES: 
 *   None
 * 
 ******************************************************************************/
static int mt6573_nand_suspend(struct platform_device *pdev, pm_message_t state)
{
	if (DRV_Reg32(NFI_STA_REG32) & STA_NAND_BUSY)
	{
		MSG(POWERCTL, "[NFI] Busy, Suspend Fail !\n");		
		return 1; // BUSY
	}	

	MSG(POWERCTL, "[NFI] Suspend !\n");
    return 0;
}
/******************************************************************************
 * mt6573_nand_resume
 * 
 * DESCRIPTION:
 *   Resume the nand device! 
 * 
 * PARAMETERS: 
 *   struct platform_device *pdev : device structure
 * 
 * RETURNS: 
 *   0 : Success
 * 
 * NOTES: 
 *   None
 * 
 ******************************************************************************/
static int mt6573_nand_resume(struct platform_device *pdev)
{
	MSG(POWERCTL, "[NFI] Resume !\n");
    return 0;
}
/******************************************************************************
 * mt6573_nand_remove
 * 
 * DESCRIPTION:
 *   unregister the nand device file operations ! 
 * 
 * PARAMETERS: 
 *   struct platform_device *pdev : device structure
 * 
 * RETURNS: 
 *   0 : Success
 * 
 * NOTES: 
 *   None
 * 
 ******************************************************************************/

static int __devexit mt6573_nand_remove(struct platform_device *pdev)
{
	struct mt6573_nand_host *host = platform_get_drvdata(pdev);
	struct mtd_info *mtd = &host->mtd;

	nand_release(mtd);

	kfree(host);

    nand_disable_clock();
	
	return 0;
}

/******************************************************************************
 * NAND OTP operations
 * ***************************************************************************/
#if (NAND_OTP_SUPPORT && SAMSUNG_OTP_SUPPORT)
unsigned int samsung_OTPQueryLength(unsigned int *QLength)
{
    *QLength = SAMSUNG_OTP_PAGE_NUM * g_page_size;
	return 0;
}

unsigned int samsung_OTPRead(unsigned int PageAddr, void *BufferPtr, void *SparePtr)
{
    struct mtd_info *mtd = &host->mtd;
    unsigned int rowaddr, coladdr;
    unsigned int u4Size = g_page_size;
    unsigned int timeout = 0xFFFF;
    unsigned int bRet;
    unsigned int sec_num = mtd->writesize >> 9;

    if(PageAddr >= SAMSUNG_OTP_PAGE_NUM)
    {
        return OTP_ERROR_OVERSCOPE;
    }

    /* Col -> Row; LSB first */
    coladdr = 0x00000000;
    rowaddr = Samsung_OTP_Page[PageAddr];

    MSG(OTP, "[%s]:(COLADDR) [0x%08x]/(ROWADDR)[0x%08x]\n", __func__, coladdr, rowaddr);
nand_get_device((struct nand_chip *)mtd->priv, mtd, FL_READING);
    /* Power on NFI HW component. */
   // nand_enable_clock();

	mt6573_nand_reset();
    (void)mt6573_nand_set_command(0x30);
    mt6573_nand_reset();
    (void)mt6573_nand_set_command(0x65);

    MSG(OTP, "[%s]: Start to read data from OTP area\n", __func__);

    if (!mt6573_nand_reset())
    {
        bRet = OTP_ERROR_RESET;
        goto cleanup;
    }

    mt6573_nand_set_mode(CNFG_OP_READ);
    NFI_SET_REG16(NFI_CNFG_REG16, CNFG_READ_EN);
    DRV_WriteReg16(NFI_CON_REG16, sec_num << CON_NFI_SEC_SHIFT);

    DRV_WriteReg32(NFI_STRADDR_REG32, __virt_to_phys(BufferPtr)); 
    NFI_SET_REG16(NFI_CNFG_REG16, CNFG_AHB);

   if(g_bHwEcc){
    NFI_SET_REG16(NFI_CNFG_REG16, CNFG_HW_ECC_EN);
   	}else{
		NFI_CLN_REG16(NFI_CNFG_REG16, CNFG_HW_ECC_EN);
	}
    mt6573_nand_set_autoformat(true);
	if(g_bHwEcc){
    ECC_Decode_Start();
	}

    if (!mt6573_nand_set_command(NAND_CMD_READ0))
    {
        bRet = OTP_ERROR_BUSY;
        goto cleanup;
    }

    if (!mt6573_nand_set_address(coladdr, rowaddr, 2, 3))
    {
        bRet = OTP_ERROR_BUSY;
        goto cleanup;
    }

    if (!mt6573_nand_set_command(NAND_CMD_READSTART))
    {
        bRet = OTP_ERROR_BUSY;
        goto cleanup;
    }

    if (!mt6573_nand_status_ready(STA_NAND_BUSY))
    {
        bRet = OTP_ERROR_BUSY;
        goto cleanup;
    }

    if (!mt6573_nand_read_page_data(mtd, BufferPtr, u4Size))
    {
        bRet = OTP_ERROR_BUSY;
        goto cleanup;
    }

    if (!mt6573_nand_status_ready(STA_NAND_BUSY))
    {
        bRet = OTP_ERROR_BUSY;
        goto cleanup;
    }

    mt6573_nand_read_fdm_data(SparePtr, sec_num);

    mt6573_nand_stop_read();

    MSG(OTP, "[%s]: End to read data from OTP area\n", __func__);

    bRet = OTP_SUCCESS;

cleanup:

	mt6573_nand_reset();
    (void)mt6573_nand_set_command(0xFF);
	nand_release_device(mtd);
	return bRet;
}

unsigned int samsung_OTPWrite(unsigned int PageAddr, void *BufferPtr, void *SparePtr)
{
    struct mtd_info *mtd = &host->mtd;
    unsigned int rowaddr, coladdr;
    unsigned int u4Size = g_page_size;
    unsigned int timeout = 0xFFFF;
    unsigned int bRet;
    unsigned int sec_num = mtd->writesize >> 9;

    if(PageAddr >= SAMSUNG_OTP_PAGE_NUM)
    {
        return OTP_ERROR_OVERSCOPE;
    }

    /* Col -> Row; LSB first */
    coladdr = 0x00000000;
    rowaddr = Samsung_OTP_Page[PageAddr];

    MSG(OTP, "[%s]:(COLADDR) [0x%08x]/(ROWADDR)[0x%08x]\n", __func__, coladdr, rowaddr);
nand_get_device((struct nand_chip *)mtd->priv, mtd, FL_READING);
	mt6573_nand_reset();
    (void)mt6573_nand_set_command(0x30);
    mt6573_nand_reset();
    (void)mt6573_nand_set_command(0x65);

    MSG(OTP, "[%s]: Start to write data to OTP area\n", __func__);

    if (!mt6573_nand_reset())
    {
		bRet = OTP_ERROR_RESET;
        goto cleanup;
	}

	mt6573_nand_set_mode(CNFG_OP_PRGM);

	NFI_CLN_REG16(NFI_CNFG_REG16, CNFG_READ_EN);

	DRV_WriteReg16(NFI_CON_REG16, sec_num << CON_NFI_SEC_SHIFT);

    DRV_WriteReg32(NFI_STRADDR_REG32, __virt_to_phys(BufferPtr)); 
	NFI_SET_REG16(NFI_CNFG_REG16, CNFG_AHB);

if(g_bHwEcc){
	NFI_SET_REG16(NFI_CNFG_REG16, CNFG_HW_ECC_EN);
}else{
	NFI_CLN_REG16(NFI_CNFG_REG16, CNFG_HW_ECC_EN);
}

	mt6573_nand_set_autoformat(true);

	ECC_Encode_Start();

	if (!mt6573_nand_set_command(NAND_CMD_SEQIN))
    {
        bRet = OTP_ERROR_BUSY;
		goto cleanup;
	}

	if (!mt6573_nand_set_address(coladdr, rowaddr, 2, 3))
    {
        bRet = OTP_ERROR_BUSY;
		goto cleanup;
	}

	if (!mt6573_nand_status_ready(STA_NAND_BUSY))
    {
        bRet = OTP_ERROR_BUSY;
		goto cleanup;
	}

	mt6573_nand_write_fdm_data((struct nand_chip *)mtd->priv, BufferPtr, sec_num);
	(void)mt6573_nand_write_page_data(mtd, BufferPtr, u4Size);
	if(!mt6573_nand_check_RW_count(u4Size))
    {
        MSG(OTP, "[%s]: Check RW count timeout !\n", __func__);
        bRet = OTP_ERROR_TIMEOUT;
        goto cleanup;
    }

	mt6573_nand_stop_write();
    (void)mt6573_nand_set_command(NAND_CMD_PAGEPROG);
	while(DRV_Reg32(NFI_STA_REG32) & STA_NAND_BUSY);

    bRet = OTP_SUCCESS;

    MSG(OTP, "[%s]: End to write data to OTP area\n", __func__);

cleanup:
    mt6573_nand_reset();
    (void)mt6573_nand_set_command(0xFF);
	nand_release_device(mtd);
    return bRet;
}
#endif

#if NAND_OTP_SUPPORT
static int mt_otp_open(struct inode *inode, struct file *filp)
{
	MSG(OTP, "[%s]:(MAJOR)%d:(MINOR)%d\n", __func__, MAJOR(inode->i_rdev), MINOR(inode->i_rdev));
	filp->private_data = (int*)OTP_MAGIC_NUM;
	return 0;
}

static int mt_otp_release(struct inode *inode, struct file *filp)
{
	MSG(OTP, "[%s]:(MAJOR)%d:(MINOR)%d\n", __func__, MAJOR(inode->i_rdev), MINOR(inode->i_rdev));
	return 0;
}

static int mt_otp_access(unsigned int access_type, unsigned int offset, void *buff_ptr, unsigned int length, unsigned int *status)
{
    unsigned int i = 0, ret = 0;
    char *BufAddr = (char *)buff_ptr;
    unsigned int PageAddr, AccessLength=0;
    int Status = 0;

    static char *p_D_Buff = NULL;
    char S_Buff[64];

    if (!(p_D_Buff = kmalloc(g_page_size, GFP_KERNEL)))
    {
        ret = -ENOMEM;
        *status = OTP_ERROR_NOMEM;
        goto exit;
    }

    MSG(OTP, "[%s]: %s (0x%x) length:(%d bytes) !\n", __func__, access_type?"WRITE":"READ", offset, length);

    while(1)
    {
        PageAddr = offset/g_page_size;
        if(FS_OTP_READ == access_type)
        {
            memset(p_D_Buff, 0xff, g_page_size);
            memset(S_Buff, 0xff, (sizeof(char)*64));

            MSG(OTP, "[%s]: Read Access of page (%d)\n",__func__, PageAddr);

            Status = g_mt6573_otp_fuc.OTPRead(PageAddr, p_D_Buff, &S_Buff);
            *status = Status;

            if( OTP_SUCCESS != Status)
            {
                MSG(OTP, "[%s]: Read status (%d)\n", __func__, Status);
                break;
            }

            AccessLength = g_page_size - (offset % g_page_size);

            if(length >= AccessLength)
            {
                memcpy(BufAddr, (p_D_Buff+(offset % g_page_size)), AccessLength);
            }
            else
            {
                //last time
                memcpy(BufAddr, (p_D_Buff+(offset % g_page_size)), length);
            }
        }
        else if(FS_OTP_WRITE == access_type)
        {
            AccessLength = g_page_size - (offset % g_page_size);
            memset(p_D_Buff, 0xff, g_page_size);
            memset(S_Buff, 0xff, (sizeof(char)*64));

            if(length >= AccessLength)
            {
                memcpy((p_D_Buff+(offset % g_page_size)), BufAddr, AccessLength);
            }
            else
            {
                //last time
                memcpy((p_D_Buff+(offset % g_page_size)), BufAddr, length);
            }

            Status = g_mt6573_otp_fuc.OTPWrite(PageAddr, p_D_Buff, &S_Buff);
            *status = Status;

            if( OTP_SUCCESS != Status)
            {
                MSG(OTP, "[%s]: Write status (%d)\n",__func__, Status);
                break;
            }
        }
        else
        {
            MSG(OTP, "[%s]: Error, not either read nor write operations !\n",__func__);
            break;
        }

        offset += AccessLength;
        BufAddr += AccessLength;
        if(length <= AccessLength)
        {
            length = 0;
            break;
        }
        else
        {
            length -= AccessLength;
            MSG(OTP, "[%s]: Remaining %s (%d) !\n",__func__, access_type?"WRITE":"READ", length);
        }
    }
error:
    kfree(p_D_Buff);
exit:
    return ret;
}

static long mt_otp_ioctl(struct inode *inode, struct file *file, unsigned int cmd, unsigned long arg)
{
	int ret = 0, i=0;
	static char *pbuf = NULL;

	void __user *uarg = (void __user *)arg;
    struct otp_ctl otpctl;

    /* Lock */
    spin_lock(&g_OTPLock);

	if (copy_from_user(&otpctl, uarg, sizeof(struct otp_ctl)))
	{
        ret = -EFAULT;
        goto exit;
    }

    if(false == g_bInitDone)
    {
        MSG(OTP, "ERROR: NAND Flash Not initialized !!\n");
        ret = -EFAULT;
        goto exit;
    }

    if (!(pbuf = kmalloc(sizeof(char)*otpctl.Length, GFP_KERNEL)))
    {
        ret = -ENOMEM;
        goto exit;
    }

	switch (cmd)
    {
	case OTP_GET_LENGTH:
        MSG(OTP, "OTP IOCTL: OTP_GET_LENGTH\n");
        g_mt6573_otp_fuc.OTPQueryLength(&otpctl.QLength);
        otpctl.status = OTP_SUCCESS;
        MSG(OTP, "OTP IOCTL: The Length is %d\n", otpctl.QLength);
        break;
    case OTP_READ:
        MSG(OTP, "OTP IOCTL: OTP_READ Offset(0x%x), Length(0x%x) \n", otpctl.Offset, otpctl.Length);
        memset(pbuf, 0xff, sizeof(char)*otpctl.Length);

        mt_otp_access(FS_OTP_READ, otpctl.Offset, pbuf, otpctl.Length, &otpctl.status);

        if (copy_to_user(otpctl.BufferPtr, pbuf, (sizeof(char)*otpctl.Length)))
        {
            MSG(OTP, "OTP IOCTL: Copy to user buffer Error !\n");
            goto error;
        }
        break;
    case OTP_WRITE:
        MSG(OTP, "OTP IOCTL: OTP_WRITE Offset(0x%x), Length(0x%x) \n", otpctl.Offset, otpctl.Length);
        if (copy_from_user(pbuf, otpctl.BufferPtr, (sizeof(char)*otpctl.Length)))
        {
            MSG(OTP, "OTP IOCTL: Copy from user buffer Error !\n");
            goto error;
        }
        mt_otp_access(FS_OTP_WRITE, otpctl.Offset , pbuf, otpctl.Length, &otpctl.status);
        break;
	default:
		ret = -EINVAL;
	}

    ret = copy_to_user(uarg, &otpctl, sizeof(struct otp_ctl));

error:
    kfree(pbuf);
exit:
    spin_unlock(&g_OTPLock);
    return ret;
}

static struct file_operations nand_otp_fops = {
    .owner=      THIS_MODULE,
    .ioctl=      mt_otp_ioctl,
    .open=       mt_otp_open,
    .release=    mt_otp_release,
};

static struct miscdevice nand_otp_dev = {
    .minor   = MISC_DYNAMIC_MINOR,
    .name    = "otp",
    .fops    = &nand_otp_fops,
};
#endif

static struct mtd_info *nandflash_probe(struct map_info *map)
//int __devinit ra_nand_init(void) 
{
	int err = 0;

	printk("tc3162 mtd init: nandflash_probe enter\n");
	
	err = mt6573_nand_setup(&mt6573_nand_hw);
	if(!err){
		return &(host->mtd);
		
	}
	else{
		return NULL;
		
	}
	//#ifdef TCSUPPORT_DUAL_IMAGE_ENHANCE
	//		offset = (1 << ra->flash->chip_shift)/2;
	//#endif

	//return &host->mtd;
}

static void nandflash_destroy(struct mtd_info *mtd)
//static void __devexit ra_nand_remove(void)
{
	//struct mt6573_nand_host *host = platform_get_drvdata(pdev);
	if(host){
		struct mtd_info *mtd = &host->mtd;

		nand_release(mtd);

		kfree(host);
	}

    nand_disable_clock();
	
	
}


static struct mtd_chip_driver nandflash_chipdrv = {
	.probe   = nandflash_probe,
	.destroy = nandflash_destroy,
	.name    = "nandflash_probe",
	.module  = THIS_MODULE
};


/******************************************************************************
Device driver structure
******************************************************************************/
static struct platform_driver mt6573_nand_driver = {
	.probe		= mt6573_nand_probe,
	.remove		= mt6573_nand_remove,
	.suspend	= mt6573_nand_suspend,
	.resume	    = mt6573_nand_resume,
	.driver		= {
		.name	= "mt6573-nand",
		.owner	= THIS_MODULE,
	},
};

int __devinit ra_nand_init(void) 
{
	return platform_driver_register(&mt6573_nand_driver);	
}

void __devexit ra_nand_remove(void)
{
	platform_driver_unregister(&mt6573_nand_driver);
}


/******************************************************************************
 * mt6573_nand_init
 * 
 * DESCRIPTION: 
 *   Init the device driver ! 
 * 
 * PARAMETERS: 
 *   None
 * 
 * RETURNS: 
 *   None
 * 
 * NOTES: 
 *   None
 * 
 ******************************************************************************/
static int __init mt6573_nand_init(void)
{
	struct proc_dir_entry *entry;
	
//#ifdef CONFIG_MTK_MTD_NAND_INTERRUPT_SCHEME	
    // boot up using polling mode
	g_i4Interrupt = 0;      
//#else
//	g_i4Interrupt = 0;
//#endif

	printk("tc3162 mtd init: mt6573_nand_init enter\n");

#if NAND_OTP_SUPPORT
    int err = 0;
    MSG(OTP, "OTP: register NAND OTP device ...\n");
	err = misc_register(&nand_otp_dev);
	if (unlikely(err))
    {
		MSG(OTP, "OTP: failed to register NAND OTP device!\n");
		return err;
	}
	spin_lock_init(&g_OTPLock);
#endif

#if (NAND_OTP_SUPPORT && SAMSUNG_OTP_SUPPORT)
    g_mt6573_otp_fuc.OTPQueryLength = samsung_OTPQueryLength;
    g_mt6573_otp_fuc.OTPRead = samsung_OTPRead;
    g_mt6573_otp_fuc.OTPWrite = samsung_OTPWrite;
#endif


	entry = create_proc_entry(PROCNAME, 0666, NULL);
	if (entry == NULL) 
	{
		MSG(INIT, "MT6573 Nand : unable to create /proc entry\n");
		return -ENOMEM;
	}
	entry->read_proc = mt6573_nand_proc_read;
	entry->write_proc = mt6573_nand_proc_write;
	
#ifdef NAND_ECC_TEST
	entry = create_proc_entry(PROCNAME_ECC, 0666, NULL);
	if (entry == NULL) 
	{
		MSG(INIT, "MT6573 Nand : unable to create /proc entry\n");
		return -ENOMEM;
	}
	entry->read_proc = mt6573_nand_ecc_proc_read;
	entry->write_proc = mt6573_nand_ecc_proc_write;
	//entry->owner = THIS_MODULE;
#endif
	MSG(INIT, "MediaTek MT6573 Nand driver init, version %s\n", VERSION);
	if(IS_SPIFLASH){ //SPI Flash boot
		//return platform_driver_register(&mt6573_nand_driver);
		return mt6573_nand_dev_register();
	}
	else{
		register_mtd_chip_driver(&nandflash_chipdrv);
		return 0;
	}

	
}

/******************************************************************************
 * mt6573_nand_exit
 * 
 * DESCRIPTION: 
 *   Free the device driver ! 
 * 
 * PARAMETERS: 
 *   None
 * 
 * RETURNS: 
 *   None
 * 
 * NOTES: 
 *   None
 * 
 ******************************************************************************/
static void __exit mt6573_nand_exit(void)
{
	MSG(INIT, "MediaTek MT6573 Nand driver exit, version %s\n", VERSION);
	
#if NAND_OTP_SUPPORT
		misc_deregister(&nand_otp_dev);
#endif

#ifdef SAMSUNG_OTP_SUPPORT
	    g_mt6573_otp_fuc.OTPQueryLength = NULL;
	    g_mt6573_otp_fuc.OTPRead = NULL;
	    g_mt6573_otp_fuc.OTPWrite = NULL;
#endif
	if(IS_SPIFLASH){ //SPI FLASH
		//platform_driver_unregister(&mt6573_nand_driver);
	}
	else{
		unregister_mtd_chip_driver(&nandflash_chipdrv);
	}
	remove_proc_entry(PROCNAME, NULL);
	#ifdef NAND_ECC_TEST
	remove_proc_entry(PROCNAME_ECC, NULL);
	#endif
}
 

module_init(mt6573_nand_init);
module_exit(mt6573_nand_exit);
MODULE_LICENSE("GPL");
