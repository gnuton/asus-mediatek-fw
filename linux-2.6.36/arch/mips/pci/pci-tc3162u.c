#include <linux/types.h>
#include <linux/pci.h>
#include <linux/kernel.h>
#include <linux/init.h>
#include <linux/delay.h>
#include <linux/interrupt.h> 
#include <asm/tc3162/tc3162.h>
#include <linux/proc_fs.h>
#include <linux/spinlock.h>

//#define PCIE_DEBUG	1
//#define ESD_DEBUG 1
#ifdef TCSUPPORT_WLAN_MT7592_PCIE
//#define PRE_CONFIG_DEBUG 1//must be close unless for debug

#define MCU_CFG_BASE		0x2000
#define MCU_PCIE_REMAP_1	(MCU_CFG_BASE + 0x500)
#define REMAP_1_OFFSET_MASK (0x3ffff)
#define GET_REMAP_1_OFFSET(p) (((p) & REMAP_1_OFFSET_MASK))
#define REMAP_1_BASE_MASK	(0x3fff << 18)
#define GET_REMAP_1_BASE(p) (((p) & REMAP_1_BASE_MASK) >> 18)
#define MCU_PCIE_REMAP_2	(MCU_CFG_BASE + 0x504)
#define REMAP_2_OFFSET_MASK (0x7ffff)
#define GET_REMAP_2_OFFSET(p) (((p) & REMAP_2_OFFSET_MASK))
#define REMAP_2_BASE_MASK (0x1fff << 19)
#define GET_REMAP_2_BASE(p) (((p) & REMAP_2_BASE_MASK) >> 19)
#endif

#define PCIE_CONFIG_ADDR		0xbfb81cf8
#define PCIE_CONFIG_DATA		0xbfb81cfc
#define AHB_BUS_TIMEOUT_ERR		(1<<25)
#define AHB_BUS_ADDR_ERR		(1<<24)

#define NIC3090_PCIe_DEVICE_ID  0x3090		// 1T/1R miniCard
#define NIC3091_PCIe_DEVICE_ID  0x3091		// 1T/2R miniCard
#define NIC3092_PCIe_DEVICE_ID  0x3092		// 2T/2R miniCard
#define NIC3390_PCIe_DEVICE_ID  0x3390		// 1T/1R miniCard
#define NIC5390_PCIe_DEVICE_ID	0x5390
#define NIC539F_PCIe_DEVICE_ID  0x539F
#define NIC5392_PCIe_DEVICE_ID  0x5392
#define NIC5592_PCIe_DEVICE_ID  0x5592
#define NIC3593_PCIe_DEVICE_ID  0x3593
#define PCIE60901_DEVICE_ID 	0x7510
#define NIC7603_PCIe_DEVICE_ID	0x7603

#define NIC_PCI_VENDOR_ID	0x1814
#define MTK_PCI_VENDOR_ID 	0x14c3

#define PCI_DEVICE_MEM1		0xbf700000
#define PCIE_TYPE_RC		0x0
#define PCIE_TYPE_DEV		0x1

#define PCIE_BUS_0			0x0
#define PCIE_BUS_1			0x1
#define PCIE_BUS_2			0x2
#define PCIE_BUS_3			0x3
#define PCIE_DEV_0			0x0
#define PCIE_DEV_1			0x1
#define PCIE_BUS_RC			0x0
#define PCIE_BUS_DEV		0x1
#define PCIE_DEVNUM_0		0x0
#define PCIE_DEVNUM_1		0x1
#define PCIE_RESET_CON_BUSTIMEOUT 0
#define PCIE_RESET_CON_PCIEERROR 1
#define PCIE_SAVE_BUS_NUM	4
#define PCIE_SAVE_DEVICE_NUM	2
#define ENABLE 1
#define DISABLE 0

#define PHYSADDR(a)	((unsigned int)(a)&0x1fffffff)


#define isRC0_LINKUP		((regRead32(0xbfb82050) & 0x1) ? 1 : 0)
#define isRC1_LINKUP		((regRead32(0xbfb83050) & 0x1) ? 1 : 0)
#define isSLAVERC_LINKUP	((regRead32(0xbfb80050) & 0x1) ? 1 : 0)


struct pci_config_s{	
	int reg;	
	unsigned long int value;
};

#ifdef TCSUPPORT_WLAN_MT7592_PCIE
struct pci_linkpath_s{	
	int rcbusnum;
	int rcdevnum;
	int epbusnum;
	int epdevnum;
};

struct pci_probeinfo_s{	
	char rcindex;
	char flag;
	struct pci_linkpath_s num[2];
};

struct pci_access_s{	
	int busnum;
	int devnum;
	int reg;	
	unsigned long int value;
};
#endif

/**************************Gloabol Value***************************/

#if defined(TCSUPPORT_BONDING)
unsigned long slaveVirBaseAddr = 0;
#endif
extern uint32 pcie_config_addr;
extern uint32 pcie_config_data;

static int ahb_status=0;
static int pcie_soft_patch=1;
static int wifiDeviceId = 0;
int dual_band_support = 0;
static char pcie_reset_condiction = PCIE_RESET_CON_BUSTIMEOUT;
static int pcie_reset_count = 0;
static char rc0_is_exist=0, rc1_is_exist=0;
static DEFINE_SPINLOCK(pcie_esd_lock);
struct pci_config_s *pcie_config_temp[PCIE_SAVE_BUS_NUM][PCIE_SAVE_DEVICE_NUM];//save 4 bus and 2 dev for each bus

#ifdef TCSUPPORT_WLAN_MT7592_PCIE
#define MAX_PRE_CONFIG_NUM 20

enum
{
	MODE0RCBASEADDR = 0,
	MODE1RCBASEADDR = 2,
	MODE2RCBASEADDR = 4,
};

struct pci_config_s pcie_config_table_WiFi_RC0_Special[] =
{
	//single wifi
	//wifi mode :(dual band)
	//linebond mode:(only master wifi)
	{0x18,0x00010100},
	{-1,0},
	//linebond mode:(only slave wifi,dualband)
	{0x18,0x00020100},
	{0x18,0x00020201},
	{-1,0}
};

struct pci_config_s pcie_config_table_WiFi_RC1_Special[] =
{
	//single wifi
	{0x18,0x00010100},
	{-1,0},
	//wifi mode :(dual band)
	//linebond mode:(only master wifi)
	{0x18,0x00020200},
	{-1,0},
	//linebond mode:(dualband)
	{0x18,0x00020100},
	{0x18,0x00030300},
	{-1,0}
};

#ifdef TCSUPPORT_BONDING
struct pci_config_s pcie_config_table_EP[] =
{
	{0x04,0x00100006},{0x10,0x21000000},
	{-1,0}
};

struct pci_config_s pcie_config_table_WiFi_RC_General[] =
{
	//first RC1 and then RC0
	{0x04,0x00100007},{0x20,0x21002100},
	{-1,0},
	{0x04,0x00100007},{0x20,0x21702000},
	{-1,0}
};
struct pci_config_s pcie_config_table_WiFi_RC_Slave_General[] =
{
	//first RC1 and then RC0
	{0x04,0x00100007},{0x20,0x21702100},
	{-1,0},
	{0x04,0x00100007},{0x20,0x21702000},
	{-1,0}
};

struct pci_config_s pcie_config_table_WiFi_RC_Master_General[] =
{
	//first RC1 and then RC0
	{0x04,0x00100007},{0x20,0x21002100},
	{-1,0},
	{0x04,0x00100007},{0x20,0x20002000},
	{-1,0}
};

struct pci_config_s pcie_config_table_EP_DMT[] =
{
	{0x04,0x00100007},{0x10,0x20000000},
	{-1,0}
};

#else
struct pci_config_s pcie_config_table_EP[] =
{
	{0x04,0x00100006},{0x10,0x20000000},
	{-1,0}
};

struct pci_config_s pcie_config_table_WiFi_RC_General[] =
{
	{0x04,0x00100007},{0x20,0x20002000},
	{-1,0}
};

#endif

struct pci_access_s pcie_config_table_temp[MAX_PRE_CONFIG_NUM];

#endif

/**************************function definition***************************/
static void aer_status_dump(void);
extern int pciePhyInit(void);
extern void pcie_phy_force_mode_en(char enable, char rc_num);
void aer_config(int aerEnable);
void pcieResetRC0(void);
void pcieResetRC1(void);
int pcie_timeout_disable(void);
static void aer_status_clear(void);
unsigned long int pcie_read_config_word(unsigned char type, unsigned char bus, unsigned char devnum, unsigned int regnum);
int pcie_write_config_word(unsigned char type, unsigned char bus, unsigned char devnum, unsigned int regnum, unsigned long int value);
int pcie_write_config_byte(unsigned char type, unsigned char bus, unsigned char devnum, unsigned int regnum, unsigned char value);
int pcie_reset_handler(char rc_num);
struct pci_config_s *save_pcie_config(char bus, char dev);
void restore_pcie_config(char bus, char dev, struct pci_config_s* restore_p);



static struct resource tc3162_pcie_io_resource = {
	.name   = "pcie IO space",
#ifdef CONFIG_MIPS_TC3162U
	.start  = 0x1FBD0000,
	.end    = 0x1FBEFFFF,
#endif
#ifdef CONFIG_MIPS_TC3262
	.start  = 0x1F600000,
	.end    = 0x1F61FFFF,
#endif
	.flags  = IORESOURCE_IO
};

static struct resource tc3162_pcie_mem_resource = {
	.name   = "pcie memory space",
	.start  = 0x1F700000,
	.end    = 0x1F8FFFFF,
	.flags  = IORESOURCE_MEM
};

extern struct pci_ops tc3162_pcie_ops;

struct pci_controller tc3162_pcie_controller = {
	.pci_ops   		= &tc3162_pcie_ops,
	.io_resource	= &tc3162_pcie_io_resource,
	.mem_resource	= &tc3162_pcie_mem_resource,
};


#ifdef TCSUPPORT_WLAN_MT7592_PCIE
unsigned long wifi_csr_addr = 0;
#ifdef TCSUPPORT_BONDING
unsigned long mappingaddr = 0;
#endif
#define RTMP_IO_READ32(_A, _R, _pV)	\
{		\
	(*_pV = readl((void *)((_A) + (_R))));			\
}

#define RTMP_IO_WRITE32(_A, _R, _V)		\
{		\
	writel((_V), (void *)((_A) + (_R)));\
}

void GlobalCRWrite(unsigned char* baseAddr, unsigned long Offset, unsigned long Value)
{
	unsigned long RemapBase, RemapOffset;
	unsigned long RestoreValue;

	RTMP_IO_READ32(baseAddr, MCU_PCIE_REMAP_1, &RestoreValue);
	RemapBase = GET_REMAP_1_BASE(Offset) << 18;
	RemapOffset = GET_REMAP_1_OFFSET(Offset);
	RTMP_IO_WRITE32(baseAddr, MCU_PCIE_REMAP_1, RemapBase);
	RTMP_IO_WRITE32(baseAddr, 0x40000 + RemapOffset, Value);

	RTMP_IO_WRITE32(baseAddr, MCU_PCIE_REMAP_1, RestoreValue);
}

void GlobalCRRead(unsigned char* baseAddr, unsigned long Offset, unsigned long *Value)
{
	unsigned long RemapBase, RemapOffset;
	unsigned long RestoreValue;

	RTMP_IO_READ32(baseAddr, MCU_PCIE_REMAP_1, &RestoreValue);
	RemapBase = GET_REMAP_1_BASE(Offset) << 18;
	RemapOffset = GET_REMAP_1_OFFSET(Offset);
	RTMP_IO_WRITE32(baseAddr, MCU_PCIE_REMAP_1, RemapBase);
	RTMP_IO_READ32(baseAddr, 0x40000 + RemapOffset, Value);

	RTMP_IO_WRITE32(baseAddr, MCU_PCIE_REMAP_1, RestoreValue);
}

void RecoverInitialValue()
{
	struct pci_access_s * config_p = &pcie_config_table_temp[0];
	int i = 0;
#ifdef PRE_CONFIG_DEBUG	
	printk("\r\n====RecoverInitValue====\r\n");
#endif
	while((i < MAX_PRE_CONFIG_NUM) && ((*(config_p + (i))).reg != 0)){
#ifdef PRE_CONFIG_DEBUG				
		printk("[write]pre config bus %x dev %x reg %x value %lx \n", (*(config_p + i)).busnum,(*(config_p + i)).devnum,(*(config_p + i)).reg, (*(config_p + i)).value);
#endif	
		pcie_write_config_word(PCIE_TYPE_DEV,  (*(config_p + i)).busnum, (*(config_p + i)).devnum, (*(config_p + i)).reg, (*(config_p + i)).value);
		memset((config_p + (i)),0,sizeof(struct pci_access_s ));
		i++;
	}
}

