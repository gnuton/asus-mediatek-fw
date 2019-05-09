#ifndef __ASM_MACH_MIPS_IRQ_H
#define __ASM_MACH_MIPS_IRQ_H


#ifdef CONFIG_MIPS_TC3262
#define NR_IRQS 64
#else
#define NR_IRQS 32
#endif

#include_next <irq.h>

#endif /* __ASM_MACH_MIPS_IRQ_H */
