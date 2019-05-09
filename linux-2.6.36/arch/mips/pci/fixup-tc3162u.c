#include <linux/init.h>
#include <linux/types.h>
#include <linux/pci.h>
#include <asm/tc3162/tc3162.h>
#include <linux/delay.h>

#ifndef PCIE_PCI_COEXIT
/*
static char irq_tab_tc3162_pcie[] __initdata = {
    //[1] = PCI_A_INT,
    //[2] = PCI_B_INT,
    [0] = PCIE_A_INT,//krammer
};
*/
int __init pcibios_map_irq(struct pci_dev *dev, u8 slot, u8 pin)
{
	//if (slot <= 0)
#if 0
	if (slot < 0)
		return -1;
#endif
    	//return irq_tab_tc3162[slot];
	return PCIE_A_INT;
}
#endif

extern int dual_band_support;
static void tc3162_pcie_fixup(struct pci_dev *dev)
{
	/* setup COMMAND register */
	pci_write_config_word(dev, PCI_COMMAND,
		(PCI_COMMAND_IO | PCI_COMMAND_MEMORY | PCI_COMMAND_MASTER));

	/* setup CACHE_LINE_SIZE register */
	pci_write_config_byte(dev, PCI_CACHE_LINE_SIZE, 0x8);

	/* setup LATENCY_TIMER register */
	pci_write_config_byte(dev, PCI_LATENCY_TIMER, 0x20);

	/* setup BARS */
//	pci_write_config_dword(dev, PCI_BASE_ADDRESS_0, 0);
//	pci_write_config_dword(dev, PCI_BASE_ADDRESS_1, 0x1FBA0000);
//	pci_write_config_dword(dev, PCI_BASE_ADDRESS_2, 0x1FBB0000);
}
static void tc3162_pcie_fixup_ra63165(struct pci_dev *dev)
{
	uint32 tmp;
#if defined(TCSUPPORT_BONDING)
	int i;
#endif

	/* setup COMMAND register */
	pci_write_config_word(dev, PCI_COMMAND,
		(PCI_COMMAND_IO | PCI_COMMAND_MEMORY | PCI_COMMAND_MASTER));

#if defined(TCSUPPORT_BONDING)
	//Enable slave RC ECRC count . //bus1, dev1
	regWrite32(0xbfb80020, 0x1080118);
	tmp = regRead32(0xbfb80024);
	regWrite32(0xbfb80024, (tmp | (1<<8)));

	//config PCIe RC/EP VC mapping
	//set bus0, dev0, fun0, reg154 (setup VC0)
	regWrite32(0xbfb80020, 0x154);
	regWrite32(0xbfb80024, 0X80000001);
	//set bus0, dev0, fun0, reg160 (setup VC1)
	regWrite32(0xbfb80020, 0x160);
	regWrite32(0xbfb80024, 0X81000002);
	//set bus1, dev0, fun0, reg154 (setup VC0)
	regWrite32(0xbfb80020, 0x1000154);
	regWrite32(0xbfb80024, 0X80000001);
	//set bus1, dev0, fun0, reg160 (setup VC1)
	regWrite32(0xbfb80020, 0x1000160);
	regWrite32(0xbfb80024, 0X81000002);

	//config slave chip EP MSI
	regWrite32(0xbfb80020, 0x1000050);
	tmp = regRead32(0xbfb80024);
	regWrite32(0xbfb80020, 0x1000050);
	regWrite32(0xbfb80024, (tmp | 0x510000));
	regWrite32(0xbfb80020, 0x1000054);
	regWrite32(0xbfb80024, 0x20af1000);
	regWrite32(0xbfb80020, 0x100005c);
	regWrite32(0xbfb80024, 0x0);

	//setup RC0 MSI address reg
	regWrite32(0xbfb82090, 0x20af1000);

	//setup RC0 Pbus/Rbus VC mapping
	regWrite32(0xbfb82094, 0x1);
	regWrite32(0xbfb83094, 0x0);

	//wait RC0 VC1 set up OK
	for(i=0 ; i<1000 ; i++){
		mdelay(1);
		regWrite32(0xbfb80020, 0x164);
		if((regRead32(0xbfb80024) & (1<<17)) == 0){
			break;
		}
	}
#endif

	//pci-e interrupt enable_dma
	if(isRT63365 || isMT751020){
#if defined(TCSUPPORT_BONDING)
		if((regRead32(0xbfb82050) & 0x1) != 0){
			/* slave dmt */
			tmp = regRead32(0xbfb8000c);
			regWrite32(0xbfb8000c, (tmp | (1<<23)));
			/* slave gdma */
			tmp = regRead32(0xbfb8000c);
			regWrite32(0xbfb8000c, (tmp | (1<<25)));

			if(regRead32(0xbfb80050) == 1){
				/* wifi 0 (slave)*/
				tmp = regRead32(0xbfb8000c);
				regWrite32(0xbfb8000c, (tmp | (1<<22)));
			}
		}
#else
		if((regRead32(0xbfb82050) & 0x1) != 0){
			tmp = regRead32(0xbfb8000c);
			regWrite32(0xbfb8000c, (tmp | (1<<20)));
		}
#endif
		//second band
		if(dual_band_support){
			if((regRead32(0xbfb83050) & 0x1) != 0){
				if(isMT751020){
					tmp = regRead32(0xbfb8000c);
					regWrite32(0xbfb8000c, (tmp | (1<<26)));
				}else{
					tmp = regRead32(0xbfb8000c);
					regWrite32(0xbfb8000c, (tmp | (1<<21)));
				}
			}
		}
	}else{
		tmp = regRead32(0xbfb8100c);
		regWrite32(0xbfb8100c, (tmp | (1<<20)));
	}

	if(isMT751020){
		pcie_timeout_disable();
		aer_config(1);
	}
}

#ifndef PCIE_PCI_COEXIT
int pcibios_plat_dev_init(struct pci_dev *dev)
{
	return 0;
}
#endif

DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_SIS, PCI_DEVICE_ID_SIS,
          tc3162_pcie_fixup);
DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_RT, PCI_DEVICE_ID_RT,
          tc3162_pcie_fixup_ra63165);
DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_MTK, PCI_DEVICE_ID_MTK,
		tc3162_pcie_fixup_ra63165);