/*we config RC first and then read EP info,if wifichip==0x7603 then config EP*/
int RegConfigFunc(struct pci_probeinfo_s* pre_info, struct pci_config_s* pre_config_RC_S)
{
	int i = 0,j = 0,k = 0,m = 0;
	int wifiDevice;
	int rcnum = pre_info->rcindex;
	int rcbusindex = pre_info->num[0].rcbusnum;
	int rcdevindex = pre_info->num[0].rcdevnum;
	int epbusindex = pre_info->num[0].epbusnum;
	int epdevindex = pre_info->num[0].epdevnum;
	struct pci_config_s* pre_config_RC_G = &pcie_config_table_WiFi_RC_General[0];
	struct pci_config_s* pre_config_EP = &pcie_config_table_EP[0];
	#ifdef TCSUPPORT_BONDING
	struct pci_config_s* pre_config_EP_DMT;
	#endif
	/*step1: config RC special register to led data pass RC to EP*/
	while((*(pre_config_RC_S + (i))).reg != -1){		
		if(i >= MAX_PRE_CONFIG_NUM)
		{
			#ifdef PRE_CONFIG_DEBUG
			printk("\r\n pcie_config_table_temp is not enough");
			#endif
			RecoverInitialValue();
			i = 0;
		}
		pcie_config_table_temp[i].busnum = rcbusindex;
		pcie_config_table_temp[i].devnum = rcdevindex;
		pcie_config_table_temp[i].reg = (*(pre_config_RC_S + i)).reg;
		pcie_config_table_temp[i].value =  pcie_read_config_word(PCIE_TYPE_DEV, rcbusindex,rcdevindex, (*(pre_config_RC_S + i)).reg);

		pcie_write_config_word(PCIE_TYPE_DEV,  rcbusindex, rcdevindex, (*(pre_config_RC_S + i)).reg, (*(pre_config_RC_S + i)).value);
#ifdef PRE_CONFIG_DEBUG				
		printk("[Config RC]pre config bus %x dev %x reg %x value %lx \n", rcbusindex,rcdevindex,(*(pre_config_RC_S + i)).reg, (*(pre_config_RC_S + i)).value);
#endif		
		i++;
#ifdef TCSUPPORT_BONDING
		if(--rcnum > 0)
		{
			rcbusindex = pre_info->num[i].rcbusnum;
			rcdevindex = pre_info->num[i].rcdevnum;
		}
#endif
	}	
	
	/*step2: read EP CHIP info,if not 7603,just return*/
	wifiDevice = pcie_read_config_word(PCIE_TYPE_DEV,  epbusindex,epdevindex, 0) >> 16;
#ifdef PRE_CONFIG_DEBUG		
	printk("[read device id]wifi config bus %x dev %x value %lx \n",epbusindex,epdevindex, pcie_read_config_word(PCIE_TYPE_DEV, epbusindex, epdevindex, 0));
#endif
	if(0x7603 != wifiDevice)
	{
		RecoverInitialValue();
		#ifdef PRE_CONFIG_DEBUG	
		printk("\r\n not 7592 wifi,so just return");
		#endif
		return -1;
	}

	/*step3: config RC general register*/
	#ifdef TCSUPPORT_BONDING
	if(1 ==  pre_info->flag)
		pre_config_RC_G = &pcie_config_table_WiFi_RC_Slave_General[0];
	else if(2 ==  pre_info->flag)
		pre_config_RC_G = &pcie_config_table_WiFi_RC_Master_General[0];
	#endif
	
	m = pre_info->rcindex;
	while(--m >= 0)
	{
		while((*(pre_config_RC_G + (k))).reg != -1){		
		if(i >= MAX_PRE_CONFIG_NUM)
		{
			#ifdef PRE_CONFIG_DEBUG
			printk("\r\n pcie_config_table_temp is not enough");
			#endif
			RecoverInitialValue();
			i = 0;
		}
			pcie_config_table_temp[i].busnum = rcbusindex;
			pcie_config_table_temp[i].devnum = rcdevindex;
			pcie_config_table_temp[i].reg = (*(pre_config_RC_G + k)).reg;
			pcie_config_table_temp[i].value =  pcie_read_config_word(PCIE_TYPE_DEV, rcbusindex,rcdevindex, (*(pre_config_RC_G + k)).reg);
	
			pcie_write_config_word(PCIE_TYPE_DEV,  rcbusindex, rcdevindex, (*(pre_config_RC_G + k)).reg, (*(pre_config_RC_G + k)).value);
#ifdef PRE_CONFIG_DEBUG				
			printk("[Config RC]pre config bus %x dev %x reg %x value %lx \n", rcbusindex,rcdevindex,(*(pre_config_RC_G + k)).reg, (*(pre_config_RC_G + k)).value);
#endif		
			k++;
			i++;
		}
		#ifdef TCSUPPORT_BONDING
		if(m > 0)
		{
			k++;
			rcbusindex = pre_info->num[m-1].rcbusnum;
			rcdevindex = pre_info->num[m-1].rcdevnum;
		}
		#endif
	};
	
#ifdef TCSUPPORT_BONDING
	if(1 ==  pre_info->flag)
	{
		pre_config_EP_DMT = &pcie_config_table_EP_DMT[0];
		m = 0;
	/*step4: config EP dmt general register,only for linebond dual band and 7592 in slave ep*/
		while((*(pre_config_EP_DMT + (m))).reg != -1){		
				if(i >= MAX_PRE_CONFIG_NUM)
				{
					#ifdef PRE_CONFIG_DEBUG
					printk("\r\n pcie_config_table_temp is not enough");
					#endif
					RecoverInitialValue();
					i = 0;
				}
				pcie_config_table_temp[i].busnum = 1;
				pcie_config_table_temp[i].devnum = 0;
				pcie_config_table_temp[i].reg = (*(pre_config_EP_DMT + m)).reg;
				pcie_config_table_temp[i].value =  pcie_read_config_word(PCIE_TYPE_DEV, 1, 0, (*(pre_config_EP_DMT + m)).reg);
		
				pcie_write_config_word(PCIE_TYPE_DEV,  1, 0, (*(pre_config_EP_DMT + m)).reg, (*(pre_config_EP_DMT + m)).value);
#ifdef PRE_CONFIG_DEBUG				
				printk("[Config EP]pre config bus %x dev %x reg %x value %lx \n", 1,0,(*(pre_config_EP_DMT + m)).reg, (*(pre_config_EP_DMT + m)).value);
#endif		
				i++;
				m++;	
		}
		mappingaddr = 0x20000000;
	}
	else
	{
		mappingaddr = 0x21000000;
	}
#endif

	/*step5: config EP general register*/
	while((*(pre_config_EP + (j))).reg != -1){		
			if(i >= MAX_PRE_CONFIG_NUM)
			{
			#ifdef PRE_CONFIG_DEBUG
			printk("\r\n pcie_config_table_temp is not enough");
			#endif
				RecoverInitialValue();
				i = 0;
			}
				
			pcie_config_table_temp[i].busnum = epbusindex;
			pcie_config_table_temp[i].devnum = epdevindex;
			pcie_config_table_temp[i].reg = (*(pre_config_EP + j)).reg;
			pcie_config_table_temp[i].value =  pcie_read_config_word(PCIE_TYPE_DEV, epbusindex, epdevindex, (*(pre_config_EP + j)).reg);
	
			pcie_write_config_word(PCIE_TYPE_DEV,  epbusindex, epdevindex, (*(pre_config_EP + j)).reg, (*(pre_config_EP + j)).value);
#ifdef PRE_CONFIG_DEBUG				
			printk("[Config EP]pre config bus %x dev %x reg %x value %lx \n", epbusindex,epdevindex,(*(pre_config_EP + j)).reg, (*(pre_config_EP + j)).value);
#endif		
			i++;
			j++;	
		}

	
#ifdef PRE_CONFIG_DEBUG 
	printk("\r\nsave total index is %d",i);
#endif

	return 0;
}

int pciePreConfigReg()
{
	int preconfigflag = -1;
	int preconfigtemp = -1;
	int rctempflag = 0;
	struct pci_probeinfo_s preinfo;
	struct pci_config_s* pre_config_RC_S;
	/*
		preconfigflag
		0:single wifi(include dual band with only one wifi)
		1:wifi mode((dual band) and (lineband mode with only master wifi))
		2:linebond mode(only slave wifi)
		3:linebond mode(dual band)
	*/
	memset(&preinfo,0,sizeof(struct pci_probeinfo_s));
	if(isMT751020 || isRT63368)
	{	
		if(dual_band_support)
		{
			#ifdef TCSUPPORT_BONDING
			rctempflag = (isRC0_LINKUP)|(isRC1_LINKUP<<1)|(isSLAVERC_LINKUP<<2);
			#else
			rctempflag = (isRC0_LINKUP)|(isRC1_LINKUP<<1);
			#endif
			switch (rctempflag)
			{
			#ifdef TCSUPPORT_BONDING
				case 3:
					//master wifi
					preconfigflag = 1;
					break;
				case 5:
					//slave wifi
					preconfigflag = 2;
					break;
				case 7:
					//dual band
					preconfigflag = 3;
					break;
			#else
				case 1:
				case 2:	
					//one wifi
					preconfigflag = 0;
					break;
				case 3:
					//dual band
					preconfigflag = 1;
					break;

			#endif
				default:
					break;
			}			
		}
		else
		{
			if(isRC0_LINKUP)
				preconfigflag = 0;
		}
	}
	else if(isRT63365)
	{
		if(isRC0_LINKUP)
			preconfigflag = 0;
	}

	
#ifdef PRE_CONFIG_DEBUG	
	printk("preconfigflag =%d\n",preconfigflag);
#endif
	preinfo.rcindex = 1;
	switch (preconfigflag)
	{
		case 0:
			preinfo.num[0].rcbusnum = PCIE_BUS_0;
			preinfo.num[0].rcdevnum = PCIE_DEV_0;
			preinfo.num[0].epbusnum = PCIE_BUS_1;
			preinfo.num[0].epdevnum = PCIE_DEV_0;
			pre_config_RC_S = &pcie_config_table_WiFi_RC0_Special[MODE0RCBASEADDR];
			preconfigtemp =  RegConfigFunc(&preinfo,pre_config_RC_S);
			break;
		case 1:
			#ifndef TCSUPPORT_BONDING
			preinfo.num[0].rcbusnum = PCIE_BUS_0;
			preinfo.num[0].rcdevnum = PCIE_DEV_0;
			preinfo.num[0].epbusnum = PCIE_BUS_1;
			preinfo.num[0].epdevnum = PCIE_DEV_0;
			pre_config_RC_S = &pcie_config_table_WiFi_RC0_Special[MODE0RCBASEADDR];
			preconfigtemp =  RegConfigFunc(&preinfo,pre_config_RC_S);
			if(!preconfigtemp)
				return;
			#endif
			preinfo.num[0].rcbusnum = PCIE_BUS_0;
			preinfo.num[0].rcdevnum = PCIE_DEV_1;
			preinfo.num[0].epbusnum = PCIE_BUS_2;
			preinfo.num[0].epdevnum = PCIE_DEV_0;
			pre_config_RC_S = &pcie_config_table_WiFi_RC1_Special[MODE1RCBASEADDR];
			preconfigtemp =  RegConfigFunc(&preinfo,pre_config_RC_S);
			break;
		#ifdef TCSUPPORT_BONDING	
		case 2:
			preinfo.rcindex = 2;
			preinfo.flag = 1;
			preinfo.num[0].rcbusnum = PCIE_BUS_0;
			preinfo.num[0].rcdevnum = PCIE_DEV_0;
			preinfo.num[1].rcbusnum = PCIE_BUS_1;
			preinfo.num[1].rcdevnum = PCIE_DEV_1;
			preinfo.num[0].epbusnum = PCIE_BUS_2;
			preinfo.num[0].epdevnum = PCIE_DEV_0;
			pre_config_RC_S = &pcie_config_table_WiFi_RC0_Special[MODE1RCBASEADDR];
			preconfigtemp =  RegConfigFunc(&preinfo,pre_config_RC_S);
			break;
		case 3:
			preinfo.flag = 1;
			preinfo.rcindex = 2;
			preinfo.num[0].rcbusnum = PCIE_BUS_0;
			preinfo.num[0].rcdevnum = PCIE_DEV_0;
			preinfo.num[1].rcbusnum = PCIE_BUS_1;
			preinfo.num[1].rcdevnum = PCIE_DEV_1;
			preinfo.num[0].epbusnum = PCIE_BUS_2;
			preinfo.num[0].epdevnum = PCIE_DEV_0;
			pre_config_RC_S = &pcie_config_table_WiFi_RC0_Special[MODE1RCBASEADDR];
			preconfigtemp =  RegConfigFunc(&preinfo,pre_config_RC_S);
			if(!preconfigtemp)
				return;
			
			preinfo.flag = 2;
			preinfo.num[0].rcbusnum = PCIE_BUS_0;
			preinfo.num[0].rcdevnum = PCIE_DEV_0;
			preinfo.num[1].rcbusnum = PCIE_BUS_0;
			preinfo.num[1].rcdevnum = PCIE_DEV_1;
			preinfo.num[0].epbusnum = PCIE_BUS_3;
			preinfo.num[0].epdevnum = PCIE_DEV_0;
			pre_config_RC_S = &pcie_config_table_WiFi_RC1_Special[MODE2RCBASEADDR];
			preconfigtemp =  RegConfigFunc(&preinfo,pre_config_RC_S);
			break;
		#endif
		default:
		#ifdef PRE_CONFIG_DEBUG	
			printk("\r\nflag not support:%d",preconfigflag);
		#endif
			preconfigtemp = -2;
			break;
	}

#ifdef PRE_CONFIG_DEBUG	
		printk("\r\nreturn preconfigflag =%d\n",preconfigflag);
#endif

	return preconfigtemp;
}

