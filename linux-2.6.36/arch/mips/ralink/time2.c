/*
 * Carsten Langgaard, carstenl@mips.com
 * Copyright (C) 1999,2000 MIPS Technologies, Inc.  All rights reserved.
 *
 *  This program is free software; you can distribute it and/or modify it
 *  under the terms of the GNU General Public License (Version 2) as
 *  published by the Free Software Foundation.
 *
 *  This program is distributed in the hope it will be useful, but WITHOUT
 *  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 *  FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
 *  for more details.
 *
 *  You should have received a copy of the GNU General Public License along
 *  with this program; if not, write to the Free Software Foundation, Inc.,
 *  59 Temple Place - Suite 330, Boston MA 02111-1307, USA.
 *
 * Setting up the clock on the MIPS boards.
 */

#include <linux/types.h>
#include <linux/init.h>
#include <linux/kernel_stat.h>
#include <linux/sched.h>
#include <linux/spinlock.h>
#include <linux/interrupt.h>
#include <linux/time.h>
#include <linux/timex.h>

#include <asm/mipsregs.h>
#include <asm/mipsmtregs.h>
#include <asm/hardirq.h>
#include <asm/irq.h>
#include <asm/div64.h>
#include <asm/cpu.h>
#include <asm/time.h>

#include <asm/tc3162/tc3162.h>
#include <asm/tc3162/TCIfSetQuery_os.h>

unsigned long cpu_khz;

static int mips_cpu_timer_irq;
extern int cp0_perfcount_irq;
extern void smtc_timer_broadcast(int);

#ifdef CONFIG_PCI
extern int pcieRegInitConfig(void);
extern void pcieReset(void);
extern void setahbstat(int val);
#endif

static void delay1ms(int ms)
{
	volatile uint32 timer_now, timer_last;
	volatile uint32 tick_acc;
	uint32 one_tick_unit = SYS_HCLK * 500;//1 * SYS_HCLK * 1000 / 2
	volatile uint32 tick_wait = ms * one_tick_unit; 
	volatile uint32 timer1_ldv = regRead32(CR_TIMER1_LDV);

	tick_acc = 0;
	timer_last = regRead32(CR_TIMER1_VLR);
	do {
		timer_now = regRead32(CR_TIMER1_VLR);
	  	if (timer_last >= timer_now) 
	  		tick_acc += timer_last - timer_now;
		else
			tick_acc += timer1_ldv - timer_now + timer_last;
		timer_last = timer_now;
	} while (tick_acc < tick_wait);
}

void
timer_Configure(
	uint8  timer_no, 
	uint8 timer_enable, 
	uint8 timer_mode, 
	uint8 timer_halt
)
{
	uint32 word,word1;

	word = regRead32(CR_TIMER_CTL);
	word1 = (timer_enable << timer_no)|(timer_mode << (timer_no + 8))|(timer_halt << (timer_no + 26));
	word |= word1;
	regWrite32(CR_TIMER_CTL, word);
} 

void 
timerSet(
	uint32 timer_no,
	uint32 timerTime, 
	uint32 enable,
	uint32 mode, 
	uint32 halt
)
{   
    uint32 word;

	/* when SYS_HCLK is large, it will cause overflow. The calculation will be wrong */
    /* word = (timerTime * SYS_HCLK) * 1000 / 2; */
    word = (timerTime * SYS_HCLK) * 500; 
    timerLdvSet(timer_no,word);
    timerCtlSet(timer_no,enable,mode,halt);
}

void
timer_WatchDogConfigure (
	uint8 tick_enable, 
	uint8 watchdog_enable
)
{
	uint32 word;

	word = regRead32(CR_TIMER_CTL);
	word &= 0xfdffffdf;
	word |= ( tick_enable << 5)|(watchdog_enable<<25);
	regWrite32(CR_TIMER_CTL, word);
}

int
is_nmi_enable(void)
{
	uint32 word = regRead32(CR_AHB_NMI_CONF);

	if(word & 0x3)
		return 1;
	else
		return 0;
	
}

void
set_nmi_enable(uint8 nmi_enable){
	uint32 word;
	/*Config NMI0*/
	word = regRead32(CR_INTC_NMI0IMR0);	
	if(nmi_enable)
		word |= 0x200;
	else
		word &= ~0x200;
	regWrite32(CR_INTC_NMI0IMR0, word);	

	#if 0
	/*Config NMI1*/
	word = regRead32(CR_INTC_NMI1IMR0);
	if(nmi_enable)
		word |= 0x200;
	else
		word &= ~0x200;
	regWrite32(CR_INTC_NMI1IMR0, word);
	#endif

}

#if defined(TCSUPPORT_DYING_GASP)
EXPORT_SYMBOL(timerSet);
EXPORT_SYMBOL(timer_WatchDogConfigure);
#endif
#define get_current_vpe()   \
	((read_c0_tcbind() >> TCBIND_CURVPE_SHIFT) & TCBIND_CURVPE)

