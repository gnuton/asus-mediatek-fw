# 1 "/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma.mod.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "./include/generated/autoconf.h" 1
# 1 "<command-line>" 2
# 1 "/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma.mod.c"
# 1 "include/linux/module.h" 1
# 9 "include/linux/module.h"
# 1 "include/linux/list.h" 1



# 1 "include/linux/types.h" 1



# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/types.h" 1
# 21 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/types.h"
# 1 "include/asm-generic/int-ll64.h" 1
# 11 "include/asm-generic/int-ll64.h"
# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/bitsperlong.h" 1





# 1 "include/asm-generic/bitsperlong.h" 1
# 7 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/bitsperlong.h" 2
# 12 "include/asm-generic/int-ll64.h" 2







typedef __signed__ char __s8;
typedef unsigned char __u8;

typedef __signed__ short __s16;
typedef unsigned short __u16;

typedef __signed__ int __s32;
typedef unsigned int __u32;


__extension__ typedef __signed__ long long __s64;
__extension__ typedef unsigned long long __u64;
# 42 "include/asm-generic/int-ll64.h"
typedef signed char s8;
typedef unsigned char u8;

typedef signed short s16;
typedef unsigned short u16;

typedef signed int s32;
typedef unsigned int u32;

typedef signed long long s64;
typedef unsigned long long u64;
# 22 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/types.h" 2




typedef unsigned short umode_t;
# 40 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/types.h"
typedef u32 dma_addr_t;

typedef u64 dma64_addr_t;







typedef unsigned long phys_t;
# 5 "include/linux/types.h" 2
# 17 "include/linux/types.h"
# 1 "include/linux/posix_types.h" 1



# 1 "include/linux/stddef.h" 1



# 1 "include/linux/compiler.h" 1
# 44 "include/linux/compiler.h"
# 1 "include/linux/compiler-gcc.h" 1
# 90 "include/linux/compiler-gcc.h"
# 1 "include/linux/compiler-gcc4.h" 1
# 91 "include/linux/compiler-gcc.h" 2
# 45 "include/linux/compiler.h" 2
# 62 "include/linux/compiler.h"
struct ftrace_branch_data {
 const char *func;
 const char *file;
 unsigned line;
 union {
  struct {
   unsigned long correct;
   unsigned long incorrect;
  };
  struct {
   unsigned long miss;
   unsigned long hit;
  };
  unsigned long miss_hit[2];
 };
};
# 5 "include/linux/stddef.h" 2
# 15 "include/linux/stddef.h"
enum {
 false = 0,
 true = 1
};
# 5 "include/linux/posix_types.h" 2
# 36 "include/linux/posix_types.h"
typedef struct {
 unsigned long fds_bits [(1024/(8 * sizeof(unsigned long)))];
} __kernel_fd_set;


typedef void (*__kernel_sighandler_t)(int);


typedef int __kernel_key_t;
typedef int __kernel_mqd_t;

# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/posix_types.h" 1
# 12 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/posix_types.h"
# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/sgidefs.h" 1
# 13 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/posix_types.h" 2







typedef unsigned long __kernel_ino_t;
typedef unsigned int __kernel_mode_t;

typedef unsigned long __kernel_nlink_t;




typedef long __kernel_off_t;
typedef int __kernel_pid_t;
typedef int __kernel_ipc_pid_t;
typedef unsigned int __kernel_uid_t;
typedef unsigned int __kernel_gid_t;

typedef unsigned int __kernel_size_t;
typedef int __kernel_ssize_t;
typedef int __kernel_ptrdiff_t;






typedef long __kernel_time_t;
typedef long __kernel_suseconds_t;
typedef long __kernel_clock_t;
typedef int __kernel_timer_t;
typedef int __kernel_clockid_t;
typedef long __kernel_daddr_t;
typedef char * __kernel_caddr_t;

typedef unsigned short __kernel_uid16_t;
typedef unsigned short __kernel_gid16_t;
typedef unsigned int __kernel_uid32_t;
typedef unsigned int __kernel_gid32_t;
typedef __kernel_uid_t __kernel_old_uid_t;
typedef __kernel_gid_t __kernel_old_gid_t;
typedef unsigned int __kernel_old_dev_t;


typedef long long __kernel_loff_t;


typedef struct {

 long val[2];




} __kernel_fsid_t;




static __inline__ __attribute__((always_inline)) void __FD_SET(unsigned long __fd, __kernel_fd_set *__fdsetp)
{
 unsigned long __tmp = __fd / (8 * sizeof(unsigned long));
 unsigned long __rem = __fd % (8 * sizeof(unsigned long));
 __fdsetp->fds_bits[__tmp] |= (1UL<<__rem);
}


static __inline__ __attribute__((always_inline)) void __FD_CLR(unsigned long __fd, __kernel_fd_set *__fdsetp)
{
 unsigned long __tmp = __fd / (8 * sizeof(unsigned long));
 unsigned long __rem = __fd % (8 * sizeof(unsigned long));
 __fdsetp->fds_bits[__tmp] &= ~(1UL<<__rem);
}


static __inline__ __attribute__((always_inline)) int __FD_ISSET(unsigned long __fd, const __kernel_fd_set *__p)
{
 unsigned long __tmp = __fd / (8 * sizeof(unsigned long));
 unsigned long __rem = __fd % (8 * sizeof(unsigned long));
 return (__p->fds_bits[__tmp] & (1UL<<__rem)) != 0;
}






static __inline__ __attribute__((always_inline)) void __FD_ZERO(__kernel_fd_set *__p)
{
 unsigned long *__tmp = __p->fds_bits;
 int __i;

 if (__builtin_constant_p((1024/(8 * sizeof(unsigned long))))) {
  switch ((1024/(8 * sizeof(unsigned long)))) {
  case 16:
   __tmp[ 0] = 0; __tmp[ 1] = 0;
   __tmp[ 2] = 0; __tmp[ 3] = 0;
   __tmp[ 4] = 0; __tmp[ 5] = 0;
   __tmp[ 6] = 0; __tmp[ 7] = 0;
   __tmp[ 8] = 0; __tmp[ 9] = 0;
   __tmp[10] = 0; __tmp[11] = 0;
   __tmp[12] = 0; __tmp[13] = 0;
   __tmp[14] = 0; __tmp[15] = 0;
   return;

  case 8:
   __tmp[ 0] = 0; __tmp[ 1] = 0;
   __tmp[ 2] = 0; __tmp[ 3] = 0;
   __tmp[ 4] = 0; __tmp[ 5] = 0;
   __tmp[ 6] = 0; __tmp[ 7] = 0;
   return;

  case 4:
   __tmp[ 0] = 0; __tmp[ 1] = 0;
   __tmp[ 2] = 0; __tmp[ 3] = 0;
   return;
  }
 }
 __i = (1024/(8 * sizeof(unsigned long)));
 while (__i) {
  __i--;
  *__tmp = 0;
  __tmp++;
 }
}
# 48 "include/linux/posix_types.h" 2
# 18 "include/linux/types.h" 2


typedef __u32 __kernel_dev_t;

typedef __kernel_fd_set fd_set;
typedef __kernel_dev_t dev_t;
typedef __kernel_ino_t ino_t;
typedef __kernel_mode_t mode_t;
typedef __kernel_nlink_t nlink_t;
typedef __kernel_off_t off_t;
typedef __kernel_pid_t pid_t;
typedef __kernel_daddr_t daddr_t;
typedef __kernel_key_t key_t;
typedef __kernel_suseconds_t suseconds_t;
typedef __kernel_timer_t timer_t;
typedef __kernel_clockid_t clockid_t;
typedef __kernel_mqd_t mqd_t;

typedef _Bool bool;




typedef __kernel_uid32_t uid_t;
typedef __kernel_gid32_t gid_t;
typedef __kernel_uid16_t uid16_t;
typedef __kernel_gid16_t gid16_t;

typedef unsigned long uintptr_t;
# 55 "include/linux/types.h"
typedef __kernel_loff_t loff_t;
# 64 "include/linux/types.h"
typedef __kernel_size_t size_t;




typedef __kernel_ssize_t ssize_t;




typedef __kernel_ptrdiff_t ptrdiff_t;




typedef __kernel_time_t time_t;




typedef __kernel_clock_t clock_t;




typedef __kernel_caddr_t caddr_t;



typedef unsigned char u_char;
typedef unsigned short u_short;
typedef unsigned int u_int;
typedef unsigned long u_long;


typedef unsigned char unchar;
typedef unsigned short ushort;
typedef unsigned int uint;
typedef unsigned long ulong;




typedef __u8 u_int8_t;
typedef __s8 int8_t;
typedef __u16 u_int16_t;
typedef __s16 int16_t;
typedef __u32 u_int32_t;
typedef __s32 int32_t;



typedef __u8 uint8_t;
typedef __u16 uint16_t;
typedef __u32 uint32_t;


typedef __u64 uint64_t;
typedef __u64 u_int64_t;
typedef __s64 int64_t;
# 151 "include/linux/types.h"
typedef unsigned long sector_t;
typedef unsigned long blkcnt_t;
# 181 "include/linux/types.h"
typedef __u16 __le16;
typedef __u16 __be16;
typedef __u32 __le32;
typedef __u32 __be32;
typedef __u64 __le64;
typedef __u64 __be64;

typedef __u16 __sum16;
typedef __u32 __wsum;







typedef unsigned gfp_t;
typedef unsigned fmode_t;




typedef u32 phys_addr_t;


typedef phys_addr_t resource_size_t;

typedef struct {
 int counter;
} atomic_t;







struct list_head {
 struct list_head *next, *prev;
};

struct hlist_head {
 struct hlist_node *first;
};

struct hlist_node {
 struct hlist_node *next, **pprev;
};

struct ustat {
 __kernel_daddr_t f_tfree;
 __kernel_ino_t f_tinode;
 char f_fname[6];
 char f_fpack[6];
};
# 5 "include/linux/list.h" 2

# 1 "include/linux/poison.h" 1
# 7 "include/linux/list.h" 2
# 1 "include/linux/prefetch.h" 1
# 14 "include/linux/prefetch.h"
# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/processor.h" 1
# 14 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/processor.h"
# 1 "include/linux/cpumask.h" 1
# 9 "include/linux/cpumask.h"
# 1 "include/linux/kernel.h" 1
# 12 "include/linux/kernel.h"
# 1 "/mtkeda/bbn/trendchip/mips-linux-uclibc/usr/bin/../lib/gcc/mips-linux-uclibc/4.3.4/include/stdarg.h" 1 3 4
# 43 "/mtkeda/bbn/trendchip/mips-linux-uclibc/usr/bin/../lib/gcc/mips-linux-uclibc/4.3.4/include/stdarg.h" 3 4
typedef __builtin_va_list __gnuc_va_list;
# 105 "/mtkeda/bbn/trendchip/mips-linux-uclibc/usr/bin/../lib/gcc/mips-linux-uclibc/4.3.4/include/stdarg.h" 3 4
typedef __gnuc_va_list va_list;
# 13 "include/linux/kernel.h" 2
# 1 "include/linux/linkage.h" 1




# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/linkage.h" 1
# 6 "include/linux/linkage.h" 2
# 14 "include/linux/kernel.h" 2



# 1 "include/linux/bitops.h" 1
# 13 "include/linux/bitops.h"
extern unsigned int __sw_hweight8(unsigned int w);
extern unsigned int __sw_hweight16(unsigned int w);
extern unsigned int __sw_hweight32(unsigned int w);
extern unsigned long __sw_hweight64(__u64 w);





# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/bitops.h" 1
# 17 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/bitops.h"
# 1 "include/linux/irqflags.h" 1
# 14 "include/linux/irqflags.h"
# 1 "include/linux/typecheck.h" 1
# 15 "include/linux/irqflags.h" 2
# 57 "include/linux/irqflags.h"
# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/irqflags.h" 1
# 17 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/irqflags.h"
# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/hazards.h" 1
# 17 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/hazards.h"
# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/cpu-features.h" 1
# 12 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/cpu-features.h"
# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/cpu.h" 1
# 190 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/cpu.h"
enum cpu_type_enum {
 CPU_UNKNOWN,




 CPU_R2000, CPU_R3000, CPU_R3000A, CPU_R3041, CPU_R3051, CPU_R3052,
 CPU_R3081, CPU_R3081E,




 CPU_R6000, CPU_R6000A,




 CPU_R4000PC, CPU_R4000SC, CPU_R4000MC, CPU_R4200, CPU_R4300, CPU_R4310,
 CPU_R4400PC, CPU_R4400SC, CPU_R4400MC, CPU_R4600, CPU_R4640, CPU_R4650,
 CPU_R4700, CPU_R5000, CPU_R5000A, CPU_R5500, CPU_NEVADA, CPU_R5432,
 CPU_R10000, CPU_R12000, CPU_R14000, CPU_VR41XX, CPU_VR4111, CPU_VR4121,
 CPU_VR4122, CPU_VR4131, CPU_VR4133, CPU_VR4181, CPU_VR4181A, CPU_RM7000,
 CPU_SR71000, CPU_RM9000, CPU_TX49XX,




 CPU_R8000,




 CPU_TX3912, CPU_TX3922, CPU_TX3927,




 CPU_4KC, CPU_4KEC, CPU_4KSC, CPU_24K, CPU_34K, CPU_1004K, CPU_74K,
 CPU_ALCHEMY, CPU_PR4450, CPU_BCM3302, CPU_BCM4710,
 CPU_BCM6338, CPU_BCM6345, CPU_BCM6348, CPU_BCM6358,
 CPU_JZRISC,




 CPU_5KC, CPU_20KC, CPU_25KF, CPU_SB1, CPU_SB1A, CPU_LOONGSON2,
 CPU_CAVIUM_OCTEON, CPU_CAVIUM_OCTEON_PLUS,

 CPU_LAST
};
# 13 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/cpu-features.h" 2
# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/cpu-info.h" 1
# 17 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/cpu-info.h"
# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/cache.h" 1
# 12 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/cache.h"
# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/mach-generic/kmalloc.h" 1
# 13 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/cache.h" 2
# 18 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/cpu-info.h" 2




struct cache_desc {
 unsigned int waysize;
 unsigned short sets;
 unsigned char ways;
 unsigned char linesz;
 unsigned char waybit;
 unsigned char flags;
};
# 41 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/cpu-info.h"
struct cpuinfo_mips {
 unsigned int udelay_val;
 unsigned int asid_cache;




 unsigned long options;
 unsigned long ases;
 unsigned int processor_id;
 unsigned int fpu_id;
 unsigned int cputype;
 int isa_level;
 int tlbsize;
 struct cache_desc icache;
 struct cache_desc dcache;
 struct cache_desc scache;
 struct cache_desc tcache;
 int srsets;
 int core;
# 71 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/cpu-info.h"
 int vpe_id;


 int tc_id;

 void *data;
 unsigned int watch_reg_count;
 unsigned int watch_reg_use_cnt;

 u16 watch_reg_masks[4];
} __attribute__((aligned((1 << 5))));

extern struct cpuinfo_mips cpu_data[];



extern void cpu_probe(void);
extern void cpu_report(void);

extern const char *__cpu_name[];
# 14 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/cpu-features.h" 2
# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/tc3162/cpu-feature-overrides.h" 1
# 15 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/cpu-features.h" 2
# 18 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/hazards.h" 2
# 30 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/hazards.h"
extern void mips_ihb(void);



__asm__(".macro " "_ssnop" "; " "sll $0, $0, 1" "; .endm"); static inline __attribute__((always_inline)) void _ssnop(void) { __asm__ __volatile__ ("_ssnop"); }



__asm__(".macro " "_ehb" "; " "sll $0, $0, 3" "; .endm"); static inline __attribute__((always_inline)) void _ehb(void) { __asm__ __volatile__ ("_ehb"); }
# 51 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/hazards.h"
__asm__(".macro " "mtc0_tlbw_hazard" "; " "_ehb" "; .endm"); static inline __attribute__((always_inline)) void mtc0_tlbw_hazard(void) { __asm__ __volatile__ ("mtc0_tlbw_hazard"); }


__asm__(".macro " "tlbw_use_hazard" "; " "_ehb" "; .endm"); static inline __attribute__((always_inline)) void tlbw_use_hazard(void) { __asm__ __volatile__ ("tlbw_use_hazard"); }


__asm__(".macro " "tlb_probe_hazard" "; " "_ehb" "; .endm"); static inline __attribute__((always_inline)) void tlb_probe_hazard(void) { __asm__ __volatile__ ("tlb_probe_hazard"); }


__asm__(".macro " "irq_enable_hazard" "; " "_ehb" "; .endm"); static inline __attribute__((always_inline)) void irq_enable_hazard(void) { __asm__ __volatile__ ("irq_enable_hazard"); }


__asm__(".macro " "irq_disable_hazard" "; " "_ehb" "; .endm"); static inline __attribute__((always_inline)) void irq_disable_hazard(void) { __asm__ __volatile__ ("irq_disable_hazard"); }


__asm__(".macro " "back_to_back_c0_hazard" "; " "_ehb" "; .endm"); static inline __attribute__((always_inline)) void back_to_back_c0_hazard(void) { __asm__ __volatile__ ("back_to_back_c0_hazard"); }
# 258 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/hazards.h"
__asm__(".macro " "enable_fpu_hazard" "; " "_ehb" "; .endm"); static inline __attribute__((always_inline)) void enable_fpu_hazard(void) { __asm__ __volatile__ ("enable_fpu_hazard"); }


__asm__(".macro " "disable_fpu_hazard" "; " "_ehb" "; .endm"); static inline __attribute__((always_inline)) void disable_fpu_hazard(void) { __asm__ __volatile__ ("disable_fpu_hazard"); }
# 18 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/irqflags.h" 2

__asm__(
 "	.macro	raw_local_irq_enable				\n"
 "	.set	push						\n"
 "	.set	reorder						\n"
 "	.set	noat						\n"

 "	mfc0	$1, $2, 1	# SMTC - clear TCStatus.IXMT	\n"
 "	ori	$1, 0x400					\n"
 "	xori	$1, 0x400					\n"
 "	mtc0	$1, $2, 1					\n"
# 37 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/irqflags.h"
 "	irq_enable_hazard					\n"
 "	.set	pop						\n"
 "	.endm");

extern void smtc_ipi_replay(void);

static inline __attribute__((always_inline)) void raw_local_irq_enable(void)
{





 smtc_ipi_replay();

 __asm__ __volatile__(
  "raw_local_irq_enable"
  :
  :
  : "memory");
}
# 78 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/irqflags.h"
__asm__(
 "	.macro	raw_local_irq_disable\n"
 "	.set	push						\n"
 "	.set	noat						\n"

 "	mfc0	$1, $2, 1					\n"
 "	ori	$1, 0x400					\n"
 "	.set	noreorder					\n"
 "	mtc0	$1, $2, 1					\n"
# 96 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/irqflags.h"
 "	irq_disable_hazard					\n"
 "	.set	pop						\n"
 "	.endm							\n");

static inline __attribute__((always_inline)) void raw_local_irq_disable(void)
{
 __asm__ __volatile__(
  "raw_local_irq_disable"
  :
  :
  : "memory");
}

__asm__(
 "	.macro	raw_local_save_flags flags			\n"
 "	.set	push						\n"
 "	.set	reorder						\n"

 "	mfc0	\\flags, $2, 1					\n"



 "	.set	pop						\n"
 "	.endm							\n");






__asm__(
 "	.macro	raw_local_irq_save result			\n"
 "	.set	push						\n"
 "	.set	reorder						\n"
 "	.set	noat						\n"

 "	mfc0	\\result, $2, 1					\n"
 "	ori	$1, \\result, 0x400				\n"
 "	.set	noreorder					\n"
 "	mtc0	$1, $2, 1					\n"
 "	andi	\\result, \\result, 0x400			\n"
# 147 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/irqflags.h"
 "	irq_disable_hazard					\n"
 "	.set	pop						\n"
 "	.endm							\n");
# 158 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/irqflags.h"
__asm__(
 "	.macro	raw_local_irq_restore flags			\n"
 "	.set	push						\n"
 "	.set	noreorder					\n"
 "	.set	noat						\n"

 "mfc0	$1, $2, 1						\n"
 "andi	\\flags, 0x400						\n"
 "ori	$1, 0x400						\n"
 "xori	$1, 0x400						\n"
 "or	\\flags, $1						\n"
 "mtc0	\\flags, $2, 1						\n"
# 194 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/irqflags.h"
 "	irq_disable_hazard					\n"
 "	.set	pop						\n"
 "	.endm							\n");


static inline __attribute__((always_inline)) void raw_local_irq_restore(unsigned long flags)
{
 unsigned long __tmp1;







 if (__builtin_expect(!!(!(flags & 0x0400)), 0))
  smtc_ipi_replay();


 __asm__ __volatile__(
  "raw_local_irq_restore\t%0"
  : "=r" (__tmp1)
  : "0" (flags)
  : "memory");
}

static inline __attribute__((always_inline)) void __raw_local_irq_restore(unsigned long flags)
{
 unsigned long __tmp1;

 __asm__ __volatile__(
  "raw_local_irq_restore\t%0"
  : "=r" (__tmp1)
  : "0" (flags)
  : "memory");
}

static inline __attribute__((always_inline)) int raw_irqs_disabled_flags(unsigned long flags)
{




 return flags & 0x400;



}
# 58 "include/linux/irqflags.h" 2
# 18 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/bitops.h" 2

# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/barrier.h" 1
# 20 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/bitops.h" 2
# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/bug.h" 1
# 9 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/bug.h"
# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/break.h" 1
# 10 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/bug.h" 2

static inline __attribute__((always_inline)) void __attribute__((noreturn)) BUG(void)
{
 __asm__ __volatile__("break %0" : : "i" (512));
 do { } while (1);
}





static inline __attribute__((always_inline)) void __BUG_ON(unsigned long condition)
{
 if (__builtin_constant_p(condition)) {
  if (condition)
   BUG();
  else
   return;
 }
 __asm__ __volatile__("tne $0, %0, %1"
        : : "r" (condition), "i" (512));
}
# 41 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/bug.h"
# 1 "include/asm-generic/bug.h" 1
# 64 "include/asm-generic/bug.h"
extern void warn_slowpath_fmt(const char *file, const int line,
  const char *fmt, ...) __attribute__((format(printf, 3, 4)));
extern void warn_slowpath_fmt_taint(const char *file, const int line,
        unsigned taint, const char *fmt, ...)
 __attribute__((format(printf, 4, 5)));
extern void warn_slowpath_null(const char *file, const int line);
# 42 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/bug.h" 2
# 21 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/bitops.h" 2
# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/byteorder.h" 1
# 12 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/byteorder.h"
# 1 "include/linux/byteorder/big_endian.h" 1
# 12 "include/linux/byteorder/big_endian.h"
# 1 "include/linux/swab.h" 1
# 46 "include/linux/swab.h"
static inline __attribute__((always_inline)) __attribute__((__const__)) __u16 __fswab16(__u16 val)
{



 return ((__u16)( (((__u16)(val) & (__u16)0x00ffU) << 8) | (((__u16)(val) & (__u16)0xff00U) >> 8)));

}

static inline __attribute__((always_inline)) __attribute__((__const__)) __u32 __fswab32(__u32 val)
{



 return ((__u32)( (((__u32)(val) & (__u32)0x000000ffUL) << 24) | (((__u32)(val) & (__u32)0x0000ff00UL) << 8) | (((__u32)(val) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(val) & (__u32)0xff000000UL) >> 24)));

}

static inline __attribute__((always_inline)) __attribute__((__const__)) __u64 __fswab64(__u64 val)
{







 return ((__u64)( (((__u64)(val) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(val) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(val) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(val) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(val) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(val) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(val) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(val) & (__u64)0xff00000000000000ULL) >> 56)));

}

static inline __attribute__((always_inline)) __attribute__((__const__)) __u32 __fswahw32(__u32 val)
{



 return ((__u32)( (((__u32)(val) & (__u32)0x0000ffffUL) << 16) | (((__u32)(val) & (__u32)0xffff0000UL) >> 16)));

}

static inline __attribute__((always_inline)) __attribute__((__const__)) __u32 __fswahb32(__u32 val)
{



 return ((__u32)( (((__u32)(val) & (__u32)0x00ff00ffUL) << 8) | (((__u32)(val) & (__u32)0xff00ff00UL) >> 8)));

}
# 148 "include/linux/swab.h"
static inline __attribute__((always_inline)) __u16 __swab16p(const __u16 *p)
{



 return (__builtin_constant_p((__u16)(*p)) ? ((__u16)( (((__u16)(*p) & (__u16)0x00ffU) << 8) | (((__u16)(*p) & (__u16)0xff00U) >> 8))) : __fswab16(*p));

}





static inline __attribute__((always_inline)) __u32 __swab32p(const __u32 *p)
{



 return (__builtin_constant_p((__u32)(*p)) ? ((__u32)( (((__u32)(*p) & (__u32)0x000000ffUL) << 24) | (((__u32)(*p) & (__u32)0x0000ff00UL) << 8) | (((__u32)(*p) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(*p) & (__u32)0xff000000UL) >> 24))) : __fswab32(*p));

}





static inline __attribute__((always_inline)) __u64 __swab64p(const __u64 *p)
{



 return (__builtin_constant_p((__u64)(*p)) ? ((__u64)( (((__u64)(*p) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(*p) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(*p) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(*p) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(*p) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(*p) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(*p) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(*p) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(*p));

}







static inline __attribute__((always_inline)) __u32 __swahw32p(const __u32 *p)
{



 return (__builtin_constant_p((__u32)(*p)) ? ((__u32)( (((__u32)(*p) & (__u32)0x0000ffffUL) << 16) | (((__u32)(*p) & (__u32)0xffff0000UL) >> 16))) : __fswahw32(*p));

}







static inline __attribute__((always_inline)) __u32 __swahb32p(const __u32 *p)
{



 return (__builtin_constant_p((__u32)(*p)) ? ((__u32)( (((__u32)(*p) & (__u32)0x00ff00ffUL) << 8) | (((__u32)(*p) & (__u32)0xff00ff00UL) >> 8))) : __fswahb32(*p));

}





static inline __attribute__((always_inline)) void __swab16s(__u16 *p)
{



 *p = __swab16p(p);

}




static inline __attribute__((always_inline)) void __swab32s(__u32 *p)
{



 *p = __swab32p(p);

}





static inline __attribute__((always_inline)) void __swab64s(__u64 *p)
{



 *p = __swab64p(p);

}







static inline __attribute__((always_inline)) void __swahw32s(__u32 *p)
{



 *p = __swahw32p(p);

}







static inline __attribute__((always_inline)) void __swahb32s(__u32 *p)
{



 *p = __swahb32p(p);

}
# 13 "include/linux/byteorder/big_endian.h" 2
# 43 "include/linux/byteorder/big_endian.h"
static inline __attribute__((always_inline)) __le64 __cpu_to_le64p(const __u64 *p)
{
 return ( __le64)__swab64p(p);
}
static inline __attribute__((always_inline)) __u64 __le64_to_cpup(const __le64 *p)
{
 return __swab64p((__u64 *)p);
}
static inline __attribute__((always_inline)) __le32 __cpu_to_le32p(const __u32 *p)
{
 return ( __le32)__swab32p(p);
}
static inline __attribute__((always_inline)) __u32 __le32_to_cpup(const __le32 *p)
{
 return __swab32p((__u32 *)p);
}
static inline __attribute__((always_inline)) __le16 __cpu_to_le16p(const __u16 *p)
{
 return ( __le16)__swab16p(p);
}
static inline __attribute__((always_inline)) __u16 __le16_to_cpup(const __le16 *p)
{
 return __swab16p((__u16 *)p);
}
static inline __attribute__((always_inline)) __be64 __cpu_to_be64p(const __u64 *p)
{
 return ( __be64)*p;
}
static inline __attribute__((always_inline)) __u64 __be64_to_cpup(const __be64 *p)
{
 return ( __u64)*p;
}
static inline __attribute__((always_inline)) __be32 __cpu_to_be32p(const __u32 *p)
{
 return ( __be32)*p;
}
static inline __attribute__((always_inline)) __u32 __be32_to_cpup(const __be32 *p)
{
 return ( __u32)*p;
}
static inline __attribute__((always_inline)) __be16 __cpu_to_be16p(const __u16 *p)
{
 return ( __be16)*p;
}
static inline __attribute__((always_inline)) __u16 __be16_to_cpup(const __be16 *p)
{
 return ( __u16)*p;
}
# 105 "include/linux/byteorder/big_endian.h"
# 1 "include/linux/byteorder/generic.h" 1
# 143 "include/linux/byteorder/generic.h"
static inline __attribute__((always_inline)) void le16_add_cpu(__le16 *var, u16 val)
{
 *var = (( __le16)(__builtin_constant_p((__u16)(((__builtin_constant_p((__u16)(( __u16)(__le16)(*var))) ? ((__u16)( (((__u16)(( __u16)(__le16)(*var)) & (__u16)0x00ffU) << 8) | (((__u16)(( __u16)(__le16)(*var)) & (__u16)0xff00U) >> 8))) : __fswab16(( __u16)(__le16)(*var))) + val))) ? ((__u16)( (((__u16)(((__builtin_constant_p((__u16)(( __u16)(__le16)(*var))) ? ((__u16)( (((__u16)(( __u16)(__le16)(*var)) & (__u16)0x00ffU) << 8) | (((__u16)(( __u16)(__le16)(*var)) & (__u16)0xff00U) >> 8))) : __fswab16(( __u16)(__le16)(*var))) + val)) & (__u16)0x00ffU) << 8) | (((__u16)(((__builtin_constant_p((__u16)(( __u16)(__le16)(*var))) ? ((__u16)( (((__u16)(( __u16)(__le16)(*var)) & (__u16)0x00ffU) << 8) | (((__u16)(( __u16)(__le16)(*var)) & (__u16)0xff00U) >> 8))) : __fswab16(( __u16)(__le16)(*var))) + val)) & (__u16)0xff00U) >> 8))) : __fswab16(((__builtin_constant_p((__u16)(( __u16)(__le16)(*var))) ? ((__u16)( (((__u16)(( __u16)(__le16)(*var)) & (__u16)0x00ffU) << 8) | (((__u16)(( __u16)(__le16)(*var)) & (__u16)0xff00U) >> 8))) : __fswab16(( __u16)(__le16)(*var))) + val))));
}

static inline __attribute__((always_inline)) void le32_add_cpu(__le32 *var, u32 val)
{
 *var = (( __le32)(__builtin_constant_p((__u32)(((__builtin_constant_p((__u32)(( __u32)(__le32)(*var))) ? ((__u32)( (((__u32)(( __u32)(__le32)(*var)) & (__u32)0x000000ffUL) << 24) | (((__u32)(( __u32)(__le32)(*var)) & (__u32)0x0000ff00UL) << 8) | (((__u32)(( __u32)(__le32)(*var)) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(( __u32)(__le32)(*var)) & (__u32)0xff000000UL) >> 24))) : __fswab32(( __u32)(__le32)(*var))) + val))) ? ((__u32)( (((__u32)(((__builtin_constant_p((__u32)(( __u32)(__le32)(*var))) ? ((__u32)( (((__u32)(( __u32)(__le32)(*var)) & (__u32)0x000000ffUL) << 24) | (((__u32)(( __u32)(__le32)(*var)) & (__u32)0x0000ff00UL) << 8) | (((__u32)(( __u32)(__le32)(*var)) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(( __u32)(__le32)(*var)) & (__u32)0xff000000UL) >> 24))) : __fswab32(( __u32)(__le32)(*var))) + val)) & (__u32)0x000000ffUL) << 24) | (((__u32)(((__builtin_constant_p((__u32)(( __u32)(__le32)(*var))) ? ((__u32)( (((__u32)(( __u32)(__le32)(*var)) & (__u32)0x000000ffUL) << 24) | (((__u32)(( __u32)(__le32)(*var)) & (__u32)0x0000ff00UL) << 8) | (((__u32)(( __u32)(__le32)(*var)) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(( __u32)(__le32)(*var)) & (__u32)0xff000000UL) >> 24))) : __fswab32(( __u32)(__le32)(*var))) + val)) & (__u32)0x0000ff00UL) << 8) | (((__u32)(((__builtin_constant_p((__u32)(( __u32)(__le32)(*var))) ? ((__u32)( (((__u32)(( __u32)(__le32)(*var)) & (__u32)0x000000ffUL) << 24) | (((__u32)(( __u32)(__le32)(*var)) & (__u32)0x0000ff00UL) << 8) | (((__u32)(( __u32)(__le32)(*var)) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(( __u32)(__le32)(*var)) & (__u32)0xff000000UL) >> 24))) : __fswab32(( __u32)(__le32)(*var))) + val)) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(((__builtin_constant_p((__u32)(( __u32)(__le32)(*var))) ? ((__u32)( (((__u32)(( __u32)(__le32)(*var)) & (__u32)0x000000ffUL) << 24) | (((__u32)(( __u32)(__le32)(*var)) & (__u32)0x0000ff00UL) << 8) | (((__u32)(( __u32)(__le32)(*var)) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(( __u32)(__le32)(*var)) & (__u32)0xff000000UL) >> 24))) : __fswab32(( __u32)(__le32)(*var))) + val)) & (__u32)0xff000000UL) >> 24))) : __fswab32(((__builtin_constant_p((__u32)(( __u32)(__le32)(*var))) ? ((__u32)( (((__u32)(( __u32)(__le32)(*var)) & (__u32)0x000000ffUL) << 24) | (((__u32)(( __u32)(__le32)(*var)) & (__u32)0x0000ff00UL) << 8) | (((__u32)(( __u32)(__le32)(*var)) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(( __u32)(__le32)(*var)) & (__u32)0xff000000UL) >> 24))) : __fswab32(( __u32)(__le32)(*var))) + val))));
}

static inline __attribute__((always_inline)) void le64_add_cpu(__le64 *var, u64 val)
{
 *var = (( __le64)(__builtin_constant_p((__u64)(((__builtin_constant_p((__u64)(( __u64)(__le64)(*var))) ? ((__u64)( (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(( __u64)(__le64)(*var))) + val))) ? ((__u64)( (((__u64)(((__builtin_constant_p((__u64)(( __u64)(__le64)(*var))) ? ((__u64)( (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(( __u64)(__le64)(*var))) + val)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(((__builtin_constant_p((__u64)(( __u64)(__le64)(*var))) ? ((__u64)( (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(( __u64)(__le64)(*var))) + val)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(((__builtin_constant_p((__u64)(( __u64)(__le64)(*var))) ? ((__u64)( (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(( __u64)(__le64)(*var))) + val)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(((__builtin_constant_p((__u64)(( __u64)(__le64)(*var))) ? ((__u64)( (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(( __u64)(__le64)(*var))) + val)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(((__builtin_constant_p((__u64)(( __u64)(__le64)(*var))) ? ((__u64)( (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(( __u64)(__le64)(*var))) + val)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(((__builtin_constant_p((__u64)(( __u64)(__le64)(*var))) ? ((__u64)( (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(( __u64)(__le64)(*var))) + val)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(((__builtin_constant_p((__u64)(( __u64)(__le64)(*var))) ? ((__u64)( (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(( __u64)(__le64)(*var))) + val)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(((__builtin_constant_p((__u64)(( __u64)(__le64)(*var))) ? ((__u64)( (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(( __u64)(__le64)(*var))) + val)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(((__builtin_constant_p((__u64)(( __u64)(__le64)(*var))) ? ((__u64)( (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(( __u64)(__le64)(*var))) + val))));
}

static inline __attribute__((always_inline)) void be16_add_cpu(__be16 *var, u16 val)
{
 *var = (( __be16)(__u16)((( __u16)(__be16)(*var)) + val));
}

static inline __attribute__((always_inline)) void be32_add_cpu(__be32 *var, u32 val)
{
 *var = (( __be32)(__u32)((( __u32)(__be32)(*var)) + val));
}

static inline __attribute__((always_inline)) void be64_add_cpu(__be64 *var, u64 val)
{
 *var = (( __be64)(__u64)((( __u64)(__be64)(*var)) + val));
}
# 106 "include/linux/byteorder/big_endian.h" 2
# 13 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/byteorder.h" 2
# 22 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/bitops.h" 2


# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/war.h" 1
# 12 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/war.h"
# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/tc3162/war.h" 1
# 13 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/war.h" 2
# 25 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/bitops.h" 2
# 58 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/bitops.h"
static inline __attribute__((always_inline)) void set_bit(unsigned long nr, volatile unsigned long *addr)
{
 unsigned long *m = ((unsigned long *) addr) + (nr >> 5);
 unsigned short bit = nr & 31UL;
 unsigned long temp;

 if (1 && 0) {
  __asm__ __volatile__(
  "	.set	mips3					\n"
  "1:	" "ll	" "%0, %1			# set_bit	\n"
  "	or	%0, %2					\n"
  "	" "sc	" "%0, %1					\n"
  "	beqzl	%0, 1b					\n"
  "	.set	mips0					\n"
  : "=&r" (temp), "=m" (*m)
  : "ir" (1UL << bit), "m" (*m));

 } else if (1 && __builtin_constant_p(bit)) {
  __asm__ __volatile__(
  "1:	" "ll	" "%0, %1			# set_bit	\n"
  "	" "ins    " "%0, %4, %2, 1				\n"
  "	" "sc	" "%0, %1					\n"
  "	beqz	%0, 2f					\n"
  "	.subsection 2					\n"
  "2:	b	1b					\n"
  "	.previous					\n"
  : "=&r" (temp), "=m" (*m)
  : "ir" (bit), "m" (*m), "r" (~0));

 } else if (1) {
  __asm__ __volatile__(
  "	.set	mips3					\n"
  "1:	" "ll	" "%0, %1			# set_bit	\n"
  "	or	%0, %2					\n"
  "	" "sc	" "%0, %1					\n"
  "	beqz	%0, 2f					\n"
  "	.subsection 2					\n"
  "2:	b	1b					\n"
  "	.previous					\n"
  "	.set	mips0					\n"
  : "=&r" (temp), "=m" (*m)
  : "ir" (1UL << bit), "m" (*m));
 } else {
  volatile unsigned long *a = addr;
  unsigned long mask;
  unsigned long flags;

  a += nr >> 5;
  mask = 1UL << bit;
  __asm__ __volatile__( "raw_local_irq_save\t%0" : "=r" (flags) : : "memory");
  *a |= mask;
  raw_local_irq_restore(flags);
 }
}
# 123 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/bitops.h"
static inline __attribute__((always_inline)) void clear_bit(unsigned long nr, volatile unsigned long *addr)
{
 unsigned long *m = ((unsigned long *) addr) + (nr >> 5);
 unsigned short bit = nr & 31UL;
 unsigned long temp;

 if (1 && 0) {
  __asm__ __volatile__(
  "	.set	mips3					\n"
  "1:	" "ll	" "%0, %1			# clear_bit	\n"
  "	and	%0, %2					\n"
  "	" "sc	" "%0, %1					\n"
  "	beqzl	%0, 1b					\n"
  "	.set	mips0					\n"
  : "=&r" (temp), "=m" (*m)
  : "ir" (~(1UL << bit)), "m" (*m));

 } else if (1 && __builtin_constant_p(bit)) {
  __asm__ __volatile__(
  "1:	" "ll	" "%0, %1			# clear_bit	\n"
  "	" "ins    " "%0, $0, %2, 1				\n"
  "	" "sc	" "%0, %1					\n"
  "	beqz	%0, 2f					\n"
  "	.subsection 2					\n"
  "2:	b	1b					\n"
  "	.previous					\n"
  : "=&r" (temp), "=m" (*m)
  : "ir" (bit), "m" (*m));

 } else if (1) {
  __asm__ __volatile__(
  "	.set	mips3					\n"
  "1:	" "ll	" "%0, %1			# clear_bit	\n"
  "	and	%0, %2					\n"
  "	" "sc	" "%0, %1					\n"
  "	beqz	%0, 2f					\n"
  "	.subsection 2					\n"
  "2:	b	1b					\n"
  "	.previous					\n"
  "	.set	mips0					\n"
  : "=&r" (temp), "=m" (*m)
  : "ir" (~(1UL << bit)), "m" (*m));
 } else {
  volatile unsigned long *a = addr;
  unsigned long mask;
  unsigned long flags;

  a += nr >> 5;
  mask = 1UL << bit;
  __asm__ __volatile__( "raw_local_irq_save\t%0" : "=r" (flags) : : "memory");
  *a &= ~mask;
  raw_local_irq_restore(flags);
 }
}
# 186 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/bitops.h"
static inline __attribute__((always_inline)) void clear_bit_unlock(unsigned long nr, volatile unsigned long *addr)
{
 __asm__ __volatile__("		\n" : : :"memory");
 clear_bit(nr, addr);
}
# 201 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/bitops.h"
static inline __attribute__((always_inline)) void change_bit(unsigned long nr, volatile unsigned long *addr)
{
 unsigned short bit = nr & 31UL;

 if (1 && 0) {
  unsigned long *m = ((unsigned long *) addr) + (nr >> 5);
  unsigned long temp;

  __asm__ __volatile__(
  "	.set	mips3				\n"
  "1:	" "ll	" "%0, %1		# change_bit	\n"
  "	xor	%0, %2				\n"
  "	" "sc	" "%0, %1				\n"
  "	beqzl	%0, 1b				\n"
  "	.set	mips0				\n"
  : "=&r" (temp), "=m" (*m)
  : "ir" (1UL << bit), "m" (*m));
 } else if (1) {
  unsigned long *m = ((unsigned long *) addr) + (nr >> 5);
  unsigned long temp;

  __asm__ __volatile__(
  "	.set	mips3				\n"
  "1:	" "ll	" "%0, %1		# change_bit	\n"
  "	xor	%0, %2				\n"
  "	" "sc	" "%0, %1				\n"
  "	beqz	%0, 2f				\n"
  "	.subsection 2				\n"
  "2:	b	1b				\n"
  "	.previous				\n"
  "	.set	mips0				\n"
  : "=&r" (temp), "=m" (*m)
  : "ir" (1UL << bit), "m" (*m));
 } else {
  volatile unsigned long *a = addr;
  unsigned long mask;
  unsigned long flags;

  a += nr >> 5;
  mask = 1UL << bit;
  __asm__ __volatile__( "raw_local_irq_save\t%0" : "=r" (flags) : : "memory");
  *a ^= mask;
  raw_local_irq_restore(flags);
 }
}
# 255 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/bitops.h"
static inline __attribute__((always_inline)) int test_and_set_bit(unsigned long nr,
 volatile unsigned long *addr)
{
 unsigned short bit = nr & 31UL;
 unsigned long res;

 __asm__ __volatile__("		\n" : : :"memory");

 if (1 && 0) {
  unsigned long *m = ((unsigned long *) addr) + (nr >> 5);
  unsigned long temp;

  __asm__ __volatile__(
  "	.set	mips3					\n"
  "1:	" "ll	" "%0, %1		# test_and_set_bit	\n"
  "	or	%2, %0, %3				\n"
  "	" "sc	" "%2, %1					\n"
  "	beqzl	%2, 1b					\n"
  "	and	%2, %0, %3				\n"
  "	.set	mips0					\n"
  : "=&r" (temp), "=m" (*m), "=&r" (res)
  : "r" (1UL << bit), "m" (*m)
  : "memory");
 } else if (1) {
  unsigned long *m = ((unsigned long *) addr) + (nr >> 5);
  unsigned long temp;

  __asm__ __volatile__(
  "	.set	push					\n"
  "	.set	noreorder				\n"
  "	.set	mips3					\n"
  "1:	" "ll	" "%0, %1		# test_and_set_bit	\n"
  "	or	%2, %0, %3				\n"
  "	" "sc	" "%2, %1					\n"
  "	beqz	%2, 2f					\n"
  "	 and	%2, %0, %3				\n"
  "	.subsection 2					\n"
  "2:	b	1b					\n"
  "	 nop						\n"
  "	.previous					\n"
  "	.set	pop					\n"
  : "=&r" (temp), "=m" (*m), "=&r" (res)
  : "r" (1UL << bit), "m" (*m)
  : "memory");
 } else {
  volatile unsigned long *a = addr;
  unsigned long mask;
  unsigned long flags;

  a += nr >> 5;
  mask = 1UL << bit;
  __asm__ __volatile__( "raw_local_irq_save\t%0" : "=r" (flags) : : "memory");
  res = (mask & *a);
  *a |= mask;
  raw_local_irq_restore(flags);
 }

 __asm__ __volatile__("		\n" : : :"memory");

 return res != 0;
}
# 325 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/bitops.h"
static inline __attribute__((always_inline)) int test_and_set_bit_lock(unsigned long nr,
 volatile unsigned long *addr)
{
 unsigned short bit = nr & 31UL;
 unsigned long res;

 if (1 && 0) {
  unsigned long *m = ((unsigned long *) addr) + (nr >> 5);
  unsigned long temp;

  __asm__ __volatile__(
  "	.set	mips3					\n"
  "1:	" "ll	" "%0, %1		# test_and_set_bit	\n"
  "	or	%2, %0, %3				\n"
  "	" "sc	" "%2, %1					\n"
  "	beqzl	%2, 1b					\n"
  "	and	%2, %0, %3				\n"
  "	.set	mips0					\n"
  : "=&r" (temp), "=m" (*m), "=&r" (res)
  : "r" (1UL << bit), "m" (*m)
  : "memory");
 } else if (1) {
  unsigned long *m = ((unsigned long *) addr) + (nr >> 5);
  unsigned long temp;

  __asm__ __volatile__(
  "	.set	push					\n"
  "	.set	noreorder				\n"
  "	.set	mips3					\n"
  "1:	" "ll	" "%0, %1		# test_and_set_bit	\n"
  "	or	%2, %0, %3				\n"
  "	" "sc	" "%2, %1					\n"
  "	beqz	%2, 2f					\n"
  "	 and	%2, %0, %3				\n"
  "	.subsection 2					\n"
  "2:	b	1b					\n"
  "	 nop						\n"
  "	.previous					\n"
  "	.set	pop					\n"
  : "=&r" (temp), "=m" (*m), "=&r" (res)
  : "r" (1UL << bit), "m" (*m)
  : "memory");
 } else {
  volatile unsigned long *a = addr;
  unsigned long mask;
  unsigned long flags;

  a += nr >> 5;
  mask = 1UL << bit;
  __asm__ __volatile__( "raw_local_irq_save\t%0" : "=r" (flags) : : "memory");
  res = (mask & *a);
  *a |= mask;
  raw_local_irq_restore(flags);
 }

 __asm__ __volatile__("		\n" : : :"memory");

 return res != 0;
}
# 392 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/bitops.h"
static inline __attribute__((always_inline)) int test_and_clear_bit(unsigned long nr,
 volatile unsigned long *addr)
{
 unsigned short bit = nr & 31UL;
 unsigned long res;

 __asm__ __volatile__("		\n" : : :"memory");

 if (1 && 0) {
  unsigned long *m = ((unsigned long *) addr) + (nr >> 5);
  unsigned long temp;

  __asm__ __volatile__(
  "	.set	mips3					\n"
  "1:	" "ll	" "%0, %1		# test_and_clear_bit	\n"
  "	or	%2, %0, %3				\n"
  "	xor	%2, %3					\n"
  "	" "sc	" "%2, %1					\n"
  "	beqzl	%2, 1b					\n"
  "	and	%2, %0, %3				\n"
  "	.set	mips0					\n"
  : "=&r" (temp), "=m" (*m), "=&r" (res)
  : "r" (1UL << bit), "m" (*m)
  : "memory");

 } else if (1 && __builtin_constant_p(nr)) {
  unsigned long *m = ((unsigned long *) addr) + (nr >> 5);
  unsigned long temp;

  __asm__ __volatile__(
  "1:	" "ll	" "%0, %1		# test_and_clear_bit	\n"
  "	" "ext    " "%2, %0, %3, 1				\n"
  "	" "ins    " "%0, $0, %3, 1				\n"
  "	" "sc	" "%0, %1					\n"
  "	beqz	%0, 2f					\n"
  "	.subsection 2					\n"
  "2:	b	1b					\n"
  "	.previous					\n"
  : "=&r" (temp), "=m" (*m), "=&r" (res)
  : "ir" (bit), "m" (*m)
  : "memory");

 } else if (1) {
  unsigned long *m = ((unsigned long *) addr) + (nr >> 5);
  unsigned long temp;

  __asm__ __volatile__(
  "	.set	push					\n"
  "	.set	noreorder				\n"
  "	.set	mips3					\n"
  "1:	" "ll	" "%0, %1		# test_and_clear_bit	\n"
  "	or	%2, %0, %3				\n"
  "	xor	%2, %3					\n"
  "	" "sc	" "%2, %1					\n"
  "	beqz	%2, 2f					\n"
  "	 and	%2, %0, %3				\n"
  "	.subsection 2					\n"
  "2:	b	1b					\n"
  "	 nop						\n"
  "	.previous					\n"
  "	.set	pop					\n"
  : "=&r" (temp), "=m" (*m), "=&r" (res)
  : "r" (1UL << bit), "m" (*m)
  : "memory");
 } else {
  volatile unsigned long *a = addr;
  unsigned long mask;
  unsigned long flags;

  a += nr >> 5;
  mask = 1UL << bit;
  __asm__ __volatile__( "raw_local_irq_save\t%0" : "=r" (flags) : : "memory");
  res = (mask & *a);
  *a &= ~mask;
  raw_local_irq_restore(flags);
 }

 __asm__ __volatile__("		\n" : : :"memory");

 return res != 0;
}
# 482 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/bitops.h"
static inline __attribute__((always_inline)) int test_and_change_bit(unsigned long nr,
 volatile unsigned long *addr)
{
 unsigned short bit = nr & 31UL;
 unsigned long res;

 __asm__ __volatile__("		\n" : : :"memory");

 if (1 && 0) {
  unsigned long *m = ((unsigned long *) addr) + (nr >> 5);
  unsigned long temp;

  __asm__ __volatile__(
  "	.set	mips3					\n"
  "1:	" "ll	" "%0, %1		# test_and_change_bit	\n"
  "	xor	%2, %0, %3				\n"
  "	" "sc	" "%2, %1					\n"
  "	beqzl	%2, 1b					\n"
  "	and	%2, %0, %3				\n"
  "	.set	mips0					\n"
  : "=&r" (temp), "=m" (*m), "=&r" (res)
  : "r" (1UL << bit), "m" (*m)
  : "memory");
 } else if (1) {
  unsigned long *m = ((unsigned long *) addr) + (nr >> 5);
  unsigned long temp;

  __asm__ __volatile__(
  "	.set	push					\n"
  "	.set	noreorder				\n"
  "	.set	mips3					\n"
  "1:	" "ll	" "%0, %1		# test_and_change_bit	\n"
  "	xor	%2, %0, %3				\n"
  "	" "sc	" "\t%2, %1				\n"
  "	beqz	%2, 2f					\n"
  "	 and	%2, %0, %3				\n"
  "	.subsection 2					\n"
  "2:	b	1b					\n"
  "	 nop						\n"
  "	.previous					\n"
  "	.set	pop					\n"
  : "=&r" (temp), "=m" (*m), "=&r" (res)
  : "r" (1UL << bit), "m" (*m)
  : "memory");
 } else {
  volatile unsigned long *a = addr;
  unsigned long mask;
  unsigned long flags;

  a += nr >> 5;
  mask = 1UL << bit;
  __asm__ __volatile__( "raw_local_irq_save\t%0" : "=r" (flags) : : "memory");
  res = (mask & *a);
  *a ^= mask;
  raw_local_irq_restore(flags);
 }

 __asm__ __volatile__("		\n" : : :"memory");

 return res != 0;
}

# 1 "include/asm-generic/bitops/non-atomic.h" 1
# 15 "include/asm-generic/bitops/non-atomic.h"
static inline __attribute__((always_inline)) void __set_bit(int nr, volatile unsigned long *addr)
{
 unsigned long mask = (1UL << ((nr) % 32));
 unsigned long *p = ((unsigned long *)addr) + ((nr) / 32);

 *p |= mask;
}

static inline __attribute__((always_inline)) void __clear_bit(int nr, volatile unsigned long *addr)
{
 unsigned long mask = (1UL << ((nr) % 32));
 unsigned long *p = ((unsigned long *)addr) + ((nr) / 32);

 *p &= ~mask;
}
# 40 "include/asm-generic/bitops/non-atomic.h"
static inline __attribute__((always_inline)) void __change_bit(int nr, volatile unsigned long *addr)
{
 unsigned long mask = (1UL << ((nr) % 32));
 unsigned long *p = ((unsigned long *)addr) + ((nr) / 32);

 *p ^= mask;
}
# 57 "include/asm-generic/bitops/non-atomic.h"
static inline __attribute__((always_inline)) int __test_and_set_bit(int nr, volatile unsigned long *addr)
{
 unsigned long mask = (1UL << ((nr) % 32));
 unsigned long *p = ((unsigned long *)addr) + ((nr) / 32);
 unsigned long old = *p;

 *p = old | mask;
 return (old & mask) != 0;
}
# 76 "include/asm-generic/bitops/non-atomic.h"
static inline __attribute__((always_inline)) int __test_and_clear_bit(int nr, volatile unsigned long *addr)
{
 unsigned long mask = (1UL << ((nr) % 32));
 unsigned long *p = ((unsigned long *)addr) + ((nr) / 32);
 unsigned long old = *p;

 *p = old & ~mask;
 return (old & mask) != 0;
}


static inline __attribute__((always_inline)) int __test_and_change_bit(int nr,
         volatile unsigned long *addr)
{
 unsigned long mask = (1UL << ((nr) % 32));
 unsigned long *p = ((unsigned long *)addr) + ((nr) / 32);
 unsigned long old = *p;

 *p = old ^ mask;
 return (old & mask) != 0;
}






static inline __attribute__((always_inline)) int test_bit(int nr, const volatile unsigned long *addr)
{
 return 1UL & (addr[((nr) / 32)] >> (nr & (32 -1)));
}
# 545 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/bitops.h" 2
# 555 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/bitops.h"
static inline __attribute__((always_inline)) void __clear_bit_unlock(unsigned long nr, volatile unsigned long *addr)
{
 __asm__ __volatile__("": : :"memory");
 __clear_bit(nr, addr);
}





static inline __attribute__((always_inline)) unsigned long __fls(unsigned long word)
{
 int num;

 if (32 == 32 &&
     __builtin_constant_p(((cpu_data[0].isa_level & 0x00000020) | (cpu_data[0].isa_level & 0x00000040) | (cpu_data[0].isa_level & 0x00000080) | (cpu_data[0].isa_level & 0x00000100))) && ((cpu_data[0].isa_level & 0x00000020) | (cpu_data[0].isa_level & 0x00000040) | (cpu_data[0].isa_level & 0x00000080) | (cpu_data[0].isa_level & 0x00000100))) {
  __asm__(
  "	.set	push					\n"
  "	.set	mips32					\n"
  "	clz	%0, %1					\n"
  "	.set	pop					\n"
  : "=r" (num)
  : "r" (word));

  return 31 - num;
 }

 if (32 == 64 &&
     __builtin_constant_p(((cpu_data[0].isa_level & 0x00000080) | (cpu_data[0].isa_level & 0x00000100))) && ((cpu_data[0].isa_level & 0x00000080) | (cpu_data[0].isa_level & 0x00000100))) {
  __asm__(
  "	.set	push					\n"
  "	.set	mips64					\n"
  "	dclz	%0, %1					\n"
  "	.set	pop					\n"
  : "=r" (num)
  : "r" (word));

  return 63 - num;
 }

 num = 32 - 1;







 if (!(word & (~0ul << (32 -16)))) {
  num -= 16;
  word <<= 16;
 }
 if (!(word & (~0ul << (32 -8)))) {
  num -= 8;
  word <<= 8;
 }
 if (!(word & (~0ul << (32 -4)))) {
  num -= 4;
  word <<= 4;
 }
 if (!(word & (~0ul << (32 -2)))) {
  num -= 2;
  word <<= 2;
 }
 if (!(word & (~0ul << (32 -1))))
  num -= 1;
 return num;
}
# 631 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/bitops.h"
static inline __attribute__((always_inline)) unsigned long __ffs(unsigned long word)
{
 return __fls(word & -word);
}
# 643 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/bitops.h"
static inline __attribute__((always_inline)) int fls(int x)
{
 int r;

 if (__builtin_constant_p(((cpu_data[0].isa_level & 0x00000020) | (cpu_data[0].isa_level & 0x00000040) | (cpu_data[0].isa_level & 0x00000080) | (cpu_data[0].isa_level & 0x00000100))) && ((cpu_data[0].isa_level & 0x00000020) | (cpu_data[0].isa_level & 0x00000040) | (cpu_data[0].isa_level & 0x00000080) | (cpu_data[0].isa_level & 0x00000100))) {
  __asm__("clz %0, %1" : "=r" (x) : "r" (x));

  return 32 - x;
 }

 r = 32;
 if (!x)
  return 0;
 if (!(x & 0xffff0000u)) {
  x <<= 16;
  r -= 16;
 }
 if (!(x & 0xff000000u)) {
  x <<= 8;
  r -= 8;
 }
 if (!(x & 0xf0000000u)) {
  x <<= 4;
  r -= 4;
 }
 if (!(x & 0xc0000000u)) {
  x <<= 2;
  r -= 2;
 }
 if (!(x & 0x80000000u)) {
  x <<= 1;
  r -= 1;
 }
 return r;
}

# 1 "include/asm-generic/bitops/fls64.h" 1
# 18 "include/asm-generic/bitops/fls64.h"
static inline __attribute__((always_inline)) __attribute__((always_inline)) int fls64(__u64 x)
{
 __u32 h = x >> 32;
 if (h)
  return fls(h) + 32;
 return fls(x);
}
# 680 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/bitops.h" 2
# 689 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/bitops.h"
static inline __attribute__((always_inline)) int ffs(int word)
{
 if (!word)
  return 0;

 return fls(word & -word);
}

# 1 "include/asm-generic/bitops/ffz.h" 1
# 698 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/bitops.h" 2
# 1 "include/asm-generic/bitops/find.h" 1
# 699 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/bitops.h" 2



# 1 "include/asm-generic/bitops/sched.h" 1
# 12 "include/asm-generic/bitops/sched.h"
static inline __attribute__((always_inline)) int sched_find_first_bit(const unsigned long *b)
{





 if (b[0])
  return __ffs(b[0]);
 if (b[1])
  return __ffs(b[1]) + 32;
 if (b[2])
  return __ffs(b[2]) + 64;
 return __ffs(b[3]) + 96;



}
# 703 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/bitops.h" 2

# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/arch_hweight.h" 1
# 35 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/arch_hweight.h"
# 1 "include/asm-generic/bitops/arch_hweight.h" 1





static inline __attribute__((always_inline)) unsigned int __arch_hweight32(unsigned int w)
{
 return __sw_hweight32(w);
}

static inline __attribute__((always_inline)) unsigned int __arch_hweight16(unsigned int w)
{
 return __sw_hweight16(w);
}

static inline __attribute__((always_inline)) unsigned int __arch_hweight8(unsigned int w)
{
 return __sw_hweight8(w);
}

static inline __attribute__((always_inline)) unsigned long __arch_hweight64(__u64 w)
{
 return __sw_hweight64(w);
}
# 36 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/arch_hweight.h" 2
# 705 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/bitops.h" 2
# 1 "include/asm-generic/bitops/const_hweight.h" 1
# 706 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/bitops.h" 2

# 1 "include/asm-generic/bitops/ext2-non-atomic.h" 1



# 1 "include/asm-generic/bitops/le.h" 1
# 45 "include/asm-generic/bitops/le.h"
extern unsigned long generic_find_next_zero_le_bit(const unsigned long *addr,
  unsigned long size, unsigned long offset);
extern unsigned long generic_find_next_le_bit(const unsigned long *addr,
  unsigned long size, unsigned long offset);
# 5 "include/asm-generic/bitops/ext2-non-atomic.h" 2
# 708 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/bitops.h" 2
# 1 "include/asm-generic/bitops/ext2-atomic.h" 1
# 709 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/bitops.h" 2
# 1 "include/asm-generic/bitops/minix.h" 1
# 710 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/bitops.h" 2
# 23 "include/linux/bitops.h" 2






static __inline__ __attribute__((always_inline)) int get_bitmask_order(unsigned int count)
{
 int order;

 order = fls(count);
 return order;
}

static __inline__ __attribute__((always_inline)) int get_count_order(unsigned int count)
{
 int order;

 order = fls(count) - 1;
 if (count & (count - 1))
  order++;
 return order;
}

static inline __attribute__((always_inline)) unsigned long hweight_long(unsigned long w)
{
 return sizeof(w) == 4 ? (__builtin_constant_p(w) ? ((( (!!((w) & (1ULL << 0))) + (!!((w) & (1ULL << 1))) + (!!((w) & (1ULL << 2))) + (!!((w) & (1ULL << 3))) + (!!((w) & (1ULL << 4))) + (!!((w) & (1ULL << 5))) + (!!((w) & (1ULL << 6))) + (!!((w) & (1ULL << 7))) ) + ( (!!(((w) >> 8) & (1ULL << 0))) + (!!(((w) >> 8) & (1ULL << 1))) + (!!(((w) >> 8) & (1ULL << 2))) + (!!(((w) >> 8) & (1ULL << 3))) + (!!(((w) >> 8) & (1ULL << 4))) + (!!(((w) >> 8) & (1ULL << 5))) + (!!(((w) >> 8) & (1ULL << 6))) + (!!(((w) >> 8) & (1ULL << 7))) )) + (( (!!(((w) >> 16) & (1ULL << 0))) + (!!(((w) >> 16) & (1ULL << 1))) + (!!(((w) >> 16) & (1ULL << 2))) + (!!(((w) >> 16) & (1ULL << 3))) + (!!(((w) >> 16) & (1ULL << 4))) + (!!(((w) >> 16) & (1ULL << 5))) + (!!(((w) >> 16) & (1ULL << 6))) + (!!(((w) >> 16) & (1ULL << 7))) ) + ( (!!((((w) >> 16) >> 8) & (1ULL << 0))) + (!!((((w) >> 16) >> 8) & (1ULL << 1))) + (!!((((w) >> 16) >> 8) & (1ULL << 2))) + (!!((((w) >> 16) >> 8) & (1ULL << 3))) + (!!((((w) >> 16) >> 8) & (1ULL << 4))) + (!!((((w) >> 16) >> 8) & (1ULL << 5))) + (!!((((w) >> 16) >> 8) & (1ULL << 6))) + (!!((((w) >> 16) >> 8) & (1ULL << 7))) ))) : __arch_hweight32(w)) : (__builtin_constant_p(w) ? (((( (!!((w) & (1ULL << 0))) + (!!((w) & (1ULL << 1))) + (!!((w) & (1ULL << 2))) + (!!((w) & (1ULL << 3))) + (!!((w) & (1ULL << 4))) + (!!((w) & (1ULL << 5))) + (!!((w) & (1ULL << 6))) + (!!((w) & (1ULL << 7))) ) + ( (!!(((w) >> 8) & (1ULL << 0))) + (!!(((w) >> 8) & (1ULL << 1))) + (!!(((w) >> 8) & (1ULL << 2))) + (!!(((w) >> 8) & (1ULL << 3))) + (!!(((w) >> 8) & (1ULL << 4))) + (!!(((w) >> 8) & (1ULL << 5))) + (!!(((w) >> 8) & (1ULL << 6))) + (!!(((w) >> 8) & (1ULL << 7))) )) + (( (!!(((w) >> 16) & (1ULL << 0))) + (!!(((w) >> 16) & (1ULL << 1))) + (!!(((w) >> 16) & (1ULL << 2))) + (!!(((w) >> 16) & (1ULL << 3))) + (!!(((w) >> 16) & (1ULL << 4))) + (!!(((w) >> 16) & (1ULL << 5))) + (!!(((w) >> 16) & (1ULL << 6))) + (!!(((w) >> 16) & (1ULL << 7))) ) + ( (!!((((w) >> 16) >> 8) & (1ULL << 0))) + (!!((((w) >> 16) >> 8) & (1ULL << 1))) + (!!((((w) >> 16) >> 8) & (1ULL << 2))) + (!!((((w) >> 16) >> 8) & (1ULL << 3))) + (!!((((w) >> 16) >> 8) & (1ULL << 4))) + (!!((((w) >> 16) >> 8) & (1ULL << 5))) + (!!((((w) >> 16) >> 8) & (1ULL << 6))) + (!!((((w) >> 16) >> 8) & (1ULL << 7))) ))) + ((( (!!(((w) >> 32) & (1ULL << 0))) + (!!(((w) >> 32) & (1ULL << 1))) + (!!(((w) >> 32) & (1ULL << 2))) + (!!(((w) >> 32) & (1ULL << 3))) + (!!(((w) >> 32) & (1ULL << 4))) + (!!(((w) >> 32) & (1ULL << 5))) + (!!(((w) >> 32) & (1ULL << 6))) + (!!(((w) >> 32) & (1ULL << 7))) ) + ( (!!((((w) >> 32) >> 8) & (1ULL << 0))) + (!!((((w) >> 32) >> 8) & (1ULL << 1))) + (!!((((w) >> 32) >> 8) & (1ULL << 2))) + (!!((((w) >> 32) >> 8) & (1ULL << 3))) + (!!((((w) >> 32) >> 8) & (1ULL << 4))) + (!!((((w) >> 32) >> 8) & (1ULL << 5))) + (!!((((w) >> 32) >> 8) & (1ULL << 6))) + (!!((((w) >> 32) >> 8) & (1ULL << 7))) )) + (( (!!((((w) >> 32) >> 16) & (1ULL << 0))) + (!!((((w) >> 32) >> 16) & (1ULL << 1))) + (!!((((w) >> 32) >> 16) & (1ULL << 2))) + (!!((((w) >> 32) >> 16) & (1ULL << 3))) + (!!((((w) >> 32) >> 16) & (1ULL << 4))) + (!!((((w) >> 32) >> 16) & (1ULL << 5))) + (!!((((w) >> 32) >> 16) & (1ULL << 6))) + (!!((((w) >> 32) >> 16) & (1ULL << 7))) ) + ( (!!(((((w) >> 32) >> 16) >> 8) & (1ULL << 0))) + (!!(((((w) >> 32) >> 16) >> 8) & (1ULL << 1))) + (!!(((((w) >> 32) >> 16) >> 8) & (1ULL << 2))) + (!!(((((w) >> 32) >> 16) >> 8) & (1ULL << 3))) + (!!(((((w) >> 32) >> 16) >> 8) & (1ULL << 4))) + (!!(((((w) >> 32) >> 16) >> 8) & (1ULL << 5))) + (!!(((((w) >> 32) >> 16) >> 8) & (1ULL << 6))) + (!!(((((w) >> 32) >> 16) >> 8) & (1ULL << 7))) )))) : __arch_hweight64(w));
}






static inline __attribute__((always_inline)) __u32 rol32(__u32 word, unsigned int shift)
{
 return (word << shift) | (word >> (32 - shift));
}






static inline __attribute__((always_inline)) __u32 ror32(__u32 word, unsigned int shift)
{
 return (word >> shift) | (word << (32 - shift));
}






static inline __attribute__((always_inline)) __u16 rol16(__u16 word, unsigned int shift)
{
 return (word << shift) | (word >> (16 - shift));
}






static inline __attribute__((always_inline)) __u16 ror16(__u16 word, unsigned int shift)
{
 return (word >> shift) | (word << (16 - shift));
}






static inline __attribute__((always_inline)) __u8 rol8(__u8 word, unsigned int shift)
{
 return (word << shift) | (word >> (8 - shift));
}






static inline __attribute__((always_inline)) __u8 ror8(__u8 word, unsigned int shift)
{
 return (word >> shift) | (word << (8 - shift));
}

static inline __attribute__((always_inline)) unsigned fls_long(unsigned long l)
{
 if (sizeof(l) == 4)
  return fls(l);
 return fls64(l);
}
# 127 "include/linux/bitops.h"
static inline __attribute__((always_inline)) unsigned long __ffs64(u64 word)
{

 if (((u32)word) == 0UL)
  return __ffs((u32)(word >> 32)) + 32;



 return __ffs((unsigned long)word);
}
# 170 "include/linux/bitops.h"
extern unsigned long find_last_bit(const unsigned long *addr,
       unsigned long size);
# 182 "include/linux/bitops.h"
extern unsigned long find_next_bit(const unsigned long *addr,
       unsigned long size, unsigned long offset);
# 192 "include/linux/bitops.h"
extern unsigned long find_next_zero_bit(const unsigned long *addr,
     unsigned long size,
     unsigned long offset);
# 18 "include/linux/kernel.h" 2
# 1 "include/linux/log2.h" 1
# 21 "include/linux/log2.h"
extern __attribute__((const, noreturn))
int ____ilog2_NaN(void);
# 31 "include/linux/log2.h"
static inline __attribute__((always_inline)) __attribute__((const))
int __ilog2_u32(u32 n)
{
 return fls(n) - 1;
}



static inline __attribute__((always_inline)) __attribute__((const))
int __ilog2_u64(u64 n)
{
 return fls64(n) - 1;
}







static inline __attribute__((always_inline)) __attribute__((const))
int is_power_of_2(unsigned long n)
{
 return (n != 0 && ((n & (n - 1)) == 0));
}




static inline __attribute__((always_inline)) __attribute__((const))
unsigned long __roundup_pow_of_two(unsigned long n)
{
 return 1UL << fls_long(n - 1);
}




static inline __attribute__((always_inline)) __attribute__((const))
unsigned long __rounddown_pow_of_two(unsigned long n)
{
 return 1UL << (fls_long(n) - 1);
}
# 19 "include/linux/kernel.h" 2

# 1 "include/linux/dynamic_debug.h" 1







extern long long dynamic_debug_enabled;
extern long long dynamic_debug_enabled2;






struct _ddebug {




 const char *modname;
 const char *function;
 const char *filename;
 const char *format;
 char primary_hash;
 char secondary_hash;
 unsigned int lineno:24;







 unsigned int flags:8;
} __attribute__((aligned(8)));


int ddebug_add_module(struct _ddebug *tab, unsigned int n,
    const char *modname);
# 76 "include/linux/dynamic_debug.h"
static inline __attribute__((always_inline)) int ddebug_remove_module(const char *mod)
{
 return 0;
}
# 21 "include/linux/kernel.h" 2



extern const char linux_banner[];
extern const char linux_proc_banner[];
# 132 "include/linux/kernel.h"
extern int console_printk[];






struct completion;
struct pt_regs;
struct user;
# 165 "include/linux/kernel.h"
  static inline __attribute__((always_inline)) void __might_sleep(const char *file, int line,
       int preempt_offset) { }
# 180 "include/linux/kernel.h"
static inline __attribute__((always_inline)) void might_fault(void)
{
 do { do { } while (0); } while (0);
}


struct va_format {
 const char *fmt;
 va_list *va;
};

extern struct atomic_notifier_head panic_notifier_list;
extern long (*panic_blink)(int state);
 void panic(const char * fmt, ...)
 __attribute__ ((noreturn, format (printf, 1, 2))) __attribute__((__cold__));
extern void oops_enter(void);
extern void oops_exit(void);
void print_oops_end_marker(void);
extern int oops_may_print(void);
 void do_exit(long error_code)
 __attribute__((noreturn));
 void complete_and_exit(struct completion *, long)
 __attribute__((noreturn));
extern unsigned long simple_strtoul(const char *,char **,unsigned int);
extern long simple_strtol(const char *,char **,unsigned int);
extern unsigned long long simple_strtoull(const char *,char **,unsigned int);
extern long long simple_strtoll(const char *,char **,unsigned int);
extern int strict_strtoul(const char *, unsigned int, unsigned long *);
extern int strict_strtol(const char *, unsigned int, long *);
extern int strict_strtoull(const char *, unsigned int, unsigned long long *);
extern int strict_strtoll(const char *, unsigned int, long long *);
extern int sprintf(char * buf, const char * fmt, ...)
 __attribute__ ((format (printf, 2, 3)));
extern int vsprintf(char *buf, const char *, va_list)
 __attribute__ ((format (printf, 2, 0)));
extern int snprintf(char * buf, size_t size, const char * fmt, ...)
 __attribute__ ((format (printf, 3, 4)));
extern int vsnprintf(char *buf, size_t size, const char *fmt, va_list args)
 __attribute__ ((format (printf, 3, 0)));
extern int scnprintf(char * buf, size_t size, const char * fmt, ...)
 __attribute__ ((format (printf, 3, 4)));
extern int vscnprintf(char *buf, size_t size, const char *fmt, va_list args)
 __attribute__ ((format (printf, 3, 0)));
extern char *kasprintf(gfp_t gfp, const char *fmt, ...)
 __attribute__ ((format (printf, 2, 3)));
extern char *kvasprintf(gfp_t gfp, const char *fmt, va_list args);

extern int sscanf(const char *, const char *, ...)
 __attribute__ ((format (scanf, 2, 3)));
extern int vsscanf(const char *, const char *, va_list)
 __attribute__ ((format (scanf, 2, 0)));

extern int get_option(char **str, int *pint);
extern char *get_options(const char *str, int nints, int *ints);
extern unsigned long long memparse(const char *ptr, char **retptr);

extern int core_kernel_text(unsigned long addr);
extern int __kernel_text_address(unsigned long addr);
extern int kernel_text_address(unsigned long addr);
extern int func_ptr_is_kernel_text(void *ptr);

struct pid;
extern struct pid *session_of_pgrp(struct pid *pgrp);
# 276 "include/linux/kernel.h"
 int vprintk(const char *fmt, va_list args)
 __attribute__ ((format (printf, 1, 0)));
 int printk(const char * fmt, ...)
 __attribute__ ((format (printf, 1, 2))) __attribute__((__cold__));

extern int __printk_ratelimit(const char *func);

extern int printk_timed_ratelimit(unsigned long *caller_jiffies,
       unsigned int interval_msec);

extern int printk_delay_msec;
# 300 "include/linux/kernel.h"
void log_buf_kexec_setup(void);
# 325 "include/linux/kernel.h"
static inline __attribute__((always_inline)) __attribute__ ((format (printf, 1, 2)))
int no_printk(const char *s, ...) { return 0; }

extern int printk_needs_cpu(int cpu);
extern void printk_tick(void);

extern void __attribute__((format(printf, 1, 2)))
 early_printk(const char *fmt, ...);

unsigned long int_sqrt(unsigned long);

static inline __attribute__((always_inline)) void console_silent(void)
{
 (console_printk[0]) = 0;
}

static inline __attribute__((always_inline)) void console_verbose(void)
{
 if ((console_printk[0]))
  (console_printk[0]) = 15;
}

extern void bust_spinlocks(int yes);
extern void wake_up_klogd(void);
extern int oops_in_progress;
extern int panic_timeout;
extern int panic_on_oops;
extern int panic_on_unrecovered_nmi;
extern int panic_on_io_nmi;
extern const char *print_tainted(void);
extern void add_taint(unsigned flag);
extern int test_taint(unsigned flag);
extern unsigned long get_taint(void);
extern int root_mountflags;


extern enum system_states {
 SYSTEM_BOOTING,
 SYSTEM_RUNNING,
 SYSTEM_HALT,
 SYSTEM_POWER_OFF,
 SYSTEM_RESTART,
 SYSTEM_SUSPEND_DISK,
} system_state;
# 383 "include/linux/kernel.h"
extern void dump_stack(void) __attribute__((__cold__));

enum {
 DUMP_PREFIX_NONE,
 DUMP_PREFIX_ADDRESS,
 DUMP_PREFIX_OFFSET
};
extern void hex_dump_to_buffer(const void *buf, size_t len,
    int rowsize, int groupsize,
    char *linebuf, size_t linebuflen, int ascii);
extern void print_hex_dump(const char *level, const char *prefix_str,
    int prefix_type, int rowsize, int groupsize,
    const void *buf, size_t len, int ascii);
extern void print_hex_dump_bytes(const char *prefix_str, int prefix_type,
   const void *buf, size_t len);

extern const char hex_asc[];



static inline __attribute__((always_inline)) char *pack_hex_byte(char *buf, u8 byte)
{
 *buf++ = hex_asc[((byte) & 0xf0) >> 4];
 *buf++ = hex_asc[((byte) & 0x0f)];
 return buf;
}

extern int hex_to_bin(char ch);
# 559 "include/linux/kernel.h"
static inline __attribute__((always_inline)) void tracing_on(void) { }
static inline __attribute__((always_inline)) void tracing_off(void) { }
static inline __attribute__((always_inline)) void tracing_off_permanent(void) { }
static inline __attribute__((always_inline)) int tracing_is_on(void) { return 0; }


enum ftrace_dump_mode {
 DUMP_NONE,
 DUMP_ALL,
 DUMP_ORIG,
};
# 651 "include/linux/kernel.h"
static inline __attribute__((always_inline)) int
trace_printk(const char *fmt, ...) __attribute__ ((format (printf, 1, 2)));

static inline __attribute__((always_inline)) void tracing_start(void) { }
static inline __attribute__((always_inline)) void tracing_stop(void) { }
static inline __attribute__((always_inline)) void ftrace_off_permanent(void) { }
static inline __attribute__((always_inline)) void trace_dump_stack(void) { }
static inline __attribute__((always_inline)) int
trace_printk(const char *fmt, ...)
{
 return 0;
}
static inline __attribute__((always_inline)) int
ftrace_vprintk(const char *fmt, va_list ap)
{
 return 0;
}
static inline __attribute__((always_inline)) void ftrace_dump(enum ftrace_dump_mode oops_dump_mode) { }
# 787 "include/linux/kernel.h"
struct sysinfo;
extern int do_sysinfo(struct sysinfo *info);




struct sysinfo {
 long uptime;
 unsigned long loads[3];
 unsigned long totalram;
 unsigned long freeram;
 unsigned long sharedram;
 unsigned long bufferram;
 unsigned long totalswap;
 unsigned long freeswap;
 unsigned short procs;
 unsigned short pad;
 unsigned long totalhigh;
 unsigned long freehigh;
 unsigned int mem_unit;
 char _f[20-2*sizeof(long)-sizeof(int)];
};
# 10 "include/linux/cpumask.h" 2
# 1 "include/linux/threads.h" 1
# 11 "include/linux/cpumask.h" 2
# 1 "include/linux/bitmap.h" 1







# 1 "include/linux/string.h" 1
# 15 "include/linux/string.h"
extern char *strndup_user(const char *, long);
extern void *memdup_user(const void *, size_t);




# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/string.h" 1
# 23 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/string.h"
static __inline__ __attribute__((always_inline)) char *strcpy(char *__dest, __const__ char *__src)
{
  char *__xdest = __dest;

  __asm__ __volatile__(
 ".set\tnoreorder\n\t"
 ".set\tnoat\n"
 "1:\tlbu\t$1,(%1)\n\t"
 "addiu\t%1,1\n\t"
 "sb\t$1,(%0)\n\t"
 "bnez\t$1,1b\n\t"
 "addiu\t%0,1\n\t"
 ".set\tat\n\t"
 ".set\treorder"
 : "=r" (__dest), "=r" (__src)
        : "0" (__dest), "1" (__src)
 : "memory");

  return __xdest;
}


static __inline__ __attribute__((always_inline)) char *strncpy(char *__dest, __const__ char *__src, size_t __n)
{
  char *__xdest = __dest;

  if (__n == 0)
    return __xdest;

  __asm__ __volatile__(
 ".set\tnoreorder\n\t"
 ".set\tnoat\n"
 "1:\tlbu\t$1,(%1)\n\t"
 "subu\t%2,1\n\t"
 "sb\t$1,(%0)\n\t"
 "beqz\t$1,2f\n\t"
 "addiu\t%0,1\n\t"
 "bnez\t%2,1b\n\t"
 "addiu\t%1,1\n"
 "2:\n\t"
 ".set\tat\n\t"
 ".set\treorder"
        : "=r" (__dest), "=r" (__src), "=r" (__n)
        : "0" (__dest), "1" (__src), "2" (__n)
        : "memory");

  return __xdest;
}


static __inline__ __attribute__((always_inline)) int strcmp(__const__ char *__cs, __const__ char *__ct)
{
  int __res;

  __asm__ __volatile__(
 ".set\tnoreorder\n\t"
 ".set\tnoat\n\t"
 "lbu\t%2,(%0)\n"
 "1:\tlbu\t$1,(%1)\n\t"
 "addiu\t%0,1\n\t"
 "bne\t$1,%2,2f\n\t"
 "addiu\t%1,1\n\t"
 "bnez\t%2,1b\n\t"
 "lbu\t%2,(%0)\n\t"



 "move\t%2,$1\n"
 "2:\tsubu\t%2,$1\n"
 "3:\t.set\tat\n\t"
 ".set\treorder"
 : "=r" (__cs), "=r" (__ct), "=r" (__res)
 : "0" (__cs), "1" (__ct));

  return __res;
}




static __inline__ __attribute__((always_inline)) int
strncmp(__const__ char *__cs, __const__ char *__ct, size_t __count)
{
 int __res;

 __asm__ __volatile__(
 ".set\tnoreorder\n\t"
 ".set\tnoat\n"
 "1:\tlbu\t%3,(%0)\n\t"
 "beqz\t%2,2f\n\t"
 "lbu\t$1,(%1)\n\t"
 "subu\t%2,1\n\t"
 "bne\t$1,%3,3f\n\t"
 "addiu\t%0,1\n\t"
 "bnez\t%3,1b\n\t"
 "addiu\t%1,1\n"
 "2:\n\t"



 "move\t%3,$1\n"
 "3:\tsubu\t%3,$1\n\t"
 ".set\tat\n\t"
 ".set\treorder"
 : "=r" (__cs), "=r" (__ct), "=r" (__count), "=r" (__res)
 : "0" (__cs), "1" (__ct), "2" (__count));

 return __res;
}



extern void *memset(void *__s, int __c, size_t __count);


extern void *memcpy(void *__to, __const__ void *__from, size_t __n);


extern void *memmove(void *__dest, __const__ void *__src, size_t __n);
# 22 "include/linux/string.h" 2
# 30 "include/linux/string.h"
size_t strlcpy(char *, const char *, size_t);


extern char * strcat(char *, const char *);


extern char * strncat(char *, const char *, __kernel_size_t);


extern size_t strlcat(char *, const char *, __kernel_size_t);
# 48 "include/linux/string.h"
extern int strnicmp(const char *, const char *, __kernel_size_t);


extern int strcasecmp(const char *s1, const char *s2);


extern int strncasecmp(const char *s1, const char *s2, size_t n);


extern char * strchr(const char *,int);


extern char * strnchr(const char *, size_t, int);


extern char * strrchr(const char *,int);

extern char * skip_spaces(const char *);

extern char *strim(char *);

static inline __attribute__((always_inline)) char *strstrip(char *str)
{
 return strim(str);
}


extern char * strstr(const char *, const char *);


extern char * strnstr(const char *, const char *, size_t);


extern __kernel_size_t strlen(const char *);


extern __kernel_size_t strnlen(const char *,__kernel_size_t);


extern char * strpbrk(const char *,const char *);


extern char * strsep(char **,const char *);


extern __kernel_size_t strspn(const char *,const char *);


extern __kernel_size_t strcspn(const char *,const char *);
# 109 "include/linux/string.h"
extern void * memscan(void *,int,__kernel_size_t);


extern int memcmp(const void *,const void *,__kernel_size_t);


extern void * memchr(const void *,int,__kernel_size_t);


extern char *kstrdup(const char *s, gfp_t gfp);
extern char *kstrndup(const char *s, size_t len, gfp_t gfp);
extern void *kmemdup(const void *src, size_t len, gfp_t gfp);

extern char **argv_split(gfp_t gfp, const char *str, int *argcp);
extern void argv_free(char **argv);

extern int sysfs_streq(const char *s1, const char *s2);







extern ssize_t memory_read_from_buffer(void *to, size_t count, loff_t *ppos,
   const void *from, size_t available);






static inline __attribute__((always_inline)) int strstarts(const char *str, const char *prefix)
{
 return strncmp(str, prefix, strlen(prefix)) == 0;
}
# 9 "include/linux/bitmap.h" 2
# 90 "include/linux/bitmap.h"
extern int __bitmap_empty(const unsigned long *bitmap, int bits);
extern int __bitmap_full(const unsigned long *bitmap, int bits);
extern int __bitmap_equal(const unsigned long *bitmap1,
                 const unsigned long *bitmap2, int bits);
extern void __bitmap_complement(unsigned long *dst, const unsigned long *src,
   int bits);
extern void __bitmap_shift_right(unsigned long *dst,
                        const unsigned long *src, int shift, int bits);
extern void __bitmap_shift_left(unsigned long *dst,
                        const unsigned long *src, int shift, int bits);
extern int __bitmap_and(unsigned long *dst, const unsigned long *bitmap1,
   const unsigned long *bitmap2, int bits);
extern void __bitmap_or(unsigned long *dst, const unsigned long *bitmap1,
   const unsigned long *bitmap2, int bits);
extern void __bitmap_xor(unsigned long *dst, const unsigned long *bitmap1,
   const unsigned long *bitmap2, int bits);
extern int __bitmap_andnot(unsigned long *dst, const unsigned long *bitmap1,
   const unsigned long *bitmap2, int bits);
extern int __bitmap_intersects(const unsigned long *bitmap1,
   const unsigned long *bitmap2, int bits);
extern int __bitmap_subset(const unsigned long *bitmap1,
   const unsigned long *bitmap2, int bits);
extern int __bitmap_weight(const unsigned long *bitmap, int bits);

extern void bitmap_set(unsigned long *map, int i, int len);
extern void bitmap_clear(unsigned long *map, int start, int nr);
extern unsigned long bitmap_find_next_zero_area(unsigned long *map,
      unsigned long size,
      unsigned long start,
      unsigned int nr,
      unsigned long align_mask);

extern int bitmap_scnprintf(char *buf, unsigned int len,
   const unsigned long *src, int nbits);
extern int __bitmap_parse(const char *buf, unsigned int buflen, int is_user,
   unsigned long *dst, int nbits);
extern int bitmap_parse_user(const char *ubuf, unsigned int ulen,
   unsigned long *dst, int nbits);
extern int bitmap_scnlistprintf(char *buf, unsigned int len,
   const unsigned long *src, int nbits);
extern int bitmap_parselist(const char *buf, unsigned long *maskp,
   int nmaskbits);
extern void bitmap_remap(unsigned long *dst, const unsigned long *src,
  const unsigned long *old, const unsigned long *new, int bits);
extern int bitmap_bitremap(int oldbit,
  const unsigned long *old, const unsigned long *new, int bits);
extern void bitmap_onto(unsigned long *dst, const unsigned long *orig,
  const unsigned long *relmap, int bits);
extern void bitmap_fold(unsigned long *dst, const unsigned long *orig,
  int sz, int bits);
extern int bitmap_find_free_region(unsigned long *bitmap, int bits, int order);
extern void bitmap_release_region(unsigned long *bitmap, int pos, int order);
extern int bitmap_allocate_region(unsigned long *bitmap, int pos, int order);
extern void bitmap_copy_le(void *dst, const unsigned long *src, int nbits);
# 154 "include/linux/bitmap.h"
static inline __attribute__((always_inline)) void bitmap_zero(unsigned long *dst, int nbits)
{
 if ((__builtin_constant_p(nbits) && (nbits) <= 32))
  *dst = 0UL;
 else {
  int len = (((nbits) + (8 * sizeof(long)) - 1) / (8 * sizeof(long))) * sizeof(unsigned long);
  memset(dst, 0, len);
 }
}

static inline __attribute__((always_inline)) void bitmap_fill(unsigned long *dst, int nbits)
{
 size_t nlongs = (((nbits) + (8 * sizeof(long)) - 1) / (8 * sizeof(long)));
 if (!(__builtin_constant_p(nbits) && (nbits) <= 32)) {
  int len = (nlongs - 1) * sizeof(unsigned long);
  memset(dst, 0xff, len);
 }
 dst[nlongs - 1] = ( ((nbits) % 32) ? (1UL<<((nbits) % 32))-1 : ~0UL );
}

static inline __attribute__((always_inline)) void bitmap_copy(unsigned long *dst, const unsigned long *src,
   int nbits)
{
 if ((__builtin_constant_p(nbits) && (nbits) <= 32))
  *dst = *src;
 else {
  int len = (((nbits) + (8 * sizeof(long)) - 1) / (8 * sizeof(long))) * sizeof(unsigned long);
  memcpy(dst, src, len);
 }
}

static inline __attribute__((always_inline)) int bitmap_and(unsigned long *dst, const unsigned long *src1,
   const unsigned long *src2, int nbits)
{
 if ((__builtin_constant_p(nbits) && (nbits) <= 32))
  return (*dst = *src1 & *src2) != 0;
 return __bitmap_and(dst, src1, src2, nbits);
}

static inline __attribute__((always_inline)) void bitmap_or(unsigned long *dst, const unsigned long *src1,
   const unsigned long *src2, int nbits)
{
 if ((__builtin_constant_p(nbits) && (nbits) <= 32))
  *dst = *src1 | *src2;
 else
  __bitmap_or(dst, src1, src2, nbits);
}

static inline __attribute__((always_inline)) void bitmap_xor(unsigned long *dst, const unsigned long *src1,
   const unsigned long *src2, int nbits)
{
 if ((__builtin_constant_p(nbits) && (nbits) <= 32))
  *dst = *src1 ^ *src2;
 else
  __bitmap_xor(dst, src1, src2, nbits);
}

static inline __attribute__((always_inline)) int bitmap_andnot(unsigned long *dst, const unsigned long *src1,
   const unsigned long *src2, int nbits)
{
 if ((__builtin_constant_p(nbits) && (nbits) <= 32))
  return (*dst = *src1 & ~(*src2)) != 0;
 return __bitmap_andnot(dst, src1, src2, nbits);
}

static inline __attribute__((always_inline)) void bitmap_complement(unsigned long *dst, const unsigned long *src,
   int nbits)
{
 if ((__builtin_constant_p(nbits) && (nbits) <= 32))
  *dst = ~(*src) & ( ((nbits) % 32) ? (1UL<<((nbits) % 32))-1 : ~0UL );
 else
  __bitmap_complement(dst, src, nbits);
}

static inline __attribute__((always_inline)) int bitmap_equal(const unsigned long *src1,
   const unsigned long *src2, int nbits)
{
 if ((__builtin_constant_p(nbits) && (nbits) <= 32))
  return ! ((*src1 ^ *src2) & ( ((nbits) % 32) ? (1UL<<((nbits) % 32))-1 : ~0UL ));
 else
  return __bitmap_equal(src1, src2, nbits);
}

static inline __attribute__((always_inline)) int bitmap_intersects(const unsigned long *src1,
   const unsigned long *src2, int nbits)
{
 if ((__builtin_constant_p(nbits) && (nbits) <= 32))
  return ((*src1 & *src2) & ( ((nbits) % 32) ? (1UL<<((nbits) % 32))-1 : ~0UL )) != 0;
 else
  return __bitmap_intersects(src1, src2, nbits);
}

static inline __attribute__((always_inline)) int bitmap_subset(const unsigned long *src1,
   const unsigned long *src2, int nbits)
{
 if ((__builtin_constant_p(nbits) && (nbits) <= 32))
  return ! ((*src1 & ~(*src2)) & ( ((nbits) % 32) ? (1UL<<((nbits) % 32))-1 : ~0UL ));
 else
  return __bitmap_subset(src1, src2, nbits);
}

static inline __attribute__((always_inline)) int bitmap_empty(const unsigned long *src, int nbits)
{
 if ((__builtin_constant_p(nbits) && (nbits) <= 32))
  return ! (*src & ( ((nbits) % 32) ? (1UL<<((nbits) % 32))-1 : ~0UL ));
 else
  return __bitmap_empty(src, nbits);
}

static inline __attribute__((always_inline)) int bitmap_full(const unsigned long *src, int nbits)
{
 if ((__builtin_constant_p(nbits) && (nbits) <= 32))
  return ! (~(*src) & ( ((nbits) % 32) ? (1UL<<((nbits) % 32))-1 : ~0UL ));
 else
  return __bitmap_full(src, nbits);
}

static inline __attribute__((always_inline)) int bitmap_weight(const unsigned long *src, int nbits)
{
 if ((__builtin_constant_p(nbits) && (nbits) <= 32))
  return hweight_long(*src & ( ((nbits) % 32) ? (1UL<<((nbits) % 32))-1 : ~0UL ));
 return __bitmap_weight(src, nbits);
}

static inline __attribute__((always_inline)) void bitmap_shift_right(unsigned long *dst,
   const unsigned long *src, int n, int nbits)
{
 if ((__builtin_constant_p(nbits) && (nbits) <= 32))
  *dst = *src >> n;
 else
  __bitmap_shift_right(dst, src, n, nbits);
}

static inline __attribute__((always_inline)) void bitmap_shift_left(unsigned long *dst,
   const unsigned long *src, int n, int nbits)
{
 if ((__builtin_constant_p(nbits) && (nbits) <= 32))
  *dst = (*src << n) & ( ((nbits) % 32) ? (1UL<<((nbits) % 32))-1 : ~0UL );
 else
  __bitmap_shift_left(dst, src, n, nbits);
}

static inline __attribute__((always_inline)) int bitmap_parse(const char *buf, unsigned int buflen,
   unsigned long *maskp, int nmaskbits)
{
 return __bitmap_parse(buf, buflen, 0, maskp, nmaskbits);
}
# 12 "include/linux/cpumask.h" 2

typedef struct cpumask { unsigned long bits[(((4) + (8 * sizeof(long)) - 1) / (8 * sizeof(long)))]; } cpumask_t;
# 27 "include/linux/cpumask.h"
extern int nr_cpu_ids;
# 78 "include/linux/cpumask.h"
extern const struct cpumask *const cpu_possible_mask;
extern const struct cpumask *const cpu_online_mask;
extern const struct cpumask *const cpu_present_mask;
extern const struct cpumask *const cpu_active_mask;
# 104 "include/linux/cpumask.h"
static inline __attribute__((always_inline)) unsigned int cpumask_check(unsigned int cpu)
{



 return cpu;
}
# 157 "include/linux/cpumask.h"
static inline __attribute__((always_inline)) unsigned int cpumask_first(const struct cpumask *srcp)
{
 return find_next_bit((((srcp)->bits)), (4), 0);
}
# 169 "include/linux/cpumask.h"
static inline __attribute__((always_inline)) unsigned int cpumask_next(int n, const struct cpumask *srcp)
{

 if (n != -1)
  cpumask_check(n);
 return find_next_bit(((srcp)->bits), 4, n+1);
}
# 184 "include/linux/cpumask.h"
static inline __attribute__((always_inline)) unsigned int cpumask_next_zero(int n, const struct cpumask *srcp)
{

 if (n != -1)
  cpumask_check(n);
 return find_next_zero_bit(((srcp)->bits), 4, n+1);
}

int cpumask_next_and(int n, const struct cpumask *, const struct cpumask *);
int cpumask_any_but(const struct cpumask *mask, unsigned int cpu);
# 254 "include/linux/cpumask.h"
static inline __attribute__((always_inline)) void cpumask_set_cpu(unsigned int cpu, struct cpumask *dstp)
{
 set_bit(cpumask_check(cpu), ((dstp)->bits));
}






static inline __attribute__((always_inline)) void cpumask_clear_cpu(int cpu, struct cpumask *dstp)
{
 clear_bit(cpumask_check(cpu), ((dstp)->bits));
}
# 286 "include/linux/cpumask.h"
static inline __attribute__((always_inline)) int cpumask_test_and_set_cpu(int cpu, struct cpumask *cpumask)
{
 return test_and_set_bit(cpumask_check(cpu), ((cpumask)->bits));
}
# 298 "include/linux/cpumask.h"
static inline __attribute__((always_inline)) int cpumask_test_and_clear_cpu(int cpu, struct cpumask *cpumask)
{
 return test_and_clear_bit(cpumask_check(cpu), ((cpumask)->bits));
}





static inline __attribute__((always_inline)) void cpumask_setall(struct cpumask *dstp)
{
 bitmap_fill(((dstp)->bits), 4);
}





static inline __attribute__((always_inline)) void cpumask_clear(struct cpumask *dstp)
{
 bitmap_zero(((dstp)->bits), 4);
}







static inline __attribute__((always_inline)) int cpumask_and(struct cpumask *dstp,
          const struct cpumask *src1p,
          const struct cpumask *src2p)
{
 return bitmap_and(((dstp)->bits), ((src1p)->bits),
           ((src2p)->bits), 4);
}







static inline __attribute__((always_inline)) void cpumask_or(struct cpumask *dstp, const struct cpumask *src1p,
         const struct cpumask *src2p)
{
 bitmap_or(((dstp)->bits), ((src1p)->bits),
          ((src2p)->bits), 4);
}







static inline __attribute__((always_inline)) void cpumask_xor(struct cpumask *dstp,
          const struct cpumask *src1p,
          const struct cpumask *src2p)
{
 bitmap_xor(((dstp)->bits), ((src1p)->bits),
           ((src2p)->bits), 4);
}







static inline __attribute__((always_inline)) int cpumask_andnot(struct cpumask *dstp,
      const struct cpumask *src1p,
      const struct cpumask *src2p)
{
 return bitmap_andnot(((dstp)->bits), ((src1p)->bits),
       ((src2p)->bits), 4);
}






static inline __attribute__((always_inline)) void cpumask_complement(struct cpumask *dstp,
          const struct cpumask *srcp)
{
 bitmap_complement(((dstp)->bits), ((srcp)->bits),
           4);
}






static inline __attribute__((always_inline)) int cpumask_equal(const struct cpumask *src1p,
    const struct cpumask *src2p)
{
 return bitmap_equal(((src1p)->bits), ((src2p)->bits),
       4);
}






static inline __attribute__((always_inline)) int cpumask_intersects(const struct cpumask *src1p,
         const struct cpumask *src2p)
{
 return bitmap_intersects(((src1p)->bits), ((src2p)->bits),
            4);
}






static inline __attribute__((always_inline)) int cpumask_subset(const struct cpumask *src1p,
     const struct cpumask *src2p)
{
 return bitmap_subset(((src1p)->bits), ((src2p)->bits),
        4);
}





static inline __attribute__((always_inline)) int cpumask_empty(const struct cpumask *srcp)
{
 return bitmap_empty(((srcp)->bits), 4);
}





static inline __attribute__((always_inline)) int cpumask_full(const struct cpumask *srcp)
{
 return bitmap_full(((srcp)->bits), 4);
}





static inline __attribute__((always_inline)) unsigned int cpumask_weight(const struct cpumask *srcp)
{
 return bitmap_weight(((srcp)->bits), 4);
}







static inline __attribute__((always_inline)) void cpumask_shift_right(struct cpumask *dstp,
           const struct cpumask *srcp, int n)
{
 bitmap_shift_right(((dstp)->bits), ((srcp)->bits), n,
            4);
}







static inline __attribute__((always_inline)) void cpumask_shift_left(struct cpumask *dstp,
          const struct cpumask *srcp, int n)
{
 bitmap_shift_left(((dstp)->bits), ((srcp)->bits), n,
           4);
}






static inline __attribute__((always_inline)) void cpumask_copy(struct cpumask *dstp,
    const struct cpumask *srcp)
{
 bitmap_copy(((dstp)->bits), ((srcp)->bits), 4);
}
# 529 "include/linux/cpumask.h"
static inline __attribute__((always_inline)) int cpumask_scnprintf(char *buf, int len,
        const struct cpumask *srcp)
{
 return bitmap_scnprintf(buf, len, ((srcp)->bits), 4);
}
# 543 "include/linux/cpumask.h"
static inline __attribute__((always_inline)) int cpumask_parse_user(const char *buf, int len,
         struct cpumask *dstp)
{
 return bitmap_parse_user(buf, len, ((dstp)->bits), 4);
}
# 558 "include/linux/cpumask.h"
static inline __attribute__((always_inline)) int cpulist_scnprintf(char *buf, int len,
        const struct cpumask *srcp)
{
 return bitmap_scnlistprintf(buf, len, ((srcp)->bits),
        4);
}
# 573 "include/linux/cpumask.h"
static inline __attribute__((always_inline)) int cpulist_parse(const char *buf, struct cpumask *dstp)
{
 return bitmap_parselist(buf, ((dstp)->bits), 4);
}






static inline __attribute__((always_inline)) size_t cpumask_size(void)
{


 return (((4) + (8 * sizeof(long)) - 1) / (8 * sizeof(long))) * sizeof(long);
}
# 618 "include/linux/cpumask.h"
typedef struct cpumask cpumask_var_t[1];

static inline __attribute__((always_inline)) int alloc_cpumask_var(cpumask_var_t *mask, gfp_t flags)
{
 return true;
}

static inline __attribute__((always_inline)) int alloc_cpumask_var_node(cpumask_var_t *mask, gfp_t flags,
       int node)
{
 return true;
}

static inline __attribute__((always_inline)) int zalloc_cpumask_var(cpumask_var_t *mask, gfp_t flags)
{
 cpumask_clear(*mask);
 return true;
}

static inline __attribute__((always_inline)) int zalloc_cpumask_var_node(cpumask_var_t *mask, gfp_t flags,
       int node)
{
 cpumask_clear(*mask);
 return true;
}

static inline __attribute__((always_inline)) void alloc_bootmem_cpumask_var(cpumask_var_t *mask)
{
}

static inline __attribute__((always_inline)) void free_cpumask_var(cpumask_var_t mask)
{
}

static inline __attribute__((always_inline)) void free_bootmem_cpumask_var(cpumask_var_t mask)
{
}




extern const unsigned long cpu_all_bits[(((4) + (8 * sizeof(long)) - 1) / (8 * sizeof(long)))];
# 670 "include/linux/cpumask.h"
void set_cpu_possible(unsigned int cpu, int possible);
void set_cpu_present(unsigned int cpu, int present);
void set_cpu_online(unsigned int cpu, int online);
void set_cpu_active(unsigned int cpu, int active);
void init_cpu_present(const struct cpumask *src);
void init_cpu_possible(const struct cpumask *src);
void init_cpu_online(const struct cpumask *src);
# 692 "include/linux/cpumask.h"
static inline __attribute__((always_inline)) int __check_is_bitmap(const unsigned long *bitmap)
{
 return 1;
}
# 704 "include/linux/cpumask.h"
extern const unsigned long
 cpu_bit_bitmap[32 +1][(((4) + (8 * sizeof(long)) - 1) / (8 * sizeof(long)))];

static inline __attribute__((always_inline)) const struct cpumask *get_cpu_mask(unsigned int cpu)
{
 const unsigned long *p = cpu_bit_bitmap[1 + cpu % 32];
 p -= cpu / 32;
 return ((struct cpumask *)(1 ? (p) : (void *)sizeof(__check_is_bitmap(p))));
}
# 781 "include/linux/cpumask.h"
int __first_cpu(const cpumask_t *srcp);
int __next_cpu(int n, const cpumask_t *srcp);
int __any_online_cpu(const cpumask_t *mask);
# 811 "include/linux/cpumask.h"
static inline __attribute__((always_inline)) void __cpu_set(int cpu, volatile cpumask_t *dstp)
{
 set_bit(cpu, dstp->bits);
}


static inline __attribute__((always_inline)) void __cpu_clear(int cpu, volatile cpumask_t *dstp)
{
 clear_bit(cpu, dstp->bits);
}


static inline __attribute__((always_inline)) void __cpus_setall(cpumask_t *dstp, int nbits)
{
 bitmap_fill(dstp->bits, nbits);
}


static inline __attribute__((always_inline)) void __cpus_clear(cpumask_t *dstp, int nbits)
{
 bitmap_zero(dstp->bits, nbits);
}





static inline __attribute__((always_inline)) int __cpu_test_and_set(int cpu, cpumask_t *addr)
{
 return test_and_set_bit(cpu, addr->bits);
}


static inline __attribute__((always_inline)) int __cpus_and(cpumask_t *dstp, const cpumask_t *src1p,
     const cpumask_t *src2p, int nbits)
{
 return bitmap_and(dstp->bits, src1p->bits, src2p->bits, nbits);
}


static inline __attribute__((always_inline)) void __cpus_or(cpumask_t *dstp, const cpumask_t *src1p,
     const cpumask_t *src2p, int nbits)
{
 bitmap_or(dstp->bits, src1p->bits, src2p->bits, nbits);
}


static inline __attribute__((always_inline)) void __cpus_xor(cpumask_t *dstp, const cpumask_t *src1p,
     const cpumask_t *src2p, int nbits)
{
 bitmap_xor(dstp->bits, src1p->bits, src2p->bits, nbits);
}



static inline __attribute__((always_inline)) int __cpus_andnot(cpumask_t *dstp, const cpumask_t *src1p,
     const cpumask_t *src2p, int nbits)
{
 return bitmap_andnot(dstp->bits, src1p->bits, src2p->bits, nbits);
}


static inline __attribute__((always_inline)) int __cpus_equal(const cpumask_t *src1p,
     const cpumask_t *src2p, int nbits)
{
 return bitmap_equal(src1p->bits, src2p->bits, nbits);
}


static inline __attribute__((always_inline)) int __cpus_intersects(const cpumask_t *src1p,
     const cpumask_t *src2p, int nbits)
{
 return bitmap_intersects(src1p->bits, src2p->bits, nbits);
}


static inline __attribute__((always_inline)) int __cpus_subset(const cpumask_t *src1p,
     const cpumask_t *src2p, int nbits)
{
 return bitmap_subset(src1p->bits, src2p->bits, nbits);
}


static inline __attribute__((always_inline)) int __cpus_empty(const cpumask_t *srcp, int nbits)
{
 return bitmap_empty(srcp->bits, nbits);
}


static inline __attribute__((always_inline)) int __cpus_weight(const cpumask_t *srcp, int nbits)
{
 return bitmap_weight(srcp->bits, nbits);
}



static inline __attribute__((always_inline)) void __cpus_shift_left(cpumask_t *dstp,
     const cpumask_t *srcp, int n, int nbits)
{
 bitmap_shift_left(dstp->bits, srcp->bits, n, nbits);
}
# 15 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/processor.h" 2


# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/cachectl.h" 1
# 18 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/processor.h" 2


# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/mipsregs.h" 1
# 1414 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/mipsregs.h"
static inline __attribute__((always_inline)) void tlb_probe(void)
{
 __asm__ __volatile__(
  ".set noreorder\n\t"
  "tlbp\n\t"
  ".set reorder");
}

static inline __attribute__((always_inline)) void tlb_read(void)
{
# 1441 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/mipsregs.h"
 __asm__ __volatile__(
  ".set noreorder\n\t"
  "tlbr\n\t"
  ".set reorder");
# 1457 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/mipsregs.h"
}

static inline __attribute__((always_inline)) void tlb_write_indexed(void)
{
 __asm__ __volatile__(
  ".set noreorder\n\t"
  "tlbwi\n\t"
  ".set reorder");
}

static inline __attribute__((always_inline)) void tlb_write_random(void)
{
 __asm__ __volatile__(
  ".set noreorder\n\t"
  "tlbwr\n\t"
  ".set reorder");
}
# 1529 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/mipsregs.h"
static inline __attribute__((always_inline)) unsigned int __dmt(void)
{
 int res;

 __asm__ __volatile__(
 "	.set	push						\n"
 "	.set	mips32r2					\n"
 "	.set	noat						\n"
 "	.word	0x41610BC1			# dmt $1	\n"
 "	ehb							\n"
 "	move	%0, $1						\n"
 "	.set	pop						\n"
 : "=r" (res));

 do { unsigned long tmp; __asm__ __volatile__( "	.set	mips64r2				\n" "	dla	%0, 1f					\n" "	jr.hb	%0					\n" "	.set	mips0					\n" "1:							\n" : "=r" (tmp)); } while (0);

 return res;
}






static inline __attribute__((always_inline)) void __emt(unsigned int previous)
{
 if ((previous & (1UL << 15)))
  __asm__ __volatile__(
  "	.set	mips32r2				\n"
  "	.word	0x41600be1		# emt		\n"
  "	ehb						\n"
  "	.set	mips0					\n");
}

static inline __attribute__((always_inline)) void __ehb(void)
{
 __asm__ __volatile__(
 "	.set	mips32r2					\n"
 "	ehb							\n" "	.set	mips0						\n");
}
# 1636 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/mipsregs.h"
static inline __attribute__((always_inline)) unsigned int set_c0_status(unsigned int set) { unsigned int res; unsigned int new; unsigned int omt; unsigned long flags; do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); __asm__ __volatile__( "raw_local_irq_save\t%0" : "=r" (flags) : : "memory"); do { } while (0); } while (0); omt = __dmt(); res = ({ int __res; if (0 == 0) __asm__ __volatile__( "mfc0\t%0, " "$12" "\n\t" : "=r" (__res)); else __asm__ __volatile__( ".set\tmips32\n\t" "mfc0\t%0, " "$12" ", " "0" "\n\t" ".set\tmips0\n\t" : "=r" (__res)); __res; }); new = res | set; do { do { if (0 == 0) __asm__ __volatile__( "mtc0\t%z0, " "$12" "\n\t" : : "Jr" ((unsigned int)(new))); else __asm__ __volatile__( ".set\tmips32\n\t" "mtc0\t%z0, " "$12" ", " "0" "\n\t" ".set\tmips0" : : "Jr" ((unsigned int)(new))); } while (0); __ehb(); } while (0); __emt(omt); do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); if (raw_irqs_disabled_flags(flags)) { raw_local_irq_restore(flags); do { } while (0); } else { do { } while (0); raw_local_irq_restore(flags); } } while (0); return res; } static inline __attribute__((always_inline)) unsigned int clear_c0_status(unsigned int clear) { unsigned int res; unsigned int new; unsigned int omt; unsigned long flags; do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); __asm__ __volatile__( "raw_local_irq_save\t%0" : "=r" (flags) : : "memory"); do { } while (0); } while (0); omt = __dmt(); res = ({ int __res; if (0 == 0) __asm__ __volatile__( "mfc0\t%0, " "$12" "\n\t" : "=r" (__res)); else __asm__ __volatile__( ".set\tmips32\n\t" "mfc0\t%0, " "$12" ", " "0" "\n\t" ".set\tmips0\n\t" : "=r" (__res)); __res; }); new = res & ~clear; do { do { if (0 == 0) __asm__ __volatile__( "mtc0\t%z0, " "$12" "\n\t" : : "Jr" ((unsigned int)(new))); else __asm__ __volatile__( ".set\tmips32\n\t" "mtc0\t%z0, " "$12" ", " "0" "\n\t" ".set\tmips0" : : "Jr" ((unsigned int)(new))); } while (0); __ehb(); } while (0); __emt(omt); do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); if (raw_irqs_disabled_flags(flags)) { raw_local_irq_restore(flags); do { } while (0); } else { do { } while (0); raw_local_irq_restore(flags); } } while (0); return res; } static inline __attribute__((always_inline)) unsigned int change_c0_status(unsigned int change, unsigned int newbits) { unsigned int res; unsigned int new; unsigned int omt; unsigned long flags; do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); __asm__ __volatile__( "raw_local_irq_save\t%0" : "=r" (flags) : : "memory"); do { } while (0); } while (0); omt = __dmt(); res = ({ int __res; if (0 == 0) __asm__ __volatile__( "mfc0\t%0, " "$12" "\n\t" : "=r" (__res)); else __asm__ __volatile__( ".set\tmips32\n\t" "mfc0\t%0, " "$12" ", " "0" "\n\t" ".set\tmips0\n\t" : "=r" (__res)); __res; }); new = res & ~change; new |= (newbits & change); do { do { if (0 == 0) __asm__ __volatile__( "mtc0\t%z0, " "$12" "\n\t" : : "Jr" ((unsigned int)(new))); else __asm__ __volatile__( ".set\tmips32\n\t" "mtc0\t%z0, " "$12" ", " "0" "\n\t" ".set\tmips0" : : "Jr" ((unsigned int)(new))); } while (0); __ehb(); } while (0); __emt(omt); do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); if (raw_irqs_disabled_flags(flags)) { raw_local_irq_restore(flags); do { } while (0); } else { do { } while (0); raw_local_irq_restore(flags); } } while (0); return res; }
static inline __attribute__((always_inline)) unsigned int set_c0_cause(unsigned int set) { unsigned int res; unsigned int new; unsigned int omt; unsigned long flags; do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); __asm__ __volatile__( "raw_local_irq_save\t%0" : "=r" (flags) : : "memory"); do { } while (0); } while (0); omt = __dmt(); res = ({ int __res; if (0 == 0) __asm__ __volatile__( "mfc0\t%0, " "$13" "\n\t" : "=r" (__res)); else __asm__ __volatile__( ".set\tmips32\n\t" "mfc0\t%0, " "$13" ", " "0" "\n\t" ".set\tmips0\n\t" : "=r" (__res)); __res; }); new = res | set; do { if (0 == 0) __asm__ __volatile__( "mtc0\t%z0, " "$13" "\n\t" : : "Jr" ((unsigned int)(new))); else __asm__ __volatile__( ".set\tmips32\n\t" "mtc0\t%z0, " "$13" ", " "0" "\n\t" ".set\tmips0" : : "Jr" ((unsigned int)(new))); } while (0); __emt(omt); do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); if (raw_irqs_disabled_flags(flags)) { raw_local_irq_restore(flags); do { } while (0); } else { do { } while (0); raw_local_irq_restore(flags); } } while (0); return res; } static inline __attribute__((always_inline)) unsigned int clear_c0_cause(unsigned int clear) { unsigned int res; unsigned int new; unsigned int omt; unsigned long flags; do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); __asm__ __volatile__( "raw_local_irq_save\t%0" : "=r" (flags) : : "memory"); do { } while (0); } while (0); omt = __dmt(); res = ({ int __res; if (0 == 0) __asm__ __volatile__( "mfc0\t%0, " "$13" "\n\t" : "=r" (__res)); else __asm__ __volatile__( ".set\tmips32\n\t" "mfc0\t%0, " "$13" ", " "0" "\n\t" ".set\tmips0\n\t" : "=r" (__res)); __res; }); new = res & ~clear; do { if (0 == 0) __asm__ __volatile__( "mtc0\t%z0, " "$13" "\n\t" : : "Jr" ((unsigned int)(new))); else __asm__ __volatile__( ".set\tmips32\n\t" "mtc0\t%z0, " "$13" ", " "0" "\n\t" ".set\tmips0" : : "Jr" ((unsigned int)(new))); } while (0); __emt(omt); do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); if (raw_irqs_disabled_flags(flags)) { raw_local_irq_restore(flags); do { } while (0); } else { do { } while (0); raw_local_irq_restore(flags); } } while (0); return res; } static inline __attribute__((always_inline)) unsigned int change_c0_cause(unsigned int change, unsigned int newbits) { unsigned int res; unsigned int new; unsigned int omt; unsigned long flags; do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); __asm__ __volatile__( "raw_local_irq_save\t%0" : "=r" (flags) : : "memory"); do { } while (0); } while (0); omt = __dmt(); res = ({ int __res; if (0 == 0) __asm__ __volatile__( "mfc0\t%0, " "$13" "\n\t" : "=r" (__res)); else __asm__ __volatile__( ".set\tmips32\n\t" "mfc0\t%0, " "$13" ", " "0" "\n\t" ".set\tmips0\n\t" : "=r" (__res)); __res; }); new = res & ~change; new |= (newbits & change); do { if (0 == 0) __asm__ __volatile__( "mtc0\t%z0, " "$13" "\n\t" : : "Jr" ((unsigned int)(new))); else __asm__ __volatile__( ".set\tmips32\n\t" "mtc0\t%z0, " "$13" ", " "0" "\n\t" ".set\tmips0" : : "Jr" ((unsigned int)(new))); } while (0); __emt(omt); do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); if (raw_irqs_disabled_flags(flags)) { raw_local_irq_restore(flags); do { } while (0); } else { do { } while (0); raw_local_irq_restore(flags); } } while (0); return res; }
static inline __attribute__((always_inline)) unsigned int set_c0_config(unsigned int set) { unsigned int res; unsigned int new; unsigned int omt; unsigned long flags; do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); __asm__ __volatile__( "raw_local_irq_save\t%0" : "=r" (flags) : : "memory"); do { } while (0); } while (0); omt = __dmt(); res = ({ int __res; if (0 == 0) __asm__ __volatile__( "mfc0\t%0, " "$16" "\n\t" : "=r" (__res)); else __asm__ __volatile__( ".set\tmips32\n\t" "mfc0\t%0, " "$16" ", " "0" "\n\t" ".set\tmips0\n\t" : "=r" (__res)); __res; }); new = res | set; do { if (0 == 0) __asm__ __volatile__( "mtc0\t%z0, " "$16" "\n\t" : : "Jr" ((unsigned int)(new))); else __asm__ __volatile__( ".set\tmips32\n\t" "mtc0\t%z0, " "$16" ", " "0" "\n\t" ".set\tmips0" : : "Jr" ((unsigned int)(new))); } while (0); __emt(omt); do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); if (raw_irqs_disabled_flags(flags)) { raw_local_irq_restore(flags); do { } while (0); } else { do { } while (0); raw_local_irq_restore(flags); } } while (0); return res; } static inline __attribute__((always_inline)) unsigned int clear_c0_config(unsigned int clear) { unsigned int res; unsigned int new; unsigned int omt; unsigned long flags; do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); __asm__ __volatile__( "raw_local_irq_save\t%0" : "=r" (flags) : : "memory"); do { } while (0); } while (0); omt = __dmt(); res = ({ int __res; if (0 == 0) __asm__ __volatile__( "mfc0\t%0, " "$16" "\n\t" : "=r" (__res)); else __asm__ __volatile__( ".set\tmips32\n\t" "mfc0\t%0, " "$16" ", " "0" "\n\t" ".set\tmips0\n\t" : "=r" (__res)); __res; }); new = res & ~clear; do { if (0 == 0) __asm__ __volatile__( "mtc0\t%z0, " "$16" "\n\t" : : "Jr" ((unsigned int)(new))); else __asm__ __volatile__( ".set\tmips32\n\t" "mtc0\t%z0, " "$16" ", " "0" "\n\t" ".set\tmips0" : : "Jr" ((unsigned int)(new))); } while (0); __emt(omt); do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); if (raw_irqs_disabled_flags(flags)) { raw_local_irq_restore(flags); do { } while (0); } else { do { } while (0); raw_local_irq_restore(flags); } } while (0); return res; } static inline __attribute__((always_inline)) unsigned int change_c0_config(unsigned int change, unsigned int newbits) { unsigned int res; unsigned int new; unsigned int omt; unsigned long flags; do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); __asm__ __volatile__( "raw_local_irq_save\t%0" : "=r" (flags) : : "memory"); do { } while (0); } while (0); omt = __dmt(); res = ({ int __res; if (0 == 0) __asm__ __volatile__( "mfc0\t%0, " "$16" "\n\t" : "=r" (__res)); else __asm__ __volatile__( ".set\tmips32\n\t" "mfc0\t%0, " "$16" ", " "0" "\n\t" ".set\tmips0\n\t" : "=r" (__res)); __res; }); new = res & ~change; new |= (newbits & change); do { if (0 == 0) __asm__ __volatile__( "mtc0\t%z0, " "$16" "\n\t" : : "Jr" ((unsigned int)(new))); else __asm__ __volatile__( ".set\tmips32\n\t" "mtc0\t%z0, " "$16" ", " "0" "\n\t" ".set\tmips0" : : "Jr" ((unsigned int)(new))); } while (0); __emt(omt); do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); if (raw_irqs_disabled_flags(flags)) { raw_local_irq_restore(flags); do { } while (0); } else { do { } while (0); raw_local_irq_restore(flags); } } while (0); return res; }
static inline __attribute__((always_inline)) unsigned int set_c0_intcontrol(unsigned int set) { unsigned int res; unsigned int new; unsigned int omt; unsigned long flags; do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); __asm__ __volatile__( "raw_local_irq_save\t%0" : "=r" (flags) : : "memory"); do { } while (0); } while (0); omt = __dmt(); res = ({ int __res; __asm__ __volatile__( "cfc0\t%0, " "$20" "\n\t" : "=r" (__res)); __res; }); new = res | set; do { __asm__ __volatile__( "ctc0\t%z0, " "$20" "\n\t" : : "Jr" ((unsigned int)(new))); } while (0); __emt(omt); do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); if (raw_irqs_disabled_flags(flags)) { raw_local_irq_restore(flags); do { } while (0); } else { do { } while (0); raw_local_irq_restore(flags); } } while (0); return res; } static inline __attribute__((always_inline)) unsigned int clear_c0_intcontrol(unsigned int clear) { unsigned int res; unsigned int new; unsigned int omt; unsigned long flags; do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); __asm__ __volatile__( "raw_local_irq_save\t%0" : "=r" (flags) : : "memory"); do { } while (0); } while (0); omt = __dmt(); res = ({ int __res; __asm__ __volatile__( "cfc0\t%0, " "$20" "\n\t" : "=r" (__res)); __res; }); new = res & ~clear; do { __asm__ __volatile__( "ctc0\t%z0, " "$20" "\n\t" : : "Jr" ((unsigned int)(new))); } while (0); __emt(omt); do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); if (raw_irqs_disabled_flags(flags)) { raw_local_irq_restore(flags); do { } while (0); } else { do { } while (0); raw_local_irq_restore(flags); } } while (0); return res; } static inline __attribute__((always_inline)) unsigned int change_c0_intcontrol(unsigned int change, unsigned int newbits) { unsigned int res; unsigned int new; unsigned int omt; unsigned long flags; do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); __asm__ __volatile__( "raw_local_irq_save\t%0" : "=r" (flags) : : "memory"); do { } while (0); } while (0); omt = __dmt(); res = ({ int __res; __asm__ __volatile__( "cfc0\t%0, " "$20" "\n\t" : "=r" (__res)); __res; }); new = res & ~change; new |= (newbits & change); do { __asm__ __volatile__( "ctc0\t%z0, " "$20" "\n\t" : : "Jr" ((unsigned int)(new))); } while (0); __emt(omt); do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); if (raw_irqs_disabled_flags(flags)) { raw_local_irq_restore(flags); do { } while (0); } else { do { } while (0); raw_local_irq_restore(flags); } } while (0); return res; }
static inline __attribute__((always_inline)) unsigned int set_c0_intctl(unsigned int set) { unsigned int res; unsigned int new; unsigned int omt; unsigned long flags; do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); __asm__ __volatile__( "raw_local_irq_save\t%0" : "=r" (flags) : : "memory"); do { } while (0); } while (0); omt = __dmt(); res = ({ int __res; if (1 == 0) __asm__ __volatile__( "mfc0\t%0, " "$12" "\n\t" : "=r" (__res)); else __asm__ __volatile__( ".set\tmips32\n\t" "mfc0\t%0, " "$12" ", " "1" "\n\t" ".set\tmips0\n\t" : "=r" (__res)); __res; }); new = res | set; do { if (1 == 0) __asm__ __volatile__( "mtc0\t%z0, " "$12" "\n\t" : : "Jr" ((unsigned int)(new))); else __asm__ __volatile__( ".set\tmips32\n\t" "mtc0\t%z0, " "$12" ", " "1" "\n\t" ".set\tmips0" : : "Jr" ((unsigned int)(new))); } while (0); __emt(omt); do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); if (raw_irqs_disabled_flags(flags)) { raw_local_irq_restore(flags); do { } while (0); } else { do { } while (0); raw_local_irq_restore(flags); } } while (0); return res; } static inline __attribute__((always_inline)) unsigned int clear_c0_intctl(unsigned int clear) { unsigned int res; unsigned int new; unsigned int omt; unsigned long flags; do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); __asm__ __volatile__( "raw_local_irq_save\t%0" : "=r" (flags) : : "memory"); do { } while (0); } while (0); omt = __dmt(); res = ({ int __res; if (1 == 0) __asm__ __volatile__( "mfc0\t%0, " "$12" "\n\t" : "=r" (__res)); else __asm__ __volatile__( ".set\tmips32\n\t" "mfc0\t%0, " "$12" ", " "1" "\n\t" ".set\tmips0\n\t" : "=r" (__res)); __res; }); new = res & ~clear; do { if (1 == 0) __asm__ __volatile__( "mtc0\t%z0, " "$12" "\n\t" : : "Jr" ((unsigned int)(new))); else __asm__ __volatile__( ".set\tmips32\n\t" "mtc0\t%z0, " "$12" ", " "1" "\n\t" ".set\tmips0" : : "Jr" ((unsigned int)(new))); } while (0); __emt(omt); do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); if (raw_irqs_disabled_flags(flags)) { raw_local_irq_restore(flags); do { } while (0); } else { do { } while (0); raw_local_irq_restore(flags); } } while (0); return res; } static inline __attribute__((always_inline)) unsigned int change_c0_intctl(unsigned int change, unsigned int newbits) { unsigned int res; unsigned int new; unsigned int omt; unsigned long flags; do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); __asm__ __volatile__( "raw_local_irq_save\t%0" : "=r" (flags) : : "memory"); do { } while (0); } while (0); omt = __dmt(); res = ({ int __res; if (1 == 0) __asm__ __volatile__( "mfc0\t%0, " "$12" "\n\t" : "=r" (__res)); else __asm__ __volatile__( ".set\tmips32\n\t" "mfc0\t%0, " "$12" ", " "1" "\n\t" ".set\tmips0\n\t" : "=r" (__res)); __res; }); new = res & ~change; new |= (newbits & change); do { if (1 == 0) __asm__ __volatile__( "mtc0\t%z0, " "$12" "\n\t" : : "Jr" ((unsigned int)(new))); else __asm__ __volatile__( ".set\tmips32\n\t" "mtc0\t%z0, " "$12" ", " "1" "\n\t" ".set\tmips0" : : "Jr" ((unsigned int)(new))); } while (0); __emt(omt); do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); if (raw_irqs_disabled_flags(flags)) { raw_local_irq_restore(flags); do { } while (0); } else { do { } while (0); raw_local_irq_restore(flags); } } while (0); return res; }
static inline __attribute__((always_inline)) unsigned int set_c0_srsmap(unsigned int set) { unsigned int res; unsigned int new; unsigned int omt; unsigned long flags; do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); __asm__ __volatile__( "raw_local_irq_save\t%0" : "=r" (flags) : : "memory"); do { } while (0); } while (0); omt = __dmt(); res = ({ int __res; if (3 == 0) __asm__ __volatile__( "mfc0\t%0, " "$12" "\n\t" : "=r" (__res)); else __asm__ __volatile__( ".set\tmips32\n\t" "mfc0\t%0, " "$12" ", " "3" "\n\t" ".set\tmips0\n\t" : "=r" (__res)); __res; }); new = res | set; do { if (3 == 0) __asm__ __volatile__( "mtc0\t%z0, " "$12" "\n\t" : : "Jr" ((unsigned int)(new))); else __asm__ __volatile__( ".set\tmips32\n\t" "mtc0\t%z0, " "$12" ", " "3" "\n\t" ".set\tmips0" : : "Jr" ((unsigned int)(new))); } while (0); __emt(omt); do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); if (raw_irqs_disabled_flags(flags)) { raw_local_irq_restore(flags); do { } while (0); } else { do { } while (0); raw_local_irq_restore(flags); } } while (0); return res; } static inline __attribute__((always_inline)) unsigned int clear_c0_srsmap(unsigned int clear) { unsigned int res; unsigned int new; unsigned int omt; unsigned long flags; do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); __asm__ __volatile__( "raw_local_irq_save\t%0" : "=r" (flags) : : "memory"); do { } while (0); } while (0); omt = __dmt(); res = ({ int __res; if (3 == 0) __asm__ __volatile__( "mfc0\t%0, " "$12" "\n\t" : "=r" (__res)); else __asm__ __volatile__( ".set\tmips32\n\t" "mfc0\t%0, " "$12" ", " "3" "\n\t" ".set\tmips0\n\t" : "=r" (__res)); __res; }); new = res & ~clear; do { if (3 == 0) __asm__ __volatile__( "mtc0\t%z0, " "$12" "\n\t" : : "Jr" ((unsigned int)(new))); else __asm__ __volatile__( ".set\tmips32\n\t" "mtc0\t%z0, " "$12" ", " "3" "\n\t" ".set\tmips0" : : "Jr" ((unsigned int)(new))); } while (0); __emt(omt); do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); if (raw_irqs_disabled_flags(flags)) { raw_local_irq_restore(flags); do { } while (0); } else { do { } while (0); raw_local_irq_restore(flags); } } while (0); return res; } static inline __attribute__((always_inline)) unsigned int change_c0_srsmap(unsigned int change, unsigned int newbits) { unsigned int res; unsigned int new; unsigned int omt; unsigned long flags; do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); __asm__ __volatile__( "raw_local_irq_save\t%0" : "=r" (flags) : : "memory"); do { } while (0); } while (0); omt = __dmt(); res = ({ int __res; if (3 == 0) __asm__ __volatile__( "mfc0\t%0, " "$12" "\n\t" : "=r" (__res)); else __asm__ __volatile__( ".set\tmips32\n\t" "mfc0\t%0, " "$12" ", " "3" "\n\t" ".set\tmips0\n\t" : "=r" (__res)); __res; }); new = res & ~change; new |= (newbits & change); do { if (3 == 0) __asm__ __volatile__( "mtc0\t%z0, " "$12" "\n\t" : : "Jr" ((unsigned int)(new))); else __asm__ __volatile__( ".set\tmips32\n\t" "mtc0\t%z0, " "$12" ", " "3" "\n\t" ".set\tmips0" : : "Jr" ((unsigned int)(new))); } while (0); __emt(omt); do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); if (raw_irqs_disabled_flags(flags)) { raw_local_irq_restore(flags); do { } while (0); } else { do { } while (0); raw_local_irq_restore(flags); } } while (0); return res; }
# 21 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/processor.h" 2
# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/prefetch.h" 1
# 22 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/processor.h" 2
# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/system.h" 1
# 19 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/system.h"
# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/addrspace.h" 1
# 13 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/addrspace.h"
# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/mach-generic/spaces.h" 1
# 13 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/mach-generic/spaces.h"
# 1 "include/linux/const.h" 1
# 14 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/mach-generic/spaces.h" 2
# 14 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/addrspace.h" 2
# 20 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/system.h" 2

# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/cmpxchg.h" 1
# 73 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/cmpxchg.h"
extern void __cmpxchg_called_with_bad_pointer(void);
# 120 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/cmpxchg.h"
# 1 "include/asm-generic/cmpxchg-local.h" 1





extern unsigned long wrong_size_cmpxchg(volatile void *ptr);





static inline __attribute__((always_inline)) unsigned long __cmpxchg_local_generic(volatile void *ptr,
  unsigned long old, unsigned long new, int size)
{
 unsigned long flags, prev;




 if (size == 8 && sizeof(unsigned long) != 8)
  wrong_size_cmpxchg(ptr);

 do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); __asm__ __volatile__( "raw_local_irq_save\t%0" : "=r" (flags) : : "memory"); do { } while (0); } while (0);
 switch (size) {
 case 1: prev = *(u8 *)ptr;
  if (prev == old)
   *(u8 *)ptr = (u8)new;
  break;
 case 2: prev = *(u16 *)ptr;
  if (prev == old)
   *(u16 *)ptr = (u16)new;
  break;
 case 4: prev = *(u32 *)ptr;
  if (prev == old)
   *(u32 *)ptr = (u32)new;
  break;
 case 8: prev = *(u64 *)ptr;
  if (prev == old)
   *(u64 *)ptr = (u64)new;
  break;
 default:
  wrong_size_cmpxchg(ptr);
 }
 do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); if (raw_irqs_disabled_flags(flags)) { raw_local_irq_restore(flags); do { } while (0); } else { do { } while (0); raw_local_irq_restore(flags); } } while (0);
 return prev;
}




static inline __attribute__((always_inline)) u64 __cmpxchg64_local_generic(volatile void *ptr,
  u64 old, u64 new)
{
 u64 prev;
 unsigned long flags;

 do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); __asm__ __volatile__( "raw_local_irq_save\t%0" : "=r" (flags) : : "memory"); do { } while (0); } while (0);
 prev = *(u64 *)ptr;
 if (prev == old)
  *(u64 *)ptr = new;
 do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); if (raw_irqs_disabled_flags(flags)) { raw_local_irq_restore(flags); do { } while (0); } else { do { } while (0); raw_local_irq_restore(flags); } } while (0);
 return prev;
}
# 121 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/cmpxchg.h" 2
# 22 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/system.h" 2

# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/dsp.h" 1
# 26 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/dsp.h"
static inline __attribute__((always_inline)) void __init_dsp(void)
{
 do { __asm__ __volatile__( "	.set	push					\n" "	.set	noat					\n" "	move	$1, %0					\n" "	# mthi	$1, $ac1				\n" "	.word	0x00200811				\n" "	.set	pop					\n" : : "r" (0)); } while (0);
 do { __asm__ __volatile__( "	.set	push					\n" "	.set	noat					\n" "	move	$1, %0					\n" "	# mtlo	$1, $ac1				\n" "	.word	0x00200813				\n" "	.set	pop					\n" : : "r" (0)); } while (0);
 do { __asm__ __volatile__( "	.set	push					\n" "	.set	noat					\n" "	move	$1, %0					\n" "	# mthi	$1, $ac2				\n" "	.word	0x00201011				\n" "	.set	pop					\n" : : "r" (0)); } while (0);
 do { __asm__ __volatile__( "	.set	push					\n" "	.set	noat					\n" "	move	$1, %0					\n" "	# mtlo	$1, $ac2				\n" "	.word	0x00201013				\n" "	.set	pop					\n" : : "r" (0)); } while (0);
 do { __asm__ __volatile__( "	.set	push					\n" "	.set	noat					\n" "	move	$1, %0					\n" "	# mthi	$1, $ac3				\n" "	.word	0x00201811				\n" "	.set	pop					\n" : : "r" (0)); } while (0);
 do { __asm__ __volatile__( "	.set	push					\n" "	.set	noat					\n" "	move	$1, %0					\n" "	# mtlo	$1, $ac3				\n" "	.word	0x00201813				\n" "	.set	pop					\n" : : "r" (0)); } while (0);
 do { __asm__ __volatile__( "	.set	push					\n" "	.set	noat					\n" "	move	$1, %0					\n" "	# wrdsp $1, %x1					\n" "	.word	0x7c2004f8 | (%x1 << 11)		\n" "	.set	pop					\n" : : "r" (0x00000000), "i" (0x3ff)); } while (0);
}

static inline __attribute__((always_inline)) void init_dsp(void)
{
 if ((cpu_data[0].ases & 0x00000010))
  __init_dsp();
}
# 24 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/system.h" 2
# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/watch.h" 1
# 15 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/watch.h"
void mips_install_watch_registers(void);
void mips_read_watch_registers(void);
void mips_clear_watch_registers(void);
void mips_probe_watch_registers(struct cpuinfo_mips *c);
# 25 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/system.h" 2







extern void *resume(void *last, void *next, void *next_ti);

struct task_struct;

extern unsigned int ll_bit;
extern struct task_struct *ll_task;
# 94 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/system.h"
static inline __attribute__((always_inline)) unsigned long __xchg_u32(volatile int * m, unsigned int val)
{
 __u32 retval;

 __asm__ __volatile__("		\n" : : :"memory");

 if (1 && 0) {
  unsigned long dummy;

  __asm__ __volatile__(
  "	.set	mips3					\n"
  "1:	ll	%0, %3			# xchg_u32	\n"
  "	.set	mips0					\n"
  "	move	%2, %z4					\n"
  "	.set	mips3					\n"
  "	sc	%2, %1					\n"
  "	beqzl	%2, 1b					\n"
  "	.set	mips0					\n"
  : "=&r" (retval), "=m" (*m), "=&r" (dummy)
  : "R" (*m), "Jr" (val)
  : "memory");
 } else if (1) {
  unsigned long dummy;

  __asm__ __volatile__(
  "	.set	mips3					\n"
  "1:	ll	%0, %3			# xchg_u32	\n"
  "	.set	mips0					\n"
  "	move	%2, %z4					\n"
  "	.set	mips3					\n"
  "	sc	%2, %1					\n"
  "	beqz	%2, 2f					\n"
  "	.subsection 2					\n"
  "2:	b	1b					\n"
  "	.previous					\n"
  "	.set	mips0					\n"
  : "=&r" (retval), "=m" (*m), "=&r" (dummy)
  : "R" (*m), "Jr" (val)
  : "memory");
 } else {
  unsigned long flags;

  __asm__ __volatile__( "raw_local_irq_save\t%0" : "=r" (flags) : : "memory");
  retval = *m;
  *m = val;
  raw_local_irq_restore(flags);
 }

 __asm__ __volatile__("		\n" : : :"memory");

 return retval;
}
# 197 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/system.h"
extern __u64 __xchg_u64_unsupported_on_32bit_kernels(volatile __u64 * m, __u64 val);



static inline __attribute__((always_inline)) unsigned long __xchg(unsigned long x, volatile void * ptr, int size)
{
 switch (size) {
 case 4:
  return __xchg_u32(ptr, x);
 case 8:
  return __xchg_u64_unsupported_on_32bit_kernels(ptr, x);
 }

 return x;
}
# 221 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/system.h"
extern void set_handler(unsigned long offset, void *addr, unsigned long len);
extern void set_uncached_handler(unsigned long offset, void *addr, unsigned long len);

typedef void (*vi_handler_t)(void);
extern void *set_vi_handler(int n, vi_handler_t addr);

extern void *set_except_vector(int n, void *addr);
extern unsigned long ebase;
extern void per_cpu_trap_init(void);







extern unsigned long arch_align_stack(unsigned long sp);
# 23 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/processor.h" 2
# 32 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/processor.h"
extern void (*cpu_wait)(void);

extern unsigned int vced_count, vcei_count;
# 99 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/processor.h"
typedef __u64 fpureg_t;
# 108 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/processor.h"
struct mips_fpu_struct {
 fpureg_t fpr[32];
 unsigned int fcr31;
};



typedef __u32 dspreg_t;

struct mips_dsp_state {
 dspreg_t dspr[6];
 unsigned int dspcontrol;
};





struct mips3264_watch_reg_state {



 unsigned long watchlo[4];

 u16 watchhi[4];
};

union mips_watch_reg_state {
 struct mips3264_watch_reg_state mips3264;
};
# 193 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/processor.h"
typedef struct {
 unsigned long seg;
} mm_segment_t;



struct mips_abi;




struct thread_struct {

 unsigned long reg16;
 unsigned long reg17, reg18, reg19, reg20, reg21, reg22, reg23;
 unsigned long reg29, reg30, reg31;


 unsigned long cp0_status;


 struct mips_fpu_struct fpu;


 unsigned long emulated_fp;

 cpumask_t user_cpus_allowed;



 struct mips_dsp_state dsp;


 union mips_watch_reg_state watch;


 unsigned long cp0_badvaddr;
 unsigned long cp0_baduaddr;
 unsigned long error_code;
 unsigned long irix_trampoline;
 unsigned long irix_oldctx;




 struct mips_abi *abi;
};
# 311 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/processor.h"
struct task_struct;







extern long kernel_thread(int (*fn)(void *), void * arg, unsigned long flags);

extern unsigned long thread_saved_pc(struct task_struct *tsk);




extern void start_thread(struct pt_regs * regs, unsigned long pc, unsigned long sp);

unsigned long get_wchan(struct task_struct *p);
# 15 "include/linux/prefetch.h" 2
# 53 "include/linux/prefetch.h"
static inline __attribute__((always_inline)) void prefetch_range(void *addr, size_t len)
{

 char *cp;
 char *end = addr + len;

 for (cp = addr; cp < end; cp += (4*(1 << 5)))
  __builtin_prefetch((cp), 0, 1);

}
# 8 "include/linux/list.h" 2
# 25 "include/linux/list.h"
static inline __attribute__((always_inline)) void INIT_LIST_HEAD(struct list_head *list)
{
 list->next = list;
 list->prev = list;
}
# 38 "include/linux/list.h"
static inline __attribute__((always_inline)) void __list_add(struct list_head *new,
         struct list_head *prev,
         struct list_head *next)
{
 next->prev = new;
 new->next = next;
 new->prev = prev;
 prev->next = new;
}
# 61 "include/linux/list.h"
static inline __attribute__((always_inline)) void list_add(struct list_head *new, struct list_head *head)
{
 __list_add(new, head, head->next);
}
# 75 "include/linux/list.h"
static inline __attribute__((always_inline)) void list_add_tail(struct list_head *new, struct list_head *head)
{
 __list_add(new, head->prev, head);
}
# 87 "include/linux/list.h"
static inline __attribute__((always_inline)) void __list_del(struct list_head * prev, struct list_head * next)
{
 next->prev = prev;
 prev->next = next;
}
# 100 "include/linux/list.h"
static inline __attribute__((always_inline)) void list_del(struct list_head *entry)
{
 __list_del(entry->prev, entry->next);
 entry->next = ((void *) 0x00100100 + 0);
 entry->prev = ((void *) 0x00200200 + 0);
}
# 117 "include/linux/list.h"
static inline __attribute__((always_inline)) void list_replace(struct list_head *old,
    struct list_head *new)
{
 new->next = old->next;
 new->next->prev = new;
 new->prev = old->prev;
 new->prev->next = new;
}

static inline __attribute__((always_inline)) void list_replace_init(struct list_head *old,
     struct list_head *new)
{
 list_replace(old, new);
 INIT_LIST_HEAD(old);
}





static inline __attribute__((always_inline)) void list_del_init(struct list_head *entry)
{
 __list_del(entry->prev, entry->next);
 INIT_LIST_HEAD(entry);
}






static inline __attribute__((always_inline)) void list_move(struct list_head *list, struct list_head *head)
{
 __list_del(list->prev, list->next);
 list_add(list, head);
}






static inline __attribute__((always_inline)) void list_move_tail(struct list_head *list,
      struct list_head *head)
{
 __list_del(list->prev, list->next);
 list_add_tail(list, head);
}






static inline __attribute__((always_inline)) int list_is_last(const struct list_head *list,
    const struct list_head *head)
{
 return list->next == head;
}





static inline __attribute__((always_inline)) int list_empty(const struct list_head *head)
{
 return head->next == head;
}
# 199 "include/linux/list.h"
static inline __attribute__((always_inline)) int list_empty_careful(const struct list_head *head)
{
 struct list_head *next = head->next;
 return (next == head) && (next == head->prev);
}





static inline __attribute__((always_inline)) void list_rotate_left(struct list_head *head)
{
 struct list_head *first;

 if (!list_empty(head)) {
  first = head->next;
  list_move_tail(first, head);
 }
}





static inline __attribute__((always_inline)) int list_is_singular(const struct list_head *head)
{
 return !list_empty(head) && (head->next == head->prev);
}

static inline __attribute__((always_inline)) void __list_cut_position(struct list_head *list,
  struct list_head *head, struct list_head *entry)
{
 struct list_head *new_first = entry->next;
 list->next = head->next;
 list->next->prev = list;
 list->prev = entry;
 entry->next = list;
 head->next = new_first;
 new_first->prev = head;
}
# 254 "include/linux/list.h"
static inline __attribute__((always_inline)) void list_cut_position(struct list_head *list,
  struct list_head *head, struct list_head *entry)
{
 if (list_empty(head))
  return;
 if (list_is_singular(head) &&
  (head->next != entry && head != entry))
  return;
 if (entry == head)
  INIT_LIST_HEAD(list);
 else
  __list_cut_position(list, head, entry);
}

static inline __attribute__((always_inline)) void __list_splice(const struct list_head *list,
     struct list_head *prev,
     struct list_head *next)
{
 struct list_head *first = list->next;
 struct list_head *last = list->prev;

 first->prev = prev;
 prev->next = first;

 last->next = next;
 next->prev = last;
}






static inline __attribute__((always_inline)) void list_splice(const struct list_head *list,
    struct list_head *head)
{
 if (!list_empty(list))
  __list_splice(list, head, head->next);
}






static inline __attribute__((always_inline)) void list_splice_tail(struct list_head *list,
    struct list_head *head)
{
 if (!list_empty(list))
  __list_splice(list, head->prev, head);
}
# 313 "include/linux/list.h"
static inline __attribute__((always_inline)) void list_splice_init(struct list_head *list,
        struct list_head *head)
{
 if (!list_empty(list)) {
  __list_splice(list, head, head->next);
  INIT_LIST_HEAD(list);
 }
}
# 330 "include/linux/list.h"
static inline __attribute__((always_inline)) void list_splice_tail_init(struct list_head *list,
      struct list_head *head)
{
 if (!list_empty(list)) {
  __list_splice(list, head->prev, head);
  INIT_LIST_HEAD(list);
 }
}
# 569 "include/linux/list.h"
static inline __attribute__((always_inline)) void INIT_HLIST_NODE(struct hlist_node *h)
{
 h->next = ((void *)0);
 h->pprev = ((void *)0);
}

static inline __attribute__((always_inline)) int hlist_unhashed(const struct hlist_node *h)
{
 return !h->pprev;
}

static inline __attribute__((always_inline)) int hlist_empty(const struct hlist_head *h)
{
 return !h->first;
}

static inline __attribute__((always_inline)) void __hlist_del(struct hlist_node *n)
{
 struct hlist_node *next = n->next;
 struct hlist_node **pprev = n->pprev;
 *pprev = next;
 if (next)
  next->pprev = pprev;
}

static inline __attribute__((always_inline)) void hlist_del(struct hlist_node *n)
{
 __hlist_del(n);
 n->next = ((void *) 0x00100100 + 0);
 n->pprev = ((void *) 0x00200200 + 0);
}

static inline __attribute__((always_inline)) void hlist_del_init(struct hlist_node *n)
{
 if (!hlist_unhashed(n)) {
  __hlist_del(n);
  INIT_HLIST_NODE(n);
 }
}

static inline __attribute__((always_inline)) void hlist_add_head(struct hlist_node *n, struct hlist_head *h)
{
 struct hlist_node *first = h->first;
 n->next = first;
 if (first)
  first->pprev = &n->next;
 h->first = n;
 n->pprev = &h->first;
}


static inline __attribute__((always_inline)) void hlist_add_before(struct hlist_node *n,
     struct hlist_node *next)
{
 n->pprev = next->pprev;
 n->next = next;
 next->pprev = &n->next;
 *(n->pprev) = n;
}

static inline __attribute__((always_inline)) void hlist_add_after(struct hlist_node *n,
     struct hlist_node *next)
{
 next->next = n->next;
 n->next = next;
 next->pprev = &n->next;

 if(next->next)
  next->next->pprev = &next->next;
}





static inline __attribute__((always_inline)) void hlist_move_list(struct hlist_head *old,
       struct hlist_head *new)
{
 new->first = old->first;
 if (new->first)
  new->first->pprev = &new->first;
 old->first = ((void *)0);
}
# 10 "include/linux/module.h" 2
# 1 "include/linux/stat.h" 1





# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/stat.h" 1
# 18 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/stat.h"
struct stat {
 unsigned st_dev;
 long st_pad1[3];
 ino_t st_ino;
 mode_t st_mode;
 nlink_t st_nlink;
 uid_t st_uid;
 gid_t st_gid;
 unsigned st_rdev;
 long st_pad2[2];
 off_t st_size;
 long st_pad3;




 time_t st_atime;
 long st_atime_nsec;
 time_t st_mtime;
 long st_mtime_nsec;
 time_t st_ctime;
 long st_ctime_nsec;
 long st_blksize;
 long st_blocks;
 long st_pad4[14];
};







struct stat64 {
 unsigned long st_dev;
 unsigned long st_pad0[3];

 unsigned long long st_ino;

 mode_t st_mode;
 nlink_t st_nlink;

 uid_t st_uid;
 gid_t st_gid;

 unsigned long st_rdev;
 unsigned long st_pad1[3];

 long long st_size;





 time_t st_atime;
 unsigned long st_atime_nsec;

 time_t st_mtime;
 unsigned long st_mtime_nsec;

 time_t st_ctime;
 unsigned long st_ctime_nsec;

 unsigned long st_blksize;
 unsigned long st_pad2;

 long long st_blocks;
};
# 7 "include/linux/stat.h" 2
# 60 "include/linux/stat.h"
# 1 "include/linux/time.h" 1






# 1 "include/linux/cache.h" 1
# 8 "include/linux/time.h" 2
# 1 "include/linux/seqlock.h" 1
# 29 "include/linux/seqlock.h"
# 1 "include/linux/spinlock.h" 1
# 50 "include/linux/spinlock.h"
# 1 "include/linux/preempt.h" 1
# 9 "include/linux/preempt.h"
# 1 "include/linux/thread_info.h" 1
# 12 "include/linux/thread_info.h"
struct timespec;
struct compat_timespec;




struct restart_block {
 long (*fn)(struct restart_block *);
 union {
  struct {
   unsigned long arg0, arg1, arg2, arg3;
  };

  struct {
   u32 *uaddr;
   u32 val;
   u32 flags;
   u32 bitset;
   u64 time;
   u32 *uaddr2;
  } futex;

  struct {
   clockid_t index;
   struct timespec *rmtp;



   u64 expires;
  } nanosleep;

  struct {
   struct pollfd *ufds;
   int nfds;
   int has_timeout;
   unsigned long tv_sec;
   unsigned long tv_nsec;
  } poll;
 };
};

extern long do_no_restart_syscall(struct restart_block *parm);


# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/thread_info.h" 1
# 24 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/thread_info.h"
struct thread_info {
 struct task_struct *task;
 struct exec_domain *exec_domain;
 unsigned long flags;
 unsigned long tp_value;
 __u32 cpu;
 int preempt_count;

 mm_segment_t addr_limit;



 struct restart_block restart_block;
 struct pt_regs *regs;
};
# 60 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/thread_info.h"
register struct thread_info *__current_thread_info __asm__("$28");
# 57 "include/linux/thread_info.h" 2
# 65 "include/linux/thread_info.h"
static inline __attribute__((always_inline)) void set_ti_thread_flag(struct thread_info *ti, int flag)
{
 set_bit(flag, (unsigned long *)&ti->flags);
}

static inline __attribute__((always_inline)) void clear_ti_thread_flag(struct thread_info *ti, int flag)
{
 clear_bit(flag, (unsigned long *)&ti->flags);
}

static inline __attribute__((always_inline)) int test_and_set_ti_thread_flag(struct thread_info *ti, int flag)
{
 return test_and_set_bit(flag, (unsigned long *)&ti->flags);
}

static inline __attribute__((always_inline)) int test_and_clear_ti_thread_flag(struct thread_info *ti, int flag)
{
 return test_and_clear_bit(flag, (unsigned long *)&ti->flags);
}

static inline __attribute__((always_inline)) int test_ti_thread_flag(struct thread_info *ti, int flag)
{
 return test_bit(flag, (unsigned long *)&ti->flags);
}
# 122 "include/linux/thread_info.h"
static inline __attribute__((always_inline)) void set_restore_sigmask(void)
{
 set_ti_thread_flag(__current_thread_info, 9);
 set_ti_thread_flag(__current_thread_info, 1);
}
# 10 "include/linux/preempt.h" 2
# 51 "include/linux/spinlock.h" 2




# 1 "include/linux/stringify.h" 1
# 56 "include/linux/spinlock.h" 2
# 1 "include/linux/bottom_half.h" 1



extern void local_bh_disable(void);
extern void _local_bh_enable(void);
extern void local_bh_enable(void);
extern void local_bh_enable_ip(unsigned long ip);
# 57 "include/linux/spinlock.h" 2
# 80 "include/linux/spinlock.h"
# 1 "include/linux/spinlock_types.h" 1
# 13 "include/linux/spinlock_types.h"
# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/spinlock_types.h" 1
# 12 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/spinlock_types.h"
typedef union {




 u32 lock;
 struct {

  u16 ticket;
  u16 serving_now;




 } h;
} arch_spinlock_t;



typedef struct {
 volatile unsigned int lock;
} arch_rwlock_t;
# 14 "include/linux/spinlock_types.h" 2




# 1 "include/linux/lockdep.h" 1
# 12 "include/linux/lockdep.h"
struct task_struct;
struct lockdep_map;


extern int prove_locking;
extern int lock_stat;
# 337 "include/linux/lockdep.h"
static inline __attribute__((always_inline)) void lockdep_off(void)
{
}

static inline __attribute__((always_inline)) void lockdep_on(void)
{
}
# 378 "include/linux/lockdep.h"
struct lock_class_key { };
# 428 "include/linux/lockdep.h"
extern void early_init_irq_lock_class(void);
# 440 "include/linux/lockdep.h"
static inline __attribute__((always_inline)) void early_boot_irqs_off(void)
{
}
static inline __attribute__((always_inline)) void early_boot_irqs_on(void)
{
}
static inline __attribute__((always_inline)) void print_irqtrace_events(struct task_struct *curr)
{
}
# 19 "include/linux/spinlock_types.h" 2

typedef struct raw_spinlock {
 arch_spinlock_t raw_lock;
# 32 "include/linux/spinlock_types.h"
} raw_spinlock_t;
# 64 "include/linux/spinlock_types.h"
typedef struct spinlock {
 union {
  struct raw_spinlock rlock;
# 75 "include/linux/spinlock_types.h"
 };
} spinlock_t;
# 94 "include/linux/spinlock_types.h"
# 1 "include/linux/rwlock_types.h" 1
# 11 "include/linux/rwlock_types.h"
typedef struct {
 arch_rwlock_t raw_lock;
# 23 "include/linux/rwlock_types.h"
} rwlock_t;
# 95 "include/linux/spinlock_types.h" 2
# 81 "include/linux/spinlock.h" 2





# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/spinlock.h" 1
# 37 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/spinlock.h"
static inline __attribute__((always_inline)) int arch_spin_is_locked(arch_spinlock_t *lock)
{
 u32 counters = (*(volatile typeof(lock->lock) *)&(lock->lock));

 return ((counters >> 16) ^ counters) & 0xffff;
}





static inline __attribute__((always_inline)) int arch_spin_is_contended(arch_spinlock_t *lock)
{
 u32 counters = (*(volatile typeof(lock->lock) *)&(lock->lock));

 return (((counters >> 16) - counters) & 0xffff) > 1;
}


static inline __attribute__((always_inline)) void arch_spin_lock(arch_spinlock_t *lock)
{
 int my_ticket;
 int tmp;
 int inc = 0x10000;

 if (0) {
  __asm__ __volatile__ (
  "	.set push		# arch_spin_lock	\n"
  "	.set noreorder					\n"
  "							\n"
  "1:	ll	%[ticket], %[ticket_ptr]		\n"
  "	addu	%[my_ticket], %[ticket], %[inc]		\n"
  "	sc	%[my_ticket], %[ticket_ptr]		\n"
  "	beqzl	%[my_ticket], 1b			\n"
  "	 nop						\n"
  "	srl	%[my_ticket], %[ticket], 16		\n"
  "	andi	%[ticket], %[ticket], 0xffff		\n"
  "	andi	%[my_ticket], %[my_ticket], 0xffff	\n"
  "	bne	%[ticket], %[my_ticket], 4f		\n"
  "	 subu	%[ticket], %[my_ticket], %[ticket]	\n"
  "2:							\n"
  "	.subsection 2					\n"
  "4:	andi	%[ticket], %[ticket], 0xffff		\n"
  "	sll	%[ticket], 5				\n"
  "							\n"
  "6:	bnez	%[ticket], 6b				\n"
  "	 subu	%[ticket], 1				\n"
  "							\n"
  "	lhu	%[ticket], %[serving_now_ptr]		\n"
  "	beq	%[ticket], %[my_ticket], 2b		\n"
  "	 subu	%[ticket], %[my_ticket], %[ticket]	\n"
  "	b	4b					\n"
  "	 subu	%[ticket], %[ticket], 1			\n"
  "	.previous					\n"
  "	.set pop					\n"
  : [ticket_ptr] "+m" (lock->lock),
    [serving_now_ptr] "+m" (lock->h.serving_now),
    [ticket] "=&r" (tmp),
    [my_ticket] "=&r" (my_ticket)
  : [inc] "r" (inc));
 } else {
  __asm__ __volatile__ (
  "	.set push		# arch_spin_lock	\n"
  "	.set noreorder					\n"
  "							\n"
  "1:	ll	%[ticket], %[ticket_ptr]		\n"
  "	addu	%[my_ticket], %[ticket], %[inc]		\n"
  "	sc	%[my_ticket], %[ticket_ptr]		\n"
  "	beqz	%[my_ticket], 1b			\n"
  "	 srl	%[my_ticket], %[ticket], 16		\n"
  "	andi	%[ticket], %[ticket], 0xffff		\n"
  "	andi	%[my_ticket], %[my_ticket], 0xffff	\n"
  "	bne	%[ticket], %[my_ticket], 4f		\n"
  "	 subu	%[ticket], %[my_ticket], %[ticket]	\n"
  "2:							\n"
  "	.subsection 2					\n"
  "4:	andi	%[ticket], %[ticket], 0x1fff		\n"
  "	sll	%[ticket], 5				\n"
  "							\n"
  "6:	bnez	%[ticket], 6b				\n"
  "	 subu	%[ticket], 1				\n"
  "							\n"
  "	lhu	%[ticket], %[serving_now_ptr]		\n"
  "	beq	%[ticket], %[my_ticket], 2b		\n"
  "	 subu	%[ticket], %[my_ticket], %[ticket]	\n"
  "	b	4b					\n"
  "	 subu	%[ticket], %[ticket], 1			\n"
  "	.previous					\n"
  "	.set pop					\n"
  : [ticket_ptr] "+m" (lock->lock),
    [serving_now_ptr] "+m" (lock->h.serving_now),
    [ticket] "=&r" (tmp),
    [my_ticket] "=&r" (my_ticket)
  : [inc] "r" (inc));
 }

 __asm__ __volatile__("		\n" : : :"memory");
}

static inline __attribute__((always_inline)) void arch_spin_unlock(arch_spinlock_t *lock)
{
 unsigned int serving_now = lock->h.serving_now + 1;
 __asm__ __volatile__( ".set	push\n\t" ".set	noreorder\n\t" ".set	mips2\n\t" "sync\n\t" ".set	pop" : : : "memory");
 lock->h.serving_now = (u16)serving_now;
 __asm__ __volatile__( ".set	push\n\t" ".set	noreorder\n\t" ".set	mips2\n\t" "sync\n\t" ".set	pop" : : : "memory");
}

static inline __attribute__((always_inline)) unsigned int arch_spin_trylock(arch_spinlock_t *lock)
{
 int tmp, tmp2, tmp3;
 int inc = 0x10000;

 if (0) {
  __asm__ __volatile__ (
  "	.set push		# arch_spin_trylock	\n"
  "	.set noreorder					\n"
  "							\n"
  "1:	ll	%[ticket], %[ticket_ptr]		\n"
  "	srl	%[my_ticket], %[ticket], 16		\n"
  "	andi	%[my_ticket], %[my_ticket], 0xffff	\n"
  "	andi	%[now_serving], %[ticket], 0xffff	\n"
  "	bne	%[my_ticket], %[now_serving], 3f	\n"
  "	 addu	%[ticket], %[ticket], %[inc]		\n"
  "	sc	%[ticket], %[ticket_ptr]		\n"
  "	beqzl	%[ticket], 1b				\n"
  "	 li	%[ticket], 1				\n"
  "2:							\n"
  "	.subsection 2					\n"
  "3:	b	2b					\n"
  "	 li	%[ticket], 0				\n"
  "	.previous					\n"
  "	.set pop					\n"
  : [ticket_ptr] "+m" (lock->lock),
    [ticket] "=&r" (tmp),
    [my_ticket] "=&r" (tmp2),
    [now_serving] "=&r" (tmp3)
  : [inc] "r" (inc));
 } else {
  __asm__ __volatile__ (
  "	.set push		# arch_spin_trylock	\n"
  "	.set noreorder					\n"
  "							\n"
  "1:	ll	%[ticket], %[ticket_ptr]		\n"
  "	srl	%[my_ticket], %[ticket], 16		\n"
  "	andi	%[my_ticket], %[my_ticket], 0xffff	\n"
  "	andi	%[now_serving], %[ticket], 0xffff	\n"
  "	bne	%[my_ticket], %[now_serving], 3f	\n"
  "	 addu	%[ticket], %[ticket], %[inc]		\n"
  "	sc	%[ticket], %[ticket_ptr]		\n"
  "	beqz	%[ticket], 1b				\n"
  "	 li	%[ticket], 1				\n"
  "2:							\n"
  "	.subsection 2					\n"
  "3:	b	2b					\n"
  "	 li	%[ticket], 0				\n"
  "	.previous					\n"
  "	.set pop					\n"
  : [ticket_ptr] "+m" (lock->lock),
    [ticket] "=&r" (tmp),
    [my_ticket] "=&r" (tmp2),
    [now_serving] "=&r" (tmp3)
  : [inc] "r" (inc));
 }

 __asm__ __volatile__("		\n" : : :"memory");

 return tmp;
}
# 227 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/spinlock.h"
static inline __attribute__((always_inline)) void arch_read_lock(arch_rwlock_t *rw)
{
 unsigned int tmp;

 if (0) {
  __asm__ __volatile__(
  "	.set	noreorder	# arch_read_lock	\n"
  "1:	ll	%1, %2					\n"
  "	bltz	%1, 1b					\n"
  "	 addu	%1, 1					\n"
  "	sc	%1, %0					\n"
  "	beqzl	%1, 1b					\n"
  "	 nop						\n"
  "	.set	reorder					\n"
  : "=m" (rw->lock), "=&r" (tmp)
  : "m" (rw->lock)
  : "memory");
 } else {
  __asm__ __volatile__(
  "	.set	noreorder	# arch_read_lock	\n"
  "1:	ll	%1, %2					\n"
  "	bltz	%1, 2f					\n"
  "	 addu	%1, 1					\n"
  "	sc	%1, %0					\n"
  "	beqz	%1, 1b					\n"
  "	 nop						\n"
  "	.subsection 2					\n"
  "2:	ll	%1, %2					\n"
  "	bltz	%1, 2b					\n"
  "	 addu	%1, 1					\n"
  "	b	1b					\n"
  "	 nop						\n"
  "	.previous					\n"
  "	.set	reorder					\n"
  : "=m" (rw->lock), "=&r" (tmp)
  : "m" (rw->lock)
  : "memory");
 }

 __asm__ __volatile__("		\n" : : :"memory");
}




static inline __attribute__((always_inline)) void arch_read_unlock(arch_rwlock_t *rw)
{
 unsigned int tmp;

 __asm__ __volatile__("		\n" : : :"memory");

 if (0) {
  __asm__ __volatile__(
  "1:	ll	%1, %2		# arch_read_unlock	\n"
  "	sub	%1, 1					\n"
  "	sc	%1, %0					\n"
  "	beqzl	%1, 1b					\n"
  : "=m" (rw->lock), "=&r" (tmp)
  : "m" (rw->lock)
  : "memory");
 } else {
  __asm__ __volatile__(
  "	.set	noreorder	# arch_read_unlock	\n"
  "1:	ll	%1, %2					\n"
  "	sub	%1, 1					\n"
  "	sc	%1, %0					\n"
  "	beqz	%1, 2f					\n"
  "	 nop						\n"
  "	.subsection 2					\n"
  "2:	b	1b					\n"
  "	 nop						\n"
  "	.previous					\n"
  "	.set	reorder					\n"
  : "=m" (rw->lock), "=&r" (tmp)
  : "m" (rw->lock)
  : "memory");
 }
}

static inline __attribute__((always_inline)) void arch_write_lock(arch_rwlock_t *rw)
{
 unsigned int tmp;

 if (0) {
  __asm__ __volatile__(
  "	.set	noreorder	# arch_write_lock	\n"
  "1:	ll	%1, %2					\n"
  "	bnez	%1, 1b					\n"
  "	 lui	%1, 0x8000				\n"
  "	sc	%1, %0					\n"
  "	beqzl	%1, 1b					\n"
  "	 nop						\n"
  "	.set	reorder					\n"
  : "=m" (rw->lock), "=&r" (tmp)
  : "m" (rw->lock)
  : "memory");
 } else {
  __asm__ __volatile__(
  "	.set	noreorder	# arch_write_lock	\n"
  "1:	ll	%1, %2					\n"
  "	bnez	%1, 2f					\n"
  "	 lui	%1, 0x8000				\n"
  "	sc	%1, %0					\n"
  "	beqz	%1, 2f					\n"
  "	 nop						\n"
  "	.subsection 2					\n"
  "2:	ll	%1, %2					\n"
  "	bnez	%1, 2b					\n"
  "	 lui	%1, 0x8000				\n"
  "	b	1b					\n"
  "	 nop						\n"
  "	.previous					\n"
  "	.set	reorder					\n"
  : "=m" (rw->lock), "=&r" (tmp)
  : "m" (rw->lock)
  : "memory");
 }

 __asm__ __volatile__("		\n" : : :"memory");
}

static inline __attribute__((always_inline)) void arch_write_unlock(arch_rwlock_t *rw)
{
 __asm__ __volatile__("": : :"memory");

 __asm__ __volatile__(
 "				# arch_write_unlock	\n"
 "	sw	$0, %0					\n"
 : "=m" (rw->lock)
 : "m" (rw->lock)
 : "memory");
}

static inline __attribute__((always_inline)) int arch_read_trylock(arch_rwlock_t *rw)
{
 unsigned int tmp;
 int ret;

 if (0) {
  __asm__ __volatile__(
  "	.set	noreorder	# arch_read_trylock	\n"
  "	li	%2, 0					\n"
  "1:	ll	%1, %3					\n"
  "	bltz	%1, 2f					\n"
  "	 addu	%1, 1					\n"
  "	sc	%1, %0					\n"
  "	.set	reorder					\n"
  "	beqzl	%1, 1b					\n"
  "	 nop						\n"
  "		\n"
  "	li	%2, 1					\n"
  "2:							\n"
  : "=m" (rw->lock), "=&r" (tmp), "=&r" (ret)
  : "m" (rw->lock)
  : "memory");
 } else {
  __asm__ __volatile__(
  "	.set	noreorder	# arch_read_trylock	\n"
  "	li	%2, 0					\n"
  "1:	ll	%1, %3					\n"
  "	bltz	%1, 2f					\n"
  "	 addu	%1, 1					\n"
  "	sc	%1, %0					\n"
  "	beqz	%1, 1b					\n"
  "	 nop						\n"
  "	.set	reorder					\n"
  "		\n"
  "	li	%2, 1					\n"
  "2:							\n"
  : "=m" (rw->lock), "=&r" (tmp), "=&r" (ret)
  : "m" (rw->lock)
  : "memory");
 }

 return ret;
}

static inline __attribute__((always_inline)) int arch_write_trylock(arch_rwlock_t *rw)
{
 unsigned int tmp;
 int ret;

 if (0) {
  __asm__ __volatile__(
  "	.set	noreorder	# arch_write_trylock	\n"
  "	li	%2, 0					\n"
  "1:	ll	%1, %3					\n"
  "	bnez	%1, 2f					\n"
  "	 lui	%1, 0x8000				\n"
  "	sc	%1, %0					\n"
  "	beqzl	%1, 1b					\n"
  "	 nop						\n"
  "		\n"
  "	li	%2, 1					\n"
  "	.set	reorder					\n"
  "2:							\n"
  : "=m" (rw->lock), "=&r" (tmp), "=&r" (ret)
  : "m" (rw->lock)
  : "memory");
 } else {
  __asm__ __volatile__(
  "	.set	noreorder	# arch_write_trylock	\n"
  "	li	%2, 0					\n"
  "1:	ll	%1, %3					\n"
  "	bnez	%1, 2f					\n"
  "	lui	%1, 0x8000				\n"
  "	sc	%1, %0					\n"
  "	beqz	%1, 3f					\n"
  "	 li	%2, 1					\n"
  "2:							\n"
  "		\n"
  "	.subsection 2					\n"
  "3:	b	1b					\n"
  "	 li	%2, 0					\n"
  "	.previous					\n"
  "	.set	reorder					\n"
  : "=m" (rw->lock), "=&r" (tmp), "=&r" (ret)
  : "m" (rw->lock)
  : "memory");
 }

 return ret;
}
# 87 "include/linux/spinlock.h" 2
# 121 "include/linux/spinlock.h"
static inline __attribute__((always_inline)) void smp_mb__after_lock(void) { __asm__ __volatile__("": : :"memory"); }
# 136 "include/linux/spinlock.h"
static inline __attribute__((always_inline)) void do_raw_spin_lock(raw_spinlock_t *lock)
{
 (void)0;
 arch_spin_lock(&lock->raw_lock);
}

static inline __attribute__((always_inline)) void
do_raw_spin_lock_flags(raw_spinlock_t *lock, unsigned long *flags)
{
 (void)0;
 arch_spin_lock(&lock->raw_lock);
}

static inline __attribute__((always_inline)) int do_raw_spin_trylock(raw_spinlock_t *lock)
{
 return arch_spin_trylock(&(lock)->raw_lock);
}

static inline __attribute__((always_inline)) void do_raw_spin_unlock(raw_spinlock_t *lock)
{
 arch_spin_unlock(&lock->raw_lock);
 (void)0;
}
# 255 "include/linux/spinlock.h"
# 1 "include/linux/rwlock.h" 1
# 256 "include/linux/spinlock.h" 2





# 1 "include/linux/spinlock_api_smp.h" 1
# 18 "include/linux/spinlock_api_smp.h"
int in_lock_functions(unsigned long addr);



void __attribute__((section(".spinlock.text"))) _raw_spin_lock(raw_spinlock_t *lock) ;
void __attribute__((section(".spinlock.text"))) _raw_spin_lock_nested(raw_spinlock_t *lock, int subclass)
        ;
void __attribute__((section(".spinlock.text")))
_raw_spin_lock_nest_lock(raw_spinlock_t *lock, struct lockdep_map *map)
        ;
void __attribute__((section(".spinlock.text"))) _raw_spin_lock_bh(raw_spinlock_t *lock) ;
void __attribute__((section(".spinlock.text"))) _raw_spin_lock_irq(raw_spinlock_t *lock)
        ;

unsigned long __attribute__((section(".spinlock.text"))) _raw_spin_lock_irqsave(raw_spinlock_t *lock)
        ;
unsigned long __attribute__((section(".spinlock.text")))
_raw_spin_lock_irqsave_nested(raw_spinlock_t *lock, int subclass)
        ;
int __attribute__((section(".spinlock.text"))) _raw_spin_trylock(raw_spinlock_t *lock);
int __attribute__((section(".spinlock.text"))) _raw_spin_trylock_bh(raw_spinlock_t *lock);
void __attribute__((section(".spinlock.text"))) _raw_spin_unlock(raw_spinlock_t *lock) ;
void __attribute__((section(".spinlock.text"))) _raw_spin_unlock_bh(raw_spinlock_t *lock) ;
void __attribute__((section(".spinlock.text"))) _raw_spin_unlock_irq(raw_spinlock_t *lock) ;
void __attribute__((section(".spinlock.text")))
_raw_spin_unlock_irqrestore(raw_spinlock_t *lock, unsigned long flags)
        ;
# 86 "include/linux/spinlock_api_smp.h"
static inline __attribute__((always_inline)) int __raw_spin_trylock(raw_spinlock_t *lock)
{
 do { } while (0);
 if (do_raw_spin_trylock(lock)) {
  do { } while (0);
  return 1;
 }
 do { } while (0);
 return 0;
}
# 104 "include/linux/spinlock_api_smp.h"
static inline __attribute__((always_inline)) unsigned long __raw_spin_lock_irqsave(raw_spinlock_t *lock)
{
 unsigned long flags;

 do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); __asm__ __volatile__( "raw_local_irq_save\t%0" : "=r" (flags) : : "memory"); do { } while (0); } while (0);
 do { } while (0);
 do { } while (0);
# 119 "include/linux/spinlock_api_smp.h"
 do_raw_spin_lock_flags(lock, &flags);

 return flags;
}

static inline __attribute__((always_inline)) void __raw_spin_lock_irq(raw_spinlock_t *lock)
{
 do { raw_local_irq_disable(); do { } while (0); } while (0);
 do { } while (0);
 do { } while (0);
 do_raw_spin_lock(lock);
}

static inline __attribute__((always_inline)) void __raw_spin_lock_bh(raw_spinlock_t *lock)
{
 local_bh_disable();
 do { } while (0);
 do { } while (0);
 do_raw_spin_lock(lock);
}

static inline __attribute__((always_inline)) void __raw_spin_lock(raw_spinlock_t *lock)
{
 do { } while (0);
 do { } while (0);
 do_raw_spin_lock(lock);
}



static inline __attribute__((always_inline)) void __raw_spin_unlock(raw_spinlock_t *lock)
{
 do { } while (0);
 do_raw_spin_unlock(lock);
 do { } while (0);
}

static inline __attribute__((always_inline)) void __raw_spin_unlock_irqrestore(raw_spinlock_t *lock,
         unsigned long flags)
{
 do { } while (0);
 do_raw_spin_unlock(lock);
 do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); if (raw_irqs_disabled_flags(flags)) { raw_local_irq_restore(flags); do { } while (0); } else { do { } while (0); raw_local_irq_restore(flags); } } while (0);
 do { } while (0);
}

static inline __attribute__((always_inline)) void __raw_spin_unlock_irq(raw_spinlock_t *lock)
{
 do { } while (0);
 do_raw_spin_unlock(lock);
 do { do { } while (0); raw_local_irq_enable(); } while (0);
 do { } while (0);
}

static inline __attribute__((always_inline)) void __raw_spin_unlock_bh(raw_spinlock_t *lock)
{
 do { } while (0);
 do_raw_spin_unlock(lock);
 do { } while (0);
 local_bh_enable_ip((unsigned long)__builtin_return_address(0));
}

static inline __attribute__((always_inline)) int __raw_spin_trylock_bh(raw_spinlock_t *lock)
{
 local_bh_disable();
 do { } while (0);
 if (do_raw_spin_trylock(lock)) {
  do { } while (0);
  return 1;
 }
 do { } while (0);
 local_bh_enable_ip((unsigned long)__builtin_return_address(0));
 return 0;
}

# 1 "include/linux/rwlock_api_smp.h" 1
# 18 "include/linux/rwlock_api_smp.h"
void __attribute__((section(".spinlock.text"))) _raw_read_lock(rwlock_t *lock) ;
void __attribute__((section(".spinlock.text"))) _raw_write_lock(rwlock_t *lock) ;
void __attribute__((section(".spinlock.text"))) _raw_read_lock_bh(rwlock_t *lock) ;
void __attribute__((section(".spinlock.text"))) _raw_write_lock_bh(rwlock_t *lock) ;
void __attribute__((section(".spinlock.text"))) _raw_read_lock_irq(rwlock_t *lock) ;
void __attribute__((section(".spinlock.text"))) _raw_write_lock_irq(rwlock_t *lock) ;
unsigned long __attribute__((section(".spinlock.text"))) _raw_read_lock_irqsave(rwlock_t *lock)
       ;
unsigned long __attribute__((section(".spinlock.text"))) _raw_write_lock_irqsave(rwlock_t *lock)
       ;
int __attribute__((section(".spinlock.text"))) _raw_read_trylock(rwlock_t *lock);
int __attribute__((section(".spinlock.text"))) _raw_write_trylock(rwlock_t *lock);
void __attribute__((section(".spinlock.text"))) _raw_read_unlock(rwlock_t *lock) ;
void __attribute__((section(".spinlock.text"))) _raw_write_unlock(rwlock_t *lock) ;
void __attribute__((section(".spinlock.text"))) _raw_read_unlock_bh(rwlock_t *lock) ;
void __attribute__((section(".spinlock.text"))) _raw_write_unlock_bh(rwlock_t *lock) ;
void __attribute__((section(".spinlock.text"))) _raw_read_unlock_irq(rwlock_t *lock) ;
void __attribute__((section(".spinlock.text"))) _raw_write_unlock_irq(rwlock_t *lock) ;
void __attribute__((section(".spinlock.text")))
_raw_read_unlock_irqrestore(rwlock_t *lock, unsigned long flags)
       ;
void __attribute__((section(".spinlock.text")))
_raw_write_unlock_irqrestore(rwlock_t *lock, unsigned long flags)
       ;
# 117 "include/linux/rwlock_api_smp.h"
static inline __attribute__((always_inline)) int __raw_read_trylock(rwlock_t *lock)
{
 do { } while (0);
 if (arch_read_trylock(&(lock)->raw_lock)) {
  do { } while (0);
  return 1;
 }
 do { } while (0);
 return 0;
}

static inline __attribute__((always_inline)) int __raw_write_trylock(rwlock_t *lock)
{
 do { } while (0);
 if (arch_write_trylock(&(lock)->raw_lock)) {
  do { } while (0);
  return 1;
 }
 do { } while (0);
 return 0;
}
# 146 "include/linux/rwlock_api_smp.h"
static inline __attribute__((always_inline)) void __raw_read_lock(rwlock_t *lock)
{
 do { } while (0);
 do { } while (0);
 do {(void)0; arch_read_lock(&(lock)->raw_lock); } while (0);
}

static inline __attribute__((always_inline)) unsigned long __raw_read_lock_irqsave(rwlock_t *lock)
{
 unsigned long flags;

 do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); __asm__ __volatile__( "raw_local_irq_save\t%0" : "=r" (flags) : : "memory"); do { } while (0); } while (0);
 do { } while (0);
 do { } while (0);
 do {(void)0; arch_read_lock(&((lock))->raw_lock); } while (0);

 return flags;
}

static inline __attribute__((always_inline)) void __raw_read_lock_irq(rwlock_t *lock)
{
 do { raw_local_irq_disable(); do { } while (0); } while (0);
 do { } while (0);
 do { } while (0);
 do {(void)0; arch_read_lock(&(lock)->raw_lock); } while (0);
}

static inline __attribute__((always_inline)) void __raw_read_lock_bh(rwlock_t *lock)
{
 local_bh_disable();
 do { } while (0);
 do { } while (0);
 do {(void)0; arch_read_lock(&(lock)->raw_lock); } while (0);
}

static inline __attribute__((always_inline)) unsigned long __raw_write_lock_irqsave(rwlock_t *lock)
{
 unsigned long flags;

 do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); __asm__ __volatile__( "raw_local_irq_save\t%0" : "=r" (flags) : : "memory"); do { } while (0); } while (0);
 do { } while (0);
 do { } while (0);
 do {(void)0; arch_write_lock(&((lock))->raw_lock); } while (0);

 return flags;
}

static inline __attribute__((always_inline)) void __raw_write_lock_irq(rwlock_t *lock)
{
 do { raw_local_irq_disable(); do { } while (0); } while (0);
 do { } while (0);
 do { } while (0);
 do {(void)0; arch_write_lock(&(lock)->raw_lock); } while (0);
}

static inline __attribute__((always_inline)) void __raw_write_lock_bh(rwlock_t *lock)
{
 local_bh_disable();
 do { } while (0);
 do { } while (0);
 do {(void)0; arch_write_lock(&(lock)->raw_lock); } while (0);
}

static inline __attribute__((always_inline)) void __raw_write_lock(rwlock_t *lock)
{
 do { } while (0);
 do { } while (0);
 do {(void)0; arch_write_lock(&(lock)->raw_lock); } while (0);
}



static inline __attribute__((always_inline)) void __raw_write_unlock(rwlock_t *lock)
{
 do { } while (0);
 do {arch_write_unlock(&(lock)->raw_lock); (void)0; } while (0);
 do { } while (0);
}

static inline __attribute__((always_inline)) void __raw_read_unlock(rwlock_t *lock)
{
 do { } while (0);
 do {arch_read_unlock(&(lock)->raw_lock); (void)0; } while (0);
 do { } while (0);
}

static inline __attribute__((always_inline)) void
__raw_read_unlock_irqrestore(rwlock_t *lock, unsigned long flags)
{
 do { } while (0);
 do {arch_read_unlock(&(lock)->raw_lock); (void)0; } while (0);
 do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); if (raw_irqs_disabled_flags(flags)) { raw_local_irq_restore(flags); do { } while (0); } else { do { } while (0); raw_local_irq_restore(flags); } } while (0);
 do { } while (0);
}

static inline __attribute__((always_inline)) void __raw_read_unlock_irq(rwlock_t *lock)
{
 do { } while (0);
 do {arch_read_unlock(&(lock)->raw_lock); (void)0; } while (0);
 do { do { } while (0); raw_local_irq_enable(); } while (0);
 do { } while (0);
}

static inline __attribute__((always_inline)) void __raw_read_unlock_bh(rwlock_t *lock)
{
 do { } while (0);
 do {arch_read_unlock(&(lock)->raw_lock); (void)0; } while (0);
 do { } while (0);
 local_bh_enable_ip((unsigned long)__builtin_return_address(0));
}

static inline __attribute__((always_inline)) void __raw_write_unlock_irqrestore(rwlock_t *lock,
          unsigned long flags)
{
 do { } while (0);
 do {arch_write_unlock(&(lock)->raw_lock); (void)0; } while (0);
 do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); if (raw_irqs_disabled_flags(flags)) { raw_local_irq_restore(flags); do { } while (0); } else { do { } while (0); raw_local_irq_restore(flags); } } while (0);
 do { } while (0);
}

static inline __attribute__((always_inline)) void __raw_write_unlock_irq(rwlock_t *lock)
{
 do { } while (0);
 do {arch_write_unlock(&(lock)->raw_lock); (void)0; } while (0);
 do { do { } while (0); raw_local_irq_enable(); } while (0);
 do { } while (0);
}

static inline __attribute__((always_inline)) void __raw_write_unlock_bh(rwlock_t *lock)
{
 do { } while (0);
 do {arch_write_unlock(&(lock)->raw_lock); (void)0; } while (0);
 do { } while (0);
 local_bh_enable_ip((unsigned long)__builtin_return_address(0));
}
# 195 "include/linux/spinlock_api_smp.h" 2
# 262 "include/linux/spinlock.h" 2
# 270 "include/linux/spinlock.h"
static inline __attribute__((always_inline)) raw_spinlock_t *spinlock_check(spinlock_t *lock)
{
 return &lock->rlock;
}







static inline __attribute__((always_inline)) void spin_lock(spinlock_t *lock)
{
 _raw_spin_lock(&lock->rlock);
}

static inline __attribute__((always_inline)) void spin_lock_bh(spinlock_t *lock)
{
 _raw_spin_lock_bh(&lock->rlock);
}

static inline __attribute__((always_inline)) int spin_trylock(spinlock_t *lock)
{
 return (_raw_spin_trylock(&lock->rlock));
}
# 306 "include/linux/spinlock.h"
static inline __attribute__((always_inline)) void spin_lock_irq(spinlock_t *lock)
{
 _raw_spin_lock_irq(&lock->rlock);
}
# 320 "include/linux/spinlock.h"
static inline __attribute__((always_inline)) void spin_unlock(spinlock_t *lock)
{
 __raw_spin_unlock(&lock->rlock);
}

static inline __attribute__((always_inline)) void spin_unlock_bh(spinlock_t *lock)
{
 _raw_spin_unlock_bh(&lock->rlock);
}

static inline __attribute__((always_inline)) void spin_unlock_irq(spinlock_t *lock)
{
 __raw_spin_unlock_irq(&lock->rlock);
}

static inline __attribute__((always_inline)) void spin_unlock_irqrestore(spinlock_t *lock, unsigned long flags)
{
 do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); _raw_spin_unlock_irqrestore(&lock->rlock, flags); } while (0);
}

static inline __attribute__((always_inline)) int spin_trylock_bh(spinlock_t *lock)
{
 return (_raw_spin_trylock_bh(&lock->rlock));
}

static inline __attribute__((always_inline)) int spin_trylock_irq(spinlock_t *lock)
{
 return ({ do { raw_local_irq_disable(); do { } while (0); } while (0); (_raw_spin_trylock(&lock->rlock)) ? 1 : ({ do { do { } while (0); raw_local_irq_enable(); } while (0); 0; }); });
}






static inline __attribute__((always_inline)) void spin_unlock_wait(spinlock_t *lock)
{
 while (arch_spin_is_locked(&(&lock->rlock)->raw_lock)) { __asm__ __volatile__("": : :"memory"); };
}

static inline __attribute__((always_inline)) int spin_is_locked(spinlock_t *lock)
{
 return arch_spin_is_locked(&(&lock->rlock)->raw_lock);
}

static inline __attribute__((always_inline)) int spin_is_contended(spinlock_t *lock)
{
 return arch_spin_is_contended(&(&lock->rlock)->raw_lock);
}

static inline __attribute__((always_inline)) int spin_can_lock(spinlock_t *lock)
{
 return (!arch_spin_is_locked(&(&lock->rlock)->raw_lock));
}

static inline __attribute__((always_inline)) void assert_spin_locked(spinlock_t *lock)
{
 __BUG_ON((unsigned long)(!arch_spin_is_locked(&(&lock->rlock)->raw_lock)));
}





# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/atomic.h" 1
# 50 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/atomic.h"
static __inline__ __attribute__((always_inline)) void atomic_add(int i, atomic_t * v)
{
 if (1 && 0) {
  int temp;

  __asm__ __volatile__(
  "	.set	mips3					\n"
  "1:	ll	%0, %1		# atomic_add		\n"
  "	addu	%0, %2					\n"
  "	sc	%0, %1					\n"
  "	beqzl	%0, 1b					\n"
  "	.set	mips0					\n"
  : "=&r" (temp), "=m" (v->counter)
  : "Ir" (i), "m" (v->counter));
 } else if (1) {
  int temp;

  __asm__ __volatile__(
  "	.set	mips3					\n"
  "1:	ll	%0, %1		# atomic_add		\n"
  "	addu	%0, %2					\n"
  "	sc	%0, %1					\n"
  "	beqz	%0, 2f					\n"
  "	.subsection 2					\n"
  "2:	b	1b					\n"
  "	.previous					\n"
  "	.set	mips0					\n"
  : "=&r" (temp), "=m" (v->counter)
  : "Ir" (i), "m" (v->counter));
 } else {
  unsigned long flags;

  __asm__ __volatile__( "raw_local_irq_save\t%0" : "=r" (flags) : : "memory");
  v->counter += i;
  raw_local_irq_restore(flags);
 }
}
# 95 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/atomic.h"
static __inline__ __attribute__((always_inline)) void atomic_sub(int i, atomic_t * v)
{
 if (1 && 0) {
  int temp;

  __asm__ __volatile__(
  "	.set	mips3					\n"
  "1:	ll	%0, %1		# atomic_sub		\n"
  "	subu	%0, %2					\n"
  "	sc	%0, %1					\n"
  "	beqzl	%0, 1b					\n"
  "	.set	mips0					\n"
  : "=&r" (temp), "=m" (v->counter)
  : "Ir" (i), "m" (v->counter));
 } else if (1) {
  int temp;

  __asm__ __volatile__(
  "	.set	mips3					\n"
  "1:	ll	%0, %1		# atomic_sub		\n"
  "	subu	%0, %2					\n"
  "	sc	%0, %1					\n"
  "	beqz	%0, 2f					\n"
  "	.subsection 2					\n"
  "2:	b	1b					\n"
  "	.previous					\n"
  "	.set	mips0					\n"
  : "=&r" (temp), "=m" (v->counter)
  : "Ir" (i), "m" (v->counter));
 } else {
  unsigned long flags;

  __asm__ __volatile__( "raw_local_irq_save\t%0" : "=r" (flags) : : "memory");
  v->counter -= i;
  raw_local_irq_restore(flags);
 }
}




static __inline__ __attribute__((always_inline)) int atomic_add_return(int i, atomic_t * v)
{
 int result;

 __asm__ __volatile__("		\n" : : :"memory");

 if (1 && 0) {
  int temp;

  __asm__ __volatile__(
  "	.set	mips3					\n"
  "1:	ll	%1, %2		# atomic_add_return	\n"
  "	addu	%0, %1, %3				\n"
  "	sc	%0, %2					\n"
  "	beqzl	%0, 1b					\n"
  "	addu	%0, %1, %3				\n"
  "	.set	mips0					\n"
  : "=&r" (result), "=&r" (temp), "=m" (v->counter)
  : "Ir" (i), "m" (v->counter)
  : "memory");
 } else if (1) {
  int temp;

  __asm__ __volatile__(
  "	.set	mips3					\n"
  "1:	ll	%1, %2		# atomic_add_return	\n"
  "	addu	%0, %1, %3				\n"
  "	sc	%0, %2					\n"
  "	beqz	%0, 2f					\n"
  "	addu	%0, %1, %3				\n"
  "	.subsection 2					\n"
  "2:	b	1b					\n"
  "	.previous					\n"
  "	.set	mips0					\n"
  : "=&r" (result), "=&r" (temp), "=m" (v->counter)
  : "Ir" (i), "m" (v->counter)
  : "memory");
 } else {
  unsigned long flags;

  __asm__ __volatile__( "raw_local_irq_save\t%0" : "=r" (flags) : : "memory");
  result = v->counter;
  result += i;
  v->counter = result;
  raw_local_irq_restore(flags);
 }

 __asm__ __volatile__("		\n" : : :"memory");

 return result;
}

static __inline__ __attribute__((always_inline)) int atomic_sub_return(int i, atomic_t * v)
{
 int result;

 __asm__ __volatile__("		\n" : : :"memory");

 if (1 && 0) {
  int temp;

  __asm__ __volatile__(
  "	.set	mips3					\n"
  "1:	ll	%1, %2		# atomic_sub_return	\n"
  "	subu	%0, %1, %3				\n"
  "	sc	%0, %2					\n"
  "	beqzl	%0, 1b					\n"
  "	subu	%0, %1, %3				\n"
  "	.set	mips0					\n"
  : "=&r" (result), "=&r" (temp), "=m" (v->counter)
  : "Ir" (i), "m" (v->counter)
  : "memory");
 } else if (1) {
  int temp;

  __asm__ __volatile__(
  "	.set	mips3					\n"
  "1:	ll	%1, %2		# atomic_sub_return	\n"
  "	subu	%0, %1, %3				\n"
  "	sc	%0, %2					\n"
  "	beqz	%0, 2f					\n"
  "	subu	%0, %1, %3				\n"
  "	.subsection 2					\n"
  "2:	b	1b					\n"
  "	.previous					\n"
  "	.set	mips0					\n"
  : "=&r" (result), "=&r" (temp), "=m" (v->counter)
  : "Ir" (i), "m" (v->counter)
  : "memory");
 } else {
  unsigned long flags;

  __asm__ __volatile__( "raw_local_irq_save\t%0" : "=r" (flags) : : "memory");
  result = v->counter;
  result -= i;
  v->counter = result;
  raw_local_irq_restore(flags);
 }

 __asm__ __volatile__("		\n" : : :"memory");

 return result;
}
# 248 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/atomic.h"
static __inline__ __attribute__((always_inline)) int atomic_sub_if_positive(int i, atomic_t * v)
{
 int result;

 __asm__ __volatile__("		\n" : : :"memory");

 if (1 && 0) {
  int temp;

  __asm__ __volatile__(
  "	.set	mips3					\n"
  "1:	ll	%1, %2		# atomic_sub_if_positive\n"
  "	subu	%0, %1, %3				\n"
  "	bltz	%0, 1f					\n"
  "	sc	%0, %2					\n"
  "	.set	noreorder				\n"
  "	beqzl	%0, 1b					\n"
  "	 subu	%0, %1, %3				\n"
  "	.set	reorder					\n"
  "1:							\n"
  "	.set	mips0					\n"
  : "=&r" (result), "=&r" (temp), "=m" (v->counter)
  : "Ir" (i), "m" (v->counter)
  : "memory");
 } else if (1) {
  int temp;

  __asm__ __volatile__(
  "	.set	mips3					\n"
  "1:	ll	%1, %2		# atomic_sub_if_positive\n"
  "	subu	%0, %1, %3				\n"
  "	bltz	%0, 1f					\n"
  "	sc	%0, %2					\n"
  "	.set	noreorder				\n"
  "	beqz	%0, 2f					\n"
  "	 subu	%0, %1, %3				\n"
  "	.set	reorder					\n"
  "	.subsection 2					\n"
  "2:	b	1b					\n"
  "	.previous					\n"
  "1:							\n"
  "	.set	mips0					\n"
  : "=&r" (result), "=&r" (temp), "=m" (v->counter)
  : "Ir" (i), "m" (v->counter)
  : "memory");
 } else {
  unsigned long flags;

  __asm__ __volatile__( "raw_local_irq_save\t%0" : "=r" (flags) : : "memory");
  result = v->counter;
  result -= i;
  if (result >= 0)
   v->counter = result;
  raw_local_irq_restore(flags);
 }

 __asm__ __volatile__("		\n" : : :"memory");

 return result;
}
# 321 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/atomic.h"
static __inline__ __attribute__((always_inline)) int atomic_add_unless(atomic_t *v, int a, int u)
{
 int c, old;
 c = (*(volatile int *)&(v)->counter);
 for (;;) {
  if (__builtin_expect(!!(c == (u)), 0))
   break;
  old = (({ __typeof__(&(((v))->counter)) __ptr = (&(((v))->counter)); __typeof__(*(&(((v))->counter))) __old = ((c)); __typeof__(*(&(((v))->counter))) __new = ((c + (a))); __typeof__(*(&(((v))->counter))) __res = 0; __asm__ __volatile__("		\n" : : :"memory"); switch (sizeof(*(__ptr))) { case 4: __res = ({ __typeof(*(__ptr)) __ret; if (1 && 0) { __asm__ __volatile__( "	.set	push				\n" "	.set	noat				\n" "	.set	mips3				\n" "1:	" "ll" "	%0, %2		# __cmpxchg_asm	\n" "	bne	%0, %z3, 2f			\n" "	.set	mips0				\n" "	move	$1, %z4				\n" "	.set	mips3				\n" "	" "sc" "	$1, %1				\n" "	beqzl	$1, 1b				\n" "2:						\n" "	.set	pop				\n" : "=&r" (__ret), "=R" (*__ptr) : "R" (*__ptr), "Jr" (__old), "Jr" (__new) : "memory"); } else if (1) { __asm__ __volatile__( "	.set	push				\n" "	.set	noat				\n" "	.set	mips3				\n" "1:	" "ll" "	%0, %2		# __cmpxchg_asm	\n" "	bne	%0, %z3, 2f			\n" "	.set	mips0				\n" "	move	$1, %z4				\n" "	.set	mips3				\n" "	" "sc" "	$1, %1				\n" "	beqz	$1, 3f				\n" "2:						\n" "	.subsection 2				\n" "3:	b	1b				\n" "	.previous				\n" "	.set	pop				\n" : "=&r" (__ret), "=R" (*__ptr) : "R" (*__ptr), "Jr" (__old), "Jr" (__new) : "memory"); } else { unsigned long __flags; __asm__ __volatile__( "raw_local_irq_save\t%0" : "=r" (__flags) : : "memory"); __ret = *__ptr; if (__ret == __old) *__ptr = __new; raw_local_irq_restore(__flags); } __ret; }); break; case 8: if (sizeof(long) == 8) { __res = ({ __typeof(*(__ptr)) __ret; if (1 && 0) { __asm__ __volatile__( "	.set	push				\n" "	.set	noat				\n" "	.set	mips3				\n" "1:	" "lld" "	%0, %2		# __cmpxchg_asm	\n" "	bne	%0, %z3, 2f			\n" "	.set	mips0				\n" "	move	$1, %z4				\n" "	.set	mips3				\n" "	" "scd" "	$1, %1				\n" "	beqzl	$1, 1b				\n" "2:						\n" "	.set	pop				\n" : "=&r" (__ret), "=R" (*__ptr) : "R" (*__ptr), "Jr" (__old), "Jr" (__new) : "memory"); } else if (1) { __asm__ __volatile__( "	.set	push				\n" "	.set	noat				\n" "	.set	mips3				\n" "1:	" "lld" "	%0, %2		# __cmpxchg_asm	\n" "	bne	%0, %z3, 2f			\n" "	.set	mips0				\n" "	move	$1, %z4				\n" "	.set	mips3				\n" "	" "scd" "	$1, %1				\n" "	beqz	$1, 3f				\n" "2:						\n" "	.subsection 2				\n" "3:	b	1b				\n" "	.previous				\n" "	.set	pop				\n" : "=&r" (__ret), "=R" (*__ptr) : "R" (*__ptr), "Jr" (__old), "Jr" (__new) : "memory"); } else { unsigned long __flags; __asm__ __volatile__( "raw_local_irq_save\t%0" : "=r" (__flags) : : "memory"); __ret = *__ptr; if (__ret == __old) *__ptr = __new; raw_local_irq_restore(__flags); } __ret; }); break; } default: __cmpxchg_called_with_bad_pointer(); break; } __asm__ __volatile__("		\n" : : :"memory"); __res; }));
  if (__builtin_expect(!!(old == c), 1))
   break;
  c = old;
 }
 return c != (u);
}
# 787 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/atomic.h"
# 1 "include/asm-generic/atomic64.h" 1
# 15 "include/asm-generic/atomic64.h"
typedef struct {
 long long counter;
} atomic64_t;



extern long long atomic64_read(const atomic64_t *v);
extern void atomic64_set(atomic64_t *v, long long i);
extern void atomic64_add(long long a, atomic64_t *v);
extern long long atomic64_add_return(long long a, atomic64_t *v);
extern void atomic64_sub(long long a, atomic64_t *v);
extern long long atomic64_sub_return(long long a, atomic64_t *v);
extern long long atomic64_dec_if_positive(atomic64_t *v);
extern long long atomic64_cmpxchg(atomic64_t *v, long long o, long long n);
extern long long atomic64_xchg(atomic64_t *v, long long new);
extern int atomic64_add_unless(atomic64_t *v, long long a, long long u);
# 788 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/atomic.h" 2
# 800 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/atomic.h"
# 1 "include/asm-generic/atomic-long.h" 1
# 141 "include/asm-generic/atomic-long.h"
typedef atomic_t atomic_long_t;


static inline __attribute__((always_inline)) long atomic_long_read(atomic_long_t *l)
{
 atomic_t *v = (atomic_t *)l;

 return (long)(*(volatile int *)&(v)->counter);
}

static inline __attribute__((always_inline)) void atomic_long_set(atomic_long_t *l, long i)
{
 atomic_t *v = (atomic_t *)l;

 ((v)->counter = (i));
}

static inline __attribute__((always_inline)) void atomic_long_inc(atomic_long_t *l)
{
 atomic_t *v = (atomic_t *)l;

 atomic_add(1, (v));
}

static inline __attribute__((always_inline)) void atomic_long_dec(atomic_long_t *l)
{
 atomic_t *v = (atomic_t *)l;

 atomic_sub(1, (v));
}

static inline __attribute__((always_inline)) void atomic_long_add(long i, atomic_long_t *l)
{
 atomic_t *v = (atomic_t *)l;

 atomic_add(i, v);
}

static inline __attribute__((always_inline)) void atomic_long_sub(long i, atomic_long_t *l)
{
 atomic_t *v = (atomic_t *)l;

 atomic_sub(i, v);
}

static inline __attribute__((always_inline)) int atomic_long_sub_and_test(long i, atomic_long_t *l)
{
 atomic_t *v = (atomic_t *)l;

 return (atomic_sub_return((i), (v)) == 0);
}

static inline __attribute__((always_inline)) int atomic_long_dec_and_test(atomic_long_t *l)
{
 atomic_t *v = (atomic_t *)l;

 return (atomic_sub_return(1, (v)) == 0);
}

static inline __attribute__((always_inline)) int atomic_long_inc_and_test(atomic_long_t *l)
{
 atomic_t *v = (atomic_t *)l;

 return (atomic_add_return(1, (v)) == 0);
}

static inline __attribute__((always_inline)) int atomic_long_add_negative(long i, atomic_long_t *l)
{
 atomic_t *v = (atomic_t *)l;

 return (atomic_add_return(i, (v)) < 0);
}

static inline __attribute__((always_inline)) long atomic_long_add_return(long i, atomic_long_t *l)
{
 atomic_t *v = (atomic_t *)l;

 return (long)atomic_add_return(i, v);
}

static inline __attribute__((always_inline)) long atomic_long_sub_return(long i, atomic_long_t *l)
{
 atomic_t *v = (atomic_t *)l;

 return (long)atomic_sub_return(i, v);
}

static inline __attribute__((always_inline)) long atomic_long_inc_return(atomic_long_t *l)
{
 atomic_t *v = (atomic_t *)l;

 return (long)atomic_add_return(1, (v));
}

static inline __attribute__((always_inline)) long atomic_long_dec_return(atomic_long_t *l)
{
 atomic_t *v = (atomic_t *)l;

 return (long)atomic_sub_return(1, (v));
}

static inline __attribute__((always_inline)) long atomic_long_add_unless(atomic_long_t *l, long a, long u)
{
 atomic_t *v = (atomic_t *)l;

 return (long)atomic_add_unless(v, a, u);
}
# 801 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/atomic.h" 2
# 385 "include/linux/spinlock.h" 2
# 393 "include/linux/spinlock.h"
extern int _atomic_dec_and_lock(atomic_t *atomic, spinlock_t *lock);
# 30 "include/linux/seqlock.h" 2


typedef struct {
 unsigned sequence;
 spinlock_t lock;
} seqlock_t;
# 60 "include/linux/seqlock.h"
static inline __attribute__((always_inline)) void write_seqlock(seqlock_t *sl)
{
 spin_lock(&sl->lock);
 ++sl->sequence;
 __asm__ __volatile__("": : :"memory");
}

static inline __attribute__((always_inline)) void write_sequnlock(seqlock_t *sl)
{
 __asm__ __volatile__("": : :"memory");
 sl->sequence++;
 spin_unlock(&sl->lock);
}

static inline __attribute__((always_inline)) int write_tryseqlock(seqlock_t *sl)
{
 int ret = spin_trylock(&sl->lock);

 if (ret) {
  ++sl->sequence;
  __asm__ __volatile__("": : :"memory");
 }
 return ret;
}


static inline __attribute__((always_inline)) __attribute__((always_inline)) unsigned read_seqbegin(const seqlock_t *sl)
{
 unsigned ret;

repeat:
 ret = sl->sequence;
 __asm__ __volatile__("": : :"memory");
 if (__builtin_expect(!!(ret & 1), 0)) {
  __asm__ __volatile__("": : :"memory");
  goto repeat;
 }

 return ret;
}






static inline __attribute__((always_inline)) __attribute__((always_inline)) int read_seqretry(const seqlock_t *sl, unsigned start)
{
 __asm__ __volatile__("": : :"memory");

 return (sl->sequence != start);
}
# 121 "include/linux/seqlock.h"
typedef struct seqcount {
 unsigned sequence;
} seqcount_t;





static inline __attribute__((always_inline)) unsigned read_seqcount_begin(const seqcount_t *s)
{
 unsigned ret;

repeat:
 ret = s->sequence;
 __asm__ __volatile__("": : :"memory");
 if (__builtin_expect(!!(ret & 1), 0)) {
  __asm__ __volatile__("": : :"memory");
  goto repeat;
 }
 return ret;
}




static inline __attribute__((always_inline)) int read_seqcount_retry(const seqcount_t *s, unsigned start)
{
 __asm__ __volatile__("": : :"memory");

 return s->sequence != start;
}






static inline __attribute__((always_inline)) void write_seqcount_begin(seqcount_t *s)
{
 s->sequence++;
 __asm__ __volatile__("": : :"memory");
}

static inline __attribute__((always_inline)) void write_seqcount_end(seqcount_t *s)
{
 __asm__ __volatile__("": : :"memory");
 s->sequence++;
}
# 9 "include/linux/time.h" 2
# 1 "include/linux/math64.h" 1




# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/div64.h" 1
# 12 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/div64.h"
# 1 "include/asm-generic/div64.h" 1
# 35 "include/asm-generic/div64.h"
extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
# 13 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/div64.h" 2
# 6 "include/linux/math64.h" 2
# 41 "include/linux/math64.h"
static inline __attribute__((always_inline)) u64 div_u64_rem(u64 dividend, u32 divisor, u32 *remainder)
{
 *remainder = ({ uint32_t __base = (divisor); uint32_t __rem; (void)(((typeof((dividend)) *)0) == ((uint64_t *)0)); if (__builtin_expect(!!(((dividend) >> 32) == 0), 1)) { __rem = (uint32_t)(dividend) % __base; (dividend) = (uint32_t)(dividend) / __base; } else __rem = __div64_32(&(dividend), __base); __rem; });
 return dividend;
}



extern s64 div_s64_rem(s64 dividend, s32 divisor, s32 *remainder);



extern u64 div64_u64(u64 dividend, u64 divisor);
# 66 "include/linux/math64.h"
static inline __attribute__((always_inline)) u64 div_u64(u64 dividend, u32 divisor)
{
 u32 remainder;
 return div_u64_rem(dividend, divisor, &remainder);
}






static inline __attribute__((always_inline)) s64 div_s64(s64 dividend, s32 divisor)
{
 s32 remainder;
 return div_s64_rem(dividend, divisor, &remainder);
}


u32 iter_div_u64_rem(u64 dividend, u32 divisor, u64 *remainder);

static inline __attribute__((always_inline)) __attribute__((always_inline)) u32
__iter_div_u64_rem(u64 dividend, u32 divisor, u64 *remainder)
{
 u32 ret = 0;

 while (dividend >= divisor) {


  asm("" : "+rm"(dividend));

  dividend -= divisor;
  ret++;
 }

 *remainder = dividend;

 return ret;
}
# 10 "include/linux/time.h" 2




struct timespec {
 __kernel_time_t tv_sec;
 long tv_nsec;
};


struct timeval {
 __kernel_time_t tv_sec;
 __kernel_suseconds_t tv_usec;
};

struct timezone {
 int tz_minuteswest;
 int tz_dsttime;
};



extern struct timezone sys_tz;
# 45 "include/linux/time.h"
static inline __attribute__((always_inline)) int timespec_equal(const struct timespec *a,
                                 const struct timespec *b)
{
 return (a->tv_sec == b->tv_sec) && (a->tv_nsec == b->tv_nsec);
}






static inline __attribute__((always_inline)) int timespec_compare(const struct timespec *lhs, const struct timespec *rhs)
{
 if (lhs->tv_sec < rhs->tv_sec)
  return -1;
 if (lhs->tv_sec > rhs->tv_sec)
  return 1;
 return lhs->tv_nsec - rhs->tv_nsec;
}

static inline __attribute__((always_inline)) int timeval_compare(const struct timeval *lhs, const struct timeval *rhs)
{
 if (lhs->tv_sec < rhs->tv_sec)
  return -1;
 if (lhs->tv_sec > rhs->tv_sec)
  return 1;
 return lhs->tv_usec - rhs->tv_usec;
}

extern unsigned long mktime(const unsigned int year, const unsigned int mon,
       const unsigned int day, const unsigned int hour,
       const unsigned int min, const unsigned int sec);

extern void set_normalized_timespec(struct timespec *ts, time_t sec, s64 nsec);






extern struct timespec timespec_add_safe(const struct timespec lhs,
      const struct timespec rhs);


static inline __attribute__((always_inline)) struct timespec timespec_add(struct timespec lhs,
      struct timespec rhs)
{
 struct timespec ts_delta;
 set_normalized_timespec(&ts_delta, lhs.tv_sec + rhs.tv_sec,
    lhs.tv_nsec + rhs.tv_nsec);
 return ts_delta;
}




static inline __attribute__((always_inline)) struct timespec timespec_sub(struct timespec lhs,
      struct timespec rhs)
{
 struct timespec ts_delta;
 set_normalized_timespec(&ts_delta, lhs.tv_sec - rhs.tv_sec,
    lhs.tv_nsec - rhs.tv_nsec);
 return ts_delta;
}







extern seqlock_t xtime_lock;

extern void read_persistent_clock(struct timespec *ts);
extern void read_boot_clock(struct timespec *ts);
extern int update_persistent_clock(struct timespec now);
extern int no_sync_cmos_clock ;
void timekeeping_init(void);
extern int timekeeping_suspended;

unsigned long get_seconds(void);
struct timespec current_kernel_time(void);
struct timespec __current_kernel_time(void);
struct timespec __get_wall_to_monotonic(void);
struct timespec get_monotonic_coarse(void);
# 146 "include/linux/time.h"
static inline __attribute__((always_inline)) u32 arch_gettimeoffset(void) { return 0; }


extern void do_gettimeofday(struct timeval *tv);
extern int do_settimeofday(struct timespec *tv);
extern int do_sys_settimeofday(struct timespec *tv, struct timezone *tz);

extern long do_utimes(int dfd, const char *filename, struct timespec *times, int flags);
struct itimerval;
extern int do_setitimer(int which, struct itimerval *value,
   struct itimerval *ovalue);
extern unsigned int alarm_setitimer(unsigned int seconds);
extern int do_getitimer(int which, struct itimerval *value);
extern void getnstimeofday(struct timespec *tv);
extern void getrawmonotonic(struct timespec *ts);
extern void getboottime(struct timespec *ts);
extern void monotonic_to_bootbased(struct timespec *ts);

extern struct timespec timespec_trunc(struct timespec t, unsigned gran);
extern int timekeeping_valid_for_hres(void);
extern u64 timekeeping_max_deferment(void);
extern void update_wall_time(void);
extern void timekeeping_leap_insert(int leapsecond);

struct tms;
extern void do_sys_times(struct tms *);





struct tm {




 int tm_sec;

 int tm_min;

 int tm_hour;

 int tm_mday;

 int tm_mon;

 long tm_year;

 int tm_wday;

 int tm_yday;
};

void time_to_tm(time_t totalsecs, int offset, struct tm *result);
# 208 "include/linux/time.h"
static inline __attribute__((always_inline)) s64 timespec_to_ns(const struct timespec *ts)
{
 return ((s64) ts->tv_sec * 1000000000L) + ts->tv_nsec;
}
# 220 "include/linux/time.h"
static inline __attribute__((always_inline)) s64 timeval_to_ns(const struct timeval *tv)
{
 return ((s64) tv->tv_sec * 1000000000L) +
  tv->tv_usec * 1000L;
}







extern struct timespec ns_to_timespec(const s64 nsec);







extern struct timeval ns_to_timeval(const s64 nsec);
# 250 "include/linux/time.h"
static inline __attribute__((always_inline)) __attribute__((always_inline)) void timespec_add_ns(struct timespec *a, u64 ns)
{
 a->tv_sec += __iter_div_u64_rem(a->tv_nsec + ns, 1000000000L, &ns);
 a->tv_nsec = ns;
}
# 273 "include/linux/time.h"
struct itimerspec {
 struct timespec it_interval;
 struct timespec it_value;
};

struct itimerval {
 struct timeval it_interval;
 struct timeval it_value;
};
# 61 "include/linux/stat.h" 2

struct kstat {
 u64 ino;
 dev_t dev;
 umode_t mode;
 unsigned int nlink;
 uid_t uid;
 gid_t gid;
 dev_t rdev;
 loff_t size;
 struct timespec atime;
 struct timespec mtime;
 struct timespec ctime;
 unsigned long blksize;
 unsigned long long blocks;
};
# 11 "include/linux/module.h" 2


# 1 "include/linux/kmod.h" 1
# 22 "include/linux/kmod.h"
# 1 "include/linux/gfp.h" 1



# 1 "include/linux/mmzone.h" 1
# 9 "include/linux/mmzone.h"
# 1 "include/linux/wait.h" 1
# 26 "include/linux/wait.h"
# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/current.h" 1
# 1 "include/asm-generic/current.h" 1
# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/current.h" 2
# 27 "include/linux/wait.h" 2

typedef struct __wait_queue wait_queue_t;
typedef int (*wait_queue_func_t)(wait_queue_t *wait, unsigned mode, int flags, void *key);
int default_wake_function(wait_queue_t *wait, unsigned mode, int flags, void *key);

struct __wait_queue {
 unsigned int flags;

 void *private;
 wait_queue_func_t func;
 struct list_head task_list;
};

struct wait_bit_key {
 void *flags;
 int bit_nr;
};

struct wait_bit_queue {
 struct wait_bit_key key;
 wait_queue_t wait;
};

struct __wait_queue_head {
 spinlock_t lock;
 struct list_head task_list;
};
typedef struct __wait_queue_head wait_queue_head_t;

struct task_struct;
# 80 "include/linux/wait.h"
extern void __init_waitqueue_head(wait_queue_head_t *q, struct lock_class_key *);
# 98 "include/linux/wait.h"
static inline __attribute__((always_inline)) void init_waitqueue_entry(wait_queue_t *q, struct task_struct *p)
{
 q->flags = 0;
 q->private = p;
 q->func = default_wake_function;
}

static inline __attribute__((always_inline)) void init_waitqueue_func_entry(wait_queue_t *q,
     wait_queue_func_t func)
{
 q->flags = 0;
 q->private = ((void *)0);
 q->func = func;
}

static inline __attribute__((always_inline)) int waitqueue_active(wait_queue_head_t *q)
{
 return !list_empty(&q->task_list);
}

extern void add_wait_queue(wait_queue_head_t *q, wait_queue_t *wait);
extern void add_wait_queue_exclusive(wait_queue_head_t *q, wait_queue_t *wait);
extern void remove_wait_queue(wait_queue_head_t *q, wait_queue_t *wait);

static inline __attribute__((always_inline)) void __add_wait_queue(wait_queue_head_t *head, wait_queue_t *new)
{
 list_add(&new->task_list, &head->task_list);
}




static inline __attribute__((always_inline)) void __add_wait_queue_exclusive(wait_queue_head_t *q,
           wait_queue_t *wait)
{
 wait->flags |= 0x01;
 __add_wait_queue(q, wait);
}

static inline __attribute__((always_inline)) void __add_wait_queue_tail(wait_queue_head_t *head,
      wait_queue_t *new)
{
 list_add_tail(&new->task_list, &head->task_list);
}

static inline __attribute__((always_inline)) void __add_wait_queue_tail_exclusive(wait_queue_head_t *q,
           wait_queue_t *wait)
{
 wait->flags |= 0x01;
 __add_wait_queue_tail(q, wait);
}

static inline __attribute__((always_inline)) void __remove_wait_queue(wait_queue_head_t *head,
       wait_queue_t *old)
{
 list_del(&old->task_list);
}

void __wake_up(wait_queue_head_t *q, unsigned int mode, int nr, void *key);
void __wake_up_locked_key(wait_queue_head_t *q, unsigned int mode, void *key);
void __wake_up_sync_key(wait_queue_head_t *q, unsigned int mode, int nr,
   void *key);
void __wake_up_locked(wait_queue_head_t *q, unsigned int mode);
void __wake_up_sync(wait_queue_head_t *q, unsigned int mode, int nr);
void __wake_up_bit(wait_queue_head_t *, void *, int);
int __wait_on_bit(wait_queue_head_t *, struct wait_bit_queue *, int (*)(void *), unsigned);
int __wait_on_bit_lock(wait_queue_head_t *, struct wait_bit_queue *, int (*)(void *), unsigned);
void wake_up_bit(void *, int);
int out_of_line_wait_on_bit(void *, int, int (*)(void *), unsigned);
int out_of_line_wait_on_bit_lock(void *, int, int (*)(void *), unsigned);
wait_queue_head_t *bit_waitqueue(void *, int);
# 574 "include/linux/wait.h"
extern void sleep_on(wait_queue_head_t *q);
extern long sleep_on_timeout(wait_queue_head_t *q,
          signed long timeout);
extern void interruptible_sleep_on(wait_queue_head_t *q);
extern long interruptible_sleep_on_timeout(wait_queue_head_t *q,
        signed long timeout);




void prepare_to_wait(wait_queue_head_t *q, wait_queue_t *wait, int state);
void prepare_to_wait_exclusive(wait_queue_head_t *q, wait_queue_t *wait, int state);
void finish_wait(wait_queue_head_t *q, wait_queue_t *wait);
void abort_exclusive_wait(wait_queue_head_t *q, wait_queue_t *wait,
   unsigned int mode, void *key);
int autoremove_wake_function(wait_queue_t *wait, unsigned mode, int sync, void *key);
int wake_bit_function(wait_queue_t *wait, unsigned mode, int sync, void *key);
# 634 "include/linux/wait.h"
static inline __attribute__((always_inline)) int wait_on_bit(void *word, int bit,
    int (*action)(void *), unsigned mode)
{
 if (!test_bit(bit, word))
  return 0;
 return out_of_line_wait_on_bit(word, bit, action, mode);
}
# 658 "include/linux/wait.h"
static inline __attribute__((always_inline)) int wait_on_bit_lock(void *word, int bit,
    int (*action)(void *), unsigned mode)
{
 if (!test_and_set_bit(bit, word))
  return 0;
 return out_of_line_wait_on_bit_lock(word, bit, action, mode);
}
# 10 "include/linux/mmzone.h" 2



# 1 "include/linux/numa.h" 1
# 14 "include/linux/mmzone.h" 2
# 1 "include/linux/init.h" 1
# 131 "include/linux/init.h"
typedef int (*initcall_t)(void);
typedef void (*exitcall_t)(void);

extern initcall_t __con_initcall_start[], __con_initcall_end[];
extern initcall_t __security_initcall_start[], __security_initcall_end[];


typedef void (*ctor_fn_t)(void);


extern int do_one_initcall(initcall_t fn);
extern char __attribute__ ((__section__(".init.data"))) boot_command_line[];
extern char *saved_command_line;
extern unsigned int reset_devices;


void setup_arch(char **);
void prepare_namespace(void);

extern void (*late_time_init)(void);

extern int initcall_debug;
# 15 "include/linux/mmzone.h" 2

# 1 "include/linux/nodemask.h" 1
# 96 "include/linux/nodemask.h"
typedef struct { unsigned long bits[((((1 << 0)) + (8 * sizeof(long)) - 1) / (8 * sizeof(long)))]; } nodemask_t;
extern nodemask_t _unused_nodemask_arg_;


static inline __attribute__((always_inline)) void __node_set(int node, volatile nodemask_t *dstp)
{
 set_bit(node, dstp->bits);
}


static inline __attribute__((always_inline)) void __node_clear(int node, volatile nodemask_t *dstp)
{
 clear_bit(node, dstp->bits);
}


static inline __attribute__((always_inline)) void __nodes_setall(nodemask_t *dstp, int nbits)
{
 bitmap_fill(dstp->bits, nbits);
}


static inline __attribute__((always_inline)) void __nodes_clear(nodemask_t *dstp, int nbits)
{
 bitmap_zero(dstp->bits, nbits);
}






static inline __attribute__((always_inline)) int __node_test_and_set(int node, nodemask_t *addr)
{
 return test_and_set_bit(node, addr->bits);
}



static inline __attribute__((always_inline)) void __nodes_and(nodemask_t *dstp, const nodemask_t *src1p,
     const nodemask_t *src2p, int nbits)
{
 bitmap_and(dstp->bits, src1p->bits, src2p->bits, nbits);
}



static inline __attribute__((always_inline)) void __nodes_or(nodemask_t *dstp, const nodemask_t *src1p,
     const nodemask_t *src2p, int nbits)
{
 bitmap_or(dstp->bits, src1p->bits, src2p->bits, nbits);
}



static inline __attribute__((always_inline)) void __nodes_xor(nodemask_t *dstp, const nodemask_t *src1p,
     const nodemask_t *src2p, int nbits)
{
 bitmap_xor(dstp->bits, src1p->bits, src2p->bits, nbits);
}



static inline __attribute__((always_inline)) void __nodes_andnot(nodemask_t *dstp, const nodemask_t *src1p,
     const nodemask_t *src2p, int nbits)
{
 bitmap_andnot(dstp->bits, src1p->bits, src2p->bits, nbits);
}



static inline __attribute__((always_inline)) void __nodes_complement(nodemask_t *dstp,
     const nodemask_t *srcp, int nbits)
{
 bitmap_complement(dstp->bits, srcp->bits, nbits);
}



static inline __attribute__((always_inline)) int __nodes_equal(const nodemask_t *src1p,
     const nodemask_t *src2p, int nbits)
{
 return bitmap_equal(src1p->bits, src2p->bits, nbits);
}



static inline __attribute__((always_inline)) int __nodes_intersects(const nodemask_t *src1p,
     const nodemask_t *src2p, int nbits)
{
 return bitmap_intersects(src1p->bits, src2p->bits, nbits);
}



static inline __attribute__((always_inline)) int __nodes_subset(const nodemask_t *src1p,
     const nodemask_t *src2p, int nbits)
{
 return bitmap_subset(src1p->bits, src2p->bits, nbits);
}


static inline __attribute__((always_inline)) int __nodes_empty(const nodemask_t *srcp, int nbits)
{
 return bitmap_empty(srcp->bits, nbits);
}


static inline __attribute__((always_inline)) int __nodes_full(const nodemask_t *srcp, int nbits)
{
 return bitmap_full(srcp->bits, nbits);
}


static inline __attribute__((always_inline)) int __nodes_weight(const nodemask_t *srcp, int nbits)
{
 return bitmap_weight(srcp->bits, nbits);
}



static inline __attribute__((always_inline)) void __nodes_shift_right(nodemask_t *dstp,
     const nodemask_t *srcp, int n, int nbits)
{
 bitmap_shift_right(dstp->bits, srcp->bits, n, nbits);
}



static inline __attribute__((always_inline)) void __nodes_shift_left(nodemask_t *dstp,
     const nodemask_t *srcp, int n, int nbits)
{
 bitmap_shift_left(dstp->bits, srcp->bits, n, nbits);
}





static inline __attribute__((always_inline)) int __first_node(const nodemask_t *srcp)
{
 return ({ int __min1 = ((1 << 0)); int __min2 = (find_next_bit((srcp->bits), ((1 << 0)), 0)); __min1 < __min2 ? __min1: __min2; });
}


static inline __attribute__((always_inline)) int __next_node(int n, const nodemask_t *srcp)
{
 return ({ int __min1 = ((1 << 0)); int __min2 = (find_next_bit(srcp->bits, (1 << 0), n+1)); __min1 < __min2 ? __min1: __min2; });
}

static inline __attribute__((always_inline)) void init_nodemask_of_node(nodemask_t *mask, int node)
{
 __nodes_clear(&(*mask), (1 << 0));
 __node_set((node), &(*mask));
}
# 264 "include/linux/nodemask.h"
static inline __attribute__((always_inline)) int __first_unset_node(const nodemask_t *maskp)
{
 return ({ int __min1 = ((1 << 0)); int __min2 = (find_next_zero_bit((maskp->bits), ((1 << 0)), 0)); __min1 < __min2 ? __min1: __min2; });

}
# 298 "include/linux/nodemask.h"
static inline __attribute__((always_inline)) int __nodemask_scnprintf(char *buf, int len,
     const nodemask_t *srcp, int nbits)
{
 return bitmap_scnprintf(buf, len, srcp->bits, nbits);
}



static inline __attribute__((always_inline)) int __nodemask_parse_user(const char *buf, int len,
     nodemask_t *dstp, int nbits)
{
 return bitmap_parse_user(buf, len, dstp->bits, nbits);
}



static inline __attribute__((always_inline)) int __nodelist_scnprintf(char *buf, int len,
     const nodemask_t *srcp, int nbits)
{
 return bitmap_scnlistprintf(buf, len, srcp->bits, nbits);
}


static inline __attribute__((always_inline)) int __nodelist_parse(const char *buf, nodemask_t *dstp, int nbits)
{
 return bitmap_parselist(buf, dstp->bits, nbits);
}



static inline __attribute__((always_inline)) int __node_remap(int oldbit,
  const nodemask_t *oldp, const nodemask_t *newp, int nbits)
{
 return bitmap_bitremap(oldbit, oldp->bits, newp->bits, nbits);
}



static inline __attribute__((always_inline)) void __nodes_remap(nodemask_t *dstp, const nodemask_t *srcp,
  const nodemask_t *oldp, const nodemask_t *newp, int nbits)
{
 bitmap_remap(dstp->bits, srcp->bits, oldp->bits, newp->bits, nbits);
}



static inline __attribute__((always_inline)) void __nodes_onto(nodemask_t *dstp, const nodemask_t *origp,
  const nodemask_t *relmapp, int nbits)
{
 bitmap_onto(dstp->bits, origp->bits, relmapp->bits, nbits);
}



static inline __attribute__((always_inline)) void __nodes_fold(nodemask_t *dstp, const nodemask_t *origp,
  int sz, int nbits)
{
 bitmap_fold(dstp->bits, origp->bits, sz, nbits);
}
# 372 "include/linux/nodemask.h"
enum node_states {
 N_POSSIBLE,
 N_ONLINE,
 N_NORMAL_MEMORY,



 N_HIGH_MEMORY = N_NORMAL_MEMORY,

 N_CPU,
 NR_NODE_STATES
};






extern nodemask_t node_states[NR_NODE_STATES];
# 435 "include/linux/nodemask.h"
static inline __attribute__((always_inline)) int node_state(int node, enum node_states state)
{
 return node == 0;
}

static inline __attribute__((always_inline)) void node_set_state(int node, enum node_states state)
{
}

static inline __attribute__((always_inline)) void node_clear_state(int node, enum node_states state)
{
}

static inline __attribute__((always_inline)) int num_node_state(enum node_states state)
{
 return 1;
}
# 491 "include/linux/nodemask.h"
struct nodemask_scratch {
 nodemask_t mask1;
 nodemask_t mask2;
};
# 17 "include/linux/mmzone.h" 2
# 1 "include/linux/pageblock-flags.h" 1
# 29 "include/linux/pageblock-flags.h"
enum pageblock_bits {
 PB_migrate,
 PB_migrate_end = PB_migrate + 3 - 1,

 NR_PAGEBLOCK_BITS
};
# 60 "include/linux/pageblock-flags.h"
struct page;


unsigned long get_pageblock_flags_group(struct page *page,
     int start_bitidx, int end_bitidx);
void set_pageblock_flags_group(struct page *page, unsigned long flags,
     int start_bitidx, int end_bitidx);
# 18 "include/linux/mmzone.h" 2
# 1 "include/generated/bounds.h" 1
# 19 "include/linux/mmzone.h" 2

# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/page.h" 1
# 45 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/page.h"
# 1 "include/linux/pfn.h" 1
# 46 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/page.h" 2
# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/io.h" 1
# 23 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/io.h"
# 1 "include/asm-generic/iomap.h" 1
# 28 "include/asm-generic/iomap.h"
extern unsigned int ioread8(void *);
extern unsigned int ioread16(void *);
extern unsigned int ioread16be(void *);
extern unsigned int ioread32(void *);
extern unsigned int ioread32be(void *);

extern void iowrite8(u8, void *);
extern void iowrite16(u16, void *);
extern void iowrite16be(u16, void *);
extern void iowrite32(u32, void *);
extern void iowrite32be(u32, void *);
# 51 "include/asm-generic/iomap.h"
extern void ioread8_rep(void *port, void *buf, unsigned long count);
extern void ioread16_rep(void *port, void *buf, unsigned long count);
extern void ioread32_rep(void *port, void *buf, unsigned long count);

extern void iowrite8_rep(void *port, const void *buf, unsigned long count);
extern void iowrite16_rep(void *port, const void *buf, unsigned long count);
extern void iowrite32_rep(void *port, const void *buf, unsigned long count);


extern void *ioport_map(unsigned long port, unsigned int nr);
extern void ioport_unmap(void *);






struct pci_dev;
extern void *pci_iomap(struct pci_dev *dev, int bar, unsigned long max);
extern void pci_iounmap(struct pci_dev *dev, void *);
# 24 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/io.h" 2
# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/page.h" 1
# 25 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/io.h" 2
# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/pgtable-bits.h" 1
# 156 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/pgtable-bits.h"
static inline __attribute__((always_inline)) uint64_t pte_to_entrylo(unsigned long pte_val)
{
 if (0) {
  int sa;

  sa = 31 - (0 ? (0 ? (((((0 ? (0) : (0) + 1) + 1) + 1) + 1)) + 1 : (((((0 ? (0) : (0) + 1) + 1) + 1) + 1))) + 1 : (0 ? (((((0 ? (0) : (0) + 1) + 1) + 1) + 1)) + 1 : (((((0 ? (0) : (0) + 1) + 1) + 1) + 1))));
# 170 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/pgtable-bits.h"
  return (pte_val >> ((0 ? (0 ? (((((0 ? (0) : (0) + 1) + 1) + 1) + 1)) + 1 : (((((0 ? (0) : (0) + 1) + 1) + 1) + 1))) + 1 : (0 ? (((((0 ? (0) : (0) + 1) + 1) + 1) + 1)) + 1 : (((((0 ? (0) : (0) + 1) + 1) + 1) + 1)))) + 1)) |
   ((pte_val & (({if (!0) BUG(); 1 << (0 ? (((((0 ? (0) : (0) + 1) + 1) + 1) + 1)) + 1 : (((((0 ? (0) : (0) + 1) + 1) + 1) + 1))); }) | ({if (!0) BUG(); 1 << (0 ? (0 ? (((((0 ? (0) : (0) + 1) + 1) + 1) + 1)) + 1 : (((((0 ? (0) : (0) + 1) + 1) + 1) + 1))) + 1 : (0 ? (((((0 ? (0) : (0) + 1) + 1) + 1) + 1)) + 1 : (((((0 ? (0) : (0) + 1) + 1) + 1) + 1)))); }))) << sa);
 }

 return pte_val >> ((0 ? (0 ? (((((0 ? (0) : (0) + 1) + 1) + 1) + 1)) + 1 : (((((0 ? (0) : (0) + 1) + 1) + 1) + 1))) + 1 : (0 ? (((((0 ? (0) : (0) + 1) + 1) + 1) + 1)) + 1 : (((((0 ? (0) : (0) + 1) + 1) + 1) + 1)))) + 1);
}
# 26 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/io.h" 2



# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/mach-generic/ioremap.h" 1
# 18 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/mach-generic/ioremap.h"
static inline __attribute__((always_inline)) phys_t fixup_bigphys_addr(phys_t phys_addr, phys_t size)
{
 return phys_addr;
}

static inline __attribute__((always_inline)) void *plat_ioremap(phys_t offset, unsigned long size,
 unsigned long flags)
{
 return ((void *)0);
}

static inline __attribute__((always_inline)) int plat_iounmap(const volatile void *addr)
{
 return 0;
}
# 30 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/io.h" 2
# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/mach-generic/mangle-port.h" 1
# 12 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/mach-generic/mangle-port.h"
extern unsigned char io_swap_noneed;
# 31 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/io.h" 2
# 61 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/io.h"
extern const unsigned long mips_io_port_base;
# 72 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/io.h"
static inline __attribute__((always_inline)) void set_io_port_base(unsigned long base)
{
 * (unsigned long *) &mips_io_port_base = base;
 __asm__ __volatile__("": : :"memory");
}
# 117 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/io.h"
static inline __attribute__((always_inline)) unsigned long virt_to_phys(volatile const void *address)
{
 return (unsigned long)address - ((0x80000000UL) + (0UL)) + (0UL);
}
# 134 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/io.h"
static inline __attribute__((always_inline)) void * phys_to_virt(unsigned long address)
{
 return (void *)(address + ((0x80000000UL) + (0UL)) - (0UL));
}




static inline __attribute__((always_inline)) unsigned long isa_virt_to_bus(volatile void * address)
{
 return (unsigned long)address - ((0x80000000UL) + (0UL));
}

static inline __attribute__((always_inline)) void * isa_bus_to_virt(unsigned long address)
{
 return (void *)(address + ((0x80000000UL) + (0UL)));
}
# 168 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/io.h"
extern void * __ioremap(phys_t offset, phys_t size, unsigned long flags);
extern void __iounmap(const volatile void *addr);

static inline __attribute__((always_inline)) void * __ioremap_mode(phys_t offset, unsigned long size,
 unsigned long flags)
{
 void *addr = plat_ioremap(offset, size, flags);

 if (addr)
  return addr;



 if (0) {
  u64 base = (0xa0000000UL);





  if (flags == (2<<(((((0 ? (0 ? (((((0 ? (0) : (0) + 1) + 1) + 1) + 1)) + 1 : (((((0 ? (0) : (0) + 1) + 1) + 1) + 1))) + 1 : (0 ? (((((0 ? (0) : (0) + 1) + 1) + 1) + 1)) + 1 : (((((0 ? (0) : (0) + 1) + 1) + 1) + 1)))) + 1) + 1) + 1) + 1)))
   base = (u64) (0xa0000000UL);
  return (void *) (unsigned long) (base + offset);
 } else if (__builtin_constant_p(offset) &&
     __builtin_constant_p(size) && __builtin_constant_p(flags)) {
  phys_t phys_addr, last_addr;

  phys_addr = fixup_bigphys_addr(offset, size);


  last_addr = phys_addr + size - 1;
  if (!size || last_addr < phys_addr)
   return ((void *)0);





  if ((!((phys_t)(phys_addr) & (phys_t) ~0x1fffffffULL)) && (!((phys_t)(last_addr) & (phys_t) ~0x1fffffffULL)) &&
      flags == (2<<(((((0 ? (0 ? (((((0 ? (0) : (0) + 1) + 1) + 1) + 1)) + 1 : (((((0 ? (0) : (0) + 1) + 1) + 1) + 1))) + 1 : (0 ? (((((0 ? (0) : (0) + 1) + 1) + 1) + 1)) + 1 : (((((0 ? (0) : (0) + 1) + 1) + 1) + 1)))) + 1) + 1) + 1) + 1)))
   return (void *)
    (unsigned long)((((int)(int)(phys_addr)) & 0x1fffffff) | 0xa0000000);
 }

 return __ioremap(offset, size, flags);


}
# 282 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/io.h"
static inline __attribute__((always_inline)) void iounmap(const volatile void *addr)
{
 if (plat_iounmap(addr))
  return;



 if (0 ||
     (__builtin_constant_p(addr) && (((unsigned long)(addr) & ~0x1fffffffUL) == 0xa0000000)))
  return;

 __iounmap(addr);


}
# 497 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/io.h"
static inline __attribute__((always_inline)) void __raw_writeb(u8 val, volatile void *mem) { volatile u8 *__mem; u8 __val; do { } while (0); __mem = (void *)((unsigned long)(mem)); __val = (val); if (sizeof(u8) != sizeof(u64) || sizeof(u64) == sizeof(long)) *__mem = __val; else if ((cpu_data[0].isa_level & (0x00000004 | 0x00000008 | 0x00000010 | 0x00000080 | 0x00000100))) { unsigned long __flags; u8 __tmp; if (1) do { ({ unsigned long __dummy; typeof(__flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); __asm__ __volatile__( "raw_local_irq_save\t%0" : "=r" (__flags) : : "memory"); do { } while (0); } while (0); __asm__ __volatile__( ".set	mips3" "\t\t# __writeq""\n\t" "dsll32	%L0, %L0, 0" "\n\t" "dsrl32	%L0, %L0, 0" "\n\t" "dsll32	%M0, %M0, 0" "\n\t" "or	%L0, %L0, %M0" "\n\t" "sd	%L0, %2" "\n\t" ".set	mips0" "\n" : "=r" (__tmp) : "0" (__val), "m" (*__mem)); if (1) do { ({ unsigned long __dummy; typeof(__flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); if (raw_irqs_disabled_flags(__flags)) { raw_local_irq_restore(__flags); do { } while (0); } else { do { } while (0); raw_local_irq_restore(__flags); } } while (0); } else BUG(); } static inline __attribute__((always_inline)) u8 __raw_readb(const volatile void *mem) { volatile u8 *__mem; u8 __val; __mem = (void *)((unsigned long)(mem)); if (sizeof(u8) != sizeof(u64) || sizeof(u64) == sizeof(long)) __val = *__mem; else if ((cpu_data[0].isa_level & (0x00000004 | 0x00000008 | 0x00000010 | 0x00000080 | 0x00000100))) { unsigned long __flags; if (1) do { ({ unsigned long __dummy; typeof(__flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); __asm__ __volatile__( "raw_local_irq_save\t%0" : "=r" (__flags) : : "memory"); do { } while (0); } while (0); __asm__ __volatile__( ".set	mips3" "\t\t# __readq" "\n\t" "ld	%L0, %1" "\n\t" "dsra32	%M0, %L0, 0" "\n\t" "sll	%L0, %L0, 0" "\n\t" ".set	mips0" "\n" : "=r" (__val) : "m" (*__mem)); if (1) do { ({ unsigned long __dummy; typeof(__flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); if (raw_irqs_disabled_flags(__flags)) { raw_local_irq_restore(__flags); do { } while (0); } else { do { } while (0); raw_local_irq_restore(__flags); } } while (0); } else { __val = 0; BUG(); } return (__val); } static inline __attribute__((always_inline)) void writeb(u8 val, volatile void *mem) { volatile u8 *__mem; u8 __val; do { } while (0); __mem = (void *)((unsigned long)(mem)); __val = (val); if (sizeof(u8) != sizeof(u64) || sizeof(u64) == sizeof(long)) *__mem = __val; else if ((cpu_data[0].isa_level & (0x00000004 | 0x00000008 | 0x00000010 | 0x00000080 | 0x00000100))) { unsigned long __flags; u8 __tmp; if (1) do { ({ unsigned long __dummy; typeof(__flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); __asm__ __volatile__( "raw_local_irq_save\t%0" : "=r" (__flags) : : "memory"); do { } while (0); } while (0); __asm__ __volatile__( ".set	mips3" "\t\t# __writeq""\n\t" "dsll32	%L0, %L0, 0" "\n\t" "dsrl32	%L0, %L0, 0" "\n\t" "dsll32	%M0, %M0, 0" "\n\t" "or	%L0, %L0, %M0" "\n\t" "sd	%L0, %2" "\n\t" ".set	mips0" "\n" : "=r" (__tmp) : "0" (__val), "m" (*__mem)); if (1) do { ({ unsigned long __dummy; typeof(__flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); if (raw_irqs_disabled_flags(__flags)) { raw_local_irq_restore(__flags); do { } while (0); } else { do { } while (0); raw_local_irq_restore(__flags); } } while (0); } else BUG(); } static inline __attribute__((always_inline)) u8 readb(const volatile void *mem) { volatile u8 *__mem; u8 __val; __mem = (void *)((unsigned long)(mem)); if (sizeof(u8) != sizeof(u64) || sizeof(u64) == sizeof(long)) __val = *__mem; else if ((cpu_data[0].isa_level & (0x00000004 | 0x00000008 | 0x00000010 | 0x00000080 | 0x00000100))) { unsigned long __flags; if (1) do { ({ unsigned long __dummy; typeof(__flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); __asm__ __volatile__( "raw_local_irq_save\t%0" : "=r" (__flags) : : "memory"); do { } while (0); } while (0); __asm__ __volatile__( ".set	mips3" "\t\t# __readq" "\n\t" "ld	%L0, %1" "\n\t" "dsra32	%M0, %L0, 0" "\n\t" "sll	%L0, %L0, 0" "\n\t" ".set	mips0" "\n" : "=r" (__val) : "m" (*__mem)); if (1) do { ({ unsigned long __dummy; typeof(__flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); if (raw_irqs_disabled_flags(__flags)) { raw_local_irq_restore(__flags); do { } while (0); } else { do { } while (0); raw_local_irq_restore(__flags); } } while (0); } else { __val = 0; BUG(); } return (__val); } static inline __attribute__((always_inline)) void __mem_writeb(u8 val, volatile void *mem) { volatile u8 *__mem; u8 __val; do { } while (0); __mem = (void *)((unsigned long)(mem)); __val = (val); if (sizeof(u8) != sizeof(u64) || sizeof(u64) == sizeof(long)) *__mem = __val; else if ((cpu_data[0].isa_level & (0x00000004 | 0x00000008 | 0x00000010 | 0x00000080 | 0x00000100))) { unsigned long __flags; u8 __tmp; if (1) do { ({ unsigned long __dummy; typeof(__flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); __asm__ __volatile__( "raw_local_irq_save\t%0" : "=r" (__flags) : : "memory"); do { } while (0); } while (0); __asm__ __volatile__( ".set	mips3" "\t\t# __writeq""\n\t" "dsll32	%L0, %L0, 0" "\n\t" "dsrl32	%L0, %L0, 0" "\n\t" "dsll32	%M0, %M0, 0" "\n\t" "or	%L0, %L0, %M0" "\n\t" "sd	%L0, %2" "\n\t" ".set	mips0" "\n" : "=r" (__tmp) : "0" (__val), "m" (*__mem)); if (1) do { ({ unsigned long __dummy; typeof(__flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); if (raw_irqs_disabled_flags(__flags)) { raw_local_irq_restore(__flags); do { } while (0); } else { do { } while (0); raw_local_irq_restore(__flags); } } while (0); } else BUG(); } static inline __attribute__((always_inline)) u8 __mem_readb(const volatile void *mem) { volatile u8 *__mem; u8 __val; __mem = (void *)((unsigned long)(mem)); if (sizeof(u8) != sizeof(u64) || sizeof(u64) == sizeof(long)) __val = *__mem; else if ((cpu_data[0].isa_level & (0x00000004 | 0x00000008 | 0x00000010 | 0x00000080 | 0x00000100))) { unsigned long __flags; if (1) do { ({ unsigned long __dummy; typeof(__flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); __asm__ __volatile__( "raw_local_irq_save\t%0" : "=r" (__flags) : : "memory"); do { } while (0); } while (0); __asm__ __volatile__( ".set	mips3" "\t\t# __readq" "\n\t" "ld	%L0, %1" "\n\t" "dsra32	%M0, %L0, 0" "\n\t" "sll	%L0, %L0, 0" "\n\t" ".set	mips0" "\n" : "=r" (__val) : "m" (*__mem)); if (1) do { ({ unsigned long __dummy; typeof(__flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); if (raw_irqs_disabled_flags(__flags)) { raw_local_irq_restore(__flags); do { } while (0); } else { do { } while (0); raw_local_irq_restore(__flags); } } while (0); } else { __val = 0; BUG(); } return (__val); }
static inline __attribute__((always_inline)) void __raw_writew(u16 val, volatile void *mem) { volatile u16 *__mem; u16 __val; do { } while (0); __mem = (void *)((unsigned long)(mem)); __val = (val); if (sizeof(u16) != sizeof(u64) || sizeof(u64) == sizeof(long)) *__mem = __val; else if ((cpu_data[0].isa_level & (0x00000004 | 0x00000008 | 0x00000010 | 0x00000080 | 0x00000100))) { unsigned long __flags; u16 __tmp; if (1) do { ({ unsigned long __dummy; typeof(__flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); __asm__ __volatile__( "raw_local_irq_save\t%0" : "=r" (__flags) : : "memory"); do { } while (0); } while (0); __asm__ __volatile__( ".set	mips3" "\t\t# __writeq""\n\t" "dsll32	%L0, %L0, 0" "\n\t" "dsrl32	%L0, %L0, 0" "\n\t" "dsll32	%M0, %M0, 0" "\n\t" "or	%L0, %L0, %M0" "\n\t" "sd	%L0, %2" "\n\t" ".set	mips0" "\n" : "=r" (__tmp) : "0" (__val), "m" (*__mem)); if (1) do { ({ unsigned long __dummy; typeof(__flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); if (raw_irqs_disabled_flags(__flags)) { raw_local_irq_restore(__flags); do { } while (0); } else { do { } while (0); raw_local_irq_restore(__flags); } } while (0); } else BUG(); } static inline __attribute__((always_inline)) u16 __raw_readw(const volatile void *mem) { volatile u16 *__mem; u16 __val; __mem = (void *)((unsigned long)(mem)); if (sizeof(u16) != sizeof(u64) || sizeof(u64) == sizeof(long)) __val = *__mem; else if ((cpu_data[0].isa_level & (0x00000004 | 0x00000008 | 0x00000010 | 0x00000080 | 0x00000100))) { unsigned long __flags; if (1) do { ({ unsigned long __dummy; typeof(__flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); __asm__ __volatile__( "raw_local_irq_save\t%0" : "=r" (__flags) : : "memory"); do { } while (0); } while (0); __asm__ __volatile__( ".set	mips3" "\t\t# __readq" "\n\t" "ld	%L0, %1" "\n\t" "dsra32	%M0, %L0, 0" "\n\t" "sll	%L0, %L0, 0" "\n\t" ".set	mips0" "\n" : "=r" (__val) : "m" (*__mem)); if (1) do { ({ unsigned long __dummy; typeof(__flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); if (raw_irqs_disabled_flags(__flags)) { raw_local_irq_restore(__flags); do { } while (0); } else { do { } while (0); raw_local_irq_restore(__flags); } } while (0); } else { __val = 0; BUG(); } return (__val); } static inline __attribute__((always_inline)) void writew(u16 val, volatile void *mem) { volatile u16 *__mem; u16 __val; do { } while (0); __mem = (void *)((unsigned long)(mem)); __val = (io_swap_noneed ? (val) : (__builtin_constant_p((__u16)(( __u16)(__le16)(val))) ? ((__u16)( (((__u16)(( __u16)(__le16)(val)) & (__u16)0x00ffU) << 8) | (((__u16)(( __u16)(__le16)(val)) & (__u16)0xff00U) >> 8))) : __fswab16(( __u16)(__le16)(val))) ); if (sizeof(u16) != sizeof(u64) || sizeof(u64) == sizeof(long)) *__mem = __val; else if ((cpu_data[0].isa_level & (0x00000004 | 0x00000008 | 0x00000010 | 0x00000080 | 0x00000100))) { unsigned long __flags; u16 __tmp; if (1) do { ({ unsigned long __dummy; typeof(__flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); __asm__ __volatile__( "raw_local_irq_save\t%0" : "=r" (__flags) : : "memory"); do { } while (0); } while (0); __asm__ __volatile__( ".set	mips3" "\t\t# __writeq""\n\t" "dsll32	%L0, %L0, 0" "\n\t" "dsrl32	%L0, %L0, 0" "\n\t" "dsll32	%M0, %M0, 0" "\n\t" "or	%L0, %L0, %M0" "\n\t" "sd	%L0, %2" "\n\t" ".set	mips0" "\n" : "=r" (__tmp) : "0" (__val), "m" (*__mem)); if (1) do { ({ unsigned long __dummy; typeof(__flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); if (raw_irqs_disabled_flags(__flags)) { raw_local_irq_restore(__flags); do { } while (0); } else { do { } while (0); raw_local_irq_restore(__flags); } } while (0); } else BUG(); } static inline __attribute__((always_inline)) u16 readw(const volatile void *mem) { volatile u16 *__mem; u16 __val; __mem = (void *)((unsigned long)(mem)); if (sizeof(u16) != sizeof(u64) || sizeof(u64) == sizeof(long)) __val = *__mem; else if ((cpu_data[0].isa_level & (0x00000004 | 0x00000008 | 0x00000010 | 0x00000080 | 0x00000100))) { unsigned long __flags; if (1) do { ({ unsigned long __dummy; typeof(__flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); __asm__ __volatile__( "raw_local_irq_save\t%0" : "=r" (__flags) : : "memory"); do { } while (0); } while (0); __asm__ __volatile__( ".set	mips3" "\t\t# __readq" "\n\t" "ld	%L0, %1" "\n\t" "dsra32	%M0, %L0, 0" "\n\t" "sll	%L0, %L0, 0" "\n\t" ".set	mips0" "\n" : "=r" (__val) : "m" (*__mem)); if (1) do { ({ unsigned long __dummy; typeof(__flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); if (raw_irqs_disabled_flags(__flags)) { raw_local_irq_restore(__flags); do { } while (0); } else { do { } while (0); raw_local_irq_restore(__flags); } } while (0); } else { __val = 0; BUG(); } return (io_swap_noneed ? (__val) : (__builtin_constant_p((__u16)(( __u16)(__le16)(__val))) ? ((__u16)( (((__u16)(( __u16)(__le16)(__val)) & (__u16)0x00ffU) << 8) | (((__u16)(( __u16)(__le16)(__val)) & (__u16)0xff00U) >> 8))) : __fswab16(( __u16)(__le16)(__val))) ); } static inline __attribute__((always_inline)) void __mem_writew(u16 val, volatile void *mem) { volatile u16 *__mem; u16 __val; do { } while (0); __mem = (void *)((unsigned long)(mem)); __val = (io_swap_noneed ? (( __le16)(__builtin_constant_p((__u16)((val))) ? ((__u16)( (((__u16)((val)) & (__u16)0x00ffU) << 8) | (((__u16)((val)) & (__u16)0xff00U) >> 8))) : __fswab16((val)))) : (val) ); if (sizeof(u16) != sizeof(u64) || sizeof(u64) == sizeof(long)) *__mem = __val; else if ((cpu_data[0].isa_level & (0x00000004 | 0x00000008 | 0x00000010 | 0x00000080 | 0x00000100))) { unsigned long __flags; u16 __tmp; if (1) do { ({ unsigned long __dummy; typeof(__flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); __asm__ __volatile__( "raw_local_irq_save\t%0" : "=r" (__flags) : : "memory"); do { } while (0); } while (0); __asm__ __volatile__( ".set	mips3" "\t\t# __writeq""\n\t" "dsll32	%L0, %L0, 0" "\n\t" "dsrl32	%L0, %L0, 0" "\n\t" "dsll32	%M0, %M0, 0" "\n\t" "or	%L0, %L0, %M0" "\n\t" "sd	%L0, %2" "\n\t" ".set	mips0" "\n" : "=r" (__tmp) : "0" (__val), "m" (*__mem)); if (1) do { ({ unsigned long __dummy; typeof(__flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); if (raw_irqs_disabled_flags(__flags)) { raw_local_irq_restore(__flags); do { } while (0); } else { do { } while (0); raw_local_irq_restore(__flags); } } while (0); } else BUG(); } static inline __attribute__((always_inline)) u16 __mem_readw(const volatile void *mem) { volatile u16 *__mem; u16 __val; __mem = (void *)((unsigned long)(mem)); if (sizeof(u16) != sizeof(u64) || sizeof(u64) == sizeof(long)) __val = *__mem; else if ((cpu_data[0].isa_level & (0x00000004 | 0x00000008 | 0x00000010 | 0x00000080 | 0x00000100))) { unsigned long __flags; if (1) do { ({ unsigned long __dummy; typeof(__flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); __asm__ __volatile__( "raw_local_irq_save\t%0" : "=r" (__flags) : : "memory"); do { } while (0); } while (0); __asm__ __volatile__( ".set	mips3" "\t\t# __readq" "\n\t" "ld	%L0, %1" "\n\t" "dsra32	%M0, %L0, 0" "\n\t" "sll	%L0, %L0, 0" "\n\t" ".set	mips0" "\n" : "=r" (__val) : "m" (*__mem)); if (1) do { ({ unsigned long __dummy; typeof(__flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); if (raw_irqs_disabled_flags(__flags)) { raw_local_irq_restore(__flags); do { } while (0); } else { do { } while (0); raw_local_irq_restore(__flags); } } while (0); } else { __val = 0; BUG(); } return (io_swap_noneed ? (( __le16)(__builtin_constant_p((__u16)((__val))) ? ((__u16)( (((__u16)((__val)) & (__u16)0x00ffU) << 8) | (((__u16)((__val)) & (__u16)0xff00U) >> 8))) : __fswab16((__val)))) : (__val) ); }
static inline __attribute__((always_inline)) void __raw_writel(u32 val, volatile void *mem) { volatile u32 *__mem; u32 __val; do { } while (0); __mem = (void *)((unsigned long)(mem)); __val = (val); if (sizeof(u32) != sizeof(u64) || sizeof(u64) == sizeof(long)) *__mem = __val; else if ((cpu_data[0].isa_level & (0x00000004 | 0x00000008 | 0x00000010 | 0x00000080 | 0x00000100))) { unsigned long __flags; u32 __tmp; if (1) do { ({ unsigned long __dummy; typeof(__flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); __asm__ __volatile__( "raw_local_irq_save\t%0" : "=r" (__flags) : : "memory"); do { } while (0); } while (0); __asm__ __volatile__( ".set	mips3" "\t\t# __writeq""\n\t" "dsll32	%L0, %L0, 0" "\n\t" "dsrl32	%L0, %L0, 0" "\n\t" "dsll32	%M0, %M0, 0" "\n\t" "or	%L0, %L0, %M0" "\n\t" "sd	%L0, %2" "\n\t" ".set	mips0" "\n" : "=r" (__tmp) : "0" (__val), "m" (*__mem)); if (1) do { ({ unsigned long __dummy; typeof(__flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); if (raw_irqs_disabled_flags(__flags)) { raw_local_irq_restore(__flags); do { } while (0); } else { do { } while (0); raw_local_irq_restore(__flags); } } while (0); } else BUG(); } static inline __attribute__((always_inline)) u32 __raw_readl(const volatile void *mem) { volatile u32 *__mem; u32 __val; __mem = (void *)((unsigned long)(mem)); if (sizeof(u32) != sizeof(u64) || sizeof(u64) == sizeof(long)) __val = *__mem; else if ((cpu_data[0].isa_level & (0x00000004 | 0x00000008 | 0x00000010 | 0x00000080 | 0x00000100))) { unsigned long __flags; if (1) do { ({ unsigned long __dummy; typeof(__flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); __asm__ __volatile__( "raw_local_irq_save\t%0" : "=r" (__flags) : : "memory"); do { } while (0); } while (0); __asm__ __volatile__( ".set	mips3" "\t\t# __readq" "\n\t" "ld	%L0, %1" "\n\t" "dsra32	%M0, %L0, 0" "\n\t" "sll	%L0, %L0, 0" "\n\t" ".set	mips0" "\n" : "=r" (__val) : "m" (*__mem)); if (1) do { ({ unsigned long __dummy; typeof(__flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); if (raw_irqs_disabled_flags(__flags)) { raw_local_irq_restore(__flags); do { } while (0); } else { do { } while (0); raw_local_irq_restore(__flags); } } while (0); } else { __val = 0; BUG(); } return (__val); } static inline __attribute__((always_inline)) void writel(u32 val, volatile void *mem) { volatile u32 *__mem; u32 __val; do { } while (0); __mem = (void *)((unsigned long)(mem)); __val = (io_swap_noneed ? (val) : (__builtin_constant_p((__u32)(( __u32)(__le32)(val))) ? ((__u32)( (((__u32)(( __u32)(__le32)(val)) & (__u32)0x000000ffUL) << 24) | (((__u32)(( __u32)(__le32)(val)) & (__u32)0x0000ff00UL) << 8) | (((__u32)(( __u32)(__le32)(val)) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(( __u32)(__le32)(val)) & (__u32)0xff000000UL) >> 24))) : __fswab32(( __u32)(__le32)(val))) ); if (sizeof(u32) != sizeof(u64) || sizeof(u64) == sizeof(long)) *__mem = __val; else if ((cpu_data[0].isa_level & (0x00000004 | 0x00000008 | 0x00000010 | 0x00000080 | 0x00000100))) { unsigned long __flags; u32 __tmp; if (1) do { ({ unsigned long __dummy; typeof(__flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); __asm__ __volatile__( "raw_local_irq_save\t%0" : "=r" (__flags) : : "memory"); do { } while (0); } while (0); __asm__ __volatile__( ".set	mips3" "\t\t# __writeq""\n\t" "dsll32	%L0, %L0, 0" "\n\t" "dsrl32	%L0, %L0, 0" "\n\t" "dsll32	%M0, %M0, 0" "\n\t" "or	%L0, %L0, %M0" "\n\t" "sd	%L0, %2" "\n\t" ".set	mips0" "\n" : "=r" (__tmp) : "0" (__val), "m" (*__mem)); if (1) do { ({ unsigned long __dummy; typeof(__flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); if (raw_irqs_disabled_flags(__flags)) { raw_local_irq_restore(__flags); do { } while (0); } else { do { } while (0); raw_local_irq_restore(__flags); } } while (0); } else BUG(); } static inline __attribute__((always_inline)) u32 readl(const volatile void *mem) { volatile u32 *__mem; u32 __val; __mem = (void *)((unsigned long)(mem)); if (sizeof(u32) != sizeof(u64) || sizeof(u64) == sizeof(long)) __val = *__mem; else if ((cpu_data[0].isa_level & (0x00000004 | 0x00000008 | 0x00000010 | 0x00000080 | 0x00000100))) { unsigned long __flags; if (1) do { ({ unsigned long __dummy; typeof(__flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); __asm__ __volatile__( "raw_local_irq_save\t%0" : "=r" (__flags) : : "memory"); do { } while (0); } while (0); __asm__ __volatile__( ".set	mips3" "\t\t# __readq" "\n\t" "ld	%L0, %1" "\n\t" "dsra32	%M0, %L0, 0" "\n\t" "sll	%L0, %L0, 0" "\n\t" ".set	mips0" "\n" : "=r" (__val) : "m" (*__mem)); if (1) do { ({ unsigned long __dummy; typeof(__flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); if (raw_irqs_disabled_flags(__flags)) { raw_local_irq_restore(__flags); do { } while (0); } else { do { } while (0); raw_local_irq_restore(__flags); } } while (0); } else { __val = 0; BUG(); } return (io_swap_noneed ? (__val) : (__builtin_constant_p((__u32)(( __u32)(__le32)(__val))) ? ((__u32)( (((__u32)(( __u32)(__le32)(__val)) & (__u32)0x000000ffUL) << 24) | (((__u32)(( __u32)(__le32)(__val)) & (__u32)0x0000ff00UL) << 8) | (((__u32)(( __u32)(__le32)(__val)) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(( __u32)(__le32)(__val)) & (__u32)0xff000000UL) >> 24))) : __fswab32(( __u32)(__le32)(__val))) ); } static inline __attribute__((always_inline)) void __mem_writel(u32 val, volatile void *mem) { volatile u32 *__mem; u32 __val; do { } while (0); __mem = (void *)((unsigned long)(mem)); __val = (io_swap_noneed ? (( __le32)(__builtin_constant_p((__u32)((val))) ? ((__u32)( (((__u32)((val)) & (__u32)0x000000ffUL) << 24) | (((__u32)((val)) & (__u32)0x0000ff00UL) << 8) | (((__u32)((val)) & (__u32)0x00ff0000UL) >> 8) | (((__u32)((val)) & (__u32)0xff000000UL) >> 24))) : __fswab32((val)))) : (val) ); if (sizeof(u32) != sizeof(u64) || sizeof(u64) == sizeof(long)) *__mem = __val; else if ((cpu_data[0].isa_level & (0x00000004 | 0x00000008 | 0x00000010 | 0x00000080 | 0x00000100))) { unsigned long __flags; u32 __tmp; if (1) do { ({ unsigned long __dummy; typeof(__flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); __asm__ __volatile__( "raw_local_irq_save\t%0" : "=r" (__flags) : : "memory"); do { } while (0); } while (0); __asm__ __volatile__( ".set	mips3" "\t\t# __writeq""\n\t" "dsll32	%L0, %L0, 0" "\n\t" "dsrl32	%L0, %L0, 0" "\n\t" "dsll32	%M0, %M0, 0" "\n\t" "or	%L0, %L0, %M0" "\n\t" "sd	%L0, %2" "\n\t" ".set	mips0" "\n" : "=r" (__tmp) : "0" (__val), "m" (*__mem)); if (1) do { ({ unsigned long __dummy; typeof(__flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); if (raw_irqs_disabled_flags(__flags)) { raw_local_irq_restore(__flags); do { } while (0); } else { do { } while (0); raw_local_irq_restore(__flags); } } while (0); } else BUG(); } static inline __attribute__((always_inline)) u32 __mem_readl(const volatile void *mem) { volatile u32 *__mem; u32 __val; __mem = (void *)((unsigned long)(mem)); if (sizeof(u32) != sizeof(u64) || sizeof(u64) == sizeof(long)) __val = *__mem; else if ((cpu_data[0].isa_level & (0x00000004 | 0x00000008 | 0x00000010 | 0x00000080 | 0x00000100))) { unsigned long __flags; if (1) do { ({ unsigned long __dummy; typeof(__flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); __asm__ __volatile__( "raw_local_irq_save\t%0" : "=r" (__flags) : : "memory"); do { } while (0); } while (0); __asm__ __volatile__( ".set	mips3" "\t\t# __readq" "\n\t" "ld	%L0, %1" "\n\t" "dsra32	%M0, %L0, 0" "\n\t" "sll	%L0, %L0, 0" "\n\t" ".set	mips0" "\n" : "=r" (__val) : "m" (*__mem)); if (1) do { ({ unsigned long __dummy; typeof(__flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); if (raw_irqs_disabled_flags(__flags)) { raw_local_irq_restore(__flags); do { } while (0); } else { do { } while (0); raw_local_irq_restore(__flags); } } while (0); } else { __val = 0; BUG(); } return (io_swap_noneed ? (( __le32)(__builtin_constant_p((__u32)((__val))) ? ((__u32)( (((__u32)((__val)) & (__u32)0x000000ffUL) << 24) | (((__u32)((__val)) & (__u32)0x0000ff00UL) << 8) | (((__u32)((__val)) & (__u32)0x00ff0000UL) >> 8) | (((__u32)((__val)) & (__u32)0xff000000UL) >> 24))) : __fswab32((__val)))) : (__val) ); }
static inline __attribute__((always_inline)) void __raw_writeq(u64 val, volatile void *mem) { volatile u64 *__mem; u64 __val; do { } while (0); __mem = (void *)((unsigned long)(mem)); __val = (val); if (sizeof(u64) != sizeof(u64) || sizeof(u64) == sizeof(long)) *__mem = __val; else if ((cpu_data[0].isa_level & (0x00000004 | 0x00000008 | 0x00000010 | 0x00000080 | 0x00000100))) { unsigned long __flags; u64 __tmp; if (1) do { ({ unsigned long __dummy; typeof(__flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); __asm__ __volatile__( "raw_local_irq_save\t%0" : "=r" (__flags) : : "memory"); do { } while (0); } while (0); __asm__ __volatile__( ".set	mips3" "\t\t# __writeq""\n\t" "dsll32	%L0, %L0, 0" "\n\t" "dsrl32	%L0, %L0, 0" "\n\t" "dsll32	%M0, %M0, 0" "\n\t" "or	%L0, %L0, %M0" "\n\t" "sd	%L0, %2" "\n\t" ".set	mips0" "\n" : "=r" (__tmp) : "0" (__val), "m" (*__mem)); if (1) do { ({ unsigned long __dummy; typeof(__flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); if (raw_irqs_disabled_flags(__flags)) { raw_local_irq_restore(__flags); do { } while (0); } else { do { } while (0); raw_local_irq_restore(__flags); } } while (0); } else BUG(); } static inline __attribute__((always_inline)) u64 __raw_readq(const volatile void *mem) { volatile u64 *__mem; u64 __val; __mem = (void *)((unsigned long)(mem)); if (sizeof(u64) != sizeof(u64) || sizeof(u64) == sizeof(long)) __val = *__mem; else if ((cpu_data[0].isa_level & (0x00000004 | 0x00000008 | 0x00000010 | 0x00000080 | 0x00000100))) { unsigned long __flags; if (1) do { ({ unsigned long __dummy; typeof(__flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); __asm__ __volatile__( "raw_local_irq_save\t%0" : "=r" (__flags) : : "memory"); do { } while (0); } while (0); __asm__ __volatile__( ".set	mips3" "\t\t# __readq" "\n\t" "ld	%L0, %1" "\n\t" "dsra32	%M0, %L0, 0" "\n\t" "sll	%L0, %L0, 0" "\n\t" ".set	mips0" "\n" : "=r" (__val) : "m" (*__mem)); if (1) do { ({ unsigned long __dummy; typeof(__flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); if (raw_irqs_disabled_flags(__flags)) { raw_local_irq_restore(__flags); do { } while (0); } else { do { } while (0); raw_local_irq_restore(__flags); } } while (0); } else { __val = 0; BUG(); } return (__val); } static inline __attribute__((always_inline)) void writeq(u64 val, volatile void *mem) { volatile u64 *__mem; u64 __val; do { } while (0); __mem = (void *)((unsigned long)(mem)); __val = (io_swap_noneed ? (val) : (__builtin_constant_p((__u64)(( __u64)(__le64)(val))) ? ((__u64)( (((__u64)(( __u64)(__le64)(val)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(( __u64)(__le64)(val)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(( __u64)(__le64)(val)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(( __u64)(__le64)(val)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(( __u64)(__le64)(val)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(( __u64)(__le64)(val)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(( __u64)(__le64)(val)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(( __u64)(__le64)(val)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(( __u64)(__le64)(val))) ); if (sizeof(u64) != sizeof(u64) || sizeof(u64) == sizeof(long)) *__mem = __val; else if ((cpu_data[0].isa_level & (0x00000004 | 0x00000008 | 0x00000010 | 0x00000080 | 0x00000100))) { unsigned long __flags; u64 __tmp; if (1) do { ({ unsigned long __dummy; typeof(__flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); __asm__ __volatile__( "raw_local_irq_save\t%0" : "=r" (__flags) : : "memory"); do { } while (0); } while (0); __asm__ __volatile__( ".set	mips3" "\t\t# __writeq""\n\t" "dsll32	%L0, %L0, 0" "\n\t" "dsrl32	%L0, %L0, 0" "\n\t" "dsll32	%M0, %M0, 0" "\n\t" "or	%L0, %L0, %M0" "\n\t" "sd	%L0, %2" "\n\t" ".set	mips0" "\n" : "=r" (__tmp) : "0" (__val), "m" (*__mem)); if (1) do { ({ unsigned long __dummy; typeof(__flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); if (raw_irqs_disabled_flags(__flags)) { raw_local_irq_restore(__flags); do { } while (0); } else { do { } while (0); raw_local_irq_restore(__flags); } } while (0); } else BUG(); } static inline __attribute__((always_inline)) u64 readq(const volatile void *mem) { volatile u64 *__mem; u64 __val; __mem = (void *)((unsigned long)(mem)); if (sizeof(u64) != sizeof(u64) || sizeof(u64) == sizeof(long)) __val = *__mem; else if ((cpu_data[0].isa_level & (0x00000004 | 0x00000008 | 0x00000010 | 0x00000080 | 0x00000100))) { unsigned long __flags; if (1) do { ({ unsigned long __dummy; typeof(__flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); __asm__ __volatile__( "raw_local_irq_save\t%0" : "=r" (__flags) : : "memory"); do { } while (0); } while (0); __asm__ __volatile__( ".set	mips3" "\t\t# __readq" "\n\t" "ld	%L0, %1" "\n\t" "dsra32	%M0, %L0, 0" "\n\t" "sll	%L0, %L0, 0" "\n\t" ".set	mips0" "\n" : "=r" (__val) : "m" (*__mem)); if (1) do { ({ unsigned long __dummy; typeof(__flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); if (raw_irqs_disabled_flags(__flags)) { raw_local_irq_restore(__flags); do { } while (0); } else { do { } while (0); raw_local_irq_restore(__flags); } } while (0); } else { __val = 0; BUG(); } return (io_swap_noneed ? (__val) : (__builtin_constant_p((__u64)(( __u64)(__le64)(__val))) ? ((__u64)( (((__u64)(( __u64)(__le64)(__val)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(( __u64)(__le64)(__val)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(( __u64)(__le64)(__val)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(( __u64)(__le64)(__val)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(( __u64)(__le64)(__val)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(( __u64)(__le64)(__val)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(( __u64)(__le64)(__val)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(( __u64)(__le64)(__val)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(( __u64)(__le64)(__val))) ); } static inline __attribute__((always_inline)) void __mem_writeq(u64 val, volatile void *mem) { volatile u64 *__mem; u64 __val; do { } while (0); __mem = (void *)((unsigned long)(mem)); __val = (io_swap_noneed ? (( __le32)(__builtin_constant_p((__u32)((val))) ? ((__u32)( (((__u32)((val)) & (__u32)0x000000ffUL) << 24) | (((__u32)((val)) & (__u32)0x0000ff00UL) << 8) | (((__u32)((val)) & (__u32)0x00ff0000UL) >> 8) | (((__u32)((val)) & (__u32)0xff000000UL) >> 24))) : __fswab32((val)))) : (val) ); if (sizeof(u64) != sizeof(u64) || sizeof(u64) == sizeof(long)) *__mem = __val; else if ((cpu_data[0].isa_level & (0x00000004 | 0x00000008 | 0x00000010 | 0x00000080 | 0x00000100))) { unsigned long __flags; u64 __tmp; if (1) do { ({ unsigned long __dummy; typeof(__flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); __asm__ __volatile__( "raw_local_irq_save\t%0" : "=r" (__flags) : : "memory"); do { } while (0); } while (0); __asm__ __volatile__( ".set	mips3" "\t\t# __writeq""\n\t" "dsll32	%L0, %L0, 0" "\n\t" "dsrl32	%L0, %L0, 0" "\n\t" "dsll32	%M0, %M0, 0" "\n\t" "or	%L0, %L0, %M0" "\n\t" "sd	%L0, %2" "\n\t" ".set	mips0" "\n" : "=r" (__tmp) : "0" (__val), "m" (*__mem)); if (1) do { ({ unsigned long __dummy; typeof(__flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); if (raw_irqs_disabled_flags(__flags)) { raw_local_irq_restore(__flags); do { } while (0); } else { do { } while (0); raw_local_irq_restore(__flags); } } while (0); } else BUG(); } static inline __attribute__((always_inline)) u64 __mem_readq(const volatile void *mem) { volatile u64 *__mem; u64 __val; __mem = (void *)((unsigned long)(mem)); if (sizeof(u64) != sizeof(u64) || sizeof(u64) == sizeof(long)) __val = *__mem; else if ((cpu_data[0].isa_level & (0x00000004 | 0x00000008 | 0x00000010 | 0x00000080 | 0x00000100))) { unsigned long __flags; if (1) do { ({ unsigned long __dummy; typeof(__flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); __asm__ __volatile__( "raw_local_irq_save\t%0" : "=r" (__flags) : : "memory"); do { } while (0); } while (0); __asm__ __volatile__( ".set	mips3" "\t\t# __readq" "\n\t" "ld	%L0, %1" "\n\t" "dsra32	%M0, %L0, 0" "\n\t" "sll	%L0, %L0, 0" "\n\t" ".set	mips0" "\n" : "=r" (__val) : "m" (*__mem)); if (1) do { ({ unsigned long __dummy; typeof(__flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); if (raw_irqs_disabled_flags(__flags)) { raw_local_irq_restore(__flags); do { } while (0); } else { do { } while (0); raw_local_irq_restore(__flags); } } while (0); } else { __val = 0; BUG(); } return (io_swap_noneed ? (( __le32)(__builtin_constant_p((__u32)((__val))) ? ((__u32)( (((__u32)((__val)) & (__u32)0x000000ffUL) << 24) | (((__u32)((__val)) & (__u32)0x0000ff00UL) << 8) | (((__u32)((__val)) & (__u32)0x00ff0000UL) >> 8) | (((__u32)((__val)) & (__u32)0xff000000UL) >> 24))) : __fswab32((__val)))) : (__val) ); }
# 510 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/io.h"
static inline __attribute__((always_inline)) void outb(u8 val, unsigned long port) { volatile u8 *__addr; u8 __val; do { } while (0); __addr = (void *)(mips_io_port_base + port); __val = (val); ((void)(sizeof(struct { int:-!!(sizeof(u8) > sizeof(unsigned long)); }))); *__addr = __val; ; } static inline __attribute__((always_inline)) u8 inb(unsigned long port) { volatile u8 *__addr; u8 __val; __addr = (void *)(mips_io_port_base + port); ((void)(sizeof(struct { int:-!!(sizeof(u8) > sizeof(unsigned long)); }))); __val = *__addr; ; return (__val); } static inline __attribute__((always_inline)) void outb_p(u8 val, unsigned long port) { volatile u8 *__addr; u8 __val; do { } while (0); __addr = (void *)(mips_io_port_base + port); __val = (val); ((void)(sizeof(struct { int:-!!(sizeof(u8) > sizeof(unsigned long)); }))); *__addr = __val; ; } static inline __attribute__((always_inline)) u8 inb_p(unsigned long port) { volatile u8 *__addr; u8 __val; __addr = (void *)(mips_io_port_base + port); ((void)(sizeof(struct { int:-!!(sizeof(u8) > sizeof(unsigned long)); }))); __val = *__addr; ; return (__val); } static inline __attribute__((always_inline)) void __mem_outb(u8 val, unsigned long port) { volatile u8 *__addr; u8 __val; do { } while (0); __addr = (void *)(mips_io_port_base + port); __val = (val); ((void)(sizeof(struct { int:-!!(sizeof(u8) > sizeof(unsigned long)); }))); *__addr = __val; ; } static inline __attribute__((always_inline)) u8 __mem_inb(unsigned long port) { volatile u8 *__addr; u8 __val; __addr = (void *)(mips_io_port_base + port); ((void)(sizeof(struct { int:-!!(sizeof(u8) > sizeof(unsigned long)); }))); __val = *__addr; ; return (__val); } static inline __attribute__((always_inline)) void __mem_outb_p(u8 val, unsigned long port) { volatile u8 *__addr; u8 __val; do { } while (0); __addr = (void *)(mips_io_port_base + port); __val = (val); ((void)(sizeof(struct { int:-!!(sizeof(u8) > sizeof(unsigned long)); }))); *__addr = __val; ; } static inline __attribute__((always_inline)) u8 __mem_inb_p(unsigned long port) { volatile u8 *__addr; u8 __val; __addr = (void *)(mips_io_port_base + port); ((void)(sizeof(struct { int:-!!(sizeof(u8) > sizeof(unsigned long)); }))); __val = *__addr; ; return (__val); }
static inline __attribute__((always_inline)) void outw(u16 val, unsigned long port) { volatile u16 *__addr; u16 __val; do { } while (0); __addr = (void *)(mips_io_port_base + port); __val = (io_swap_noneed ? (val) : (__builtin_constant_p((__u16)(( __u16)(__le16)(val))) ? ((__u16)( (((__u16)(( __u16)(__le16)(val)) & (__u16)0x00ffU) << 8) | (((__u16)(( __u16)(__le16)(val)) & (__u16)0xff00U) >> 8))) : __fswab16(( __u16)(__le16)(val))) ); ((void)(sizeof(struct { int:-!!(sizeof(u16) > sizeof(unsigned long)); }))); *__addr = __val; ; } static inline __attribute__((always_inline)) u16 inw(unsigned long port) { volatile u16 *__addr; u16 __val; __addr = (void *)(mips_io_port_base + port); ((void)(sizeof(struct { int:-!!(sizeof(u16) > sizeof(unsigned long)); }))); __val = *__addr; ; return (io_swap_noneed ? (__val) : (__builtin_constant_p((__u16)(( __u16)(__le16)(__val))) ? ((__u16)( (((__u16)(( __u16)(__le16)(__val)) & (__u16)0x00ffU) << 8) | (((__u16)(( __u16)(__le16)(__val)) & (__u16)0xff00U) >> 8))) : __fswab16(( __u16)(__le16)(__val))) ); } static inline __attribute__((always_inline)) void outw_p(u16 val, unsigned long port) { volatile u16 *__addr; u16 __val; do { } while (0); __addr = (void *)(mips_io_port_base + port); __val = (io_swap_noneed ? (val) : (__builtin_constant_p((__u16)(( __u16)(__le16)(val))) ? ((__u16)( (((__u16)(( __u16)(__le16)(val)) & (__u16)0x00ffU) << 8) | (((__u16)(( __u16)(__le16)(val)) & (__u16)0xff00U) >> 8))) : __fswab16(( __u16)(__le16)(val))) ); ((void)(sizeof(struct { int:-!!(sizeof(u16) > sizeof(unsigned long)); }))); *__addr = __val; ; } static inline __attribute__((always_inline)) u16 inw_p(unsigned long port) { volatile u16 *__addr; u16 __val; __addr = (void *)(mips_io_port_base + port); ((void)(sizeof(struct { int:-!!(sizeof(u16) > sizeof(unsigned long)); }))); __val = *__addr; ; return (io_swap_noneed ? (__val) : (__builtin_constant_p((__u16)(( __u16)(__le16)(__val))) ? ((__u16)( (((__u16)(( __u16)(__le16)(__val)) & (__u16)0x00ffU) << 8) | (((__u16)(( __u16)(__le16)(__val)) & (__u16)0xff00U) >> 8))) : __fswab16(( __u16)(__le16)(__val))) ); } static inline __attribute__((always_inline)) void __mem_outw(u16 val, unsigned long port) { volatile u16 *__addr; u16 __val; do { } while (0); __addr = (void *)(mips_io_port_base + port); __val = (io_swap_noneed ? (( __le16)(__builtin_constant_p((__u16)((val))) ? ((__u16)( (((__u16)((val)) & (__u16)0x00ffU) << 8) | (((__u16)((val)) & (__u16)0xff00U) >> 8))) : __fswab16((val)))) : (val) ); ((void)(sizeof(struct { int:-!!(sizeof(u16) > sizeof(unsigned long)); }))); *__addr = __val; ; } static inline __attribute__((always_inline)) u16 __mem_inw(unsigned long port) { volatile u16 *__addr; u16 __val; __addr = (void *)(mips_io_port_base + port); ((void)(sizeof(struct { int:-!!(sizeof(u16) > sizeof(unsigned long)); }))); __val = *__addr; ; return (io_swap_noneed ? (( __le16)(__builtin_constant_p((__u16)((__val))) ? ((__u16)( (((__u16)((__val)) & (__u16)0x00ffU) << 8) | (((__u16)((__val)) & (__u16)0xff00U) >> 8))) : __fswab16((__val)))) : (__val) ); } static inline __attribute__((always_inline)) void __mem_outw_p(u16 val, unsigned long port) { volatile u16 *__addr; u16 __val; do { } while (0); __addr = (void *)(mips_io_port_base + port); __val = (io_swap_noneed ? (( __le16)(__builtin_constant_p((__u16)((val))) ? ((__u16)( (((__u16)((val)) & (__u16)0x00ffU) << 8) | (((__u16)((val)) & (__u16)0xff00U) >> 8))) : __fswab16((val)))) : (val) ); ((void)(sizeof(struct { int:-!!(sizeof(u16) > sizeof(unsigned long)); }))); *__addr = __val; ; } static inline __attribute__((always_inline)) u16 __mem_inw_p(unsigned long port) { volatile u16 *__addr; u16 __val; __addr = (void *)(mips_io_port_base + port); ((void)(sizeof(struct { int:-!!(sizeof(u16) > sizeof(unsigned long)); }))); __val = *__addr; ; return (io_swap_noneed ? (( __le16)(__builtin_constant_p((__u16)((__val))) ? ((__u16)( (((__u16)((__val)) & (__u16)0x00ffU) << 8) | (((__u16)((__val)) & (__u16)0xff00U) >> 8))) : __fswab16((__val)))) : (__val) ); }
static inline __attribute__((always_inline)) void outl(u32 val, unsigned long port) { volatile u32 *__addr; u32 __val; do { } while (0); __addr = (void *)(mips_io_port_base + port); __val = (io_swap_noneed ? (val) : (__builtin_constant_p((__u32)(( __u32)(__le32)(val))) ? ((__u32)( (((__u32)(( __u32)(__le32)(val)) & (__u32)0x000000ffUL) << 24) | (((__u32)(( __u32)(__le32)(val)) & (__u32)0x0000ff00UL) << 8) | (((__u32)(( __u32)(__le32)(val)) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(( __u32)(__le32)(val)) & (__u32)0xff000000UL) >> 24))) : __fswab32(( __u32)(__le32)(val))) ); ((void)(sizeof(struct { int:-!!(sizeof(u32) > sizeof(unsigned long)); }))); *__addr = __val; ; } static inline __attribute__((always_inline)) u32 inl(unsigned long port) { volatile u32 *__addr; u32 __val; __addr = (void *)(mips_io_port_base + port); ((void)(sizeof(struct { int:-!!(sizeof(u32) > sizeof(unsigned long)); }))); __val = *__addr; ; return (io_swap_noneed ? (__val) : (__builtin_constant_p((__u32)(( __u32)(__le32)(__val))) ? ((__u32)( (((__u32)(( __u32)(__le32)(__val)) & (__u32)0x000000ffUL) << 24) | (((__u32)(( __u32)(__le32)(__val)) & (__u32)0x0000ff00UL) << 8) | (((__u32)(( __u32)(__le32)(__val)) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(( __u32)(__le32)(__val)) & (__u32)0xff000000UL) >> 24))) : __fswab32(( __u32)(__le32)(__val))) ); } static inline __attribute__((always_inline)) void outl_p(u32 val, unsigned long port) { volatile u32 *__addr; u32 __val; do { } while (0); __addr = (void *)(mips_io_port_base + port); __val = (io_swap_noneed ? (val) : (__builtin_constant_p((__u32)(( __u32)(__le32)(val))) ? ((__u32)( (((__u32)(( __u32)(__le32)(val)) & (__u32)0x000000ffUL) << 24) | (((__u32)(( __u32)(__le32)(val)) & (__u32)0x0000ff00UL) << 8) | (((__u32)(( __u32)(__le32)(val)) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(( __u32)(__le32)(val)) & (__u32)0xff000000UL) >> 24))) : __fswab32(( __u32)(__le32)(val))) ); ((void)(sizeof(struct { int:-!!(sizeof(u32) > sizeof(unsigned long)); }))); *__addr = __val; ; } static inline __attribute__((always_inline)) u32 inl_p(unsigned long port) { volatile u32 *__addr; u32 __val; __addr = (void *)(mips_io_port_base + port); ((void)(sizeof(struct { int:-!!(sizeof(u32) > sizeof(unsigned long)); }))); __val = *__addr; ; return (io_swap_noneed ? (__val) : (__builtin_constant_p((__u32)(( __u32)(__le32)(__val))) ? ((__u32)( (((__u32)(( __u32)(__le32)(__val)) & (__u32)0x000000ffUL) << 24) | (((__u32)(( __u32)(__le32)(__val)) & (__u32)0x0000ff00UL) << 8) | (((__u32)(( __u32)(__le32)(__val)) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(( __u32)(__le32)(__val)) & (__u32)0xff000000UL) >> 24))) : __fswab32(( __u32)(__le32)(__val))) ); } static inline __attribute__((always_inline)) void __mem_outl(u32 val, unsigned long port) { volatile u32 *__addr; u32 __val; do { } while (0); __addr = (void *)(mips_io_port_base + port); __val = (io_swap_noneed ? (( __le32)(__builtin_constant_p((__u32)((val))) ? ((__u32)( (((__u32)((val)) & (__u32)0x000000ffUL) << 24) | (((__u32)((val)) & (__u32)0x0000ff00UL) << 8) | (((__u32)((val)) & (__u32)0x00ff0000UL) >> 8) | (((__u32)((val)) & (__u32)0xff000000UL) >> 24))) : __fswab32((val)))) : (val) ); ((void)(sizeof(struct { int:-!!(sizeof(u32) > sizeof(unsigned long)); }))); *__addr = __val; ; } static inline __attribute__((always_inline)) u32 __mem_inl(unsigned long port) { volatile u32 *__addr; u32 __val; __addr = (void *)(mips_io_port_base + port); ((void)(sizeof(struct { int:-!!(sizeof(u32) > sizeof(unsigned long)); }))); __val = *__addr; ; return (io_swap_noneed ? (( __le32)(__builtin_constant_p((__u32)((__val))) ? ((__u32)( (((__u32)((__val)) & (__u32)0x000000ffUL) << 24) | (((__u32)((__val)) & (__u32)0x0000ff00UL) << 8) | (((__u32)((__val)) & (__u32)0x00ff0000UL) >> 8) | (((__u32)((__val)) & (__u32)0xff000000UL) >> 24))) : __fswab32((__val)))) : (__val) ); } static inline __attribute__((always_inline)) void __mem_outl_p(u32 val, unsigned long port) { volatile u32 *__addr; u32 __val; do { } while (0); __addr = (void *)(mips_io_port_base + port); __val = (io_swap_noneed ? (( __le32)(__builtin_constant_p((__u32)((val))) ? ((__u32)( (((__u32)((val)) & (__u32)0x000000ffUL) << 24) | (((__u32)((val)) & (__u32)0x0000ff00UL) << 8) | (((__u32)((val)) & (__u32)0x00ff0000UL) >> 8) | (((__u32)((val)) & (__u32)0xff000000UL) >> 24))) : __fswab32((val)))) : (val) ); ((void)(sizeof(struct { int:-!!(sizeof(u32) > sizeof(unsigned long)); }))); *__addr = __val; ; } static inline __attribute__((always_inline)) u32 __mem_inl_p(unsigned long port) { volatile u32 *__addr; u32 __val; __addr = (void *)(mips_io_port_base + port); ((void)(sizeof(struct { int:-!!(sizeof(u32) > sizeof(unsigned long)); }))); __val = *__addr; ; return (io_swap_noneed ? (( __le32)(__builtin_constant_p((__u32)((__val))) ? ((__u32)( (((__u32)((__val)) & (__u32)0x000000ffUL) << 24) | (((__u32)((__val)) & (__u32)0x0000ff00UL) << 8) | (((__u32)((__val)) & (__u32)0x00ff0000UL) >> 8) | (((__u32)((__val)) & (__u32)0xff000000UL) >> 24))) : __fswab32((__val)))) : (__val) ); }
# 521 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/io.h"
static inline __attribute__((always_inline)) void ____raw_writeq(u64 val, volatile void *mem) { volatile u64 *__mem; u64 __val; do { } while (0); __mem = (void *)((unsigned long)(mem)); __val = (val); if (sizeof(u64) != sizeof(u64) || sizeof(u64) == sizeof(long)) *__mem = __val; else if ((cpu_data[0].isa_level & (0x00000004 | 0x00000008 | 0x00000010 | 0x00000080 | 0x00000100))) { unsigned long __flags; u64 __tmp; if (0) do { ({ unsigned long __dummy; typeof(__flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); __asm__ __volatile__( "raw_local_irq_save\t%0" : "=r" (__flags) : : "memory"); do { } while (0); } while (0); __asm__ __volatile__( ".set	mips3" "\t\t# __writeq""\n\t" "dsll32	%L0, %L0, 0" "\n\t" "dsrl32	%L0, %L0, 0" "\n\t" "dsll32	%M0, %M0, 0" "\n\t" "or	%L0, %L0, %M0" "\n\t" "sd	%L0, %2" "\n\t" ".set	mips0" "\n" : "=r" (__tmp) : "0" (__val), "m" (*__mem)); if (0) do { ({ unsigned long __dummy; typeof(__flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); if (raw_irqs_disabled_flags(__flags)) { raw_local_irq_restore(__flags); do { } while (0); } else { do { } while (0); raw_local_irq_restore(__flags); } } while (0); } else BUG(); } static inline __attribute__((always_inline)) u64 ____raw_readq(const volatile void *mem) { volatile u64 *__mem; u64 __val; __mem = (void *)((unsigned long)(mem)); if (sizeof(u64) != sizeof(u64) || sizeof(u64) == sizeof(long)) __val = *__mem; else if ((cpu_data[0].isa_level & (0x00000004 | 0x00000008 | 0x00000010 | 0x00000080 | 0x00000100))) { unsigned long __flags; if (0) do { ({ unsigned long __dummy; typeof(__flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); __asm__ __volatile__( "raw_local_irq_save\t%0" : "=r" (__flags) : : "memory"); do { } while (0); } while (0); __asm__ __volatile__( ".set	mips3" "\t\t# __readq" "\n\t" "ld	%L0, %1" "\n\t" "dsra32	%M0, %L0, 0" "\n\t" "sll	%L0, %L0, 0" "\n\t" ".set	mips0" "\n" : "=r" (__val) : "m" (*__mem)); if (0) do { ({ unsigned long __dummy; typeof(__flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); if (raw_irqs_disabled_flags(__flags)) { raw_local_irq_restore(__flags); do { } while (0); } else { do { } while (0); raw_local_irq_restore(__flags); } } while (0); } else { __val = 0; BUG(); } return (__val); }
# 605 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/io.h"
static inline __attribute__((always_inline)) void writesb(volatile void *mem, const void *addr, unsigned int count) { const volatile u8 *__addr = addr; while (count--) { __mem_writeb(*__addr, mem); __addr++; } } static inline __attribute__((always_inline)) void readsb(volatile void *mem, void *addr, unsigned int count) { volatile u8 *__addr = addr; while (count--) { *__addr = __mem_readb(mem); __addr++; } } static inline __attribute__((always_inline)) void outsb(unsigned long port, const void *addr, unsigned int count) { const volatile u8 *__addr = addr; while (count--) { __mem_outb(*__addr, port); __addr++; } } static inline __attribute__((always_inline)) void insb(unsigned long port, void *addr, unsigned int count) { volatile u8 *__addr = addr; while (count--) { *__addr = __mem_inb(port); __addr++; } }
static inline __attribute__((always_inline)) void writesw(volatile void *mem, const void *addr, unsigned int count) { const volatile u16 *__addr = addr; while (count--) { __mem_writew(*__addr, mem); __addr++; } } static inline __attribute__((always_inline)) void readsw(volatile void *mem, void *addr, unsigned int count) { volatile u16 *__addr = addr; while (count--) { *__addr = __mem_readw(mem); __addr++; } } static inline __attribute__((always_inline)) void outsw(unsigned long port, const void *addr, unsigned int count) { const volatile u16 *__addr = addr; while (count--) { __mem_outw(*__addr, port); __addr++; } } static inline __attribute__((always_inline)) void insw(unsigned long port, void *addr, unsigned int count) { volatile u16 *__addr = addr; while (count--) { *__addr = __mem_inw(port); __addr++; } }
static inline __attribute__((always_inline)) void writesl(volatile void *mem, const void *addr, unsigned int count) { const volatile u32 *__addr = addr; while (count--) { __mem_writel(*__addr, mem); __addr++; } } static inline __attribute__((always_inline)) void readsl(volatile void *mem, void *addr, unsigned int count) { volatile u32 *__addr = addr; while (count--) { *__addr = __mem_readl(mem); __addr++; } } static inline __attribute__((always_inline)) void outsl(unsigned long port, const void *addr, unsigned int count) { const volatile u32 *__addr = addr; while (count--) { __mem_outl(*__addr, port); __addr++; } } static inline __attribute__((always_inline)) void insl(unsigned long port, void *addr, unsigned int count) { volatile u32 *__addr = addr; while (count--) { *__addr = __mem_inl(port); __addr++; } }
# 620 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/io.h"
static inline __attribute__((always_inline)) void memset_io(volatile void *addr, unsigned char val, int count)
{
 memset((void *) addr, val, count);
}
static inline __attribute__((always_inline)) void memcpy_fromio(void *dst, const volatile void *src, int count)
{
 memcpy(dst, (void *) src, count);
}
static inline __attribute__((always_inline)) void memcpy_toio(volatile void *dst, const void *src, int count)
{
 memcpy((void *) dst, src, count);
}
# 655 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/io.h"
extern void (*_dma_cache_wback_inv)(unsigned long start, unsigned long size);
extern void (*_dma_cache_wback)(unsigned long start, unsigned long size);
extern void (*_dma_cache_inv)(unsigned long start, unsigned long size);
# 47 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/page.h" 2

extern void build_clear_page(void);
extern void build_copy_page(void);
# 58 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/page.h"
extern void clear_page(void * page);
extern void copy_page(void * to, void * from);

extern unsigned long shm_align_mask;

static inline __attribute__((always_inline)) unsigned long pages_do_alias(unsigned long addr1,
 unsigned long addr2)
{
 return (addr1 ^ addr2) & shm_align_mask;
}

struct page;

static inline __attribute__((always_inline)) void clear_user_page(void *addr, unsigned long vaddr,
 struct page *page)
{
 extern void (*flush_data_cache_page)(unsigned long addr);

 clear_page(addr);
 if (pages_do_alias((unsigned long) addr, vaddr & (~((1 << 12) - 1))))
  flush_data_cache_page((unsigned long)addr);
}

extern void copy_user_page(void *vto, void *vfrom, unsigned long vaddr,
 struct page *to);
struct vm_area_struct;
extern void copy_user_highpage(struct page *to, struct page *from,
 unsigned long vaddr, struct vm_area_struct *vma);
# 103 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/page.h"
typedef struct { unsigned long pte; } pte_t;



typedef struct page *pgtable_t;
# 117 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/page.h"
typedef struct { unsigned long pgd; } pgd_t;






typedef struct { unsigned long pgprot; } pgprot_t;
# 210 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/page.h"
# 1 "include/asm-generic/memory_model.h" 1
# 211 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/page.h" 2
# 1 "include/asm-generic/getorder.h" 1
# 9 "include/asm-generic/getorder.h"
static inline __attribute__((always_inline)) __attribute__((__const__)) int get_order(unsigned long size)
{
 int order;

 size = (size - 1) >> (12 - 1);
 order = -1;
 do {
  size >>= 1;
  order++;
 } while (size);
 return order;
}
# 212 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/page.h" 2
# 21 "include/linux/mmzone.h" 2
# 50 "include/linux/mmzone.h"
extern int page_group_by_mobility_disabled;

static inline __attribute__((always_inline)) int get_pageblock_migratetype(struct page *page)
{
 return get_pageblock_flags_group(page, PB_migrate, PB_migrate_end);
}

struct free_area {
 struct list_head free_list[5];
 unsigned long nr_free;
};

struct pglist_data;
# 71 "include/linux/mmzone.h"
struct zone_padding {
 char x[0];
} __attribute__((__aligned__(1 << (5))));





enum zone_stat_item {

 NR_FREE_PAGES,
 NR_LRU_BASE,
 NR_INACTIVE_ANON = NR_LRU_BASE,
 NR_ACTIVE_ANON,
 NR_INACTIVE_FILE,
 NR_ACTIVE_FILE,
 NR_UNEVICTABLE,
 NR_MLOCK,
 NR_ANON_PAGES,
 NR_FILE_MAPPED,

 NR_FILE_PAGES,
 NR_FILE_DIRTY,
 NR_WRITEBACK,
 NR_SLAB_RECLAIMABLE,
 NR_SLAB_UNRECLAIMABLE,
 NR_PAGETABLE,
 NR_KERNEL_STACK,

 NR_UNSTABLE_NFS,
 NR_BOUNCE,
 NR_VMSCAN_WRITE,
 NR_WRITEBACK_TEMP,
 NR_ISOLATED_ANON,
 NR_ISOLATED_FILE,
 NR_SHMEM,
# 115 "include/linux/mmzone.h"
 NR_VM_ZONE_STAT_ITEMS };
# 130 "include/linux/mmzone.h"
enum lru_list {
 LRU_INACTIVE_ANON = 0,
 LRU_ACTIVE_ANON = 0 + 1,
 LRU_INACTIVE_FILE = 0 + 2,
 LRU_ACTIVE_FILE = 0 + 2 + 1,
 LRU_UNEVICTABLE,
 NR_LRU_LISTS
};





static inline __attribute__((always_inline)) int is_file_lru(enum lru_list l)
{
 return (l == LRU_INACTIVE_FILE || l == LRU_ACTIVE_FILE);
}

static inline __attribute__((always_inline)) int is_active_lru(enum lru_list l)
{
 return (l == LRU_ACTIVE_ANON || l == LRU_ACTIVE_FILE);
}

static inline __attribute__((always_inline)) int is_unevictable_lru(enum lru_list l)
{
 return (l == LRU_UNEVICTABLE);
}

enum zone_watermarks {
 WMARK_MIN,
 WMARK_LOW,
 WMARK_HIGH,
 NR_WMARK
};





struct per_cpu_pages {
 int count;
 int high;
 int batch;


 struct list_head lists[3];
};

struct per_cpu_pageset {
 struct per_cpu_pages pcp;




 s8 stat_threshold;
 s8 vm_stat_diff[NR_VM_ZONE_STAT_ITEMS];

};



enum zone_type {
# 226 "include/linux/mmzone.h"
 ZONE_NORMAL,
# 238 "include/linux/mmzone.h"
 ZONE_MOVABLE,
 __MAX_NR_ZONES
};
# 262 "include/linux/mmzone.h"
struct zone_reclaim_stat {
# 271 "include/linux/mmzone.h"
 unsigned long recent_rotated[2];
 unsigned long recent_scanned[2];




 unsigned long nr_saved_scan[NR_LRU_LISTS];
};

struct zone {



 unsigned long watermark[NR_WMARK];






 unsigned long percpu_drift_mark;
# 301 "include/linux/mmzone.h"
 unsigned long lowmem_reserve[2];
# 311 "include/linux/mmzone.h"
 struct per_cpu_pageset *pageset;



 spinlock_t lock;
 int all_unreclaimable;




 struct free_area free_area[11];






 unsigned long *pageblock_flags;
# 341 "include/linux/mmzone.h"
 struct zone_padding _pad1_;


 spinlock_t lru_lock;
 struct zone_lru {
  struct list_head list;
 } lru[NR_LRU_LISTS];

 struct zone_reclaim_stat reclaim_stat;

 unsigned long pages_scanned;
 unsigned long flags;


 atomic_long_t vm_stat[NR_VM_ZONE_STAT_ITEMS];





 unsigned int inactive_ratio;


 struct zone_padding _pad2_;
# 391 "include/linux/mmzone.h"
 wait_queue_head_t * wait_table;
 unsigned long wait_table_hash_nr_entries;
 unsigned long wait_table_bits;




 struct pglist_data *zone_pgdat;

 unsigned long zone_start_pfn;
# 412 "include/linux/mmzone.h"
 unsigned long spanned_pages;
 unsigned long present_pages;




 const char *name;
} __attribute__((__aligned__(1 << (5))));

typedef enum {
 ZONE_RECLAIM_LOCKED,
 ZONE_OOM_LOCKED,
} zone_flags_t;

static inline __attribute__((always_inline)) void zone_set_flag(struct zone *zone, zone_flags_t flag)
{
 set_bit(flag, &zone->flags);
}

static inline __attribute__((always_inline)) int zone_test_and_set_flag(struct zone *zone, zone_flags_t flag)
{
 return test_and_set_bit(flag, &zone->flags);
}

static inline __attribute__((always_inline)) void zone_clear_flag(struct zone *zone, zone_flags_t flag)
{
 clear_bit(flag, &zone->flags);
}

static inline __attribute__((always_inline)) int zone_is_reclaim_locked(const struct zone *zone)
{
 return test_bit(ZONE_RECLAIM_LOCKED, &zone->flags);
}

static inline __attribute__((always_inline)) int zone_is_oom_locked(const struct zone *zone)
{
 return test_bit(ZONE_OOM_LOCKED, &zone->flags);
}


unsigned long zone_nr_free_pages(struct zone *zone);
# 545 "include/linux/mmzone.h"
struct zonelist_cache;






struct zoneref {
 struct zone *zone;
 int zone_idx;
};
# 574 "include/linux/mmzone.h"
struct zonelist {
 struct zonelist_cache *zlcache_ptr;
 struct zoneref _zonerefs[((1 << 0) * 2) + 1];



};


struct node_active_region {
 unsigned long start_pfn;
 unsigned long end_pfn;
 int nid;
};




extern struct page *mem_map;
# 606 "include/linux/mmzone.h"
struct bootmem_data;
typedef struct pglist_data {
 struct zone node_zones[2];
 struct zonelist node_zonelists[1];
 int nr_zones;

 struct page *node_mem_map;





 struct bootmem_data *bdata;
# 630 "include/linux/mmzone.h"
 unsigned long node_start_pfn;
 unsigned long node_present_pages;
 unsigned long node_spanned_pages;

 int node_id;
 wait_queue_head_t kswapd_wait;
 struct task_struct *kswapd;
 int kswapd_max_order;
} pg_data_t;
# 649 "include/linux/mmzone.h"
# 1 "include/linux/memory_hotplug.h" 1



# 1 "include/linux/mmzone.h" 1
# 5 "include/linux/memory_hotplug.h" 2

# 1 "include/linux/notifier.h" 1
# 12 "include/linux/notifier.h"
# 1 "include/linux/errno.h" 1



# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/errno.h" 1
# 15 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/errno.h"
# 1 "include/asm-generic/errno-base.h" 1
# 16 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/errno.h" 2
# 5 "include/linux/errno.h" 2
# 13 "include/linux/notifier.h" 2
# 1 "include/linux/mutex.h" 1
# 48 "include/linux/mutex.h"
struct mutex {

 atomic_t count;
 spinlock_t wait_lock;
 struct list_head wait_list;

 struct thread_info *owner;
# 63 "include/linux/mutex.h"
};





struct mutex_waiter {
 struct list_head list;
 struct task_struct *task;



};
# 115 "include/linux/mutex.h"
extern void __mutex_init(struct mutex *lock, const char *name,
    struct lock_class_key *key);







static inline __attribute__((always_inline)) int mutex_is_locked(struct mutex *lock)
{
 return (*(volatile int *)&(&lock->count)->counter) != 1;
}
# 144 "include/linux/mutex.h"
extern void mutex_lock(struct mutex *lock);
extern int mutex_lock_interruptible(struct mutex *lock);
extern int mutex_lock_killable(struct mutex *lock);
# 159 "include/linux/mutex.h"
extern int mutex_trylock(struct mutex *lock);
extern void mutex_unlock(struct mutex *lock);
extern int atomic_dec_and_mutex_lock(atomic_t *cnt, struct mutex *lock);
# 14 "include/linux/notifier.h" 2
# 1 "include/linux/rwsem.h" 1
# 17 "include/linux/rwsem.h"
struct rw_semaphore;


# 1 "include/linux/rwsem-spinlock.h" 1
# 22 "include/linux/rwsem-spinlock.h"
struct rwsem_waiter;
# 31 "include/linux/rwsem-spinlock.h"
struct rw_semaphore {
 __s32 activity;
 spinlock_t wait_lock;
 struct list_head wait_list;



};
# 53 "include/linux/rwsem-spinlock.h"
extern void __init_rwsem(struct rw_semaphore *sem, const char *name,
    struct lock_class_key *key);
# 63 "include/linux/rwsem-spinlock.h"
extern void __down_read(struct rw_semaphore *sem);
extern int __down_read_trylock(struct rw_semaphore *sem);
extern void __down_write(struct rw_semaphore *sem);
extern void __down_write_nested(struct rw_semaphore *sem, int subclass);
extern int __down_write_trylock(struct rw_semaphore *sem);
extern void __up_read(struct rw_semaphore *sem);
extern void __up_write(struct rw_semaphore *sem);
extern void __downgrade_write(struct rw_semaphore *sem);
extern int rwsem_is_locked(struct rw_semaphore *sem);
# 21 "include/linux/rwsem.h" 2







extern void down_read(struct rw_semaphore *sem);




extern int down_read_trylock(struct rw_semaphore *sem);




extern void down_write(struct rw_semaphore *sem);




extern int down_write_trylock(struct rw_semaphore *sem);




extern void up_read(struct rw_semaphore *sem);




extern void up_write(struct rw_semaphore *sem);




extern void downgrade_write(struct rw_semaphore *sem);
# 15 "include/linux/notifier.h" 2
# 1 "include/linux/srcu.h" 1
# 32 "include/linux/srcu.h"
struct srcu_struct_array {
 int c[2];
};

struct srcu_struct {
 int completed;
 struct srcu_struct_array *per_cpu_ref;
 struct mutex mutex;



};
# 70 "include/linux/srcu.h"
int init_srcu_struct(struct srcu_struct *sp);






void cleanup_srcu_struct(struct srcu_struct *sp);
int __srcu_read_lock(struct srcu_struct *sp) ;
void __srcu_read_unlock(struct srcu_struct *sp, int idx) ;
void synchronize_srcu(struct srcu_struct *sp);
void synchronize_srcu_expedited(struct srcu_struct *sp);
long srcu_batches_completed(struct srcu_struct *sp);
# 103 "include/linux/srcu.h"
static inline __attribute__((always_inline)) int srcu_read_lock_held(struct srcu_struct *sp)
{
 return 1;
}
# 125 "include/linux/srcu.h"
static inline __attribute__((always_inline)) int srcu_read_lock(struct srcu_struct *sp)
{
 int retval = __srcu_read_lock(sp);

 do { } while (0);
 return retval;
}
# 140 "include/linux/srcu.h"
static inline __attribute__((always_inline)) void srcu_read_unlock(struct srcu_struct *sp, int idx)

{
 do { } while (0);
 __srcu_read_unlock(sp, idx);
}
# 16 "include/linux/notifier.h" 2
# 50 "include/linux/notifier.h"
struct notifier_block {
 int (*notifier_call)(struct notifier_block *, unsigned long, void *);
 struct notifier_block *next;
 int priority;
};

struct atomic_notifier_head {
 spinlock_t lock;
 struct notifier_block *head;
};

struct blocking_notifier_head {
 struct rw_semaphore rwsem;
 struct notifier_block *head;
};

struct raw_notifier_head {
 struct notifier_block *head;
};

struct srcu_notifier_head {
 struct mutex mutex;
 struct srcu_struct srcu;
 struct notifier_block *head;
};
# 89 "include/linux/notifier.h"
extern void srcu_init_notifier_head(struct srcu_notifier_head *nh);
# 115 "include/linux/notifier.h"
extern int atomic_notifier_chain_register(struct atomic_notifier_head *nh,
  struct notifier_block *nb);
extern int blocking_notifier_chain_register(struct blocking_notifier_head *nh,
  struct notifier_block *nb);
extern int raw_notifier_chain_register(struct raw_notifier_head *nh,
  struct notifier_block *nb);
extern int srcu_notifier_chain_register(struct srcu_notifier_head *nh,
  struct notifier_block *nb);

extern int blocking_notifier_chain_cond_register(
  struct blocking_notifier_head *nh,
  struct notifier_block *nb);

extern int atomic_notifier_chain_unregister(struct atomic_notifier_head *nh,
  struct notifier_block *nb);
extern int blocking_notifier_chain_unregister(struct blocking_notifier_head *nh,
  struct notifier_block *nb);
extern int raw_notifier_chain_unregister(struct raw_notifier_head *nh,
  struct notifier_block *nb);
extern int srcu_notifier_chain_unregister(struct srcu_notifier_head *nh,
  struct notifier_block *nb);

extern int atomic_notifier_call_chain(struct atomic_notifier_head *nh,
  unsigned long val, void *v);
extern int __atomic_notifier_call_chain(struct atomic_notifier_head *nh,
 unsigned long val, void *v, int nr_to_call, int *nr_calls);
extern int blocking_notifier_call_chain(struct blocking_notifier_head *nh,
  unsigned long val, void *v);
extern int __blocking_notifier_call_chain(struct blocking_notifier_head *nh,
 unsigned long val, void *v, int nr_to_call, int *nr_calls);
extern int raw_notifier_call_chain(struct raw_notifier_head *nh,
  unsigned long val, void *v);
extern int __raw_notifier_call_chain(struct raw_notifier_head *nh,
 unsigned long val, void *v, int nr_to_call, int *nr_calls);
extern int srcu_notifier_call_chain(struct srcu_notifier_head *nh,
  unsigned long val, void *v);
extern int __srcu_notifier_call_chain(struct srcu_notifier_head *nh,
 unsigned long val, void *v, int nr_to_call, int *nr_calls);
# 165 "include/linux/notifier.h"
static inline __attribute__((always_inline)) int notifier_from_errno(int err)
{
 if (err)
  return 0x8000 | (0x0001 - err);

 return 0x0001;
}


static inline __attribute__((always_inline)) int notifier_to_errno(int ret)
{
 ret &= ~0x8000;
 return ret > 0x0001 ? 0x0001 - ret : 0;
}
# 271 "include/linux/notifier.h"
extern struct blocking_notifier_head reboot_notifier_list;
# 7 "include/linux/memory_hotplug.h" 2

struct page;
struct zone;
struct pglist_data;
struct mem_section;
# 164 "include/linux/memory_hotplug.h"
static inline __attribute__((always_inline)) void pgdat_resize_lock(struct pglist_data *p, unsigned long *f) {}
static inline __attribute__((always_inline)) void pgdat_resize_unlock(struct pglist_data *p, unsigned long *f) {}
static inline __attribute__((always_inline)) void pgdat_resize_init(struct pglist_data *pgdat) {}

static inline __attribute__((always_inline)) unsigned zone_span_seqbegin(struct zone *zone)
{
 return 0;
}
static inline __attribute__((always_inline)) int zone_span_seqretry(struct zone *zone, unsigned iv)
{
 return 0;
}
static inline __attribute__((always_inline)) void zone_span_writelock(struct zone *zone) {}
static inline __attribute__((always_inline)) void zone_span_writeunlock(struct zone *zone) {}
static inline __attribute__((always_inline)) void zone_seqlock_init(struct zone *zone) {}

static inline __attribute__((always_inline)) int mhp_notimplemented(const char *func)
{
 printk("<4>" "%s() called, with CONFIG_MEMORY_HOTPLUG disabled\n", func);
 dump_stack();
 return -89;
}

static inline __attribute__((always_inline)) void register_page_bootmem_info_node(struct pglist_data *pgdat)
{
}
# 198 "include/linux/memory_hotplug.h"
static inline __attribute__((always_inline)) int is_mem_section_removable(unsigned long pfn,
     unsigned long nr_pages)
{
 return 0;
}


extern int mem_online_node(int nid);
extern int add_memory(int nid, u64 start, u64 size);
extern int arch_add_memory(int nid, u64 start, u64 size);
extern int remove_memory(u64 start, u64 size);
extern int sparse_add_one_section(struct zone *zone, unsigned long start_pfn,
        int nr_pages);
extern void sparse_remove_one_section(struct zone *zone, struct mem_section *ms);
extern struct page *sparse_decode_mem_map(unsigned long coded_mem_map,
       unsigned long pnum);
# 650 "include/linux/mmzone.h" 2

extern struct mutex zonelists_mutex;
void build_all_zonelists(void *data);
void wakeup_kswapd(struct zone *zone, int order);
int zone_watermark_ok(struct zone *z, int order, unsigned long mark,
  int classzone_idx, int alloc_flags);
enum memmap_context {
 MEMMAP_EARLY,
 MEMMAP_HOTPLUG,
};
extern int init_currently_empty_zone(struct zone *zone, unsigned long start_pfn,
         unsigned long size,
         enum memmap_context context);




static inline __attribute__((always_inline)) void memory_present(int nid, unsigned long start, unsigned long end) {}





static inline __attribute__((always_inline)) int local_memory_node(int node_id) { return node_id; };
# 685 "include/linux/mmzone.h"
static inline __attribute__((always_inline)) int populated_zone(struct zone *zone)
{
 return (!!zone->present_pages);
}

extern int movable_zone;

static inline __attribute__((always_inline)) int zone_movable_is_highmem(void)
{



 return 0;

}

static inline __attribute__((always_inline)) int is_highmem_idx(enum zone_type idx)
{




 return 0;

}

static inline __attribute__((always_inline)) int is_normal_idx(enum zone_type idx)
{
 return (idx == ZONE_NORMAL);
}







static inline __attribute__((always_inline)) int is_highmem(struct zone *zone)
{






 return 0;

}

static inline __attribute__((always_inline)) int is_normal(struct zone *zone)
{
 return zone == zone->zone_pgdat->node_zones + ZONE_NORMAL;
}

static inline __attribute__((always_inline)) int is_dma32(struct zone *zone)
{



 return 0;

}

static inline __attribute__((always_inline)) int is_dma(struct zone *zone)
{



 return 0;

}


struct ctl_table;
int min_free_kbytes_sysctl_handler(struct ctl_table *, int,
     void *, size_t *, loff_t *);
extern int sysctl_lowmem_reserve_ratio[2 -1];
int lowmem_reserve_ratio_sysctl_handler(struct ctl_table *, int,
     void *, size_t *, loff_t *);
int percpu_pagelist_fraction_sysctl_handler(struct ctl_table *, int,
     void *, size_t *, loff_t *);
int sysctl_min_unmapped_ratio_sysctl_handler(struct ctl_table *, int,
   void *, size_t *, loff_t *);
int sysctl_min_slab_ratio_sysctl_handler(struct ctl_table *, int,
   void *, size_t *, loff_t *);

extern int numa_zonelist_order_handler(struct ctl_table *, int,
   void *, size_t *, loff_t *);
extern char numa_zonelist_order[];




extern struct pglist_data contig_page_data;
# 788 "include/linux/mmzone.h"
extern struct pglist_data *first_online_pgdat(void);
extern struct pglist_data *next_online_pgdat(struct pglist_data *pgdat);
extern struct zone *next_zone(struct zone *zone);
# 820 "include/linux/mmzone.h"
static inline __attribute__((always_inline)) struct zone *zonelist_zone(struct zoneref *zoneref)
{
 return zoneref->zone;
}

static inline __attribute__((always_inline)) int zonelist_zone_idx(struct zoneref *zoneref)
{
 return zoneref->zone_idx;
}

static inline __attribute__((always_inline)) int zonelist_node_idx(struct zoneref *zoneref)
{




 return 0;

}
# 853 "include/linux/mmzone.h"
struct zoneref *next_zones_zonelist(struct zoneref *z,
     enum zone_type highest_zoneidx,
     nodemask_t *nodes,
     struct zone **zone);
# 870 "include/linux/mmzone.h"
static inline __attribute__((always_inline)) struct zoneref *first_zones_zonelist(struct zonelist *zonelist,
     enum zone_type highest_zoneidx,
     nodemask_t *nodes,
     struct zone **zone)
{
 return next_zones_zonelist(zonelist->_zonerefs, highest_zoneidx, nodes,
        zone);
}
# 1094 "include/linux/mmzone.h"
void memory_present(int nid, unsigned long start, unsigned long end);
unsigned long __attribute__ ((__section__(".init.text"))) __attribute__((__cold__)) __attribute__((no_instrument_function)) node_memmap_size_bytes(int, unsigned long, unsigned long);
# 1128 "include/linux/mmzone.h"
static inline __attribute__((always_inline)) int memmap_valid_within(unsigned long pfn,
     struct page *page, struct zone *zone)
{
 return 1;
}
# 5 "include/linux/gfp.h" 2


# 1 "include/linux/topology.h" 1
# 33 "include/linux/topology.h"
# 1 "include/linux/smp.h" 1
# 14 "include/linux/smp.h"
extern void cpu_idle(void);

struct call_single_data {
 struct list_head list;
 void (*func) (void *info);
 void *info;
 u16 flags;
 u16 priv;
};


extern unsigned int total_cpus;

int smp_call_function_single(int cpuid, void (*func) (void *info), void *info,
    int wait);







# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/smp.h" 1
# 16 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/smp.h"
# 1 "include/linux/smp.h" 1
# 17 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/smp.h" 2




# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/smp-ops.h" 1
# 18 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/smp-ops.h"
struct task_struct;

struct plat_smp_ops {
 void (*send_ipi_single)(int cpu, unsigned int action);
 void (*send_ipi_mask)(const struct cpumask *mask, unsigned int action);
 void (*init_secondary)(void);
 void (*smp_finish)(void);
 void (*cpus_done)(void);
 void (*boot_secondary)(int cpu, struct task_struct *idle);
 void (*smp_setup)(void);
 void (*prepare_cpus)(unsigned int max_cpus);




};

extern void register_smp_ops(struct plat_smp_ops *ops);

static inline __attribute__((always_inline)) void plat_smp_setup(void)
{
 extern struct plat_smp_ops *mp_ops;

 mp_ops->smp_setup();
}
# 59 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/smp-ops.h"
extern struct plat_smp_ops up_smp_ops;
extern struct plat_smp_ops cmp_smp_ops;
extern struct plat_smp_ops vsmp_smp_ops;
# 22 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/smp.h" 2

extern int smp_num_siblings;
extern cpumask_t cpu_sibling_map[];





extern int __cpu_number_map[4];



extern int __cpu_logical_map[4];
# 44 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/smp.h"
extern volatile cpumask_t cpu_callin_map;

extern void smp_bootstrap(void);






static inline __attribute__((always_inline)) void smp_send_reschedule(int cpu)
{
 extern struct plat_smp_ops *mp_ops;

 mp_ops->send_ipi_single(cpu, 0x1);
}
# 78 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/smp.h"
extern void smp_call_function_interrupt(void);

static inline __attribute__((always_inline)) void arch_send_call_function_single_ipi(int cpu)
{
 extern struct plat_smp_ops *mp_ops;

 mp_ops->send_ipi_mask(&(*get_cpu_mask(cpu)), 0x2);
}

static inline __attribute__((always_inline)) void arch_send_call_function_ipi_mask(const struct cpumask *mask)
{
 extern struct plat_smp_ops *mp_ops;

 mp_ops->send_ipi_mask(mask, 0x2);
}
# 37 "include/linux/smp.h" 2
# 46 "include/linux/smp.h"
extern void smp_send_stop(void);




extern void smp_send_reschedule(int cpu);





extern void smp_prepare_cpus(unsigned int max_cpus);




extern int __cpu_up(unsigned int cpunum);




extern void smp_cpus_done(unsigned int max_cpus);




int smp_call_function(void(*func)(void *info), void *info, int wait);
void smp_call_function_many(const struct cpumask *mask,
       void (*func)(void *info), void *info, int wait);

void __smp_call_function_single(int cpuid, struct call_single_data *data,
    int wait);

int smp_call_function_any(const struct cpumask *mask,
     void (*func)(void *info), void *info, int wait);





void generic_smp_call_function_single_interrupt(void);
void generic_smp_call_function_interrupt(void);
void ipi_call_lock(void);
void ipi_call_unlock(void);
void ipi_call_lock_irq(void);
void ipi_call_unlock_irq(void);





int on_each_cpu(void (*func) (void *info), void *info, int wait);
# 113 "include/linux/smp.h"
void smp_prepare_boot_cpu(void);

extern unsigned int setup_max_cpus;
# 183 "include/linux/smp.h"
extern void arch_disable_smp_support(void);

void smp_setup_processor_id(void);
# 34 "include/linux/topology.h" 2
# 1 "include/linux/percpu.h" 1
# 10 "include/linux/percpu.h"
# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/percpu.h" 1



# 1 "include/asm-generic/percpu.h" 1





# 1 "include/linux/percpu-defs.h" 1
# 7 "include/asm-generic/percpu.h" 2
# 18 "include/asm-generic/percpu.h"
extern unsigned long __per_cpu_offset[4];
# 5 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/percpu.h" 2
# 11 "include/linux/percpu.h" 2
# 74 "include/linux/percpu.h"
extern void *pcpu_base_addr;
extern const unsigned long *pcpu_unit_offsets;

struct pcpu_group_info {
 int nr_units;
 unsigned long base_offset;
 unsigned int *cpu_map;

};

struct pcpu_alloc_info {
 size_t static_size;
 size_t reserved_size;
 size_t dyn_size;
 size_t unit_size;
 size_t atom_size;
 size_t alloc_size;
 size_t __ai_size;
 int nr_groups;
 struct pcpu_group_info groups[];
};

enum pcpu_fc {
 PCPU_FC_AUTO,
 PCPU_FC_EMBED,
 PCPU_FC_PAGE,

 PCPU_FC_NR,
};
extern const char *pcpu_fc_names[PCPU_FC_NR];

extern enum pcpu_fc pcpu_chosen_fc;

typedef void * (*pcpu_fc_alloc_fn_t)(unsigned int cpu, size_t size,
         size_t align);
typedef void (*pcpu_fc_free_fn_t)(void *ptr, size_t size);
typedef void (*pcpu_fc_populate_pte_fn_t)(unsigned long addr);
typedef int (pcpu_fc_cpu_distance_fn_t)(unsigned int from, unsigned int to);

extern struct pcpu_alloc_info * __attribute__ ((__section__(".init.text"))) __attribute__((__cold__)) __attribute__((no_instrument_function)) pcpu_alloc_alloc_info(int nr_groups,
            int nr_units);
extern void __attribute__ ((__section__(".init.text"))) __attribute__((__cold__)) __attribute__((no_instrument_function)) pcpu_free_alloc_info(struct pcpu_alloc_info *ai);

extern int __attribute__ ((__section__(".init.text"))) __attribute__((__cold__)) __attribute__((no_instrument_function)) pcpu_setup_first_chunk(const struct pcpu_alloc_info *ai,
      void *base_addr);
# 142 "include/linux/percpu.h"
extern void *__alloc_reserved_percpu(size_t size, size_t align);
extern int is_kernel_percpu_address(unsigned long addr);


extern void __attribute__ ((__section__(".init.text"))) __attribute__((__cold__)) __attribute__((no_instrument_function)) setup_per_cpu_areas(void);

extern void __attribute__ ((__section__(".init.text"))) __attribute__((__cold__)) __attribute__((no_instrument_function)) percpu_init_late(void);
# 171 "include/linux/percpu.h"
extern void *__alloc_percpu(size_t size, size_t align);
extern void free_percpu(void *__pdata);
extern phys_addr_t per_cpu_ptr_to_phys(void *addr);
# 237 "include/linux/percpu.h"
extern void __bad_size_call_parameter(void);
# 35 "include/linux/topology.h" 2
# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/topology.h" 1
# 11 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/topology.h"
# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/mach-generic/topology.h" 1
# 1 "include/asm-generic/topology.h" 1
# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/mach-generic/topology.h" 2
# 12 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/topology.h" 2
# 36 "include/linux/topology.h" 2
# 49 "include/linux/topology.h"
int arch_update_cpu_topology(void);
# 247 "include/linux/topology.h"
static inline __attribute__((always_inline)) int numa_node_id(void)
{
 return ((void)((__current_thread_info->cpu)),0);
}
# 297 "include/linux/topology.h"
static inline __attribute__((always_inline)) int numa_mem_id(void)
{
 return numa_node_id();
}
# 8 "include/linux/gfp.h" 2
# 1 "include/linux/mmdebug.h" 1
# 9 "include/linux/gfp.h" 2

struct vm_area_struct;
# 143 "include/linux/gfp.h"
static inline __attribute__((always_inline)) int allocflags_to_migratetype(gfp_t gfp_flags)
{
 ({ int __ret_warn_on = !!((gfp_flags & ((( gfp_t)0x80000u)|(( gfp_t)0x08u))) == ((( gfp_t)0x80000u)|(( gfp_t)0x08u))); if (__builtin_expect(!!(__ret_warn_on), 0)) warn_slowpath_null("include/linux/gfp.h", 145); __builtin_expect(!!(__ret_warn_on), 0); });

 if (__builtin_expect(!!(page_group_by_mobility_disabled), 0))
  return 0;


 return (((gfp_flags & (( gfp_t)0x08u)) != 0) << 1) |
  ((gfp_flags & (( gfp_t)0x80000u)) != 0);
}
# 238 "include/linux/gfp.h"
static inline __attribute__((always_inline)) enum zone_type gfp_zone(gfp_t flags)
{
 enum zone_type z;
 int bit = flags & ((( gfp_t)0x01u)|(( gfp_t)0x02u)|(( gfp_t)0x04u)|(( gfp_t)0x08u));

 z = (( (ZONE_NORMAL << 0 * 1) | (ZONE_NORMAL << (( gfp_t)0x01u) * 1) | (ZONE_NORMAL << (( gfp_t)0x02u) * 1) | (ZONE_NORMAL << (( gfp_t)0x04u) * 1) | (ZONE_NORMAL << (( gfp_t)0x08u) * 1) | (ZONE_NORMAL << ((( gfp_t)0x08u) | (( gfp_t)0x01u)) * 1) | (ZONE_MOVABLE << ((( gfp_t)0x08u) | (( gfp_t)0x02u)) * 1) | (ZONE_NORMAL << ((( gfp_t)0x08u) | (( gfp_t)0x04u)) * 1)) >> (bit * 1)) &
      ((1 << 1) - 1);

 if (__builtin_constant_p(bit))
  ((void)sizeof(char[1 - 2 * !!((( 1 << ((( gfp_t)0x01u) | (( gfp_t)0x02u)) | 1 << ((( gfp_t)0x01u) | (( gfp_t)0x04u)) | 1 << ((( gfp_t)0x04u) | (( gfp_t)0x02u)) | 1 << ((( gfp_t)0x01u) | (( gfp_t)0x04u) | (( gfp_t)0x02u)) | 1 << ((( gfp_t)0x08u) | (( gfp_t)0x02u) | (( gfp_t)0x01u)) | 1 << ((( gfp_t)0x08u) | (( gfp_t)0x04u) | (( gfp_t)0x01u)) | 1 << ((( gfp_t)0x08u) | (( gfp_t)0x04u) | (( gfp_t)0x02u)) | 1 << ((( gfp_t)0x08u) | (( gfp_t)0x04u) | (( gfp_t)0x01u) | (( gfp_t)0x02u))) >> bit) & 1)]));
 else {



 }
 return z;
}
# 263 "include/linux/gfp.h"
static inline __attribute__((always_inline)) int gfp_zonelist(gfp_t flags)
{
 if (0 && __builtin_expect(!!(flags & (( gfp_t)0x40000u)), 0))
  return 1;

 return 0;
}
# 280 "include/linux/gfp.h"
static inline __attribute__((always_inline)) struct zonelist *node_zonelist(int nid, gfp_t flags)
{
 return (&contig_page_data)->node_zonelists + gfp_zonelist(flags);
}


static inline __attribute__((always_inline)) void arch_free_page(struct page *page, int order) { }


static inline __attribute__((always_inline)) void arch_alloc_page(struct page *page, int order) { }


struct page *
__alloc_pages_nodemask(gfp_t gfp_mask, unsigned int order,
         struct zonelist *zonelist, nodemask_t *nodemask);

static inline __attribute__((always_inline)) struct page *
__alloc_pages(gfp_t gfp_mask, unsigned int order,
  struct zonelist *zonelist)
{
 return __alloc_pages_nodemask(gfp_mask, order, zonelist, ((void *)0));
}

static inline __attribute__((always_inline)) struct page *alloc_pages_node(int nid, gfp_t gfp_mask,
      unsigned int order)
{

 if (nid < 0)
  nid = numa_node_id();

 return __alloc_pages(gfp_mask, order, node_zonelist(nid, gfp_mask));
}

static inline __attribute__((always_inline)) struct page *alloc_pages_exact_node(int nid, gfp_t gfp_mask,
      unsigned int order)
{
 do { (void)(nid < 0 || nid >= (1 << 0)); } while (0);

 return __alloc_pages(gfp_mask, order, node_zonelist(nid, gfp_mask));
}
# 338 "include/linux/gfp.h"
extern unsigned long __get_free_pages(gfp_t gfp_mask, unsigned int order);
extern unsigned long get_zeroed_page(gfp_t gfp_mask);

void *alloc_pages_exact(size_t size, gfp_t gfp_mask);
void free_pages_exact(void *virt, size_t size);







extern void __free_pages(struct page *page, unsigned int order);
extern void free_pages(unsigned long addr, unsigned int order);
extern void free_hot_cold_page(struct page *page, int cold);




void page_alloc_init(void);
void drain_zone_pages(struct zone *zone, struct per_cpu_pages *pcp);
void drain_all_pages(void);
void drain_local_pages(void *dummy);

extern gfp_t gfp_allowed_mask;

extern void set_gfp_allowed_mask(gfp_t mask);
extern gfp_t clear_gfp_allowed_mask(gfp_t mask);
# 23 "include/linux/kmod.h" 2



# 1 "include/linux/workqueue.h" 1







# 1 "include/linux/timer.h" 1




# 1 "include/linux/ktime.h" 1
# 25 "include/linux/ktime.h"
# 1 "include/linux/jiffies.h" 1







# 1 "include/linux/timex.h" 1
# 64 "include/linux/timex.h"
struct timex {
 unsigned int modes;
 long offset;
 long freq;
 long maxerror;
 long esterror;
 int status;
 long constant;
 long precision;
 long tolerance;


 struct timeval time;
 long tick;

 long ppsfreq;
 long jitter;
 int shift;
 long stabil;
 long jitcnt;
 long calcnt;
 long errcnt;
 long stbcnt;

 int tai;

 int :32; int :32; int :32; int :32;
 int :32; int :32; int :32; int :32;
 int :32; int :32; int :32;
};
# 171 "include/linux/timex.h"
# 1 "include/linux/param.h" 1



# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/param.h" 1
# 14 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/param.h"
# 1 "include/asm-generic/param.h" 1
# 15 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/param.h" 2
# 5 "include/linux/param.h" 2
# 172 "include/linux/timex.h" 2

# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/timex.h" 1
# 34 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/timex.h"
typedef unsigned int cycles_t;

static inline __attribute__((always_inline)) cycles_t get_cycles(void)
{
 return 0;
}
# 174 "include/linux/timex.h" 2
# 233 "include/linux/timex.h"
extern unsigned long tick_usec;
extern unsigned long tick_nsec;




extern int time_status;

extern void ntp_init(void);
extern void ntp_clear(void);





static inline __attribute__((always_inline)) int ntp_synced(void)
{
 return !(time_status & 0x0040);
}
# 266 "include/linux/timex.h"
extern u64 tick_length;

extern void second_overflow(void);
extern void update_ntp_one_tick(void);
extern int do_adjtimex(struct timex *);

int read_current_timer(unsigned long *timer_val);
# 9 "include/linux/jiffies.h" 2
# 81 "include/linux/jiffies.h"
extern u64 __attribute__((section(".data"))) jiffies_64;
extern unsigned long volatile __attribute__((section(".data"))) jiffies;


u64 get_jiffies_64(void);
# 183 "include/linux/jiffies.h"
extern unsigned long preset_lpj;
# 296 "include/linux/jiffies.h"
extern unsigned int jiffies_to_msecs(const unsigned long j);
extern unsigned int jiffies_to_usecs(const unsigned long j);
extern unsigned long msecs_to_jiffies(const unsigned int m);
extern unsigned long usecs_to_jiffies(const unsigned int u);
extern unsigned long timespec_to_jiffies(const struct timespec *value);
extern void jiffies_to_timespec(const unsigned long jiffies,
    struct timespec *value);
extern unsigned long timeval_to_jiffies(const struct timeval *value);
extern void jiffies_to_timeval(const unsigned long jiffies,
          struct timeval *value);
extern clock_t jiffies_to_clock_t(long x);
extern unsigned long clock_t_to_jiffies(unsigned long x);
extern u64 jiffies_64_to_clock_t(u64 x);
extern u64 nsec_to_clock_t(u64 x);
extern unsigned long nsecs_to_jiffies(u64 n);
# 26 "include/linux/ktime.h" 2
# 46 "include/linux/ktime.h"
union ktime {
 s64 tv64;

 struct {

 s32 sec, nsec;



 } tv;

};

typedef union ktime ktime_t;
# 151 "include/linux/ktime.h"
static inline __attribute__((always_inline)) ktime_t ktime_set(const long secs, const unsigned long nsecs)
{
 return (ktime_t) { .tv = { .sec = secs, .nsec = nsecs } };
}
# 163 "include/linux/ktime.h"
static inline __attribute__((always_inline)) ktime_t ktime_sub(const ktime_t lhs, const ktime_t rhs)
{
 ktime_t res;

 res.tv64 = lhs.tv64 - rhs.tv64;
 if (res.tv.nsec < 0)
  res.tv.nsec += 1000000000L;

 return res;
}
# 181 "include/linux/ktime.h"
static inline __attribute__((always_inline)) ktime_t ktime_add(const ktime_t add1, const ktime_t add2)
{
 ktime_t res;

 res.tv64 = add1.tv64 + add2.tv64;
# 194 "include/linux/ktime.h"
 if (res.tv.nsec >= 1000000000L)
  res.tv64 += (u32)-1000000000L;

 return res;
}
# 207 "include/linux/ktime.h"
extern ktime_t ktime_add_ns(const ktime_t kt, u64 nsec);
# 216 "include/linux/ktime.h"
extern ktime_t ktime_sub_ns(const ktime_t kt, u64 nsec);







static inline __attribute__((always_inline)) ktime_t timespec_to_ktime(const struct timespec ts)
{
 return (ktime_t) { .tv = { .sec = (s32)ts.tv_sec,
          .nsec = (s32)ts.tv_nsec } };
}







static inline __attribute__((always_inline)) ktime_t timeval_to_ktime(const struct timeval tv)
{
 return (ktime_t) { .tv = { .sec = (s32)tv.tv_sec,
       .nsec = (s32)tv.tv_usec * 1000 } };
}







static inline __attribute__((always_inline)) struct timespec ktime_to_timespec(const ktime_t kt)
{
 return (struct timespec) { .tv_sec = (time_t) kt.tv.sec,
       .tv_nsec = (long) kt.tv.nsec };
}







static inline __attribute__((always_inline)) struct timeval ktime_to_timeval(const ktime_t kt)
{
 return (struct timeval) {
  .tv_sec = (time_t) kt.tv.sec,
  .tv_usec = (suseconds_t) (kt.tv.nsec / 1000L) };
}







static inline __attribute__((always_inline)) s64 ktime_to_ns(const ktime_t kt)
{
 return (s64) kt.tv.sec * 1000000000L + kt.tv.nsec;
}
# 287 "include/linux/ktime.h"
static inline __attribute__((always_inline)) int ktime_equal(const ktime_t cmp1, const ktime_t cmp2)
{
 return cmp1.tv64 == cmp2.tv64;
}

static inline __attribute__((always_inline)) s64 ktime_to_us(const ktime_t kt)
{
 struct timeval tv = ktime_to_timeval(kt);
 return (s64) tv.tv_sec * 1000000L + tv.tv_usec;
}

static inline __attribute__((always_inline)) s64 ktime_to_ms(const ktime_t kt)
{
 struct timeval tv = ktime_to_timeval(kt);
 return (s64) tv.tv_sec * 1000L + tv.tv_usec / 1000L;
}

static inline __attribute__((always_inline)) s64 ktime_us_delta(const ktime_t later, const ktime_t earlier)
{
       return ktime_to_us(ktime_sub(later, earlier));
}

static inline __attribute__((always_inline)) ktime_t ktime_add_us(const ktime_t kt, const u64 usec)
{
 return ktime_add_ns(kt, usec * 1000);
}

static inline __attribute__((always_inline)) ktime_t ktime_sub_us(const ktime_t kt, const u64 usec)
{
 return ktime_sub_ns(kt, usec * 1000);
}

extern ktime_t ktime_add_safe(const ktime_t lhs, const ktime_t rhs);
# 331 "include/linux/ktime.h"
extern void ktime_get_ts(struct timespec *ts);




static inline __attribute__((always_inline)) ktime_t ns_to_ktime(u64 ns)
{
 static const ktime_t ktime_zero = { .tv64 = 0 };
 return ktime_add_ns(ktime_zero, ns);
}
# 6 "include/linux/timer.h" 2

# 1 "include/linux/debugobjects.h" 1






enum debug_obj_state {
 ODEBUG_STATE_NONE,
 ODEBUG_STATE_INIT,
 ODEBUG_STATE_INACTIVE,
 ODEBUG_STATE_ACTIVE,
 ODEBUG_STATE_DESTROYED,
 ODEBUG_STATE_NOTAVAILABLE,
 ODEBUG_STATE_MAX,
};

struct debug_obj_descr;
# 27 "include/linux/debugobjects.h"
struct debug_obj {
 struct hlist_node node;
 enum debug_obj_state state;
 unsigned int astate;
 void *object;
 struct debug_obj_descr *descr;
};
# 47 "include/linux/debugobjects.h"
struct debug_obj_descr {
 const char *name;

 int (*fixup_init) (void *addr, enum debug_obj_state state);
 int (*fixup_activate) (void *addr, enum debug_obj_state state);
 int (*fixup_destroy) (void *addr, enum debug_obj_state state);
 int (*fixup_free) (void *addr, enum debug_obj_state state);
};
# 77 "include/linux/debugobjects.h"
static inline __attribute__((always_inline)) void
debug_object_init (void *addr, struct debug_obj_descr *descr) { }
static inline __attribute__((always_inline)) void
debug_object_init_on_stack(void *addr, struct debug_obj_descr *descr) { }
static inline __attribute__((always_inline)) void
debug_object_activate (void *addr, struct debug_obj_descr *descr) { }
static inline __attribute__((always_inline)) void
debug_object_deactivate(void *addr, struct debug_obj_descr *descr) { }
static inline __attribute__((always_inline)) void
debug_object_destroy (void *addr, struct debug_obj_descr *descr) { }
static inline __attribute__((always_inline)) void
debug_object_free (void *addr, struct debug_obj_descr *descr) { }

static inline __attribute__((always_inline)) void debug_objects_early_init(void) { }
static inline __attribute__((always_inline)) void debug_objects_mem_init(void) { }





static inline __attribute__((always_inline)) void
debug_check_no_obj_freed(const void *address, unsigned long size) { }
# 8 "include/linux/timer.h" 2


struct tvec_base;

struct timer_list {




 struct list_head entry;
 unsigned long expires;
 struct tvec_base *base;

 void (*function)(unsigned long);
 unsigned long data;

 int slack;
# 34 "include/linux/timer.h"
};

extern struct tvec_base boot_tvec_bases;
# 65 "include/linux/timer.h"
void init_timer_key(struct timer_list *timer,
      const char *name,
      struct lock_class_key *key);
void init_timer_deferrable_key(struct timer_list *timer,
          const char *name,
          struct lock_class_key *key);
# 131 "include/linux/timer.h"
static inline __attribute__((always_inline)) void destroy_timer_on_stack(struct timer_list *timer) { }
static inline __attribute__((always_inline)) void init_timer_on_stack_key(struct timer_list *timer,
        const char *name,
        struct lock_class_key *key)
{
 init_timer_key(timer, name, key);
}


static inline __attribute__((always_inline)) void setup_timer_key(struct timer_list * timer,
    const char *name,
    struct lock_class_key *key,
    void (*function)(unsigned long),
    unsigned long data)
{
 timer->function = function;
 timer->data = data;
 init_timer_key(timer, name, key);
}

static inline __attribute__((always_inline)) void setup_timer_on_stack_key(struct timer_list *timer,
     const char *name,
     struct lock_class_key *key,
     void (*function)(unsigned long),
     unsigned long data)
{
 timer->function = function;
 timer->data = data;
 init_timer_on_stack_key(timer, name, key);
}

extern void setup_deferrable_timer_on_stack_key(struct timer_list *timer,
      const char *name,
      struct lock_class_key *key,
      void (*function)(unsigned long),
      unsigned long data);
# 178 "include/linux/timer.h"
static inline __attribute__((always_inline)) int timer_pending(const struct timer_list * timer)
{
 return timer->entry.next != ((void *)0);
}

extern void add_timer_on(struct timer_list *timer, int cpu);
extern int del_timer(struct timer_list * timer);
extern int mod_timer(struct timer_list *timer, unsigned long expires);
extern int mod_timer_pending(struct timer_list *timer, unsigned long expires);
extern int mod_timer_pinned(struct timer_list *timer, unsigned long expires);

extern void set_timer_slack(struct timer_list *time, int slack_hz);
# 204 "include/linux/timer.h"
extern unsigned long get_next_timer_interrupt(unsigned long now);
# 236 "include/linux/timer.h"
static inline __attribute__((always_inline)) void init_timer_stats(void)
{
}

static inline __attribute__((always_inline)) void timer_stats_timer_set_start_info(struct timer_list *timer)
{
}

static inline __attribute__((always_inline)) void timer_stats_timer_clear_start_info(struct timer_list *timer)
{
}


extern void add_timer(struct timer_list *timer);


  extern int try_to_del_timer_sync(struct timer_list *timer);
  extern int del_timer_sync(struct timer_list *timer);







extern void init_timers(void);
extern void run_local_timers(void);
struct hrtimer;
extern enum hrtimer_restart it_real_fn(struct hrtimer *);

unsigned long __round_jiffies(unsigned long j, int cpu);
unsigned long __round_jiffies_relative(unsigned long j, int cpu);
unsigned long round_jiffies(unsigned long j);
unsigned long round_jiffies_relative(unsigned long j);

unsigned long __round_jiffies_up(unsigned long j, int cpu);
unsigned long __round_jiffies_up_relative(unsigned long j, int cpu);
unsigned long round_jiffies_up(unsigned long j);
unsigned long round_jiffies_up_relative(unsigned long j);
# 9 "include/linux/workqueue.h" 2






struct workqueue_struct;

struct work_struct;
typedef void (*work_func_t)(struct work_struct *work);







enum {
 WORK_STRUCT_PENDING_BIT = 0,
 WORK_STRUCT_DELAYED_BIT = 1,
 WORK_STRUCT_CWQ_BIT = 2,
 WORK_STRUCT_LINKED_BIT = 3,




 WORK_STRUCT_COLOR_SHIFT = 4,


 WORK_STRUCT_COLOR_BITS = 4,

 WORK_STRUCT_PENDING = 1 << WORK_STRUCT_PENDING_BIT,
 WORK_STRUCT_DELAYED = 1 << WORK_STRUCT_DELAYED_BIT,
 WORK_STRUCT_CWQ = 1 << WORK_STRUCT_CWQ_BIT,
 WORK_STRUCT_LINKED = 1 << WORK_STRUCT_LINKED_BIT,



 WORK_STRUCT_STATIC = 0,






 WORK_NR_COLORS = (1 << WORK_STRUCT_COLOR_BITS) - 1,
 WORK_NO_COLOR = WORK_NR_COLORS,


 WORK_CPU_UNBOUND = 4,
 WORK_CPU_NONE = 4 + 1,
 WORK_CPU_LAST = WORK_CPU_NONE,






 WORK_STRUCT_FLAG_BITS = WORK_STRUCT_COLOR_SHIFT +
      WORK_STRUCT_COLOR_BITS,

 WORK_STRUCT_FLAG_MASK = (1UL << WORK_STRUCT_FLAG_BITS) - 1,
 WORK_STRUCT_WQ_DATA_MASK = ~WORK_STRUCT_FLAG_MASK,
 WORK_STRUCT_NO_CPU = WORK_CPU_NONE << WORK_STRUCT_FLAG_BITS,


 WORK_BUSY_PENDING = 1 << 0,
 WORK_BUSY_RUNNING = 1 << 1,
};

struct work_struct {
 atomic_long_t data;
 struct list_head entry;
 work_func_t func;



};





struct delayed_work {
 struct work_struct work;
 struct timer_list timer;
};

static inline __attribute__((always_inline)) struct delayed_work *to_delayed_work(struct work_struct *work)
{
 return ({ const typeof( ((struct delayed_work *)0)->work ) *__mptr = (work); (struct delayed_work *)( (char *)__mptr - __builtin_offsetof(struct delayed_work,work) );});
}

struct execute_work {
 struct work_struct work;
};
# 155 "include/linux/workqueue.h"
static inline __attribute__((always_inline)) void __init_work(struct work_struct *work, int onstack) { }
static inline __attribute__((always_inline)) void destroy_work_on_stack(struct work_struct *work) { }
static inline __attribute__((always_inline)) unsigned int work_static(struct work_struct *work) { return 0; }
# 242 "include/linux/workqueue.h"
enum {
 WQ_NON_REENTRANT = 1 << 0,
 WQ_UNBOUND = 1 << 1,
 WQ_FREEZEABLE = 1 << 2,
 WQ_RESCUER = 1 << 3,
 WQ_HIGHPRI = 1 << 4,
 WQ_CPU_INTENSIVE = 1 << 5,

 WQ_DYING = 1 << 6,

 WQ_MAX_ACTIVE = 512,
 WQ_MAX_UNBOUND_PER_CPU = 4,
 WQ_DFL_ACTIVE = WQ_MAX_ACTIVE / 2,
};
# 281 "include/linux/workqueue.h"
extern struct workqueue_struct *system_wq;
extern struct workqueue_struct *system_long_wq;
extern struct workqueue_struct *system_nrt_wq;
extern struct workqueue_struct *system_unbound_wq;

extern struct workqueue_struct *
__alloc_workqueue_key(const char *name, unsigned int flags, int max_active,
        struct lock_class_key *key, const char *lock_name);
# 316 "include/linux/workqueue.h"
extern void destroy_workqueue(struct workqueue_struct *wq);

extern int queue_work(struct workqueue_struct *wq, struct work_struct *work);
extern int queue_work_on(int cpu, struct workqueue_struct *wq,
   struct work_struct *work);
extern int queue_delayed_work(struct workqueue_struct *wq,
   struct delayed_work *work, unsigned long delay);
extern int queue_delayed_work_on(int cpu, struct workqueue_struct *wq,
   struct delayed_work *work, unsigned long delay);

extern void flush_workqueue(struct workqueue_struct *wq);
extern void flush_scheduled_work(void);
extern void flush_delayed_work(struct delayed_work *work);

extern int schedule_work(struct work_struct *work);
extern int schedule_work_on(int cpu, struct work_struct *work);
extern int schedule_delayed_work(struct delayed_work *work, unsigned long delay);
extern int schedule_delayed_work_on(int cpu, struct delayed_work *work,
     unsigned long delay);
extern int schedule_on_each_cpu(work_func_t func);
extern int keventd_up(void);

int execute_in_process_context(work_func_t fn, struct execute_work *);

extern int flush_work(struct work_struct *work);
extern int cancel_work_sync(struct work_struct *work);

extern void workqueue_set_max_active(struct workqueue_struct *wq,
         int max_active);
extern int workqueue_congested(unsigned int cpu, struct workqueue_struct *wq);
extern unsigned int work_cpu(struct work_struct *work);
extern unsigned int work_busy(struct work_struct *work);







static inline __attribute__((always_inline)) int cancel_delayed_work(struct delayed_work *work)
{
 int ret;

 ret = del_timer_sync(&work->timer);
 if (ret)
  clear_bit(WORK_STRUCT_PENDING_BIT, ((unsigned long *)(&(&work->work)->data)));
 return ret;
}






static inline __attribute__((always_inline)) int __cancel_delayed_work(struct delayed_work *work)
{
 int ret;

 ret = del_timer(&work->timer);
 if (ret)
  clear_bit(WORK_STRUCT_PENDING_BIT, ((unsigned long *)(&(&work->work)->data)));
 return ret;
}

extern int cancel_delayed_work_sync(struct delayed_work *work);


static inline __attribute__((always_inline))
void cancel_rearming_delayed_workqueue(struct workqueue_struct *wq,
     struct delayed_work *work)
{
 cancel_delayed_work_sync(work);
}


static inline __attribute__((always_inline))
void cancel_rearming_delayed_work(struct delayed_work *work)
{
 cancel_delayed_work_sync(work);
}







long work_on_cpu(unsigned int cpu, long (*fn)(void *), void *arg);
# 27 "include/linux/kmod.h" 2




extern char modprobe_path[];


extern int __request_module(int wait, const char *name, ...) __attribute__((format(printf, 2, 3)));
# 47 "include/linux/kmod.h"
struct key;
struct file;

enum umh_wait {
 UMH_NO_WAIT = -1,
 UMH_WAIT_EXEC = 0,
 UMH_WAIT_PROC = 1,
};

struct subprocess_info {
 struct work_struct work;
 struct completion *complete;
 char *path;
 char **argv;
 char **envp;
 enum umh_wait wait;
 int retval;
 int (*init)(struct subprocess_info *info);
 void (*cleanup)(struct subprocess_info *info);
 void *data;
};


struct subprocess_info *call_usermodehelper_setup(char *path, char **argv,
        char **envp, gfp_t gfp_mask);


void call_usermodehelper_setfns(struct subprocess_info *info,
      int (*init)(struct subprocess_info *info),
      void (*cleanup)(struct subprocess_info *info),
      void *data);


int call_usermodehelper_exec(struct subprocess_info *info, enum umh_wait wait);



void call_usermodehelper_freeinfo(struct subprocess_info *info);

static inline __attribute__((always_inline)) int
call_usermodehelper_fns(char *path, char **argv, char **envp,
   enum umh_wait wait,
   int (*init)(struct subprocess_info *info),
   void (*cleanup)(struct subprocess_info *), void *data)
{
 struct subprocess_info *info;
 gfp_t gfp_mask = (wait == UMH_NO_WAIT) ? ((( gfp_t)0x20u)) : ((( gfp_t)0x10u) | (( gfp_t)0x40u) | (( gfp_t)0x80u));

 info = call_usermodehelper_setup(path, argv, envp, gfp_mask);

 if (info == ((void *)0))
  return -12;

 call_usermodehelper_setfns(info, init, cleanup, data);

 return call_usermodehelper_exec(info, wait);
}

static inline __attribute__((always_inline)) int
call_usermodehelper(char *path, char **argv, char **envp, enum umh_wait wait)
{
 return call_usermodehelper_fns(path, argv, envp, wait,
           ((void *)0), ((void *)0), ((void *)0));
}

extern void usermodehelper_init(void);

extern int usermodehelper_disable(void);
extern void usermodehelper_enable(void);
# 14 "include/linux/module.h" 2
# 1 "include/linux/elf.h" 1




# 1 "include/linux/elf-em.h" 1
# 6 "include/linux/elf.h" 2

# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/elf.h" 1
# 170 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/elf.h"
typedef unsigned long elf_greg_t;
typedef elf_greg_t elf_gregset_t[45];

typedef double elf_fpreg_t;
typedef elf_fpreg_t elf_fpregset_t[33];
# 242 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/elf.h"
struct mips_abi;

extern struct mips_abi mips_abi;
extern struct mips_abi mips_abi_32;
extern struct mips_abi mips_abi_n32;
# 313 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/elf.h"
struct pt_regs;
struct task_struct;

extern void elf_dump_regs(elf_greg_t *, struct pt_regs *regs);
extern int dump_task_regs(struct task_struct *, elf_gregset_t *);
extern int dump_task_fpu(struct task_struct *, elf_fpregset_t *);
# 345 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/elf.h"
extern const char *__elf_platform;
# 372 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/elf.h"
struct linux_binprm;
extern int arch_setup_additional_pages(struct linux_binprm *bprm,
           int uses_interp);

struct mm_struct;
extern unsigned long arch_randomize_brk(struct mm_struct *mm);
# 8 "include/linux/elf.h" 2


struct file;
# 20 "include/linux/elf.h"
typedef __u32 Elf32_Addr;
typedef __u16 Elf32_Half;
typedef __u32 Elf32_Off;
typedef __s32 Elf32_Sword;
typedef __u32 Elf32_Word;


typedef __u64 Elf64_Addr;
typedef __u16 Elf64_Half;
typedef __s16 Elf64_SHalf;
typedef __u64 Elf64_Off;
typedef __s32 Elf64_Sword;
typedef __u32 Elf64_Word;
typedef __u64 Elf64_Xword;
typedef __s64 Elf64_Sxword;
# 149 "include/linux/elf.h"
typedef struct dynamic{
  Elf32_Sword d_tag;
  union{
    Elf32_Sword d_val;
    Elf32_Addr d_ptr;
  } d_un;
} Elf32_Dyn;

typedef struct {
  Elf64_Sxword d_tag;
  union {
    Elf64_Xword d_val;
    Elf64_Addr d_ptr;
  } d_un;
} Elf64_Dyn;
# 172 "include/linux/elf.h"
typedef struct elf32_rel {
  Elf32_Addr r_offset;
  Elf32_Word r_info;
} Elf32_Rel;

typedef struct elf64_rel {
  Elf64_Addr r_offset;
  Elf64_Xword r_info;
} Elf64_Rel;

typedef struct elf32_rela{
  Elf32_Addr r_offset;
  Elf32_Word r_info;
  Elf32_Sword r_addend;
} Elf32_Rela;

typedef struct elf64_rela {
  Elf64_Addr r_offset;
  Elf64_Xword r_info;
  Elf64_Sxword r_addend;
} Elf64_Rela;

typedef struct elf32_sym{
  Elf32_Word st_name;
  Elf32_Addr st_value;
  Elf32_Word st_size;
  unsigned char st_info;
  unsigned char st_other;
  Elf32_Half st_shndx;
} Elf32_Sym;

typedef struct elf64_sym {
  Elf64_Word st_name;
  unsigned char st_info;
  unsigned char st_other;
  Elf64_Half st_shndx;
  Elf64_Addr st_value;
  Elf64_Xword st_size;
} Elf64_Sym;




typedef struct elf32_hdr{
  unsigned char e_ident[16];
  Elf32_Half e_type;
  Elf32_Half e_machine;
  Elf32_Word e_version;
  Elf32_Addr e_entry;
  Elf32_Off e_phoff;
  Elf32_Off e_shoff;
  Elf32_Word e_flags;
  Elf32_Half e_ehsize;
  Elf32_Half e_phentsize;
  Elf32_Half e_phnum;
  Elf32_Half e_shentsize;
  Elf32_Half e_shnum;
  Elf32_Half e_shstrndx;
} Elf32_Ehdr;

typedef struct elf64_hdr {
  unsigned char e_ident[16];
  Elf64_Half e_type;
  Elf64_Half e_machine;
  Elf64_Word e_version;
  Elf64_Addr e_entry;
  Elf64_Off e_phoff;
  Elf64_Off e_shoff;
  Elf64_Word e_flags;
  Elf64_Half e_ehsize;
  Elf64_Half e_phentsize;
  Elf64_Half e_phnum;
  Elf64_Half e_shentsize;
  Elf64_Half e_shnum;
  Elf64_Half e_shstrndx;
} Elf64_Ehdr;







typedef struct elf32_phdr{
  Elf32_Word p_type;
  Elf32_Off p_offset;
  Elf32_Addr p_vaddr;
  Elf32_Addr p_paddr;
  Elf32_Word p_filesz;
  Elf32_Word p_memsz;
  Elf32_Word p_flags;
  Elf32_Word p_align;
} Elf32_Phdr;

typedef struct elf64_phdr {
  Elf64_Word p_type;
  Elf64_Word p_flags;
  Elf64_Off p_offset;
  Elf64_Addr p_vaddr;
  Elf64_Addr p_paddr;
  Elf64_Xword p_filesz;
  Elf64_Xword p_memsz;
  Elf64_Xword p_align;
} Elf64_Phdr;
# 311 "include/linux/elf.h"
typedef struct elf32_shdr {
  Elf32_Word sh_name;
  Elf32_Word sh_type;
  Elf32_Word sh_flags;
  Elf32_Addr sh_addr;
  Elf32_Off sh_offset;
  Elf32_Word sh_size;
  Elf32_Word sh_link;
  Elf32_Word sh_info;
  Elf32_Word sh_addralign;
  Elf32_Word sh_entsize;
} Elf32_Shdr;

typedef struct elf64_shdr {
  Elf64_Word sh_name;
  Elf64_Word sh_type;
  Elf64_Xword sh_flags;
  Elf64_Addr sh_addr;
  Elf64_Off sh_offset;
  Elf64_Xword sh_size;
  Elf64_Word sh_link;
  Elf64_Word sh_info;
  Elf64_Xword sh_addralign;
  Elf64_Xword sh_entsize;
} Elf64_Shdr;
# 401 "include/linux/elf.h"
typedef struct elf32_note {
  Elf32_Word n_namesz;
  Elf32_Word n_descsz;
  Elf32_Word n_type;
} Elf32_Nhdr;


typedef struct elf64_note {
  Elf64_Word n_namesz;
  Elf64_Word n_descsz;
  Elf64_Word n_type;
} Elf64_Nhdr;




extern Elf32_Dyn _DYNAMIC [];
# 439 "include/linux/elf.h"
static inline __attribute__((always_inline)) int elf_coredump_extra_notes_size(void) { return 0; }
static inline __attribute__((always_inline)) int elf_coredump_extra_notes_write(struct file *file,
   loff_t *foffset) { return 0; }
# 15 "include/linux/module.h" 2

# 1 "include/linux/kobject.h" 1
# 21 "include/linux/kobject.h"
# 1 "include/linux/sysfs.h" 1
# 19 "include/linux/sysfs.h"
# 1 "include/linux/kobject_ns.h" 1
# 20 "include/linux/kobject_ns.h"
struct sock;
struct kobject;





enum kobj_ns_type {
 KOBJ_NS_TYPE_NONE = 0,
 KOBJ_NS_TYPE_NET,
 KOBJ_NS_TYPES
};







struct kobj_ns_type_operations {
 enum kobj_ns_type type;
 const void *(*current_ns)(void);
 const void *(*netlink_ns)(struct sock *sk);
 const void *(*initial_ns)(void);
};

int kobj_ns_type_register(const struct kobj_ns_type_operations *ops);
int kobj_ns_type_registered(enum kobj_ns_type type);
const struct kobj_ns_type_operations *kobj_child_ns_ops(struct kobject *parent);
const struct kobj_ns_type_operations *kobj_ns_ops(struct kobject *kobj);

const void *kobj_ns_current(enum kobj_ns_type type);
const void *kobj_ns_netlink(enum kobj_ns_type type, struct sock *sk);
const void *kobj_ns_initial(enum kobj_ns_type type);
void kobj_ns_exit(enum kobj_ns_type type, const void *ns);
# 20 "include/linux/sysfs.h" 2


struct kobject;
struct module;
enum kobj_ns_type;

struct attribute {
 const char *name;
 mode_t mode;




};
# 56 "include/linux/sysfs.h"
struct attribute_group {
 const char *name;
 mode_t (*is_visible)(struct kobject *,
           struct attribute *, int);
 struct attribute **attrs;
};
# 85 "include/linux/sysfs.h"
struct file;
struct vm_area_struct;

struct bin_attribute {
 struct attribute attr;
 size_t size;
 void *private;
 ssize_t (*read)(struct file *, struct kobject *, struct bin_attribute *,
   char *, loff_t, size_t);
 ssize_t (*write)(struct file *,struct kobject *, struct bin_attribute *,
    char *, loff_t, size_t);
 int (*mmap)(struct file *, struct kobject *, struct bin_attribute *attr,
      struct vm_area_struct *vma);
};
# 112 "include/linux/sysfs.h"
struct sysfs_ops {
 ssize_t (*show)(struct kobject *, struct attribute *,char *);
 ssize_t (*store)(struct kobject *,struct attribute *,const char *, size_t);
};

struct sysfs_dirent;
# 184 "include/linux/sysfs.h"
static inline __attribute__((always_inline)) int sysfs_schedule_callback(struct kobject *kobj,
  void (*func)(void *), void *data, struct module *owner)
{
 return -89;
}

static inline __attribute__((always_inline)) int sysfs_create_dir(struct kobject *kobj)
{
 return 0;
}

static inline __attribute__((always_inline)) void sysfs_remove_dir(struct kobject *kobj)
{
}

static inline __attribute__((always_inline)) int sysfs_rename_dir(struct kobject *kobj, const char *new_name)
{
 return 0;
}

static inline __attribute__((always_inline)) int sysfs_move_dir(struct kobject *kobj,
     struct kobject *new_parent_kobj)
{
 return 0;
}

static inline __attribute__((always_inline)) int sysfs_create_file(struct kobject *kobj,
        const struct attribute *attr)
{
 return 0;
}

static inline __attribute__((always_inline)) int sysfs_create_files(struct kobject *kobj,
        const struct attribute **attr)
{
 return 0;
}

static inline __attribute__((always_inline)) int sysfs_chmod_file(struct kobject *kobj,
       const struct attribute *attr, mode_t mode)
{
 return 0;
}

static inline __attribute__((always_inline)) void sysfs_remove_file(struct kobject *kobj,
         const struct attribute *attr)
{
}

static inline __attribute__((always_inline)) void sysfs_remove_files(struct kobject *kobj,
         const struct attribute **attr)
{
}

static inline __attribute__((always_inline)) int sysfs_create_bin_file(struct kobject *kobj,
     const struct bin_attribute *attr)
{
 return 0;
}

static inline __attribute__((always_inline)) void sysfs_remove_bin_file(struct kobject *kobj,
      const struct bin_attribute *attr)
{
}

static inline __attribute__((always_inline)) int sysfs_create_link(struct kobject *kobj,
        struct kobject *target, const char *name)
{
 return 0;
}

static inline __attribute__((always_inline)) int sysfs_create_link_nowarn(struct kobject *kobj,
        struct kobject *target,
        const char *name)
{
 return 0;
}

static inline __attribute__((always_inline)) void sysfs_remove_link(struct kobject *kobj, const char *name)
{
}

static inline __attribute__((always_inline)) int sysfs_rename_link(struct kobject *k, struct kobject *t,
        const char *old_name, const char *new_name)
{
 return 0;
}

static inline __attribute__((always_inline)) void sysfs_delete_link(struct kobject *k, struct kobject *t,
         const char *name)
{
}

static inline __attribute__((always_inline)) int sysfs_create_group(struct kobject *kobj,
         const struct attribute_group *grp)
{
 return 0;
}

static inline __attribute__((always_inline)) int sysfs_update_group(struct kobject *kobj,
    const struct attribute_group *grp)
{
 return 0;
}

static inline __attribute__((always_inline)) void sysfs_remove_group(struct kobject *kobj,
          const struct attribute_group *grp)
{
}

static inline __attribute__((always_inline)) int sysfs_add_file_to_group(struct kobject *kobj,
  const struct attribute *attr, const char *group)
{
 return 0;
}

static inline __attribute__((always_inline)) void sysfs_remove_file_from_group(struct kobject *kobj,
  const struct attribute *attr, const char *group)
{
}

static inline __attribute__((always_inline)) void sysfs_notify(struct kobject *kobj, const char *dir,
    const char *attr)
{
}
static inline __attribute__((always_inline)) void sysfs_notify_dirent(struct sysfs_dirent *sd)
{
}
static inline __attribute__((always_inline))
struct sysfs_dirent *sysfs_get_dirent(struct sysfs_dirent *parent_sd,
          const void *ns,
          const unsigned char *name)
{
 return ((void *)0);
}
static inline __attribute__((always_inline)) struct sysfs_dirent *sysfs_get(struct sysfs_dirent *sd)
{
 return ((void *)0);
}
static inline __attribute__((always_inline)) void sysfs_put(struct sysfs_dirent *sd)
{
}

static inline __attribute__((always_inline)) void sysfs_exit_ns(int type, const void *tag)
{
}

static inline __attribute__((always_inline)) int sysfs_init(void)
{
 return 0;
}

static inline __attribute__((always_inline)) void sysfs_printk_last_file(void)
{
}
# 22 "include/linux/kobject.h" 2


# 1 "include/linux/kref.h" 1
# 20 "include/linux/kref.h"
struct kref {
 atomic_t refcount;
};

void kref_init(struct kref *kref);
void kref_get(struct kref *kref);
int kref_put(struct kref *kref, void (*release) (struct kref *kref));
# 25 "include/linux/kobject.h" 2
# 35 "include/linux/kobject.h"
extern char uevent_helper[];


extern u64 uevent_seqnum;
# 50 "include/linux/kobject.h"
enum kobject_action {
 KOBJ_ADD,
 KOBJ_REMOVE,
 KOBJ_CHANGE,
 KOBJ_MOVE,
 KOBJ_ONLINE,
 KOBJ_OFFLINE,
 KOBJ_MAX
};

struct kobject {
 const char *name;
 struct list_head entry;
 struct kobject *parent;
 struct kset *kset;
 struct kobj_type *ktype;
 struct sysfs_dirent *sd;
 struct kref kref;
 unsigned int state_initialized:1;
 unsigned int state_in_sysfs:1;
 unsigned int state_add_uevent_sent:1;
 unsigned int state_remove_uevent_sent:1;
 unsigned int uevent_suppress:1;
};

extern int kobject_set_name(struct kobject *kobj, const char *name, ...)
       __attribute__((format(printf, 2, 3)));
extern int kobject_set_name_vargs(struct kobject *kobj, const char *fmt,
      va_list vargs);

static inline __attribute__((always_inline)) const char *kobject_name(const struct kobject *kobj)
{
 return kobj->name;
}

extern void kobject_init(struct kobject *kobj, struct kobj_type *ktype);
extern int kobject_add(struct kobject *kobj,
        struct kobject *parent,
        const char *fmt, ...);
extern int kobject_init_and_add(struct kobject *kobj,
          struct kobj_type *ktype,
          struct kobject *parent,
          const char *fmt, ...);

extern void kobject_del(struct kobject *kobj);

extern struct kobject * kobject_create(void);
extern struct kobject * kobject_create_and_add(const char *name,
      struct kobject *parent);

extern int kobject_rename(struct kobject *, const char *new_name);
extern int kobject_move(struct kobject *, struct kobject *);

extern struct kobject *kobject_get(struct kobject *kobj);
extern void kobject_put(struct kobject *kobj);

extern char *kobject_get_path(struct kobject *kobj, gfp_t flag);

struct kobj_type {
 void (*release)(struct kobject *kobj);
 const struct sysfs_ops *sysfs_ops;
 struct attribute **default_attrs;
 const struct kobj_ns_type_operations *(*child_ns_type)(struct kobject *kobj);
 const void *(*namespace)(struct kobject *kobj);
};

struct kobj_uevent_env {
 char *envp[32];
 int envp_idx;
 char buf[2048];
 int buflen;
};

struct kset_uevent_ops {
 int (* const filter)(struct kset *kset, struct kobject *kobj);
 const char *(* const name)(struct kset *kset, struct kobject *kobj);
 int (* const uevent)(struct kset *kset, struct kobject *kobj,
        struct kobj_uevent_env *env);
};

struct kobj_attribute {
 struct attribute attr;
 ssize_t (*show)(struct kobject *kobj, struct kobj_attribute *attr,
   char *buf);
 ssize_t (*store)(struct kobject *kobj, struct kobj_attribute *attr,
    const char *buf, size_t count);
};

extern const struct sysfs_ops kobj_sysfs_ops;

struct sock;
# 159 "include/linux/kobject.h"
struct kset {
 struct list_head list;
 spinlock_t list_lock;
 struct kobject kobj;
 const struct kset_uevent_ops *uevent_ops;
};

extern void kset_init(struct kset *kset);
extern int kset_register(struct kset *kset);
extern void kset_unregister(struct kset *kset);
extern struct kset * kset_create_and_add(const char *name,
      const struct kset_uevent_ops *u,
      struct kobject *parent_kobj);

static inline __attribute__((always_inline)) struct kset *to_kset(struct kobject *kobj)
{
 return kobj ? ({ const typeof( ((struct kset *)0)->kobj ) *__mptr = (kobj); (struct kset *)( (char *)__mptr - __builtin_offsetof(struct kset,kobj) );}) : ((void *)0);
}

static inline __attribute__((always_inline)) struct kset *kset_get(struct kset *k)
{
 return k ? to_kset(kobject_get(&k->kobj)) : ((void *)0);
}

static inline __attribute__((always_inline)) void kset_put(struct kset *k)
{
 kobject_put(&k->kobj);
}

static inline __attribute__((always_inline)) struct kobj_type *get_ktype(struct kobject *kobj)
{
 return kobj->ktype;
}

extern struct kobject *kset_find_obj(struct kset *, const char *);


extern struct kobject *kernel_kobj;

extern struct kobject *mm_kobj;

extern struct kobject *hypervisor_kobj;

extern struct kobject *power_kobj;

extern struct kobject *firmware_kobj;
# 217 "include/linux/kobject.h"
static inline __attribute__((always_inline)) int kobject_uevent(struct kobject *kobj,
     enum kobject_action action)
{ return 0; }
static inline __attribute__((always_inline)) int kobject_uevent_env(struct kobject *kobj,
          enum kobject_action action,
          char *envp[])
{ return 0; }

static inline __attribute__((always_inline)) int add_uevent_var(struct kobj_uevent_env *env,
     const char *format, ...)
{ return 0; }

static inline __attribute__((always_inline)) int kobject_action_type(const char *buf, size_t count,
          enum kobject_action *type)
{ return -22; }
# 17 "include/linux/module.h" 2
# 1 "include/linux/moduleparam.h" 1
# 32 "include/linux/moduleparam.h"
struct kernel_param;

struct kernel_param_ops {

 int (*set)(const char *val, const struct kernel_param *kp);

 int (*get)(char *buffer, const struct kernel_param *kp);

 void (*free)(void *arg);
};




struct kernel_param {
 const char *name;
 const struct kernel_param_ops *ops;
 u16 perm;
 u16 flags;
 union {
  void *arg;
  const struct kparam_string *str;
  const struct kparam_array *arr;
 };
};


struct kparam_string {
 unsigned int maxlen;
 char *string;
};


struct kparam_array
{
 unsigned int max;
 unsigned int *num;
 const struct kernel_param_ops *ops;
 unsigned int elemsize;
 void *elem;
};
# 164 "include/linux/moduleparam.h"
static inline __attribute__((always_inline)) int
__check_old_set_param(int (*oldset)(const char *, struct kernel_param *))
{
 return 0;
}
# 218 "include/linux/moduleparam.h"
static inline __attribute__((always_inline)) void __kernel_param_lock(void)
{
}
static inline __attribute__((always_inline)) void __kernel_param_unlock(void)
{
}
# 264 "include/linux/moduleparam.h"
extern int parse_args(const char *name,
        char *args,
        const struct kernel_param *params,
        unsigned num,
        int (*unknown)(char *param, char *val));





static inline __attribute__((always_inline)) void destroy_params(const struct kernel_param *params,
      unsigned num)
{
}
# 286 "include/linux/moduleparam.h"
extern struct kernel_param_ops param_ops_byte;
extern int param_set_byte(const char *val, const struct kernel_param *kp);
extern int param_get_byte(char *buffer, const struct kernel_param *kp);


extern struct kernel_param_ops param_ops_short;
extern int param_set_short(const char *val, const struct kernel_param *kp);
extern int param_get_short(char *buffer, const struct kernel_param *kp);


extern struct kernel_param_ops param_ops_ushort;
extern int param_set_ushort(const char *val, const struct kernel_param *kp);
extern int param_get_ushort(char *buffer, const struct kernel_param *kp);


extern struct kernel_param_ops param_ops_int;
extern int param_set_int(const char *val, const struct kernel_param *kp);
extern int param_get_int(char *buffer, const struct kernel_param *kp);


extern struct kernel_param_ops param_ops_uint;
extern int param_set_uint(const char *val, const struct kernel_param *kp);
extern int param_get_uint(char *buffer, const struct kernel_param *kp);


extern struct kernel_param_ops param_ops_long;
extern int param_set_long(const char *val, const struct kernel_param *kp);
extern int param_get_long(char *buffer, const struct kernel_param *kp);


extern struct kernel_param_ops param_ops_ulong;
extern int param_set_ulong(const char *val, const struct kernel_param *kp);
extern int param_get_ulong(char *buffer, const struct kernel_param *kp);


extern struct kernel_param_ops param_ops_charp;
extern int param_set_charp(const char *val, const struct kernel_param *kp);
extern int param_get_charp(char *buffer, const struct kernel_param *kp);



extern struct kernel_param_ops param_ops_bool;
extern int param_set_bool(const char *val, const struct kernel_param *kp);
extern int param_get_bool(char *buffer, const struct kernel_param *kp);
# 338 "include/linux/moduleparam.h"
extern struct kernel_param_ops param_ops_invbool;
extern int param_set_invbool(const char *val, const struct kernel_param *kp);
extern int param_get_invbool(char *buffer, const struct kernel_param *kp);
# 380 "include/linux/moduleparam.h"
extern struct kernel_param_ops param_array_ops;

extern struct kernel_param_ops param_ops_string;
extern int param_set_copystring(const char *val, const struct kernel_param *);
extern int param_get_string(char *buffer, const struct kernel_param *kp);



struct module;
# 397 "include/linux/moduleparam.h"
static inline __attribute__((always_inline)) int module_param_sysfs_setup(struct module *mod,
        const struct kernel_param *kparam,
        unsigned int num_params)
{
 return 0;
}

static inline __attribute__((always_inline)) void module_param_sysfs_remove(struct module *mod)
{ }
# 18 "include/linux/module.h" 2
# 1 "include/linux/tracepoint.h" 1
# 19 "include/linux/tracepoint.h"
# 1 "include/linux/rcupdate.h" 1
# 42 "include/linux/rcupdate.h"
# 1 "include/linux/completion.h" 1
# 25 "include/linux/completion.h"
struct completion {
 unsigned int done;
 wait_queue_head_t wait;
};
# 73 "include/linux/completion.h"
static inline __attribute__((always_inline)) void init_completion(struct completion *x)
{
 x->done = 0;
 do { static struct lock_class_key __key; __init_waitqueue_head((&x->wait), &__key); } while (0);
}

extern void wait_for_completion(struct completion *);
extern int wait_for_completion_interruptible(struct completion *x);
extern int wait_for_completion_killable(struct completion *x);
extern unsigned long wait_for_completion_timeout(struct completion *x,
         unsigned long timeout);
extern unsigned long wait_for_completion_interruptible_timeout(
   struct completion *x, unsigned long timeout);
extern unsigned long wait_for_completion_killable_timeout(
   struct completion *x, unsigned long timeout);
extern int try_wait_for_completion(struct completion *x);
extern int completion_done(struct completion *x);

extern void complete(struct completion *);
extern void complete_all(struct completion *);
# 43 "include/linux/rcupdate.h" 2
# 54 "include/linux/rcupdate.h"
struct rcu_head {
 struct rcu_head *next;
 void (*func)(struct rcu_head *head);
};


extern void rcu_barrier(void);
extern void rcu_barrier_bh(void);
extern void rcu_barrier_sched(void);
extern void synchronize_sched_expedited(void);
extern int sched_expedited_torture_stats(char *page);


extern void rcu_init(void);


# 1 "include/linux/rcutree.h" 1
# 33 "include/linux/rcutree.h"
struct notifier_block;

extern void rcu_sched_qs(int cpu);
extern void rcu_bh_qs(int cpu);
extern void rcu_note_context_switch(int cpu);
extern int rcu_needs_cpu(int cpu);
# 55 "include/linux/rcutree.h"
static inline __attribute__((always_inline)) void __rcu_read_lock(void)
{
 do { } while (0);
}

static inline __attribute__((always_inline)) void __rcu_read_unlock(void)
{
 do { } while (0);
}



static inline __attribute__((always_inline)) void exit_rcu(void)
{
}

static inline __attribute__((always_inline)) int rcu_preempt_depth(void)
{
 return 0;
}



static inline __attribute__((always_inline)) void __rcu_read_lock_bh(void)
{
 local_bh_disable();
}
static inline __attribute__((always_inline)) void __rcu_read_unlock_bh(void)
{
 local_bh_enable();
}

extern void call_rcu_sched(struct rcu_head *head,
      void (*func)(struct rcu_head *rcu));
extern void synchronize_rcu_bh(void);
extern void synchronize_sched(void);
extern void synchronize_rcu_expedited(void);

static inline __attribute__((always_inline)) void synchronize_rcu_bh_expedited(void)
{
 synchronize_sched_expedited();
}

extern void rcu_check_callbacks(int cpu, int user);

extern long rcu_batches_completed(void);
extern long rcu_batches_completed_bh(void);
extern long rcu_batches_completed_sched(void);
extern void rcu_force_quiescent_state(void);
extern void rcu_bh_force_quiescent_state(void);
extern void rcu_sched_force_quiescent_state(void);





static inline __attribute__((always_inline)) void rcu_enter_nohz(void)
{
}
static inline __attribute__((always_inline)) void rcu_exit_nohz(void)
{
}



static inline __attribute__((always_inline)) int rcu_blocking_is_gp(void)
{
 return cpumask_weight(cpu_online_mask) == 1;
}

extern void rcu_scheduler_starting(void);
extern int rcu_scheduler_active ;
# 71 "include/linux/rcupdate.h" 2
# 93 "include/linux/rcupdate.h"
static inline __attribute__((always_inline)) void init_rcu_head_on_stack(struct rcu_head *head)
{
}

static inline __attribute__((always_inline)) void destroy_rcu_head_on_stack(struct rcu_head *head)
{
}
# 186 "include/linux/rcupdate.h"
static inline __attribute__((always_inline)) int rcu_read_lock_held(void)
{
 return 1;
}

static inline __attribute__((always_inline)) int rcu_read_lock_bh_held(void)
{
 return 1;
}







static inline __attribute__((always_inline)) int rcu_read_lock_sched_held(void)
{
 return 1;
}
# 322 "include/linux/rcupdate.h"
static inline __attribute__((always_inline)) void rcu_read_lock(void)
{
 __rcu_read_lock();
 (void)0;
 do { } while (0);
}
# 344 "include/linux/rcupdate.h"
static inline __attribute__((always_inline)) void rcu_read_unlock(void)
{
 do { } while (0);
 (void)0;
 __rcu_read_unlock();
}
# 362 "include/linux/rcupdate.h"
static inline __attribute__((always_inline)) void rcu_read_lock_bh(void)
{
 __rcu_read_lock_bh();
 (void)0;
 do { } while (0);
}






static inline __attribute__((always_inline)) void rcu_read_unlock_bh(void)
{
 do { } while (0);
 (void)0;
 __rcu_read_unlock_bh();
}
# 390 "include/linux/rcupdate.h"
static inline __attribute__((always_inline)) void rcu_read_lock_sched(void)
{
 do { } while (0);
 (void)0;
 do { } while (0);
}


static inline __attribute__((always_inline)) __attribute__((no_instrument_function)) void rcu_read_lock_sched_notrace(void)
{
 do { } while (0);
 (void)0;
}






static inline __attribute__((always_inline)) void rcu_read_unlock_sched(void)
{
 do { } while (0);
 (void)0;
 do { } while (0);
}


static inline __attribute__((always_inline)) __attribute__((no_instrument_function)) void rcu_read_unlock_sched_notrace(void)
{
 (void)0;
 do { } while (0);
}
# 490 "include/linux/rcupdate.h"
struct rcu_synchronize {
 struct rcu_head head;
 struct completion completion;
};

extern void wakeme_after_rcu(struct rcu_head *head);
# 508 "include/linux/rcupdate.h"
extern void call_rcu(struct rcu_head *head,
         void (*func)(struct rcu_head *head));
# 529 "include/linux/rcupdate.h"
extern void call_rcu_bh(struct rcu_head *head,
   void (*func)(struct rcu_head *head));
# 560 "include/linux/rcupdate.h"
static inline __attribute__((always_inline)) void debug_rcu_head_queue(struct rcu_head *head)
{
}

static inline __attribute__((always_inline)) void debug_rcu_head_unqueue(struct rcu_head *head)
{
}
# 20 "include/linux/tracepoint.h" 2

struct module;
struct tracepoint;

struct tracepoint_func {
 void *func;
 void *data;
};

struct tracepoint {
 const char *name;
 int state;
 void (*regfunc)(void);
 void (*unregfunc)(void);
 struct tracepoint_func *funcs;
} __attribute__((aligned(32)));
# 46 "include/linux/tracepoint.h"
extern int tracepoint_probe_register(const char *name, void *probe, void *data);





extern int
tracepoint_probe_unregister(const char *name, void *probe, void *data);

extern int tracepoint_probe_register_noupdate(const char *name, void *probe,
           void *data);
extern int tracepoint_probe_unregister_noupdate(const char *name, void *probe,
      void *data);
extern void tracepoint_probe_update_all(void);

struct tracepoint_iter {
 struct module *module;
 struct tracepoint *tracepoint;
};

extern void tracepoint_iter_start(struct tracepoint_iter *iter);
extern void tracepoint_iter_next(struct tracepoint_iter *iter);
extern void tracepoint_iter_stop(struct tracepoint_iter *iter);
extern void tracepoint_iter_reset(struct tracepoint_iter *iter);
extern int tracepoint_get_iter_range(struct tracepoint **tracepoint,
 struct tracepoint *begin, struct tracepoint *end);






static inline __attribute__((always_inline)) void tracepoint_synchronize_unregister(void)
{
 synchronize_sched();
}







static inline __attribute__((always_inline)) void tracepoint_update_probe_range(struct tracepoint *begin,
 struct tracepoint *end)
{ }
# 19 "include/linux/module.h" 2


# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/module.h" 1




# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/uaccess.h" 1
# 207 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/uaccess.h"
struct __large_struct { unsigned long buf[100]; };
# 221 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/uaccess.h"
extern void __get_user_unknown(void);
# 387 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/uaccess.h"
extern void __put_user_unknown(void);
# 486 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/uaccess.h"
extern void __get_user_unaligned_unknown(void);
# 650 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/uaccess.h"
extern void __put_user_unaligned_unknown(void);
# 673 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/uaccess.h"
extern size_t __copy_user(void *__to, const void *__from, size_t __n);
# 721 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/uaccess.h"
extern size_t __copy_user_inatomic(void *__to, const void *__from, size_t __n);
# 935 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/uaccess.h"
static inline __attribute__((always_inline)) __kernel_size_t
__clear_user(void *addr, __kernel_size_t size)
{
 __kernel_size_t res;

 might_fault();
 __asm__ __volatile__(
  "move\t$4, %1\n\t"
  "move\t$5, $0\n\t"
  "move\t$6, %2\n\t"
  ".set\tnoat\n\t" "la" "\t$1, " "__bzero" "\n\t" "jalr\t$1\n\t" ".set\tat\n\t"
  "move\t%0, $6"
  : "=r" (res)
  : "r" (addr), "r" (size)
  : "$4", "$5", "$6", "$8", "$9", "$31");

 return res;
}
# 984 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/uaccess.h"
static inline __attribute__((always_inline)) long
__strncpy_from_user(char *__to, const char *__from, long __len)
{
 long res;

 might_fault();
 __asm__ __volatile__(
  "move\t$4, %1\n\t"
  "move\t$5, %2\n\t"
  "move\t$6, %3\n\t"
  ".set\tnoat\n\t" "la" "\t$1, " "__strncpy_from_user_nocheck_asm" "\n\t" "jalr\t$1\n\t" ".set\tat\n\t"
  "move\t%0, $2"
  : "=r" (res)
  : "r" (__to), "r" (__from), "r" (__len)
  : "$2", "$3", "$4", "$5", "$6", "$8", "$31", "memory");

 return res;
}
# 1021 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/uaccess.h"
static inline __attribute__((always_inline)) long
strncpy_from_user(char *__to, const char *__from, long __len)
{
 long res;

 might_fault();
 __asm__ __volatile__(
  "move\t$4, %1\n\t"
  "move\t$5, %2\n\t"
  "move\t$6, %3\n\t"
  ".set\tnoat\n\t" "la" "\t$1, " "__strncpy_from_user_asm" "\n\t" "jalr\t$1\n\t" ".set\tat\n\t"
  "move\t%0, $2"
  : "=r" (res)
  : "r" (__to), "r" (__from), "r" (__len)
  : "$2", "$3", "$4", "$5", "$6", "$8", "$31", "memory");

 return res;
}


static inline __attribute__((always_inline)) long __strlen_user(const char *s)
{
 long res;

 might_fault();
 __asm__ __volatile__(
  "move\t$4, %1\n\t"
  ".set\tnoat\n\t" "la" "\t$1, " "__strlen_user_nocheck_asm" "\n\t" "jalr\t$1\n\t" ".set\tat\n\t"
  "move\t%0, $2"
  : "=r" (res)
  : "r" (s)
  : "$2", "$4", "$8", "$31");

 return res;
}
# 1071 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/uaccess.h"
static inline __attribute__((always_inline)) long strlen_user(const char *s)
{
 long res;

 might_fault();
 __asm__ __volatile__(
  "move\t$4, %1\n\t"
  ".set\tnoat\n\t" "la" "\t$1, " "__strlen_user_asm" "\n\t" "jalr\t$1\n\t" ".set\tat\n\t"
  "move\t%0, $2"
  : "=r" (res)
  : "r" (s)
  : "$2", "$4", "$8", "$31");

 return res;
}


static inline __attribute__((always_inline)) long __strnlen_user(const char *s, long n)
{
 long res;

 might_fault();
 __asm__ __volatile__(
  "move\t$4, %1\n\t"
  "move\t$5, %2\n\t"
  ".set\tnoat\n\t" "la" "\t$1, " "__strnlen_user_nocheck_asm" "\n\t" "jalr\t$1\n\t" ".set\tat\n\t"
  "move\t%0, $2"
  : "=r" (res)
  : "r" (s), "r" (n)
  : "$2", "$4", "$5", "$8", "$31");

 return res;
}
# 1119 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/uaccess.h"
static inline __attribute__((always_inline)) long strnlen_user(const char *s, long n)
{
 long res;

 might_fault();
 __asm__ __volatile__(
  "move\t$4, %1\n\t"
  "move\t$5, %2\n\t"
  ".set\tnoat\n\t" "la" "\t$1, " "__strnlen_user_asm" "\n\t" "jalr\t$1\n\t" ".set\tat\n\t"
  "move\t%0, $2"
  : "=r" (res)
  : "r" (s), "r" (n)
  : "$2", "$4", "$5", "$8", "$31");

 return res;
}

struct exception_table_entry
{
 unsigned long insn;
 unsigned long nextinsn;
};

extern int fixup_exception(struct pt_regs *regs);
# 6 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/module.h" 2

struct mod_arch_specific {

 struct list_head dbe_list;
 const struct exception_table_entry *dbe_start;
 const struct exception_table_entry *dbe_end;
};

typedef uint8_t Elf64_Byte;

typedef struct {
 Elf64_Addr r_offset;
 Elf64_Word r_sym;
 Elf64_Byte r_ssym;
 Elf64_Byte r_type3;
 Elf64_Byte r_type2;
 Elf64_Byte r_type;
} Elf64_Mips_Rel;

typedef struct {
 Elf64_Addr r_offset;
 Elf64_Word r_sym;
 Elf64_Byte r_ssym;
 Elf64_Byte r_type3;
 Elf64_Byte r_type2;
 Elf64_Byte r_type;
 Elf64_Sxword r_addend;
} Elf64_Mips_Rela;
# 67 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/module.h"
const struct exception_table_entry*search_module_dbetables(unsigned long addr);
# 22 "include/linux/module.h" 2

# 1 "include/trace/events/module.h" 1






# 1 "include/linux/tracepoint.h" 1
# 8 "include/trace/events/module.h" 2



struct module;






static inline __attribute__((always_inline)) void trace_module_load(struct module *mod) { } static inline __attribute__((always_inline)) int register_trace_module_load(void (*probe)(void *__data, struct module *mod), void *data) { return -89; } static inline __attribute__((always_inline)) int unregister_trace_module_load(void (*probe)(void *__data, struct module *mod), void *data) { return -89; } static inline __attribute__((always_inline)) void check_trace_callback_type_module_load(void (*cb)(void *__data, struct module *mod)) { };
# 37 "include/trace/events/module.h"
static inline __attribute__((always_inline)) void trace_module_free(struct module *mod) { } static inline __attribute__((always_inline)) int register_trace_module_free(void (*probe)(void *__data, struct module *mod), void *data) { return -89; } static inline __attribute__((always_inline)) int unregister_trace_module_free(void (*probe)(void *__data, struct module *mod), void *data) { return -89; } static inline __attribute__((always_inline)) void check_trace_callback_type_module_free(void (*cb)(void *__data, struct module *mod)) { };
# 57 "include/trace/events/module.h"
;
# 79 "include/trace/events/module.h"
static inline __attribute__((always_inline)) void trace_module_get(struct module *mod, unsigned long ip) { } static inline __attribute__((always_inline)) int register_trace_module_get(void (*probe)(void *__data, struct module *mod, unsigned long ip), void *data) { return -89; } static inline __attribute__((always_inline)) int unregister_trace_module_get(void (*probe)(void *__data, struct module *mod, unsigned long ip), void *data) { return -89; } static inline __attribute__((always_inline)) void check_trace_callback_type_module_get(void (*cb)(void *__data, struct module *mod, unsigned long ip)) { };






static inline __attribute__((always_inline)) void trace_module_put(struct module *mod, unsigned long ip) { } static inline __attribute__((always_inline)) int register_trace_module_put(void (*probe)(void *__data, struct module *mod, unsigned long ip), void *data) { return -89; } static inline __attribute__((always_inline)) int unregister_trace_module_put(void (*probe)(void *__data, struct module *mod, unsigned long ip), void *data) { return -89; } static inline __attribute__((always_inline)) void check_trace_callback_type_module_put(void (*cb)(void *__data, struct module *mod, unsigned long ip)) { };







static inline __attribute__((always_inline)) void trace_module_request(char *name, int wait, unsigned long ip) { } static inline __attribute__((always_inline)) int register_trace_module_request(void (*probe)(void *__data, char *name, int wait, unsigned long ip), void *data) { return -89; } static inline __attribute__((always_inline)) int unregister_trace_module_request(void (*probe)(void *__data, char *name, int wait, unsigned long ip), void *data) { return -89; } static inline __attribute__((always_inline)) void check_trace_callback_type_module_request(void (*cb)(void *__data, char *name, int wait, unsigned long ip)) { };
# 121 "include/trace/events/module.h"
# 1 "include/trace/define_trace.h" 1
# 122 "include/trace/events/module.h" 2
# 24 "include/linux/module.h" 2
# 37 "include/linux/module.h"
struct kernel_symbol
{
 unsigned long value;
 const char *name;
};

struct modversion_info
{
 unsigned long crc;
 char name[(64 - sizeof(unsigned long))];
};

struct module;

struct module_attribute {
        struct attribute attr;
        ssize_t (*show)(struct module_attribute *, struct module *, char *);
        ssize_t (*store)(struct module_attribute *, struct module *,
    const char *, size_t count);
 void (*setup)(struct module *, const char *);
 int (*test)(struct module *);
 void (*free)(struct module *);
};

struct module_kobject
{
 struct kobject kobj;
 struct module *mod;
 struct kobject *drivers_dir;
 struct module_param_attrs *mp;
};


extern int init_module(void);
extern void cleanup_module(void);


struct exception_table_entry;

const struct exception_table_entry *
search_extable(const struct exception_table_entry *first,
        const struct exception_table_entry *last,
        unsigned long value);
void sort_extable(struct exception_table_entry *start,
    struct exception_table_entry *finish);
void sort_main_extable(void);
void trim_init_extable(struct module *m);






extern struct module __this_module;
# 172 "include/linux/module.h"
const struct exception_table_entry *search_exception_tables(unsigned long add);

struct notifier_block;



extern int modules_disabled;

void *__symbol_get(const char *symbol);
void *__symbol_get_gpl(const char *symbol);



struct module_use {
 struct list_head source_list;
 struct list_head target_list;
 struct module *source, *target;
};
# 237 "include/linux/module.h"
enum module_state
{
 MODULE_STATE_LIVE,
 MODULE_STATE_COMING,
 MODULE_STATE_GOING,
};

struct module
{
 enum module_state state;


 struct list_head list;


 char name[(64 - sizeof(unsigned long))];


 struct module_kobject mkobj;
 struct module_attribute *modinfo_attrs;
 const char *version;
 const char *srcversion;
 struct kobject *holders_dir;


 const struct kernel_symbol *syms;
 const unsigned long *crcs;
 unsigned int num_syms;


 struct kernel_param *kp;
 unsigned int num_kp;


 unsigned int num_gpl_syms;
 const struct kernel_symbol *gpl_syms;
 const unsigned long *gpl_crcs;
# 288 "include/linux/module.h"
 const struct kernel_symbol *gpl_future_syms;
 const unsigned long *gpl_future_crcs;
 unsigned int num_gpl_future_syms;


 unsigned int num_exentries;
 struct exception_table_entry *extable;


 int (*init)(void);


 void *module_init;


 void *module_core;


 unsigned int init_size, core_size;


 unsigned int init_text_size, core_text_size;


 struct mod_arch_specific arch;

 unsigned int taints;
# 329 "include/linux/module.h"
 Elf32_Sym *symtab, *core_symtab;
 unsigned int num_symtab, core_num_syms;
 char *strtab, *core_strtab;


 struct module_sect_attrs *sect_attrs;


 struct module_notes_attrs *notes_attrs;




 void *percpu;
 unsigned int percpu_size;




 char *args;
# 369 "include/linux/module.h"
 struct list_head source_list;

 struct list_head target_list;


 struct task_struct *waiter;


 void (*exit)(void);

 struct module_ref {
  unsigned int incs;
  unsigned int decs;
 } *refptr;




 ctor_fn_t *ctors;
 unsigned int num_ctors;

};




extern struct mutex module_mutex;




static inline __attribute__((always_inline)) int module_is_live(struct module *mod)
{
 return mod->state != MODULE_STATE_GOING;
}

struct module *__module_text_address(unsigned long addr);
struct module *__module_address(unsigned long addr);
int is_module_address(unsigned long addr);
int is_module_percpu_address(unsigned long addr);
int is_module_text_address(unsigned long addr);

static inline __attribute__((always_inline)) int within_module_core(unsigned long addr, struct module *mod)
{
 return (unsigned long)mod->module_core <= addr &&
        addr < (unsigned long)mod->module_core + mod->core_size;
}

static inline __attribute__((always_inline)) int within_module_init(unsigned long addr, struct module *mod)
{
 return (unsigned long)mod->module_init <= addr &&
        addr < (unsigned long)mod->module_init + mod->init_size;
}


struct module *find_module(const char *name);

struct symsearch {
 const struct kernel_symbol *start, *stop;
 const unsigned long *crcs;
 enum {
  NOT_GPL_ONLY,
  GPL_ONLY,
  WILL_BE_GPL_ONLY,
 } licence;
 int unused;
};


const struct kernel_symbol *find_symbol(const char *name,
     struct module **owner,
     const unsigned long **crc,
     int gplok,
     int warn);


int each_symbol(int (*fn)(const struct symsearch *arr, struct module *owner,
       unsigned int symnum, void *data), void *data);



int module_get_kallsym(unsigned int symnum, unsigned long *value, char *type,
   char *name, char *module_name, int *exported);


unsigned long module_kallsyms_lookup_name(const char *name);

int module_kallsyms_on_each_symbol(int (*fn)(void *, const char *,
          struct module *, unsigned long),
       void *data);

extern void __module_put_and_exit(struct module *mod, long code)
 __attribute__((noreturn));



unsigned int module_refcount(struct module *mod);
void __symbol_put(const char *symbol);

void symbol_put_addr(void *addr);



static inline __attribute__((always_inline)) void __module_get(struct module *module)
{
 if (module) {
  do { } while (0);
  do { do { const void *__vpp_verify = (typeof(&(((module->refptr->incs)))))((void *)0); (void)__vpp_verify; } while (0); switch(sizeof(((module->refptr->incs)))) { case 1: do { *({ do { const void *__vpp_verify = (typeof((&((((module->refptr->incs)))))))((void *)0); (void)__vpp_verify; } while (0); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"((typeof(*(&((((module->refptr->incs)))))) *)(&((((module->refptr->incs))))))); (typeof((typeof(*(&((((module->refptr->incs)))))) *)(&((((module->refptr->incs))))))) (__ptr + (((__per_cpu_offset[(__current_thread_info->cpu)])))); }); }) += ((1)); } while (0);break; case 2: do { *({ do { const void *__vpp_verify = (typeof((&((((module->refptr->incs)))))))((void *)0); (void)__vpp_verify; } while (0); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"((typeof(*(&((((module->refptr->incs)))))) *)(&((((module->refptr->incs))))))); (typeof((typeof(*(&((((module->refptr->incs)))))) *)(&((((module->refptr->incs))))))) (__ptr + (((__per_cpu_offset[(__current_thread_info->cpu)])))); }); }) += ((1)); } while (0);break; case 4: do { *({ do { const void *__vpp_verify = (typeof((&((((module->refptr->incs)))))))((void *)0); (void)__vpp_verify; } while (0); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"((typeof(*(&((((module->refptr->incs)))))) *)(&((((module->refptr->incs))))))); (typeof((typeof(*(&((((module->refptr->incs)))))) *)(&((((module->refptr->incs))))))) (__ptr + (((__per_cpu_offset[(__current_thread_info->cpu)])))); }); }) += ((1)); } while (0);break; case 8: do { *({ do { const void *__vpp_verify = (typeof((&((((module->refptr->incs)))))))((void *)0); (void)__vpp_verify; } while (0); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"((typeof(*(&((((module->refptr->incs)))))) *)(&((((module->refptr->incs))))))); (typeof((typeof(*(&((((module->refptr->incs)))))) *)(&((((module->refptr->incs))))))) (__ptr + (((__per_cpu_offset[(__current_thread_info->cpu)])))); }); }) += ((1)); } while (0);break; default: __bad_size_call_parameter();break; } } while (0);
  trace_module_get(module, ({ __label__ __here; __here: (unsigned long)&&__here; }));
  do { } while (0);
 }
}

static inline __attribute__((always_inline)) int try_module_get(struct module *module)
{
 int ret = 1;

 if (module) {
  do { } while (0);

  if (__builtin_expect(!!(module_is_live(module)), 1)) {
   do { do { const void *__vpp_verify = (typeof(&(((module->refptr->incs)))))((void *)0); (void)__vpp_verify; } while (0); switch(sizeof(((module->refptr->incs)))) { case 1: do { *({ do { const void *__vpp_verify = (typeof((&((((module->refptr->incs)))))))((void *)0); (void)__vpp_verify; } while (0); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"((typeof(*(&((((module->refptr->incs)))))) *)(&((((module->refptr->incs))))))); (typeof((typeof(*(&((((module->refptr->incs)))))) *)(&((((module->refptr->incs))))))) (__ptr + (((__per_cpu_offset[(__current_thread_info->cpu)])))); }); }) += ((1)); } while (0);break; case 2: do { *({ do { const void *__vpp_verify = (typeof((&((((module->refptr->incs)))))))((void *)0); (void)__vpp_verify; } while (0); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"((typeof(*(&((((module->refptr->incs)))))) *)(&((((module->refptr->incs))))))); (typeof((typeof(*(&((((module->refptr->incs)))))) *)(&((((module->refptr->incs))))))) (__ptr + (((__per_cpu_offset[(__current_thread_info->cpu)])))); }); }) += ((1)); } while (0);break; case 4: do { *({ do { const void *__vpp_verify = (typeof((&((((module->refptr->incs)))))))((void *)0); (void)__vpp_verify; } while (0); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"((typeof(*(&((((module->refptr->incs)))))) *)(&((((module->refptr->incs))))))); (typeof((typeof(*(&((((module->refptr->incs)))))) *)(&((((module->refptr->incs))))))) (__ptr + (((__per_cpu_offset[(__current_thread_info->cpu)])))); }); }) += ((1)); } while (0);break; case 8: do { *({ do { const void *__vpp_verify = (typeof((&((((module->refptr->incs)))))))((void *)0); (void)__vpp_verify; } while (0); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"((typeof(*(&((((module->refptr->incs)))))) *)(&((((module->refptr->incs))))))); (typeof((typeof(*(&((((module->refptr->incs)))))) *)(&((((module->refptr->incs))))))) (__ptr + (((__per_cpu_offset[(__current_thread_info->cpu)])))); }); }) += ((1)); } while (0);break; default: __bad_size_call_parameter();break; } } while (0);
   trace_module_get(module, ({ __label__ __here; __here: (unsigned long)&&__here; }));
  } else
   ret = 0;

  do { } while (0);
 }
 return ret;
}

extern void module_put(struct module *module);
# 517 "include/linux/module.h"
int use_module(struct module *a, struct module *b);
# 529 "include/linux/module.h"
const char *module_address_lookup(unsigned long addr,
       unsigned long *symbolsize,
       unsigned long *offset,
       char **modname,
       char *namebuf);
int lookup_module_symbol_name(unsigned long addr, char *symname);
int lookup_module_symbol_attrs(unsigned long addr, unsigned long *size, unsigned long *offset, char *modname, char *name);


const struct exception_table_entry *search_module_extables(unsigned long addr);

int register_module_notifier(struct notifier_block * nb);
int unregister_module_notifier(struct notifier_block * nb);

extern void print_modules(void);

extern void module_update_tracepoints(void);
extern int module_get_iter_tracepoints(struct tracepoint_iter *iter);
# 695 "include/linux/module.h"
static inline __attribute__((always_inline)) void module_bug_finalize(const Elf32_Ehdr *hdr,
     const Elf32_Shdr *sechdrs,
     struct module *mod)
{
}
static inline __attribute__((always_inline)) void module_bug_cleanup(struct module *mod) {}
# 2 "/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma.mod.c" 2
# 1 "include/linux/vermagic.h" 1
# 1 "include/generated/utsrelease.h" 1
# 2 "include/linux/vermagic.h" 2
# 3 "/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma.mod.c" 2


static const char __mod_vermagic5[] __attribute__((__used__)) __attribute__((section(".modinfo"),unused)) = "vermagic" "=" "2.6.36" " " "SMP " "" "mod_unload " "" "MIPS32_R2 " "32BIT " "MT_SMTC ";

struct module __this_module
__attribute__((section(".gnu.linkonce.this_module"))) = {
 .name = "qdma",
 .init = init_module,

 .exit = cleanup_module,

 .arch = {},
};

static const char __module_depends[]
__attribute__((__used__))
__attribute__((section(".modinfo"))) =
"depends=";