void SetLDO()
{
	
	unsigned int Value1 = 0;
	unsigned int Value2 = 0;
	int cnt = 10;
	unsigned char *baseAddr = (unsigned char *)wifi_csr_addr;
	
	while(cnt--){
		GlobalCRWrite(baseAddr, 0x50012498, 0x5);
		GlobalCRRead(baseAddr, 0x50012498, &Value1);
		if(Value1 == 0x5) //Setting success
			break;		
	}

	if(Value1 != 0x5){
		printk("Wifi CR 0x%x value setting fail(Value=0x%x)\n", 0x50012498, Value1);
	}

	while(cnt--){
		GlobalCRWrite(baseAddr, 0x50012040, 0x80);
		GlobalCRRead(baseAddr, 0x50012040, &Value2);
		if(Value2 == 0x80) //Setting success
			break;		
	}

	if(Value2 != 0x80){
		printk("Wifi CR 0x%x value setting fail(Value=0x%x)\n", 0x50012040, Value2);
	}

	printk("CR 0x%x value is 0x%x\n", 0x50012498, Value1);
	printk("CR 0x%x value is 0x%x\n", 0x50012040, Value2);	
}

void preConfigLDO()
{	
	int i,preconfigflag;
	for(i = 0;i < MAX_PRE_CONFIG_NUM; i++)
	{	
		memset(&pcie_config_table_temp[i],0,sizeof(struct pci_access_s ));
	}
	preconfigflag = pciePreConfigReg();
	if(!preconfigflag)
	{
#ifdef TCSUPPORT_BONDING
		wifi_csr_addr = (unsigned long)ioremap(mappingaddr,0x100000);
#else
		wifi_csr_addr = (unsigned long)ioremap(0x20000000,0x100000);
#endif
		SetLDO();
		RecoverInitialValue();
		iounmap((char *)wifi_csr_addr);
	}
}
#endif

struct pci_config_s *save_pcie_config(char bus, char dev){	
	int reco_reg[]= {0x4, 0xc, 0x10, 0x18, 0x1c, 0x20, 0x24, 0x30, 0x3c, 0x54, -1};	
	int i, num_reg;	
	struct pci_config_s * ret_p;
#ifdef ESD_DEBUG	
	printk("save pcie config bus %d dev %d\n",bus,dev);
#endif	
	i = 0;	
	num_reg = 0;

	if(pcie_read_config_word(PCIE_TYPE_RC, bus, dev, 0) == 0xffffffff)//means no device 
		return NULL;
	
	while(reco_reg[num_reg++] != -1){}; // caclute total reg_num	
	ret_p = (struct pci_config_s *)kzalloc(sizeof(struct pci_config_s) * num_reg ,GFP_KERNEL);	
	if(ret_p == NULL)			
		return NULL;	
	for(i=0; i<num_reg; i++){		
		(*(ret_p + i)).reg = reco_reg[i];		
		if(reco_reg[i] != -1){				
			(*(ret_p + i)).value= pcie_read_config_word(PCIE_TYPE_RC, bus, dev, reco_reg[i]);
#ifdef ESD_DEBUG						
			printk("reg %x value %lx\n",(*(ret_p + i)).reg,(*(ret_p + i)).value);
#endif		
		}		
	}			
	return ret_p;	
}
void restore_pcie_config(char bus, char dev, struct pci_config_s* restore_p){	
	int i;
#ifdef ESD_DEBUG	
	printk("restore pcie config bus %d dev %d\n", bus, dev);
#endif	
	if(restore_p == NULL){		
		printk("Recover BUS %d DEV %d Faill !!\n",bus,dev);		
		return;	
	}		
	i = 0;	
	while((*(restore_p + (i))).reg != -1){		
		pcie_write_config_word(PCIE_TYPE_DEV, bus, dev, (*(restore_p + i)).reg, (*(restore_p + i)).value);
#ifdef ESD_DEBUG				
		printk("restore reg %x value %lx \n", (*(restore_p + i)).reg, (*(restore_p + i)).value);
#endif		
		i++;	
	}	

}
void pcie_int_enable(char enable, char rc_num){
	unsigned long int tmp;
	
	if(enable == ENABLE){
		if(rc_num == 0){//Enable Interrupt
			if(isMT751020){
				tmp = regRead32(0xbfb8000c);
#if defined(TCSUPPORT_BONDING)
				/* slave dmt, error interrupt, slave gdma */
				tmp |= ((1<<23) | (1<<24) | (1<<25));
#else
				tmp |= (1<<20);
#endif
				regWrite32(0xbfb8000c, tmp);
			}	
		}else{//only need rc0 or 1
			if(isMT751020){
				tmp = regRead32(0xbfb8000c);
				tmp |= (1<<26);
				regWrite32(0xbfb8000c, tmp);
			}	
		}
	}else{//Disable Interrupt
		if(rc_num == 0){
			if(isMT751020){
				tmp = regRead32(0xbfb8000c);
#if defined(TCSUPPORT_BONDING)
				/* slave dmt, error interrupt, slave gdma */
				tmp &= ~((1<<23) | (1<<24) | (1<<25));
#else
				tmp &= ~(1<<20);
#endif
				regWrite32(0xbfb8000c, tmp);
			}
		}else{
			if(isMT751020){
				tmp = regRead32(0xbfb8000c);
				tmp &= ~(1<<26);
				regWrite32(0xbfb8000c, tmp);
			}
		}	
	}
}

int pcie_reset_handler(char rc_num){
		int wifi_dev_bus_id = 1;

		if((rc_num == 0) || (rc_num == 2)){		
			pcie_reset_count ++;
			aer_config(0);
			pcieResetRC0();
			if(isRC0_LINKUP){
				restore_pcie_config(PCIE_BUS_0, PCIE_DEV_0, pcie_config_temp[PCIE_BUS_0][PCIE_DEV_0]);
				restore_pcie_config(PCIE_BUS_1, PCIE_DEV_0, pcie_config_temp[PCIE_BUS_1][PCIE_DEV_0]);
#if defined(TCSUPPORT_BONDING)
				if(isSLAVERC_LINKUP){
					wifi_dev_bus_id++;
					restore_pcie_config(PCIE_BUS_1, PCIE_DEV_1, pcie_config_temp[PCIE_BUS_1][PCIE_DEV_1]);//slave RC
					restore_pcie_config(wifi_dev_bus_id, PCIE_DEV_0, pcie_config_temp[wifi_dev_bus_id][PCIE_DEV_0]);//slave WIFI
				}else{
					wifi_dev_bus_id = -1; //no wifi
				}	
#endif
				if(wifi_dev_bus_id != -1){
					wifiDeviceId = pcie_read_config_word(PCIE_TYPE_DEV, wifi_dev_bus_id, PCIE_DEV_0, 0) >> 16;
#ifdef ESD_DEBUG					
					printk("wifi DeviceID %x\n",wifiDeviceId);
#endif
				}	
				pcie_int_enable(ENABLE, 0);
				pcie_timeout_disable();
				aer_status_clear();
				aer_config(1);
			}else{
				printk("RC0 Dead\n");
				return -1;
			}	
			#if defined(TCSUPPORT_CPU_RT63368) ||defined(TCSUPPORT_CPU_MT7520) || defined(TCSUPPORT_CPU_MT7510)|| defined(TCSUPPORT_CPU_MT7505)
			#ifdef TCSUPPORT_WLAN_MT7592_PCIE
			if(0x7603 == wifiDeviceId)
				preConfigLDO();
			#endif
			#endif
		}else if(rc_num == 1){		
			pcie_reset_count ++;
			aer_config(0);
			pcieResetRC1();
			if(isRC1_LINKUP){
				restore_pcie_config(PCIE_BUS_0, PCIE_DEV_1, pcie_config_temp[PCIE_BUS_0][PCIE_DEV_1]);
				if(isRC0_LINKUP){
					wifi_dev_bus_id++;
#if defined(TCSUPPORT_BONDING)					
					if(isSLAVERC_LINKUP){
						wifi_dev_bus_id++;
						restore_pcie_config(wifi_dev_bus_id, PCIE_DEV_0, pcie_config_temp[wifi_dev_bus_id][PCIE_DEV_0]);
					}else
#endif					
					{
						restore_pcie_config(wifi_dev_bus_id, PCIE_DEV_0, pcie_config_temp[wifi_dev_bus_id][PCIE_DEV_0]);
					}
				}else{
					restore_pcie_config(wifi_dev_bus_id, PCIE_DEV_0, pcie_config_temp[wifi_dev_bus_id][PCIE_DEV_0]);
				}
				if(wifi_dev_bus_id != -1){
					wifiDeviceId = pcie_read_config_word(PCIE_TYPE_DEV, wifi_dev_bus_id, PCIE_DEV_0, 0) >> 16;
#ifdef ESD_DEBUG					
					printk("wifi DeviceID %x\n",wifiDeviceId);
#endif
				}
				pcie_int_enable(ENABLE, 1);
				pcie_timeout_disable();
				aer_status_clear();
				aer_config(1);
			}else{
				printk("RC1 Dead\n");
				
				return -1;
			}
			#if defined(TCSUPPORT_CPU_RT63368) ||defined(TCSUPPORT_CPU_MT7520) || defined(TCSUPPORT_CPU_MT7510)|| defined(TCSUPPORT_CPU_MT7505)
			#ifdef TCSUPPORT_WLAN_MT7592_PCIE
			if(0x7603 == wifiDeviceId)
				preConfigLDO();
			#endif
			#endif
		}else{
			printk("RC ID %d Fail\n",rc_num);
			return -1;
		}


		return 0;
}	

void pcie_mt7510_reset(){
	if(rc0_is_exist)
		pcie_reset_handler(0);
	if(rc1_is_exist)
		pcie_reset_handler(1);
	return;
}
EXPORT_SYMBOL(pcie_mt7510_reset);

