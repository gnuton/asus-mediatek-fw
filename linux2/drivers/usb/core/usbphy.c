#include <linux/module.h>
#include <linux/moduleparam.h>
#include <linux/string.h>
#include <linux/bitops.h>
#include <linux/slab.h>
#include <linux/interrupt.h>  /* for in_interrupt() */
#include <linux/kmod.h>
#include <linux/init.h>
#include <linux/spinlock.h>
#include <linux/errno.h>
#include <linux/usb.h>
#include <linux/usb/hcd.h>
#include <linux/mutex.h>
#include <linux/workqueue.h>
#include <linux/debugfs.h>


#include <asm/io.h>
#include <linux/scatterlist.h>
#include <linux/mm.h>
#include <linux/dma-mapping.h>



#include <asm/tc3162/tc3162.h>
//#define USB_PHY_DBG 1


void usb_tc3182_rt65168_phy_init(void){
	unsigned long temp;
	
	/*choose op mode host*/
	temp = VPint(CR_AHB_SSR);
	temp &= ~((1<<30) | (1<<29));
	temp |= ((1<<30) | (1<<29));
	VPint(CR_AHB_SSR) = temp;
	mdelay(10);
	//setup port 0 reset time
	temp = VPint(0xbfb000a8);
	temp |= ((1<<9) | (1<<10));
	VPint(0xbfb000a8) = temp;	
	temp = VPint(0xbfb000ac);
	temp &= ~((1<<29) | (1<<28));
	VPint(0xbfb000ac) = temp;
	//setup port 1 reset time	
	temp = VPint(0xbfb000a8);
	temp |= ((1<<14) | (1<<13));
	VPint(0xbfb000a8) = temp;	
	temp = VPint(0xbfb000a8);
	temp &= ~((1<<12) | (1<<11));
	VPint(0xbfb000a8) = temp;
	//select reset mode internal
	temp = VPint(0xbfb000ac);
	temp &= ~(1<<27);
	VPint(0xbfb000ac) = temp;
	//phy reset
	temp = VPint(0xbfb000ec);
	temp &= ~(1<<31);
	VPint(0xbfb000ec) = temp;
	mdelay(1);
	temp |= (1<<31);
	VPint(0xbfb000ec) = temp;
	mdelay(6);
}

