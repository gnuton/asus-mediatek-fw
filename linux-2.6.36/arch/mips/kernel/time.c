/*
 * Copyright 2001 MontaVista Software Inc.
 * Author: Jun Sun, jsun@mvista.com or jsun@junsun.net
 * Copyright (c) 2003, 2004  Maciej W. Rozycki
 *
 * Common time service routines for MIPS machines.
 *
 * This program is free software; you can redistribute  it and/or modify it
 * under  the terms of  the GNU General  Public License as published by the
 * Free Software Foundation;  either version 2 of the  License, or (at your
 * option) any later version.
 */
#include <linux/bug.h>
#include <linux/clockchips.h>
#include <linux/types.h>
#include <linux/kernel.h>
#include <linux/init.h>
#include <linux/sched.h>
#include <linux/param.h>
#include <linux/time.h>
#include <linux/timex.h>
#include <linux/smp.h>
#include <linux/spinlock.h>
#include <linux/module.h>

#include <asm/cpu-features.h>
#include <asm/div64.h>
#include <asm/smtc_ipi.h>
#include <asm/time.h>
#include <linux/profile.h>
/*
 * forward reference
 */
DEFINE_SPINLOCK(rtc_lock);
EXPORT_SYMBOL(rtc_lock);

int __weak rtc_mips_set_time(unsigned long sec)
{
	return 0;
}

int __weak rtc_mips_set_mmss(unsigned long nowtime)
{
	return rtc_mips_set_time(nowtime);
}

int update_persistent_clock(struct timespec now)
{
	return rtc_mips_set_mmss(now.tv_sec);
}

static int null_perf_irq(void)
{
	return 0;
}

int (*perf_irq)(void) = null_perf_irq;

EXPORT_SYMBOL(perf_irq);

/*
 * time_init() - it does the following things.
 *
 * 1) plat_time_init() -
 * 	a) (optional) set up RTC routines,
 *      b) (optional) calibrate and set the mips_hpt_frequency
 *	    (only needed if you intended to use cpu counter as timer interrupt
 *	     source)
 * 2) calculate a couple of cached variables for later usage
 */

unsigned int mips_hpt_frequency;

/*
 * This function exists in order to cause an error due to a duplicate
 * definition if platform code should have its own implementation.  The hook
 * to use instead is plat_time_init.  plat_time_init does not receive the
 * irqaction pointer argument anymore.  This is because any function which
 * initializes an interrupt timer now takes care of its own request_irq rsp.
 * setup_irq calls and each clock_event_device should use its own
 * struct irqrequest.
 */
void __init plat_timer_setup(void)
{
	BUG();
}

static __init int cpu_has_mfc0_count_bug(void)
{
	switch (current_cpu_type()) {
	case CPU_R4000PC:
	case CPU_R4000SC:
	case CPU_R4000MC:
		/*
		 * V3.0 is documented as suffering from the mfc0 from count bug.
		 * Afaik this is the last version of the R4000.  Later versions
		 * were marketed as R4400.
		 */
		return 1;

	case CPU_R4400PC:
	case CPU_R4400SC:
	case CPU_R4400MC:
		/*
		 * The published errata for the R4400 upto 3.0 say the CPU
		 * has the mfc0 from count bug.
		 */
		if ((current_cpu_data.processor_id & 0xff) <= 0x30)
			return 1;

		/*
		 * we assume newer revisions are ok
		 */
		return 0;
	}

	return 0;
}
#if 0 //def CONFIG_MIPS_TC3262
int reset_time_value(int time_shift){
	u64 temp;
	u32 shift;
	int i;
	unsigned int cpu;
	
#ifdef DBG
	printk("cycles_per_jiffy %x\n",cycles_per_jiffy);
	printk("true mips_hpt_frequency  %x shift %d\n",mips_hpt_frequency_true,time_shift);
#endif	
	if(loops_per_jiffy_true == 0){
		//save correct value
		if(loops_per_jiffy == (1<<12)){
			printk("init not over\n");	
			return -1;
		}else{
			loops_per_jiffy_true = loops_per_jiffy;
			for(i=0;i<NR_CPUS;i++){
				udelay_val_true[i] = cpu_data[i].udelay_val;
			}
		}
	} 
#ifdef DBG	
	printk("true loops_per_jiffie  %x loops_per_jiffie %x\n", loops_per_jiffy_true, loops_per_jiffy);
#endif
	local_irq_disable();
	mips_hpt_frequency = (mips_hpt_frequency_true>>(time_shift));
#ifdef DBG	
	printk("After mips_hpt_frequency %x \n",mips_hpt_frequency);
#endif
	/* Calculate cache parameters.  */
	cycles_per_jiffy = (mips_hpt_frequency + HZ / 2) / HZ;
#ifdef DBG	
	printk("cycles_per_jiffy %x\n",cycles_per_jiffy);
#endif	
	/* Calclate a somewhat reasonable rating value */
	clocksource_mips.rating = 200 + mips_hpt_frequency / 10000000;	
	/* Find a shift value */
	for (shift = 32; shift > 0; shift--) {
		temp = (u64) NSEC_PER_SEC << shift;
		do_div(temp, mips_hpt_frequency);
		if ((temp >> 32) == 0)
			break;
	}
	clocksource_mips.shift = shift;
	clocksource_mips.mult = (u32)temp;
	//about date
	clocksource_calculate_interval(&clocksource_mips, NTP_INTERVAL_LENGTH);
	clocksource_change_rating(&clocksource_mips, clocksource_mips.rating);
#ifdef DBG	
	printk("clocksource_mips.rate %x shift %x mult %x cycle_interval %x\n",clocksource_mips.rating,clocksource_mips.shift,clocksource_mips.mult,clocksource_mips.cycle_interval);
#endif
	//about delay
	for(i=0;i<NR_CPUS;i++){
		cpu_data[i].udelay_val = (udelay_val_true[i] >> (time_shift));
	}
	loops_per_jiffy = loops_per_jiffy_true >> (time_shift) ;

	local_irq_enable();

	return 0;
}
EXPORT_SYMBOL(reset_time_value);
#endif

void (*board_time_init)(void);
void __init time_init(void)
{
	if(board_time_init)
		board_time_init();

	plat_time_init();

	if (!mips_clockevent_init() || !cpu_has_mfc0_count_bug())
		init_mips_clocksource();
}