void pcie_check(char force){
	uint32 val, addr;
	unsigned long flags;
	char need_reset = 0;

	if(pcie_soft_patch == 0){
		return;
	}

	spin_lock_irqsave(&pcie_esd_lock, flags);	
	if(pcie_reset_condiction == PCIE_RESET_CON_BUSTIMEOUT){
		//Read Config 0 for RC0/RC1 to generate Bustime out
		if(force == 0){
			if(rc0_is_exist){
				val = regRead32(0xbfb82034);
			}	
			if(rc1_is_exist){
				val = regRead32(0xbfb83034);	
			}
			if(regRead32(CR_PRATIR)){
				//bus timeout happened
				addr = regRead32(CR_ERR_ADDR);
				if(((addr >= 0x1fb80000) && (addr <= 0x1fb83fff)) 
					|| ((addr >= 0x20000000) && (addr <= 0x2fffffff)) )
				{
					regWrite32(CR_PRATIR, 0);
					printk("check bustimeout and reset %lx\n",addr);
					need_reset = 1;
				}
			}	
		}else{
			addr = regRead32(CR_ERR_ADDR);
			if(((addr >= 0x1fb80000) && (addr <= 0x1fb83fff)) 
				|| ((addr >= 0x20000000) && (addr <= 0x2fffffff)) )
			{
				regWrite32(CR_PRATIR, 0);
				printk("bustimeout int and reset %lx\n",addr);
				need_reset = 1;
			}
		}	

		if(need_reset){	
			if(rc0_is_exist){
				if(pcie_reset_handler(0) == 0){
					ahb_status = 1;
				}
			}	
			if(rc1_is_exist){
				if(pcie_reset_handler(1) == 0){
					ahb_status = 1;
				}
			}	
		}
	}else if(pcie_reset_condiction == PCIE_RESET_CON_PCIEERROR){
		val = regRead32(0xbfb80060);
		if((val & (1<<1)) != 0){
			regWrite32(0xbfb82070, 1); //clear interrupt status
			regWrite32(0xbfb82070, 0); //set interrupt status
		
			if(pcie_reset_handler(0) == 0){
				ahb_status = 1;
			}
		}
		if((val & (1<<2)) != 0){
			regWrite32(0xbfb83070, 1); //clear interrupt status
			regWrite32(0xbfb83070, 0); //set interrupt status

			if(pcie_reset_handler(1) == 0){
				ahb_status = 1;
			}
			
		}
#if defined(TCSUPPORT_BONDING)	
		if((val & (1<<0)) != 0){
			if(slaveVirBaseAddr == 0){
				spin_unlock_irqrestore(&pcie_esd_lock, flags);
				printk("No slaveVirBaseAddr\n");
				return;
			}	
			regWrite32(slaveVirBaseAddr + 0xb83070, 1); //clear interrupt status
			regWrite32(slaveVirBaseAddr + 0xb83070, 0); //set interrupt status
		
			if(pcie_reset_handler(2) == 0){
				ahb_status = 1;
			}
		}
#endif
	}
	spin_unlock_irqrestore(&pcie_esd_lock, flags);
	return;
}

void setahbstat(int val){		
	ahb_status = val;
}
EXPORT_SYMBOL(setahbstat);


void pcieReset(void){	
	int i;
	unsigned long tmp;
	
	if(isRT63165){
		return;		
	}
	if(isRT63365){
		//disable interrupt
		if(dual_band_support){
			tmp = regRead32(0xbfb8000c);
			regWrite32(0xbfb8000c, (tmp & (~((1<<20) | (1<<21)) )));
		}else{
			tmp = regRead32(0xbfb8000c);
			regWrite32(0xbfb8000c, (tmp & ~(1<<20)));
		}	
		mdelay(5);
		//PCI-E reset
		if (isFPGA) {		
			//FPGA mode
			tmp = regRead32(0xbfb00834);
			regWrite32(0xbfb00834, (tmp & ~(1<<26)));
			mdelay(1);
			tmp = regRead32(0xbfb00834);
			regWrite32(0xbfb00834, (tmp | (1<<26)));
			mdelay(1);
		}else{	
			//rt63368 enable pci-e port1 and port1 do not have power will cause hang. shnwind.
			if(dual_band_support){
				tmp = regRead32(0xbfb00834);
				regWrite32(0xbfb00834, (tmp | ((1<<26) | (1<<27) | (1<<29))));
				mdelay(1);
				tmp = regRead32(0xbfb00834);
				regWrite32(0xbfb00834, (tmp &  (~((1<<26) | (1<<27) | (1<<29)))));
				mdelay(1);
			}else{
				tmp = regRead32(0xbfb00834);
				regWrite32(0xbfb00834, (tmp | ((1<<26) | (1<<29))));
				mdelay(1);
				tmp = regRead32(0xbfb00834);
				regWrite32(0xbfb00834, (tmp & (~((1<<26) | (1<<29)))));

				mdelay(1);
			}	
		}		

		tmp = regRead32(0xbfb80000);
		regWrite32(0xbfb80000, (tmp | (1<<1)));
		mdelay(1);
		tmp = regRead32(0xbfb80000);
		regWrite32(0xbfb80000, (tmp & ~(1<<1)));
		mdelay(1);
		//wait device link up
		for(i=0 ; i<1000 ; i++){
			mdelay(1);
			if(dual_band_support){
				if(isRC0_LINKUP || isRC1_LINKUP){
					break;
				}	
			}else{
				if(isRC0_LINKUP){
					break;
				}
			}	
		}
		if(i == 1000){
			printk("PCI-E RC can not link up\n");
			return ;
		}
		if(dual_band_support){		
			if(isRC0_LINKUP){
				//config PCI-E RC
				regWrite32(0xbfb82010, 0xffff0001); //disable support BAR0

				//change class PCI-PCI Bridge
				regWrite32(0xbfb82034, 0x06040001);
			}else{
				//disable port 0
				tmp = regRead32(0xbfb00088);
				regWrite32(0xbfb00088, (tmp & ~(1<<23)));
				mdelay(1);
			}

			if(isRC1_LINKUP){
				//config PCI-E RC
				regWrite32(0xbfb83010, 0xffff0001); //disable support BAR0

				//change class PCI-PCI Bridge
				regWrite32(0xbfb83034, 0x06040001);
			}else{
				//disable port 1
				tmp = regRead32(0xbfb00088);
				regWrite32(0xbfb00088, (tmp & ~(1<<22)));
				mdelay(1);
			}
		}else{
			//config PCI-E RC
			regWrite32(0xbfb82010, 0xffff0001); //disable support BAR0

			//change class PCI-PCI Bridge
			regWrite32(0xbfb82034, 0x06040001);
		}	
		
		//Enable CRC count .
		regWrite32(KSEG1ADDR(pcie_config_addr), 0x118);
		tmp = regRead32(KSEG1ADDR(pcie_config_data));
		regWrite32(KSEG1ADDR(pcie_config_data), (tmp | (1<<8)));

	}else{
		tmp = regRead32(CR_AHB_PCIC);
		regWrite32(CR_AHB_PCIC, (tmp & ~(1<<29)));
		mdelay(5);
		tmp = regRead32(CR_AHB_PCIC);
		regWrite32(CR_AHB_PCIC, (tmp & ~(1<<30)));
		mdelay(5);
		tmp = regRead32(CR_AHB_PCIC);
		regWrite32(CR_AHB_PCIC, (tmp | (1<<29)));
		mdelay(5);
		tmp = regRead32(CR_AHB_PCIC);
		regWrite32(CR_AHB_PCIC, (tmp | (1<<30)));
		mdelay(5);
		/*force link up, workaround the pcie hardware problems.*/
		if(isTC3162U){
			regWrite32(KSEG1ADDR(pcie_config_addr), 0x40);
			regWrite32(KSEG1ADDR(pcie_config_data), 0x20);
		}
	}
}

EXPORT_SYMBOL(pcieReset);


void pcieResetRC0(void){
	unsigned long tmp;

	if(!isMT751020){
		return;
	}

	pcie_int_enable(DISABLE, 0);
	mdelay(5);

	//PCI-E reset
	tmp = regRead32(0xbfb00834);
	regWrite32(0xbfb00834, (tmp & (~(1<<26))));
	mdelay(1);
	regWrite32(0xbfb00834, (tmp | (1<<26)));
	mdelay(1);
	regWrite32(0xbfb00834, (tmp & (~(1<<26))));
	mdelay(1);

#if defined(TCSUPPORT_BONDING)
	//printk("reset slave chip \n");
	tmp = regRead32(0xbfbf0214);
	regWrite32(0xbfbf0214, (tmp | (1<<6)));
	tmp = regRead32(0xbfbf0234);
	regWrite32(0xbfbf0234, (tmp & ~(1<<6)));
	tmp = regRead32(0xbfbf021c);
	regWrite32(0xbfbf021c, (tmp & (~((1<<12) | (1<<13)))));
	tmp = regRead32(0xbfbf0200);
	regWrite32(0xbfbf0200, (tmp & ~(1<<13)));
	tmp = regRead32(0xbfbf0200);
	regWrite32(0xbfbf0200, (tmp | (1<<12)));
	if (isFPGA) {
		//printk("isFPGA \n");
		tmp = regRead32(0xbfbf0204);
		regWrite32(0xbfbf0204, (tmp | (1<<6)));
		mdelay(1);
		tmp = regRead32(0xbfbf0204);
		regWrite32(0xbfbf0204, (tmp & ~(1<<6)));
	}else{
		tmp = regRead32(0xbfbf0204);
		regWrite32(0xbfbf0204, (tmp & ~(1<<6)));
		mdelay(1);
		tmp = regRead32(0xbfbf0204);
		regWrite32(0xbfbf0204, (tmp | (1<<6)));
	}
	tmp = regRead32(0xbfbf0214);
	regWrite32(0xbfbf0214, (tmp & ~(1<<6)));

	//disable VC1
	regWrite32(0xbfb80020, 0x160);
	regWrite32(0xbfb80024, 0x0);
#endif

	tmp = regRead32(0xbfb80000);
	regWrite32(0xbfb80000, (tmp & (~((1<<1) | (1<<2)))));

	//wait device link up
	mdelay(250);
	//printk("#isRC0_LINKUP=%x \n", isRC0_LINKUP);
#if defined(TCSUPPORT_BONDING)
	//printk("isSLAVERC_LINKUP=%x \n", isSLAVERC_LINKUP);
#endif

	if(isRC0_LINKUP){
		//config PCI-E RC
		regWrite32(0xbfb82010, 0xffff0001); //disable support BAR0

		//change class PCI-PCI Bridge
		regWrite32(0xbfb82034, 0x06040001);

		//Enable CRC count .
		regWrite32(KSEG1ADDR(pcie_config_addr), 0x118);
		tmp = regRead32(KSEG1ADDR(pcie_config_data));
		regWrite32(KSEG1ADDR(pcie_config_data), (tmp | (1<<8)));
		pcie_phy_force_mode_en(ENABLE, 0);
	}else{
		//disable port 0
		tmp = regRead32(0xbfb00088);
		regWrite32(0xbfb00088, (tmp & ~(1<<23)));
		mdelay(1);
	}

#if defined(TCSUPPORT_BONDING)
	if(isSLAVERC_LINKUP){
		pcie_phy_force_mode_en(ENABLE, 2);
	}
	else{
		//disable slave RC
		tmp = regRead32(0xbfb00088);
		regWrite32(0xbfb00088, (tmp & ~(1<<24)));
		mdelay(1);
	}
#endif


	return;
}
EXPORT_SYMBOL(pcieResetRC0);

void pcieResetRC1(void){
	unsigned long tmp;

	if(!isMT751020 ){
		return;
	}

	pcie_int_enable(DISABLE, 1);
	mdelay(5);

	//PCI-E reset
	tmp = regRead32(0xbfb00834);
	regWrite32(0xbfb00834, (tmp & ~(1<<27)));
	mdelay(1);
	regWrite32(0xbfb00834, (tmp | (1<<27)));
	mdelay(1);
	regWrite32(0xbfb00834, (tmp & ~(1<<27)));
	mdelay(1);


	tmp = regRead32(0xbfb80000);
	regWrite32(0xbfb80000, (tmp & (~((1<<1) | (1<<2)))));

	//wait device link up
	mdelay(250);

	//printk("isRC1_LINKUP=%d \n", isRC1_LINKUP);;
	if(isRC1_LINKUP){
		//config PCI-E RC
		regWrite32(0xbfb83010, 0xffff0001); //disable support BAR0

		//change class PCI-PCI Bridge
		regWrite32(0xbfb83034, 0x06040001);

		//Enable RC1 ECRC count . //bus0, dev1
		regWrite32(KSEG1ADDR(pcie_config_addr), 0x80118);
		tmp = regRead32(KSEG1ADDR(pcie_config_data));
		regWrite32(KSEG1ADDR(pcie_config_data), (tmp | (1<<8)));
		pcie_phy_force_mode_en(ENABLE, 1);
	}else{
		//disable port 1
		tmp = regRead32(0xbfb00088);
		regWrite32(0xbfb00088, (tmp & ~(1<<22)));
		mdelay(1);
	}

	return;
}