void usb_mt751020_phy_init(void){

#ifdef USB_PHY_DBG
	printk("usb_debug:Init 7510/7520 USB PHY\n");
//7510 ASIC  rtlsim  setting:
//1.	PHY Initial setting :
	printk("usb_debug:PHY initial setting: \n");
//a.	Read  usb_phy_top bank (0xBFAF_1800) offset address 0x0000 :  read data  (0x0048086a)
	printk("read address BFAF1800 (0x0048086a); value is: %lx\n",VPint(0xbfaf1800));
	mdelay(1);
//b.	Read  usb_phy_top bank (0xBFAF_1800) offset address 0x0010 :  read data  (0x00015404)
	printk("read address BFAF1810 (0x00015404); value is: %lx\n",VPint(0xbfaf1810));
	mdelay(1);
//c.	Read  usb_phy_top bank (0xBFAF_1800) offset address 0x0110 :  read data  (0x00015404)
	printk("read address BFAF1910 (0x00015404); value is: %lx\n",VPint(0xbfaf1910));
	mdelay(1);
//d.	Read  usb_phy_top bank (0xBFAF_1800) offset address 0x0060 :  read data  (0x00000402)
	printk("read address BFAF1860 (0x00000402); value is: %lx\n",VPint(0xbfaf1860));
	mdelay(1);
//e.	Read  usb_phy_top bank (0xBFAF_1800) offset address 0x0160 :  read data  (0x00000402)
	printk("read address BFAF1960 (0x00000402); value is: %lx\n",VPint(0xbfaf1960));
	mdelay(1);
//f.	Write usb_phy_top bank (0xBFAF_1800) offset address 0x0060 :  write data (0x00ffff02)
	VPint(0xbfaf1860) = 0x00ffff02;
	printk("write address BFAF1860 with value 0x00ffff02\n");
	mdelay(1);
//g.	Read usb_phy_top bank (0xBFAF_1800) offset address 0x0060 :  read data (0x00ffff02)
	printk("read address BFAF1860 (0x00ffff02); value is: %lx\n",VPint(0xbfaf1860));
	mdelay(1);
//h.	Write usb_phy_top bank (0xBFAF_1800) offset address 0x0060 :  write data (0x00555502)
	VPint(0xbfaf1860) = 0x00555502;
	printk("write address BFAF1860 with value 0x00555502\n");
	mdelay(1);
//i.	Read usb_phy_top bank (0xBFAF_1800) offset address 0x0060 :  read data (0x00555502)
	printk("read address BFAF1860 (0x00555502); value is: %lx\n",VPint(0xbfaf1860));
	mdelay(1);
//j.	Write usb_phy_top bank (0xBFAF_1800) offset address 0x0060 :  write data (0x00aaaa02)
	VPint(0xbfaf1860) = 0x00aaaa02;
	printk("write address BFAF1860 with value 0x00aaaa02\n");
	mdelay(1);
//k.	Read usb_phy_top bank (0xBFAF_1800) offset address 0x0060 :  read data (0x00aaaa02)
	printk("read address BFAF1860 (0x00aaaa02); value is: %lx\n",VPint(0xbfaf1860));
#endif
	mdelay(1);
//l.	Write usb_phy_top bank (0xBFAF_1800) offset address 0x0060 :  write data (0x00000402)
	//VPint(0xbfaf1860) = 0x00000402;
	regWrite32(0xbfaf1860, 0x00000402);
#ifdef USB_PHY_DBG
	printk("write address BFAF1860 with value 0x00000402\n");
#endif
	mdelay(1);
//m.	Read usb_phy_top bank (0xBFAF_1800) offset address 0x0060 :  read data (0x00000402)
#ifdef USB_PHY_DBG
	printk("read address BFAF1860 (0x00000402); value is: %x\n",regRead32(0xbfaf1860));
	mdelay(1);
#endif
//n.	Write usb_phy_top bank (0xBFAF_1800) offset address 0x0000 :  write data (0x0048086a)
	regWrite32(0xbfaf1800, 0x0048086a);
#ifdef USB_PHY_DBG
	printk("write address BFAF1800 with value 0x0048086a\n");
#endif
	mdelay(1);
//o.	Write usb_phy_top bank (0xBFAF_1800) offset address 0x0004 :  write data (0x4400001c)
	regWrite32(0xbfaf1804, 0x4400001c);
#ifdef USB_PHY_DBG
	printk("write address BFAF1804 with value 0x4400001c\n");
#endif
	mdelay(1);
//p.	Write usb_phy_top bank (0xBFAF_1800) offset address 0x001c :  write data (0xc0200000)
	regWrite32(0xbfaf181c, 0xc0200000);
#ifdef USB_PHY_DBG
	printk("write address BFAF181c with value 0xc0200000\n");
#endif
	mdelay(1);
//q.	Write usb_phy_top bank (0xBFAF_1800) offset address 0x011c :  write data (0xc0200000)
	regWrite32(0xbfaf191c, 0xc0200000);
#ifdef USB_PHY_DBG
	printk("write address BFAF191c with value 0xc0200000\n");
#endif
	mdelay(1);
//r.	Write usb_phy_top bank (0xBFAF_1800) offset address 0x0068 :  write data (0x02000000)
	regWrite32(0xbfaf1868, 0x02000000);
#ifdef USB_PHY_DBG
	printk("write address BFAF1868 with value 0x02000000\n");
#endif
	mdelay(1);
//s.	Write usb_phy_top bank (0xBFAF_1800) offset address 0x0168 :  write data (0x02000000)
	regWrite32(0xbfaf1968, 0x02000000);
#ifdef USB_PHY_DBG
	printk("write address BFAF1968 with value 0x02000000\n");
#endif
	mdelay(1);

//2.	Reset usb phy :
#ifdef USB_PHY_DBG
	printk("usb_debug:Reset USB PHY: \n");
#endif
//a.	Write usb_phy_top bank (0xBFAF_1800) offset address 0x0068 :  write data (0x02004000)
	regWrite32(0xbfaf1868, 0x02004000);
#ifdef USB_PHY_DBG
	printk("write address BFAF1868 with value 0x02004000\n");
#endif
	mdelay(1);
//b.	Read  usb_phy_top bank (0xBFAF_1800) offset address 0x0068 :  read data  (0x02004000)
#ifdef USB_PHY_DBG
	printk("read address BFAF1868 (0x02004000); value is: %lx\n",VPint(0xbfaf1868));
	mdelay(1);
#endif
//c.	Write usb_phy_top bank (0xBFAF_1800) offset address 0x0168 :  write data (0x02004000)
	regWrite32(0xbfaf1968, 0x02004000);
#ifdef USB_PHY_DBG
	printk("write address BFAF1968 with value 0x02004000\n");
#endif
	mdelay(1);
//d.	Read  usb_phy_top bank (0xBFAF_1800) offset address 0x0168 :  read data  (0x02004000)
#ifdef USB_PHY_DBG
	printk("read address BFAF1968 (0x02004000); value is: %x\n",regRead32(0xbfaf1968));
	mdelay(1);
#endif
//e.	Write usb_phy_top bank (0xBFAF_1800) offset address 0x0068 :  write data (0x02000000)
	regWrite32(0xbfaf1868, 0x02000000);

#ifdef USB_PHY_DBG
	printk("write address BFAF1868 with value 0x02000000\n");
#endif
	mdelay(1);
//f.	Read  usb_phy_top bank (0xBFAF_1800) offset address 0x0068 :  read data  (0x02000000)
#ifdef USB_PHY_DBG
	printk("read address BFAF1868 (0x02000000); value is: %x\n",regRead32(0xbfaf1868));
	mdelay(1);
#endif
//g.	Write usb_phy_top bank (0xBFAF_1800) offset address 0x0168 :  write data (0x02000000)
	regWrite32(0xbfaf1968, 0x02000000);
#ifdef USB_PHY_DBG
	printk("write address BFAF1968 with value 0x02000000\n");
#endif
	mdelay(1);
//h.	Read  usb_phy_top bank (0xBFAF_1800) offset address 0x0168 :  read data  (0x02000000)
#ifdef USB_PHY_DBG
	printk("read address BFAF1968 (0x02000000); value is: %x\n",regRead32(0xbfaf1968));
	mdelay(1);
#endif

	regWrite32(0xbfaf186c, 0x00800000);
//biker_20130814, add slew rate cal to pass eye diagram test
//port 0
	regWrite32(0xbfaf1810,  regRead32(0xbfaf1810)  | (0x1<<23) );
	mdelay(1);
	regWrite32(0xbfaf1f10,  regRead32(0xbfaf1f10)  | (0x1<<8) );
	mdelay(1);
	regWrite32(0xbfaf1f00,  regRead32(0xbfaf1f00)  | (0x1<<10) );
	mdelay(1);
	regWrite32(0xbfaf1f00,  regRead32(0xbfaf1f00)  | (0x1<<24) );
	mdelay(1);
	regWrite32(0xbfaf1f00,  regRead32(0xbfaf1f00)  & (~(0x1<<24) ) );
	mdelay(1);
	regWrite32(0xbfaf1f10,  regRead32(0xbfaf1f10) & (~(0x1<<8) ));
	mdelay(1);
	regWrite32(0xbfaf1810,  (regRead32(0xbfaf1810) &(~(0x7 <<16)) ) | (0x4<<16) );
	mdelay(1);
	regWrite32(0xbfaf1810,  regRead32(0xbfaf1810) & (~(0x1<<23) ) );
	mdelay(1);

//port 1
	regWrite32(0xbfaf1910,  regRead32(0xbfaf1910)  | (0x1<<23) );
	mdelay(1);
	regWrite32(0xbfaf1f10,  regRead32(0xbfaf1f10)  | (0x1<<8) );
	mdelay(1);
	regWrite32(0xbfaf1f00,  regRead32(0xbfaf1f00)  | (0x1<<10) );
	mdelay(1);
	regWrite32(0xbfaf1f00,  regRead32(0xbfaf1f00)  | (0x1<<24) );
	mdelay(1);
	regWrite32(0xbfaf1f00,  regRead32(0xbfaf1f00)  & (~(0x1<<24) ) );
	mdelay(1);
	regWrite32(0xbfaf1f10,  regRead32(0xbfaf1f10) & (~(0x1<<8) ));
	mdelay(1);
	regWrite32(0xbfaf1910,  (regRead32(0xbfaf1910) &(~(0x7 <<16)) ) | (0x4<<16) );
	mdelay(1);
	regWrite32(0xbfaf1910,  regRead32(0xbfaf1910) & (~(0x1<<23) ) );
	mdelay(1);
	return;
}


void usb_phy_init(void){

	if(isTC3182 || isRT65168){
		usb_tc3182_rt65168_phy_init();
	}
	else if(isMT751020){		
		usb_mt751020_phy_init();
	}

}