extern void tc3162_enable_irq(unsigned int irq);

static void mips_timer_dispatch(void)
{
	do_IRQ(SI_TIMER_INT);
}

static void mips_perf_dispatch(void)
{
	do_IRQ(cp0_perfcount_irq);
}

extern int (*perf_irq)(void);

/*
 * Estimate CPU frequency.  Sets mips_hpt_frequency as a side-effect
 */
static unsigned int __init estimate_cpu_frequency(void)
{
	unsigned int count;
	unsigned long flags;
	unsigned int start;

	local_irq_save(flags);

	/* Start r4k counter. */
	start = read_c0_count();

	/* delay 1 second */
	delay1ms(1000);

	count = read_c0_count() - start;

	/* restore interrupts */
	local_irq_restore(flags);

	count += 5000;    /* round */
	count -= count%10000;

	mips_hpt_frequency = count;

	/* on 34K, 2 cycles per count */
	count *= 2;

	return count;
}

irqreturn_t mips_perf_interrupt(int irq, void *dev_id)
{
	return perf_irq();
}

static struct irqaction perf_irqaction = {
	.handler = mips_perf_interrupt,
	.flags = IRQF_DISABLED | IRQF_PERCPU,
	.name = "performance",
};
extern struct clocksource clocksource_mips;

#if defined(TCSUPPORT_DYING_GASP) && (defined(CONFIG_MIPS_RT63365))
irqreturn_t real_watchdog_timer_interrupt(int irq, void *dev_id)
#else
irqreturn_t watchdog_timer_interrupt(int irq, void *dev_id)
#endif
{
	uint32 word;

	word = regRead32(CR_TIMER_CTL); 
	word &= 0xffc0ffff;
	word |= 0x00200000;
	regWrite32(CR_TIMER_CTL, word);

	printk("watchdog timer interrupt\n");

#ifdef CONFIG_TC3162_ADSL
    /* stop adsl */
	if (adsl_dev_ops)
	    adsl_dev_ops->set(ADSL_SET_DMT_CLOSE, NULL, NULL); 
#endif

#if defined(CONFIG_MIPS_TC3262) && defined(TCSUPPORT_POWERSAVE_ENABLE)
	if(isRT63365){
		word = regRead32(CR_AHB_CLK);
		word |= 0x57e1;//restore ahb clk to default value
		regWrite32(CR_AHB_CLK, word);
	}
#endif
	dump_stack();

	return IRQ_HANDLED;
}

#if defined(TCSUPPORT_DYING_GASP) && (defined(CONFIG_MIPS_RT63365))
__IMEM
irqreturn_t watchdog_timer_interrupt(int irq, void *dev_id){
	
	unsigned int word;
	word = regRead32(0xbfb00834);
        word &= ~(1<<18);//enable spi
        regWrite32(0xbfb00834, word);
	word = regRead32(0xbfb00040);
        word &= ~(1<<0); //enable ddr device
        regWrite32(0xbfb00040, word);

	return real_watchdog_timer_interrupt(irq, dev_id);
}
#endif
static struct irqaction watchdog_timer_irqaction = {
	.handler = watchdog_timer_interrupt,
	.flags = IRQF_DISABLED ,
	.name = "watchdog",
};

static void watchdog_timer_dispatch(void)
{
	do_IRQ(TIMER5_INT);
}

/************************************************************************
*                   B U S  T I M E O U T  I N T E R R U P T  
*************************************************************************
*/

irqreturn_t bus_timeout_interrupt(int irq, void *dev_id)
{
	uint32 reg;
	uint32 addr;
	
	/* read to clear interrupt */
	if(isMT751020)
	{
		regWrite32(CR_PRATIR, 0);
		addr =  regRead32(CR_ERR_ADDR);
		printk("bus timeout interrupt ERR ADDR=%08lx\n", addr);
		dump_stack();	

#if 0//def CONFIG_PCI
		if(addr >= 0x1fb80000 && addr <= 0x1fb80064)
		{
			pcieReset();
			pcieRegInitConfig();
			setahbstat(1);
		}
#endif
	}
	else
	{
	reg = regRead32(CR_PRATIR);
	
	printk("bus timeout interrupt ERR ADDR=%08lx\n", regRead32(CR_ERR_ADDR));
	dump_stack();	
	
#ifdef CONFIG_PCI
	pcieReset();
	pcieRegInitConfig();
	setahbstat(1);
#endif
	}
	
	return IRQ_HANDLED;
}

static struct irqaction bus_timeout_irqaction = {
	.handler = bus_timeout_interrupt,
	.flags = IRQF_DISABLED ,
	.name = "bus timeout",
};

static void bus_timeout_dispatch(void)
{
	do_IRQ(BUS_TOUT_INT);
}
static unsigned long cycles_per_jiffy __read_mostly;
static unsigned int expirelo;