int pcie_write_config_word(unsigned char type, unsigned char bus, unsigned char devnum, unsigned int regnum, unsigned long int value)
{
	if(isRT63165 || isRT63365 || isMT751020 ){
		regWrite32(KSEG1ADDR(pcie_config_addr), (bus<<24 |devnum<<19|regnum));
	}else{
		regWrite32(KSEG1ADDR(pcie_config_addr), (type<<31|bus<<20 |devnum<<15|regnum));
	}	
	regWrite32(KSEG1ADDR(pcie_config_data), value);

	return 0;
}
int pcie_write_config_byte(unsigned char type, unsigned char bus, unsigned char devnum, unsigned int regnum, unsigned char value)
{
	if(isRT63165 || isRT63365 || isMT751020 ){
		regWrite32(KSEG1ADDR(pcie_config_addr), (bus<<24 |devnum<<19|regnum));
	}else{	
		regWrite32(KSEG1ADDR(pcie_config_addr), (type<<31|bus<<20 |devnum<<15|regnum));
	}	
	regWrite32(KSEG1ADDR(pcie_config_data), value);

	return 0;
}
unsigned long int pcie_read_config_word(unsigned char type, unsigned char bus, unsigned char devnum, unsigned int regnum)
{
	if(isRT63165 || isRT63365 || isMT751020 ){
		regWrite32(KSEG1ADDR(pcie_config_addr), (bus<<24 |devnum<<19|regnum));
	}else{	
		regWrite32(KSEG1ADDR(pcie_config_addr), (type<<31|bus<<20|devnum<<15|regnum));
	}
	return regRead32(KSEG1ADDR(pcie_config_data));
}
#if (defined(TCSUPPORT_POWERSAVE_ENABLE) && (defined(TCSUPPORT_CPU_MT7510) || defined(TCSUPPORT_CPU_MT7520)))
EXPORT_SYMBOL(pcie_write_config_word);
EXPORT_SYMBOL(pcie_read_config_word);
#endif
int pcieRegInitConfig(void)
{
	unsigned int reg1_val, reg2_val;
	unsigned int reg_val = 0;
	int i = 0;
	int slot;
	int pci_device_exist = 0;
	unsigned long tmp;

	if(isRT63165){
		return 0;		
	}

	/* PCIe init module */
	/* reset PCIe module */
	/*
	 * From: TC/Li Fengbo 
	 * To: 'krammer' ; 'Marshall Yen \
	 * Cc: 'Liu, Shuenn-Ren' ; 'Graham Fan\
	 * Sent: Friday, May 22, 2009 2:49 PM
	 * Subject: new pof for software reboot
	 *
	 * Dear both,
	 * I have generated a new pof for software reboot, the pof file name is 
	 * software_reboot_20090522.pof
	 * It has been transported to Hsingchu, please help to check it
	 * Software Reset User Guide:
	 * After power on, there are two steps to active PCIe System
	 * 1 Wait for minimum 50us, Write ¡§1¡¨ to bit 29 of Register bfb0_0088, then
	 * 2 Wait for minimum 3.5us, write ¡§1¡¨ to bit 30 of Register bfb0_0088
	 * 
	 * Before do software reboot, 
	 * 1 Write ¡§0¡¨ to bit 29 and bit 30 of Register bfb0_0088
	 * Then reset for PCIE system is completed, you can reboot system
	 * Don¡¦t forget to release PCIe reset
	 * 2 Wait for minimum 50us , Write ¡§1¡¨ to bit 29 of bfb0_0088, then
	 * 3 Wait for minimum 3.5us, write ¡§1¡¨ to bit 30 of bfb0_0088
	 *
	 * Best regards
	 * Fengbo Li
	 *
	 */
	/* pcie fixup start */
	/* setup COMMAND register */
	pcie_write_config_word(PCIE_TYPE_RC, PCIE_BUS_RC, PCIE_DEVNUM_0, 0x04, 0x00100007);

	/* setup CACHE_LINE_SIZE register */
	if(isRT63365){
		pcie_write_config_word(PCIE_TYPE_RC, PCIE_BUS_RC, PCIE_DEVNUM_0, 0x0c, 0x00010000);
	}else{	
		pcie_write_config_word(PCIE_TYPE_RC, PCIE_BUS_RC, PCIE_DEVNUM_0, 0x0c/*PCI_CACHE_LINE_SIZE*/, 0x00000008);//duoduo_20090701
	}	
	/* setup LATENCY_TIMER register */
	/* pcie fixup end */
	/*setup secondary bus number*/
	/*setup subordinate bus number*/
	pcie_write_config_word(PCIE_TYPE_RC, PCIE_BUS_RC, PCIE_DEVNUM_0, 0x18, 0x00010100);
	/*setup I/O Base register*/
	if(isRT63365){
		pcie_write_config_word(PCIE_TYPE_RC, PCIE_BUS_RC, PCIE_DEVNUM_0, 0x30, 0x0);
	}else{	
		pcie_write_config_word(PCIE_TYPE_RC, PCIE_BUS_RC, PCIE_DEVNUM_0, 0x30, 0x0000FFFF);
	}
	pcie_write_config_word(PCIE_TYPE_RC, PCIE_BUS_RC, PCIE_DEVNUM_0, 0x1C, 0x000000F0);
	/*setup memory base register*/
	if(isRT63365){
		pcie_write_config_word(PCIE_TYPE_RC, PCIE_BUS_RC, PCIE_DEVNUM_0, 0x20, 0x20002000);
	}else{	
		pcie_write_config_word(PCIE_TYPE_RC, PCIE_BUS_RC, PCIE_DEVNUM_0, 0x20, 0x1F701F70);
	}	
	/*setup prefetchable memory base register */
	pcie_write_config_word(PCIE_TYPE_RC, PCIE_BUS_RC, PCIE_DEVNUM_0, 0x24, 0x0000FFF0);
	/*setup I/O Base upper 16 bits register*/
	/*setup interrupt line register*/
	/*setup bridge control*/
	if(isRT63365){
		pcie_write_config_word(PCIE_TYPE_RC, PCIE_BUS_RC, PCIE_DEVNUM_0, 0x3C, 0x00040119);
	}else{	
		pcie_write_config_word(PCIE_TYPE_RC, PCIE_BUS_RC, PCIE_DEVNUM_0, 0x3C, 0x0004010B);
	}	

	/* pci register 0x10 config needed or not? Linos for L2H will configure it */
	if(isRT63365){
		for(i = 0; i < 10; i++){
			reg1_val = pcie_read_config_word(PCIE_TYPE_DEV, PCIE_BUS_DEV, PCIE_DEVNUM_0, 0x0);
			mdelay(1);
			//reg2_val = pcie_read_config_word(PCIE_TYPE_DEV, PCIE_BUS_DEV, PCIE_DEVNUM_1, 0x0);
			//mdelay(1);
		}	
		reg2_val = 0xffffffff;
		//Enable Interrupt
		if(isRC0_LINKUP){
			tmp = regRead32(0xbfb8000c);
			regWrite32(0xbfb8000c, (tmp | (1<<20)));
		}	
		//second band
		if(dual_band_support){
			if(isRC1_LINKUP){
				tmp = regRead32(0xbfb8000c);
				regWrite32(0xbfb8000c, (tmp | (1<<21)));
			}	
		}	
	}else{	
		do
		{
			mdelay(30);
			reg_val = pcie_read_config_word(PCIE_TYPE_RC, PCIE_BUS_RC, PCIE_DEVNUM_0, 0xe0);
			i++;
		}
		while((reg_val & 0x03f00000) != 0x00100000 && i <= 10);//check the if the dev has been link up
		for(i = 0; i < 10; i++){
			reg1_val = pcie_read_config_word(PCIE_TYPE_DEV, PCIE_BUS_DEV, PCIE_DEVNUM_0, 0x0);
			mdelay(1);
			reg2_val = pcie_read_config_word(PCIE_TYPE_DEV, PCIE_BUS_DEV, PCIE_DEVNUM_1, 0x0);
			mdelay(1);
		}
	}
	if( (reg1_val != 0xffffffff) &&
			( (reg1_val == ((NIC3090_PCIe_DEVICE_ID <<16) |NIC_PCI_VENDOR_ID)) //duoduo_20090702
			  || (reg1_val == ((NIC3091_PCIe_DEVICE_ID <<16) |NIC_PCI_VENDOR_ID))
			  || (reg1_val == ((NIC3092_PCIe_DEVICE_ID <<16) |NIC_PCI_VENDOR_ID)) 
			  || (reg1_val == ((NIC3390_PCIe_DEVICE_ID <<16) |NIC_PCI_VENDOR_ID))
			  || (reg1_val == ((NIC5390_PCIe_DEVICE_ID <<16) |NIC_PCI_VENDOR_ID))//xyyou_20101111
			  || (reg1_val == ((NIC539F_PCIe_DEVICE_ID <<16) |NIC_PCI_VENDOR_ID))
			  || (reg1_val == ((NIC5392_PCIe_DEVICE_ID <<16) |NIC_PCI_VENDOR_ID))) ){//xyyou wait to do
		pcie_write_config_word(PCIE_TYPE_DEV, PCIE_BUS_DEV, PCIE_DEVNUM_0, 0x04, 0x00100006);
		if(isRT63365)
			pcie_write_config_word(PCIE_TYPE_DEV, PCIE_BUS_DEV, PCIE_DEVNUM_0, 0x10, 0x20000000);
		else	
			pcie_write_config_word(PCIE_TYPE_DEV, PCIE_BUS_DEV, PCIE_DEVNUM_0, 0x10, PHYSADDR(PCI_DEVICE_MEM1)); 
		pcie_write_config_word(PCIE_TYPE_DEV, PCIE_BUS_DEV, PCIE_DEVNUM_0, 0x14, 0); 
		pcie_write_config_word(PCIE_TYPE_DEV, PCIE_BUS_DEV, PCIE_DEVNUM_0, 0x18, 0); 
		pcie_write_config_word(PCIE_TYPE_DEV, PCIE_BUS_DEV, PCIE_DEVNUM_0, 0x1C, 0); 
		pcie_write_config_word(PCIE_TYPE_DEV, PCIE_BUS_DEV, PCIE_DEVNUM_0, 0x20, 0); 
		pcie_write_config_word(PCIE_TYPE_DEV, PCIE_BUS_DEV, PCIE_DEVNUM_0, 0x24, 0); 
		pcie_write_config_word(PCIE_TYPE_DEV, PCIE_BUS_DEV, PCIE_DEVNUM_0, 0x30, 0); 
		if(isRT63365)
			pcie_write_config_word(PCIE_TYPE_DEV, PCIE_BUS_DEV, PCIE_DEVNUM_0, 0x3C, 0x00000119);
		else	
			pcie_write_config_word(PCIE_TYPE_DEV, PCIE_BUS_DEV, PCIE_DEVNUM_0, 0x3C, 0x0000010B); 

		slot = PCIE_DEVNUM_0;		
		pci_device_exist++;
	}
	else if( (reg2_val != 0xffffffff) &&
			( (reg2_val == ((NIC3090_PCIe_DEVICE_ID <<16) |NIC_PCI_VENDOR_ID)) 
			  || (reg2_val == ((NIC3091_PCIe_DEVICE_ID <<16) |NIC_PCI_VENDOR_ID))
			  || (reg2_val == ((NIC3092_PCIe_DEVICE_ID <<16) |NIC_PCI_VENDOR_ID))
			  || (reg1_val == ((NIC3390_PCIe_DEVICE_ID <<16) |NIC_PCI_VENDOR_ID))
			  || (reg1_val == ((NIC5390_PCIe_DEVICE_ID <<16) |NIC_PCI_VENDOR_ID))
			  || (reg1_val == ((NIC539F_PCIe_DEVICE_ID <<16) |NIC_PCI_VENDOR_ID))
			  || (reg1_val == ((NIC5392_PCIe_DEVICE_ID <<16) |NIC_PCI_VENDOR_ID))) ){
		slot=PCIE_DEVNUM_1;
		pci_device_exist++;
	}
	else{
		printk("no_pci_found error case\n");
		return -1;
	}
	return slot;
}
EXPORT_SYMBOL(pcieRegInitConfig);



void pcie_init(void)
{
	int i, j;
	if(isRT63365){
		return;
	}
	if(isMT751020){
		//Save all configuration
		for(i=0; i<PCIE_SAVE_BUS_NUM;i++){
			for(j=0;j<PCIE_SAVE_DEVICE_NUM;j++){
				if(pcie_config_temp[i][j] == NULL){
					pcie_config_temp[i][j] = save_pcie_config(i, j);
				}	
			}
		}
		pcie_soft_patch = ENABLE;
	}else{
		pcieReset();
		pcieRegInitConfig();
	}	
}
EXPORT_SYMBOL(pcie_init);

