#include <linux/types.h>
#include <linux/pci.h>
#include <linux/kernel.h>
#include <linux/init.h>
#include <linux/delay.h>
#include <asm/tc3162/tc3162.h>


#ifdef CONFIG_MIPS_TC3262
#define PCI_COMMAND_WINDOW 0xBFB80CF8
#endif
static struct resource tc3162_pci_io_resource = {
	.name   = "pci IO space",
	.start  = 0x1FB90000,
	.end    = 0x1FB9FFFF,
	.flags  = IORESOURCE_IO
};

static struct resource tc3162_pci_mem_resource = {
	.name   = "pci memory space",
	.start  = 0x1FBA0000,
	.end    = 0x1FBCFFFF,
	.flags  = IORESOURCE_MEM
};

extern struct pci_ops tc3162_pci_ops;

struct pci_controller tc3162_controller = {
	.pci_ops   		= &tc3162_pci_ops,
	.io_resource	= &tc3162_pci_io_resource,
	.mem_resource	= &tc3162_pci_mem_resource,
};

static __init int tc3162_pci_init(void)
{
	int pci_bios;
	unsigned long tmp;

	if(isRT63365 || isMT751020)
		return -1;

#ifndef CONFIG_MIPS_TC3262
	pci_bios = regRead32(CR_AHB_HWCONF) & (1<<8);

	printk(KERN_INFO "tc3162: system has %sPCI BIOS\n",
		pci_bios ? "" : "no ");
	if (pci_bios == 0)
		return -1;
#endif
	tmp = regRead32(CR_AHB_PCIC);
	regWrite32(CR_AHB_PCIC, (tmp & ~(1<<31)));
	mdelay(100);
	tmp = regRead32(CR_AHB_PCIC);
	regWrite32(CR_AHB_PCIC, (tmp | (1<<31)));
	mdelay(300);

	/* PCI memory byte swap enable */
	/*
	tmp = regRead32(CR_AHB_PCIC);
	regWrite32(CR_AHB_PCIC, (tmp | ((1<<24) | (1<<25))) );
	*/

#ifdef CONFIG_MIPS_TC3262

	/*read pci enable bit from PCI bridge command window to check pci support.
           shnwind*/
	regWrite32(PCI_COMMAND_WINDOW, (1<<31));
	pci_bios = regRead32(PCI_COMMAND_WINDOW);
	 
	printk(KERN_INFO "system has %sPCI BIOS\n",pci_bios ? "" : "no ");
	if (pci_bios == 0){
		return -1;
	}
#endif	
	/* Set I/O resource limits.  */
	ioport_resource.end = 0x1fffffff;
	iomem_resource.end = 0xffffffff;

if(isRT63165)
{
/* rt63165's PCI bridge has additional config registers 
 * which can be direct-accessed, such as the first 3 
 * registers shown below
 */
	//Disable PCI IO SWAP.
	
	tmp = regRead32(0xbfb000ec);
	tmp &= ~(1<<9);
	regWrite32(0xbfb000ec, tmp);

    /* configure USB Host Control Register to 
     do byte swaping in HW --Trey */
	regWrite32(0xbfb000a8, 0x00000060);
    mdelay(10);
    /* set space of PCI base address
    up to 256M  --Trey*/
    regWrite32(0xbfb80010, 0x0fff0001);
    /* configure PCIArbitor Control Register to
    set priority scheme --Trey*/
    regWrite32(0xbfb80080, 0x00000079);

    //set base address of PCI
    regWrite32(0xbfb80cf8, 0x80000410);
    regWrite32(0xbfb80cfc, 0x00000000);
    
    //enable PCI's master, memory functions 
    regWrite32(0xbfb80cf8, 0x80000404);
    regWrite32(0xbfb80cfc, 0xa4800016);
    
    //set PCI's latency-timer, cache-line-size
    regWrite32(0xbfb80cf8, 0x8000040c);
    regWrite32(0xbfb80cfc, 0x00002008);
}
	register_pci_controller(&tc3162_controller);
	return 0;
}

arch_initcall(tc3162_pci_init);