static int vpe1_timer_installed = 0;

unsigned int __cpuinit get_c0_compare_int(void)
{
	if ((get_current_vpe()) && !vpe1_timer_installed) {
		tc3162_enable_irq(SI_TIMER1_INT);
		vpe1_timer_installed++;
	}

	if (vpe1_timer_installed == 0) {
		if (cpu_has_veic) 
			set_vi_handler(SI_TIMER_INT, mips_timer_dispatch);
	}
	mips_cpu_timer_irq = SI_TIMER_INT;

	return mips_cpu_timer_irq;
}
static cycle_t cputmr_hpt_read(void)
{
	return regRead32(CR_CPUTMR_CNT0);
}
static void __init cputmr_hpt_timer_init(void)
{
	unsigned int tmp;

	regWrite32(CR_CPUTMR_CNT0, 0x0);
	regWrite32(CR_CPUTMR_CNT1, 0x0);

	expirelo = regRead32(CR_CPUTMR_CNT0) + cycles_per_jiffy;
	
	regWrite32(CR_CPUTMR_CMR0, expirelo);
        regWrite32(CR_CPUTMR_CMR1, expirelo);

	tmp = regRead32(CR_CPUTMR_CTL);
	tmp |= (1<<1)|(1<<0);
	regWrite32(CR_CPUTMR_CTL, tmp);	
}
static void cputmr_timer_ack(void)
{
	unsigned int count = 0;

	/* Ack this timer interrupt and set the next one.  */
	expirelo += cycles_per_jiffy;
	regWrite32(CR_CPUTMR_CMR0, expirelo);

	/* Check to see if we have missed any timer interrupts.  */
	while (((count = regRead32(CR_CPUTMR_CNT0)) - expirelo) < 0x7fffffff) {
		/* missed_timer_count++; */
		expirelo = count + cycles_per_jiffy;
		regWrite32(CR_CPUTMR_CMR0, expirelo);
	}
}

void __init tc3162_time_init(void)
{

	timerSet(1, TIMERTICKS_10MS, ENABLE, TIMER_TOGGLEMODE, TIMER_HALTDISABLE);

	if (isRT63165 || isRT63365 || isMT751020) {
		/* watchdog timer */
		/* set count down 3 seconds to issue interrupt */
		regWrite32(CR_WDOG_THSLD, ((3 * TIMERTICKS_1S * SYS_HCLK) * 500)); // (3 * TIMERTICKS_1S * SYS_HCLK) * 1000 / 2
		if (cpu_has_vint)
			set_vi_handler(TIMER5_INT, watchdog_timer_dispatch);
#ifdef CONFIG_MIPS_MT_SMTC
		setup_irq_smtc(TIMER5_INT, &watchdog_timer_irqaction, 0x0);
#else
		setup_irq(TIMER5_INT, &watchdog_timer_irqaction);
#endif

		/* setup bus timeout interrupt */
   		//VPint(CR_MON_TMR) |= ((1<<30) | (0xff));
		if(isMT751020)
		{
			regWrite32(CR_MON_TMR, 0xcfffffff);
			regWrite32(CR_BUSTIMEOUT_SWITCH, 0xfdbfffff);//switch off usb phy(bit22/bit25) control because hw issue
		}

		if (cpu_has_vint)
			set_vi_handler(BUS_TOUT_INT, bus_timeout_dispatch);
#ifdef CONFIG_MIPS_MT_SMTC
		setup_irq_smtc(BUS_TOUT_INT, &bus_timeout_irqaction, 0x0);
#else
		setup_irq(BUS_TOUT_INT, &bus_timeout_irqaction);
#endif
	} 

}

void (*mips_timer_ack)(void);
void __init plat_time_init(void)
{
		unsigned int est_freq = 0;

	timerSet(1, TIMERTICKS_10MS, ENABLE, TIMER_TOGGLEMODE, TIMER_HALTDISABLE);

	est_freq = estimate_cpu_frequency ();

	printk("CPU frequency %d.%02d MHz\n", est_freq/1000000,
	       (est_freq%1000000)*100/1000000);

    cpu_khz = est_freq / 1000;
		
	if (isRT63165 || isRT63365 || isMT751020) {		
		
		/* enable CPU external timer */
		clocksource_mips.read = cputmr_hpt_read;
		mips_hpt_frequency = CPUTMR_CLK;

		mips_timer_ack = cputmr_timer_ack;
		/* Calculate cache parameters.  */
		cycles_per_jiffy =
			(mips_hpt_frequency + HZ / 2) / HZ;

		cputmr_hpt_timer_init();
		
		printk(" Using %u.%03u MHz high precision timer.\n",
		   ((mips_hpt_frequency + 500) / 1000) / 1000,
		   ((mips_hpt_frequency + 500) / 1000) % 1000);
	}
}