int pcie_timeout_disable(void)
{
	unsigned int val = 0x10;
	unsigned int reg = 0x98;
	unsigned int dev = 0x0;
	unsigned int bus;

	bus = 0x1;
	if(isRC0_LINKUP){
		//disable RC0's device timeout
		pcie_write_config_word(PCIE_TYPE_DEV, bus, dev, reg, val);
	}

#if defined(TCSUPPORT_BONDING)
	if(isSLAVERC_LINKUP){
		bus += 1;

		//disable slave RC's device timeout
		pcie_write_config_word(PCIE_TYPE_DEV, bus, dev, reg, val);
	}
#endif

	if(isRC1_LINKUP){
		bus += 1;

		//disable RC1's device timeout
		pcie_write_config_word(PCIE_TYPE_DEV, bus, dev, reg, val);
	}
	
	return 0;
}

#if defined(TCSUPPORT_BONDING)
void pcie_virBaseAddr_set(unsigned long addr)
{
	slaveVirBaseAddr = addr;
}
EXPORT_SYMBOL(pcie_virBaseAddr_set);
#endif


void aer_config(int aerEnable)
{
	unsigned int advRcErrReg = 0x12c, advRcErrVal = 0x7, disAdvRcErr = 0x0;
	unsigned int briCtrlReg = 0x3c, briCtrlVal = 0x60119, disBriCtrl = 0x40119;
	unsigned int devCtrlReg = 0x78, devCtrlVal = 0x201f, disDevCtrl = 0x2010;
	unsigned int dev = 0x0;
	unsigned int bus = 0x0;


	if(aerEnable){ // Enable AER
		// configure RC
		bus = 0x0;
		dev = 0x0;
		if(isRC0_LINKUP){
			//Enable RC0 interrupt
			pcie_write_config_word(PCIE_TYPE_DEV, bus, dev, advRcErrReg, advRcErrVal);
			regWrite32(KSEG1ADDR(pcie_config_data), advRcErrVal);
			//Enable RC0 error report
			pcie_write_config_word(PCIE_TYPE_DEV, bus, dev, briCtrlReg, briCtrlVal);
			pcie_write_config_word(PCIE_TYPE_DEV, bus, dev, devCtrlReg, devCtrlVal);
		}
		if(isRC1_LINKUP){
			dev += 1;

			//Enable RC1 interrupt
			pcie_write_config_word(PCIE_TYPE_DEV, bus, dev, advRcErrReg, advRcErrVal);

			//Enable RC1 error report
			pcie_write_config_word(PCIE_TYPE_DEV, bus, dev, briCtrlReg, briCtrlVal);
			pcie_write_config_word(PCIE_TYPE_DEV, bus, dev, devCtrlReg, devCtrlVal);
		}

		// configure device
		dev = 0x0;
		if(isRC0_LINKUP){
			bus += 1;

			//Enable EP0 error report
			pcie_write_config_word(PCIE_TYPE_DEV, bus, dev, devCtrlReg, devCtrlVal);
		}

#if defined(TCSUPPORT_BONDING)
		// configure slave RC & device
		if(isSLAVERC_LINKUP){
			dev += 1;

			//Enable slave RC interrupt
			pcie_write_config_word(PCIE_TYPE_DEV, bus, dev, advRcErrReg, advRcErrVal);

			//Enable slave RC error report
			pcie_write_config_word(PCIE_TYPE_DEV, bus, dev, briCtrlReg, briCtrlVal);
			pcie_write_config_word(PCIE_TYPE_DEV, bus, dev, devCtrlReg, devCtrlVal);

			dev = 0x0;
			bus += 1;
			//Enable slave wifi error report
			pcie_write_config_word(PCIE_TYPE_DEV, bus, dev, devCtrlReg, devCtrlVal);
		}
#endif

		// configure device
		dev = 0x0;
		if(isRC1_LINKUP){
			bus += 1;

			//Enable EP1 error report
			pcie_write_config_word(PCIE_TYPE_DEV, bus, dev, devCtrlReg, devCtrlVal);
		}

	}else{ // Disable AER
		// configure RC
		bus = 0x0;
		dev = 0x0;
		if(isRC0_LINKUP){
			//Disable RC0 interrupt
			pcie_write_config_word(PCIE_TYPE_DEV, bus, dev, advRcErrReg, disAdvRcErr);

			//Disable RC0 error report
			pcie_write_config_word(PCIE_TYPE_DEV, bus, dev, briCtrlReg, disBriCtrl);
			pcie_write_config_word(PCIE_TYPE_DEV, bus, dev, devCtrlReg, disDevCtrl);

		}
		if(isRC1_LINKUP){
			dev = 0x1;

			//Disable RC1 interrupt
			pcie_write_config_word(PCIE_TYPE_DEV, bus, dev, advRcErrReg, disAdvRcErr);
			
			//Disable RC1 error report
			pcie_write_config_word(PCIE_TYPE_DEV, bus, dev, briCtrlReg, disBriCtrl);
			pcie_write_config_word(PCIE_TYPE_DEV, bus, dev, devCtrlReg, disDevCtrl);

		}

#if defined(TCSUPPORT_BONDING)
		if(isSLAVERC_LINKUP){
			bus += 1;
			dev = 0x1;

			//Disable slave RC interrupt
			pcie_write_config_word(PCIE_TYPE_DEV, bus, dev, advRcErrReg, disAdvRcErr);

			//Disable slave RC interrupt
			pcie_write_config_word(PCIE_TYPE_DEV, bus, dev, briCtrlReg, disBriCtrl);
			pcie_write_config_word(PCIE_TYPE_DEV, bus, dev, devCtrlReg, disDevCtrl);

		}
#endif
	}
}

static void aer_status_dump(void)
{
	unsigned int rootErrReg = 0x130;
	unsigned int errSrcIdReg = 0x134;
	unsigned int unCorErrReg = 0x104;
	unsigned int corErrReg = 0x110;
	unsigned int dev = 0x0;
	unsigned int bus = 0x0;


	if(isRC0_LINKUP){
		printk("### RC0 ###\n");
		//check root error status
		printk("root error status=0x%lx\n", pcie_read_config_word(PCIE_TYPE_DEV, bus, dev, rootErrReg));
		//check error source ID
		printk("error source ID=0x%lx\n", pcie_read_config_word(PCIE_TYPE_DEV, bus, dev, errSrcIdReg));
		//check uncorrectable error status
		printk("UN-correctable status=0x%lx\n", pcie_read_config_word(PCIE_TYPE_DEV, bus, dev, unCorErrReg));
		//check correctable error status
		printk("Correctable status=0x%lx\n", pcie_read_config_word(PCIE_TYPE_DEV, bus, dev, corErrReg));
		//check error counter
		printk("RC0 LCRC counter: 0x%x         RC0 ECRC counter: 0x%x\n",(unsigned int)regRead32(0xbfb82060),(unsigned int)regRead32(0xbfb82064));
		printk("EP correctable counter: 0x%x   EP non-fatal counter: 0x%x \n\n",(unsigned int)regRead32(0xbfb82068),(unsigned int)regRead32(0xbfb8206c));
	}

	if(isRC1_LINKUP){
		bus = 0x0;
		dev = 0x1;

		printk("### RC1 ###\n");
		//check root error status
		printk("root error status=0x%lx\n", pcie_read_config_word(PCIE_TYPE_DEV, bus, dev, rootErrReg));
		//check error source ID
		printk("error source ID=0x%lx\n", pcie_read_config_word(PCIE_TYPE_DEV, bus, dev, errSrcIdReg));
		//check uncorrectable error status
		printk("UN-correctable status=0x%lx\n", pcie_read_config_word(PCIE_TYPE_DEV, bus, dev, unCorErrReg));
		//check correctable error status
		printk("Correctable status=0x%lx\n", pcie_read_config_word(PCIE_TYPE_DEV, bus, dev, corErrReg));
		//check error counter
		printk("RC1 LCRC counter: 0x%x         RC1 ECRC counter: 0x%x\n",(unsigned int)regRead32(0xbfb83060),(unsigned int)regRead32(0xbfb83064));
		printk("EP correctable counter: 0x%x   EP non-fatal counter: 0x%x \n\n",(unsigned int)regRead32(0xbfb83068),(unsigned int)regRead32(0xbfb8306c));
	}

#if defined(TCSUPPORT_BONDING)
	if(isSLAVERC_LINKUP){
		bus = 0x0;
		if(isRC0_LINKUP){
			bus += 1;
		}
		dev = 0x1;

		printk("### slave RC ###\n");
		//check root error status
		printk("root error status=0x%lx\n", pcie_read_config_word(PCIE_TYPE_DEV, bus, dev, rootErrReg));
		//check error source ID
		printk("error source ID=0x%lx\n", pcie_read_config_word(PCIE_TYPE_DEV, bus, dev, errSrcIdReg));
		//check uncorrectable error status
		printk("UN-correctable status=0x%lx\n", pcie_read_config_word(PCIE_TYPE_DEV, bus, dev, unCorErrReg));
		//check correctable error status
		printk("Correctable status=0x%lx\n", pcie_read_config_word(PCIE_TYPE_DEV, bus, dev, corErrReg));
		//check error counter
		if(slaveVirBaseAddr != 0){
			printk("slaveRC LCRC counter: 0x%x         slaveRC ECRC counter: 0x%x\n",(unsigned int)regRead32(slaveVirBaseAddr + 0xb83060),(unsigned int)regRead32(slaveVirBaseAddr + 0xb83064));
			printk("EP correctable counter: 0x%x   EP non-fatal counter: 0x%x \n\n",(unsigned int)regRead32(slaveVirBaseAddr + 0xb83068),(unsigned int)regRead32(slaveVirBaseAddr + 0xb8306c));
		}
	}
#endif
}

static void aer_status_clear(void)
{
	unsigned int unCorErrReg = 0x104;
	unsigned int corErrReg = 0x110;
	unsigned int rootErrReg = 0x130;
	unsigned int dev = 0x0;
	unsigned int bus = 0x0;
	unsigned long int errStatus;

	if(isRC0_LINKUP){
		//printk("RC0\n");
		//clear UN-correctable error status
		errStatus = pcie_read_config_word(PCIE_TYPE_DEV, bus, dev, unCorErrReg);
		pcie_write_config_word(PCIE_TYPE_DEV, bus, dev, unCorErrReg, errStatus);
		//printk("Clear UN-orrectable status=0x%lx\n", pcie_read_config_word(PCIE_TYPE_DEV, bus, dev, unCorErrReg));
		//clear correctable error status
		errStatus = pcie_read_config_word(PCIE_TYPE_DEV, bus, dev, corErrReg);
		pcie_write_config_word(PCIE_TYPE_DEV, bus, dev, corErrReg, errStatus);
		//printk("Clear Correctable status=0x%lx\n", pcie_read_config_word(PCIE_TYPE_DEV, bus, dev, corErrReg));
		//clear root error status
		errStatus = pcie_read_config_word(PCIE_TYPE_DEV, bus, dev, rootErrReg);
		pcie_write_config_word(PCIE_TYPE_DEV, bus, dev, rootErrReg, errStatus);
		//printk("Clear root error status=0x%lx\n", pcie_read_config_word(PCIE_TYPE_DEV, bus, dev, rootErrReg));
	}

	if(isRC1_LINKUP){
		bus = 0x0;
		dev = 0x1;

		//printk("RC1\n");
		//clear UN-correctable error status
		errStatus = pcie_read_config_word(PCIE_TYPE_DEV, bus, dev, unCorErrReg);
		pcie_write_config_word(PCIE_TYPE_DEV, bus, dev, unCorErrReg, errStatus);
		//printk("Clear UN-orrectable status=0x%lx\n", pcie_read_config_word(PCIE_TYPE_DEV, bus, dev, unCorErrReg));
		//clear correctable error status
		errStatus = pcie_read_config_word(PCIE_TYPE_DEV, bus, dev, corErrReg);
		pcie_write_config_word(PCIE_TYPE_DEV, bus, dev, corErrReg, errStatus);
		//printk("Clear Correctable status=0x%lx\n", pcie_read_config_word(PCIE_TYPE_DEV, bus, dev, corErrReg));
		//clear root error status
		errStatus = pcie_read_config_word(PCIE_TYPE_DEV, bus, dev, rootErrReg);
		pcie_write_config_word(PCIE_TYPE_DEV, bus, dev, rootErrReg, errStatus);
		//printk("Clear root error status=0x%lx\n", pcie_read_config_word(PCIE_TYPE_DEV, bus, dev, rootErrReg));
	}

#if defined(TCSUPPORT_BONDING)
	if(isSLAVERC_LINKUP){
		bus = 0x0;
		if(isRC0_LINKUP){
			bus += 1;
		}
		dev = 0x1;

		//printk("slave RC\n");
		//clear UN-correctable error status
		errStatus = pcie_read_config_word(PCIE_TYPE_DEV, bus, dev, unCorErrReg);
		pcie_write_config_word(PCIE_TYPE_DEV, bus, dev, unCorErrReg, errStatus);
		//printk("Clear UN-orrectable status=0x%lx\n", pcie_read_config_word(PCIE_TYPE_DEV, bus, dev, unCorErrReg));
		//clear correctable error status
		errStatus = pcie_read_config_word(PCIE_TYPE_DEV, bus, dev, corErrReg);
		pcie_write_config_word(PCIE_TYPE_DEV, bus, dev, corErrReg, errStatus);
		//printk("Clear Correctable status=0x%lx\n", pcie_read_config_word(PCIE_TYPE_DEV, bus, dev, corErrReg));
		//clear root error status
		errStatus = pcie_read_config_word(PCIE_TYPE_DEV, bus, dev, rootErrReg);
		pcie_write_config_word(PCIE_TYPE_DEV, bus, dev, rootErrReg, errStatus);
		//printk("Clear root error status=0x%lx\n", pcie_read_config_word(PCIE_TYPE_DEV, bus, dev, rootErrReg));
	}
#endif
}


void
ahbErrChk(void){
	register uint32 status=0;
	unsigned long flags;
	
	if(pcie_soft_patch == 0){
		return;
	}
	
	if(isRT63365)
		return;
	
	
	if(isMT751020){
		pcie_check(0);
	}else
	{
		status=regRead32(CR_AHB_AACS);
		if((status & AHB_BUS_TIMEOUT_ERR)||(status & AHB_BUS_ADDR_ERR)){	
			printk("CR_AHB_AACS:0x%08lx\n", status);
			printk("CR_AHB_ABEM:0x%08lx\n", regRead32(CR_AHB_ABEM));
			printk("CR_AHB_ABEA:0x%08lx\n", regRead32(CR_AHB_ABEA));
			local_irq_save(flags);
			ahb_status=1;
			pcieReset();
			pcieRegInitConfig();
			local_irq_restore(flags);
		}
	}
	

}
EXPORT_SYMBOL(ahbErrChk);

#ifdef CONFIG_MIPS_TC3162U
static irqreturn_t ahbErrIsr(int irq, void *dev){
	ahbErrChk();	
	return IRQ_HANDLED;
}
#endif

void chkAhbErr(int force){
	uint32 val=0;
	unsigned long flags;
	uint32 lcrc, ecrc;

	if(pcie_soft_patch == 0){
		return;
	}

	if(isTC3162U){
		local_irq_save(flags);
		/*check the pcie bus crc error counter*/
		val= pcie_read_config_word(PCIE_TYPE_RC, PCIE_BUS_RC, PCIE_DEVNUM_0, 0x54);
		if((val!=0x0) || (force==0x1) ){
			/*Reset pcie and refill pcie-registers*/
			pcieReset();
			pcieRegInitConfig();
			ahb_status = 1;
		}
		local_irq_restore(flags);
	}

	else if(isRT63365){
		local_irq_save(flags);
		/*check the pcie bus crc error counter*/
		lcrc = regRead32(0xbfb82060);
		ecrc = regRead32(0xbfb82064);
		if((lcrc != 0xdeadbeaf) || (ecrc != 0xdeadbeaf)){
			if((lcrc != 0x0) || (ecrc != 0x0) || (force == 0x1)){
				printk("RC0 PCI-E L-crc %lx E-crc %lx!!\n", lcrc, ecrc);
				/*Reset pcie and refill pcie-registers*/
				pcieReset();
				pcieRegInitConfig();
				ahb_status = 1;
			}
		}
		local_irq_restore(flags);
	}
	

}
EXPORT_SYMBOL(chkAhbErr);

static int ahb_status_read_proc(char *page, char **start, off_t off,
	int count, int *eof, void *data)
{
	int len;
	len = sprintf(page, "%d %d %d", pcie_soft_patch, ahb_status, wifiDeviceId);
	len -= off;
	*start = page + off;

	if (len > count)
		len = count;
	else
		*eof = 1;

	if (len < 0)
		len = 0;
	
	chkAhbErr(0);
	return len;
}

static int ahb_status_write_proc(struct file *file, const char *buffer,
	unsigned long count, void *data)
{
	char val_string[8];
	int val=0;
	unsigned long flags;

	if (count > sizeof(val_string) - 1)
		return -EINVAL;

	if (copy_from_user(val_string, buffer, count))
		return -EFAULT;

	val_string[count] = '\0';
	if(sscanf(val_string,"%d %d", &pcie_soft_patch, &val)!=2){
		printk("usage: <onoff> <type>\n");
		return count;
	}
	if(val==0x2){
		/*Reset pcie and refill pcie-registers*/
		local_irq_save(flags);
		if(isMT751020){
			pcie_check(0);
		}else{	
			pcieReset();
			pcieRegInitConfig();
		}
		local_irq_restore(flags);
	}
	if (val == 0) /*Disable wifi interface down to up*/{
		ahb_status = 0;
		wifiDeviceId = 0;
	}else{
		ahb_status = 1;
	}
	return count;
}



static int pcie_rcnum_read_proc(char *page, char **start, off_t off,
	int count, int *eof, void *data)
{
	
	
	return 0;
}

static int pcie_rcnum_write_proc(struct file *file, const char *buffer,
	unsigned long count, void *data)
{
	char val_string[8];
	int reset_rc = -1;
	unsigned long flags;

	if (count > sizeof(val_string) - 1)
		return -EINVAL;

	if (copy_from_user(val_string, buffer, count))
		return -EFAULT;

	val_string[count] = '\0';
	if(sscanf(val_string,"%d", &reset_rc)!=1){
		printk("usage: <RC reset Number> \n");
		return count;
	}

	if(reset_rc != -1){
		printk("reset and recover start RC %d\n",reset_rc);
		spin_lock_irqsave(&pcie_esd_lock, flags);	
		pcie_reset_handler(reset_rc);
		spin_unlock_irqrestore(&pcie_esd_lock, flags);	
		
		ahb_status = 1;
	}
	
	return count;
}
static int pcie_reset_con_read_proc(char *page, char **start, off_t off,
	int count, int *eof, void *data)
{
	int len;
	len = sprintf(page, "currect pcie_reset_con %d", pcie_reset_condiction);
	len -= off;
	*start = page + off;

	if (len > count)
		len = count;
	else
		*eof = 1;

	if (len < 0)
		len = 0;
	
	return len;
}

static int pcie_reset_con_write_proc(struct file *file, const char *buffer,
	unsigned long count, void *data)
{
	char val_string[8];
	int value;

	if (count > sizeof(val_string) - 1)
		return -EINVAL;

	if (copy_from_user(val_string, buffer, count))
		return -EFAULT;

	val_string[count] = '\0';
	if(sscanf(val_string,"%d", &value)!=1){
		printk("usage: <pcie_reset_condiction 0:bustime out 1:pcie error> \n");
		return count;
	}
	pcie_reset_condiction = (char)value;
	return count;
}
static int pcie_reset_count_read_proc(char *page, char **start, off_t off,
	int count, int *eof, void *data)
{
	int len;
	len = sprintf(page, "pcie_reset_count %d\n", pcie_reset_count);
	len -= off;
	*start = page + off;

	if (len > count)
		len = count;
	else
		*eof = 1;

	if (len < 0)
		len = 0;
	
	return len;
}
static int aer_status_read_proc(char *page, char **start, off_t off,
	int count, int *eof, void *data)
{
	aer_status_dump();

	return 0;
}

static int aer_status_write_proc(struct file *file, const char *buffer,
	unsigned long count, void *data)
{
	char val_string[5];
	int clear=0;

	if (count > sizeof(val_string) - 1)
		return -EINVAL;

	if (copy_from_user(val_string, buffer, count))
		return -EFAULT;

	val_string[count] = '\0';
	sscanf(val_string,"%d", &clear);

	if(clear == 1){
		aer_status_dump();
		aer_status_clear();
	}

	return count;
}
#if defined(TCSUPPORT_BONDING)
static void reset_slave_chip(void){
	uint32 tmp;

	tmp = regRead32(CR_GPIO_CTRL);
	tmp &= ~(0x3 << (6<<1));
	tmp |=  (0x1 << (6<<1));
	regWrite32(CR_GPIO_CTRL, tmp);
	tmp = regRead32(CR_GPIO_ODRAIN);
	regWrite32(CR_GPIO_ODRAIN, (tmp | (1<<6)));
	tmp = regRead32(CR_GPIO_DATA);
	regWrite32(CR_GPIO_DATA, (tmp | (1<<6)));
	udelay(1);
	regWrite32(CR_GPIO_DATA, (tmp & (~(1<<6))));
	udelay(1);
	regWrite32(CR_GPIO_DATA, (tmp | (1<<6)));
	udelay(1);

}
#endif
static __init int tc3162_pcie_init(void)
{
	struct proc_dir_entry *ahb_status_proc;
	struct proc_dir_entry *aer_status_proc;
	int i;
	uint32 tmp;

#ifdef TCSUPPORT_MT7510_E1	
	if(isMT751020 ){
		#ifndef TCSUPPORT_MT7520_PCIE
		if (!isFPGA)
			return -1;
		#endif
		/* enabled PCIe port 0,1 */
		tmp = regRead32(0xbfb00088);
		regWrite32(0xbfb00088, (tmp | (0x1<<22)));
		mdelay(1);
	}
#endif
	if (!isFPGA){
#if defined(TCSUPPORT_BONDING)
		printk("slave chip reset\n");
		reset_slave_chip();
#endif
		pciePhyInit();
	}

	if(isRT63365 || isMT751020){
		if(isMT751020){
			dual_band_support = 1;
			printk("MT7510_pcie_init\n");
		}
		else if(isRT63368){
#if defined(TCSUPPORT_DUAL_WLAN)
			//rt63368 enable pci-e port1 and port1 do not have power will cause hang. shnwind.
			dual_band_support = 1;
#else
			dual_band_support = 0;
#endif			
			printk("RT63368_pcie_init:%d\n",dual_band_support);
		}else{	
			printk("RT63365_pcie_init\n");
		}	

		//change memory mapping affress.
		tc3162_pcie_mem_resource.start = 0x20000000;
		tc3162_pcie_mem_resource.end   = 0x2FFFFFFF;

		//change pcie addr and data window.
		pcie_config_addr = 0x1fb80020;
		pcie_config_data = 0x1fb80024;

		//PCI-E reset
		if(isMT751020 ){
			/* enabled PCIe port 1 */
			tmp = regRead32(0xbfb00088);
			regWrite32(0xbfb00088, (tmp | (1<<22)));
			mdelay(1);
#if !defined(TCSUPPORT_BONDING)
			if (!isFPGA){
				//set GPIO share scheme reg for PERST output
				tmp = regRead32(0xbfb00860);
				regWrite32(0xbfb00860, (tmp | ((1<<19) | (1<<20))));
			}
#endif
			/*first reset to default*/
			tmp = regRead32(0xbfb00834);
			regWrite32(0xbfb00834, (tmp & (~((1<<26) | (1<<27) | (1<<29)))));
			mdelay(1);
			tmp = regRead32(0xbfb00834);
			regWrite32(0xbfb00834, (tmp | ((1<<26) | (1<<27) | (1<<29))));
			mdelay(100);
			tmp = regRead32(0xbfb00834);
			regWrite32(0xbfb00834, (tmp & (~((1<<26) | (1<<27) | (1<<29)))));
			mdelay(1);
		}else{
			if (isFPGA) {
				//FPGA mode
				tmp = regRead32(0xbfb00834);
				regWrite32(0xbfb00834, (tmp & ~(1<<26)));
				mdelay(1);
				tmp = regRead32(0xbfb00834);
				regWrite32(0xbfb00834, (tmp | (1<<26)));
				mdelay(1);
			}else{
				if(dual_band_support){
					/* enabled PCIe port 1 */
					tmp = regRead32(0xbfb00088);
					regWrite32(0xbfb00088, (tmp | (1<<22)));
					mdelay(1);
					tmp = regRead32(0xbfb00834);
					regWrite32(0xbfb00834, (tmp | ((1<<26) | (1<<27) | (1<<29))));
					mdelay(1);
					tmp = regRead32(0xbfb00834);
					regWrite32(0xbfb00834, (tmp & (~((1<<26) | (1<<27) | (1<<29)))));
					mdelay(1);
				}else{
					/* disabled PCIe port 1 */
					tmp = regRead32(0xbfb00088);
					regWrite32(0xbfb00088, (tmp & ~(1<<22)));
					mdelay(1);
					tmp = regRead32(0xbfb00834);
					regWrite32(0xbfb00834, (tmp | ((1<<26) | (1<<29))));
					mdelay(1);
					tmp = regRead32(0xbfb00834);
					regWrite32(0xbfb00834, (tmp & (~((1<<26) | (1<<29)))));
					mdelay(1);
				}
			}
		}
		if(isMT751020 ){
			//relese pcie device reset
			tmp = regRead32(0xbfb80000);
			regWrite32(0xbfb80000, (tmp & (~((1<<1) | (1<<2)))));
			mdelay(1);
		}else{
			tmp = regRead32(0xbfb80000);
			regWrite32(0xbfb80000, (tmp | (1<<1)));
			mdelay(1);
			tmp = regRead32(0xbfb80000);
			regWrite32(0xbfb80000, (tmp & ~(1<<1)));
			mdelay(1);
		}

		if (isRT63365 && (isFPGA)) {
			//FPGA mode
			tmp = regRead32(0xbfbc0028);
			regWrite32(0xbfbc0028, 0x60068880);
			regWrite32(0xbfbc0004, 0x08000002);
			regWrite32(0xbfbc0008, 0x00000700);
			regWrite32(0xbfbc0000, 0x00160106);
			regWrite32(0xbfbc0028, tmp);
		}

		//wait device link up
		mdelay(250);
		printk("check pcie link up status: \n");
		printk("isRC0_LINKUP=%d \n",isRC0_LINKUP);
		if(isMT751020){
			printk("isRC1_LINKUP=%d \n",isRC1_LINKUP);
#if defined(TCSUPPORT_BONDING)
			printk("isSLAVERC_LINKUP=%d \n",isSLAVERC_LINKUP);
#endif
			if((!isRC0_LINKUP) && (!isRC1_LINKUP)){
				printk("PCI-E RC0 & RC1 can not link up\n");
				return -1;
			}
		}else{
			if(dual_band_support){
				printk("isRC1_LINKUP=%d \n",isRC1_LINKUP);
				if((!isRC0_LINKUP) && (!isRC1_LINKUP)){
					printk("PCI-E RC can not link up\n");
					return -1;
				}
			}else{
				if(!isRC0_LINKUP){
					printk("PCI-E RC can not link up\n");
					return -1;
				}
			}
		}


		if(isMT751020 ){
			pcie_soft_patch = DISABLE; //Enable after temp all config
			if(isRC0_LINKUP){
				//config PCI-E RC
				regWrite32(0xbfb82010, 0xffff0001); //disable support BAR0

				//change class PCI-PCI Bridge
				regWrite32(0xbfb82034, 0x06040001);

				//Enable CRC count .
				regWrite32(KSEG1ADDR(pcie_config_addr), 0x118);
				tmp = regRead32(KSEG1ADDR(pcie_config_data));
				regWrite32(KSEG1ADDR(pcie_config_data), (tmp | (1<<8)));
				pcie_phy_force_mode_en(ENABLE, 0);
				rc0_is_exist = 1;
			}else{
				//disable port 0
				tmp = regRead32(0xbfb00088);
				regWrite32(0xbfb00088, (tmp & ~(1<<23)));
				mdelay(1);
			}

			if(isRC1_LINKUP){
				//config PCI-E RC
				regWrite32(0xbfb83010, 0xffff0001); //disable support BAR0

				//change class PCI-PCI Bridge
				regWrite32(0xbfb83034, 0x06040001);

				//Enable RC1 ECRC count . //bus0, dev1
				regWrite32(KSEG1ADDR(pcie_config_addr), 0x80118);
				tmp = regRead32(KSEG1ADDR(pcie_config_data));
				regWrite32(KSEG1ADDR(pcie_config_data), (tmp | (1<<8)));
				pcie_phy_force_mode_en(ENABLE, 1);
				rc1_is_exist = 1;
			}else{
				//disable port 1
				tmp = regRead32(0xbfb00088);
				regWrite32(0xbfb00088, (tmp & ~(1<<22)));
				mdelay(1);
			}

#if defined(TCSUPPORT_BONDING)
			if(isSLAVERC_LINKUP){
				pcie_phy_force_mode_en(ENABLE, 2);
			}else{
				//disable slave RC
				tmp = regRead32(0xbfb00088);
				regWrite32(0xbfb00088, (tmp & ~(1<<24)));
				mdelay(1);
			}
#endif
		}else{
			if(dual_band_support){
				if(isRC0_LINKUP){
					//config PCI-E RC
					regWrite32(0xbfb82010, 0xffff0001); //disable support BAR0

					//change class PCI-PCI Bridge
					regWrite32(0xbfb82034, 0x06040001);

					//Enable CRC count .
					regWrite32(KSEG1ADDR(pcie_config_addr), 0x118);
					tmp = regRead32(KSEG1ADDR(pcie_config_data));
					regWrite32(KSEG1ADDR(pcie_config_data), (tmp | (1<<8)));
				}else{
					//disable port 0
					tmp = regRead32(0xbfb00088);
					regWrite32(0xbfb00088, (tmp & ~(1<<23)));
					mdelay(1);
				}

				if(isRC1_LINKUP){
					//config PCI-E RC
					regWrite32(0xbfb83010, 0xffff0001); //disable support BAR0

					//change class PCI-PCI Bridge
					regWrite32(0xbfb83034, 0x06040001);

					//Enable RC1 ECRC count . //bus0, dev1
					regWrite32(KSEG1ADDR(pcie_config_addr), 0x80118);
					tmp = regRead32(KSEG1ADDR(pcie_config_data));
					regWrite32(KSEG1ADDR(pcie_config_data), (tmp | (1<<8)));
				}else{
					//disable port 1
					tmp = regRead32(0xbfb00088);
					regWrite32(0xbfb00088, (tmp & ~(1<<22)));
					mdelay(1);
				}
			}else{
				//config PCI-E RC
				regWrite32(0xbfb82010, 0xffff0001); //disable support BAR0

				//change class PCI-PCI Bridge
				regWrite32(0xbfb82034, 0x06040001);

				//Enable CRC count .
				regWrite32(KSEG1ADDR(pcie_config_addr), 0x118);
				tmp = regRead32(KSEG1ADDR(pcie_config_data));
				regWrite32(KSEG1ADDR(pcie_config_data), (tmp | (1<<8)));
			}
		}
#if defined(TCSUPPORT_CPU_RT63368) ||defined(TCSUPPORT_CPU_MT7520) || defined(TCSUPPORT_CPU_MT7510)|| defined(TCSUPPORT_CPU_MT7505)
#ifdef TCSUPPORT_WLAN_MT7592_PCIE
	preConfigLDO();
#endif
#endif
	}
	else if(isRT63165){
		
		printk("RT63165_pcie_init\n");
		tmp = regRead32(CR_AHB_PCIC);
		regWrite32(CR_AHB_PCIC, (tmp | (1<<29)));
		mdelay(1);
		tmp = regRead32(CR_AHB_PCIC);
		regWrite32(CR_AHB_PCIC, (tmp | (1<<30)));
		mdelay(1);
		//wait device link up
		for(i=0 ; i<1000 ; i++){
			mdelay(1);
			if((regRead32(0xbfb81050) & 0x1) != 0){
				break;
			}	
		}
		if(i == 1000){
			printk("PCI-E RC can not link up\n");
			return -1;
		}
		regWrite32(0xbfb81cf8, 0x0);
		if((regRead32(0xbfb81cfc) & 0xffff) == 0xffff){
			printk("No PCI-E device found\n");
			return -1;
		}

		//config PCI-E RC
		regWrite32(0xbfb81010, 0xffff0001); //not support BAR0
		//check has device or not 
		regWrite32(0xbfb81034, 0x06040001); //change class PCI-PCI Bridge
		//set pci-e burst size
		//regWrite32(0xbfb81060, 0x3);
		//Enable CRC count .
		regWrite32(KSEG1ADDR(pcie_config_addr), 0x118);
		tmp = regRead32(KSEG1ADDR(pcie_config_data));
		regWrite32(KSEG1ADDR(pcie_config_data), (tmp | (1<<8)));
	}else{
	printk("tc3162_pcie_init\n");
#ifdef CONFIG_MIPS_TC3262
	regWrite32(0xbfb000b8, 0x00000001);
#endif 

#if defined(CONFIG_MIPS_TC3162U) || defined(CONFIG_MIPS_TC3262)
	/*pcie relate clock setting*/
	tmp = regRead32(CR_AHB_SSR);
	//tmp &= ~(1<<0 | 1<<2 | 1<<3 | 1<<4);
	//tmp |= (1<<0 | 1<<2 | 1<<3 | 1<<4);
	/*use internal clock,*/
	tmp &= ~(1<<0 | 1<<2 | 1<<3);
	tmp |= (1<<0 | 1<<2 | 1<<3);
	regWrite32(CR_AHB_SSR, tmp);
	mdelay(1);
#endif

	//tmp = regRead32(CR_AHB_PCIC);
	//regWrite32(CR_AHB_PCIC), (tmp & ~(1<<29)));
	//mdelay(5);
	//tmp = regRead32(CR_AHB_PCIC);
	//regWrite32(CR_AHB_PCIC), (tmp & ~(1<<30)));
	//mdelay(5);

	tmp = regRead32(CR_AHB_PCIC);
	regWrite32(CR_AHB_PCIC, (tmp | (1<<29)));
	mdelay(5);
	tmp = regRead32(CR_AHB_PCIC);
	regWrite32(CR_AHB_PCIC, (tmp | (1<<30)));
	mdelay(5);

#ifdef CONFIG_MIPS_TC3162U
	/*work arround for pcie link up*/
	regWrite32(PCIE_CONFIG_ADDR, 0x40);
	regWrite32(PCIE_CONFIG_DATA, 0x20);
#endif	
	/* PCI memory byte swap enable */
	/*
	tmp = regRead32(CR_AHB_PCIC);
	regWrite32(CR_AHB_PCIC, (tmp | ((1<<24) | (1<<25))));
	*/
	}

	/* Set I/O resource limits.  */
	ioport_resource.end = 0x1fffffff;
	iomem_resource.end = 0xffffffff;

	register_pci_controller(&tc3162_pcie_controller);
	
#ifdef CONFIG_MIPS_TC3162U
	/*Add AHB error monitor check*/
	if(request_irq(ARBITER_ERR_INT, ahbErrIsr, 0, "AHB ERR", ahbErrIsr) != 0) {
		printk("request ARBITER err isr error.\n");
	}
#endif
	/*create a proc to check wifi dead or not*/
	ahb_status_proc = create_proc_entry("tc3162/ahb_status", 0, NULL);
	ahb_status_proc->read_proc = ahb_status_read_proc;
	ahb_status_proc->write_proc = ahb_status_write_proc;

	if(isMT751020){

		/*create a proc to check AER*/
		aer_status_proc = create_proc_entry("tc3162/aer_status", 0, NULL);
		if(aer_status_proc != NULL){
			aer_status_proc->read_proc = aer_status_read_proc;
			aer_status_proc->write_proc = aer_status_write_proc;
		}	
		aer_status_proc = create_proc_entry("tc3162/pcie_reset", 0, NULL);
		if(aer_status_proc != NULL){
			aer_status_proc->read_proc = pcie_rcnum_read_proc;
			aer_status_proc->write_proc = pcie_rcnum_write_proc;
		}
		aer_status_proc = create_proc_entry("tc3162/pcie_reset_cond", 0, NULL);
		if(aer_status_proc != NULL){
			aer_status_proc->read_proc = pcie_reset_con_read_proc;
			aer_status_proc->write_proc = pcie_reset_con_write_proc;
		}
		create_proc_read_entry("tc3162/pcie_reset_count", 0, NULL, pcie_reset_count_read_proc, NULL);
		
	}

	return 0;
}

arch_initcall(tc3162_pcie_init);
