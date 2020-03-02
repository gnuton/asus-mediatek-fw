# 1 "/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_bmgr.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "./include/generated/autoconf.h" 1
# 1 "<command-line>" 2
# 1 "/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_bmgr.c"
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
# 2 "/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_bmgr.c" 2


# 1 "include/linux/dma-mapping.h" 1



# 1 "include/linux/device.h" 1
# 16 "include/linux/device.h"
# 1 "include/linux/ioport.h" 1
# 18 "include/linux/ioport.h"
struct resource {
 resource_size_t start;
 resource_size_t end;
 const char *name;
 unsigned long flags;
 struct resource *parent, *sibling, *child;
};

struct resource_list {
 struct resource_list *next;
 struct resource *res;
 struct pci_dev *dev;
};
# 113 "include/linux/ioport.h"
extern struct resource ioport_resource;
extern struct resource iomem_resource;

extern struct resource *request_resource_conflict(struct resource *root, struct resource *new);
extern int request_resource(struct resource *root, struct resource *new);
extern int release_resource(struct resource *new);
void release_child_resources(struct resource *new);
extern void reserve_region_with_split(struct resource *root,
        resource_size_t start, resource_size_t end,
        const char *name);
extern struct resource *insert_resource_conflict(struct resource *parent, struct resource *new);
extern int insert_resource(struct resource *parent, struct resource *new);
extern void insert_resource_expand_to_fit(struct resource *root, struct resource *new);
extern int allocate_resource(struct resource *root, struct resource *new,
        resource_size_t size, resource_size_t min,
        resource_size_t max, resource_size_t align,
        resource_size_t (*alignf)(void *,
             const struct resource *,
             resource_size_t,
             resource_size_t),
        void *alignf_data);
int adjust_resource(struct resource *res, resource_size_t start,
      resource_size_t size);
resource_size_t resource_alignment(struct resource *res);
static inline __attribute__((always_inline)) resource_size_t resource_size(const struct resource *res)
{
 return res->end - res->start + 1;
}
static inline __attribute__((always_inline)) unsigned long resource_type(const struct resource *res)
{
 return res->flags & 0x00001f00;
}
# 155 "include/linux/ioport.h"
extern struct resource * __request_region(struct resource *,
     resource_size_t start,
     resource_size_t n,
     const char *name, int flags);






extern int __check_region(struct resource *, resource_size_t, resource_size_t);
extern void __release_region(struct resource *, resource_size_t,
    resource_size_t);

static inline __attribute__((always_inline)) int __attribute__((deprecated)) check_region(resource_size_t s,
      resource_size_t n)
{
 return __check_region(&ioport_resource, s, n);
}


struct device;





extern struct resource * __devm_request_region(struct device *dev,
    struct resource *parent, resource_size_t start,
    resource_size_t n, const char *name);






extern void __devm_release_region(struct device *dev, struct resource *parent,
      resource_size_t start, resource_size_t n);
extern int iomem_map_sanity_check(resource_size_t addr, unsigned long size);
extern int iomem_is_exclusive(u64 addr);

extern int
walk_system_ram_range(unsigned long start_pfn, unsigned long nr_pages,
  void *arg, int (*func)(unsigned long, unsigned long, void *));
# 17 "include/linux/device.h" 2

# 1 "include/linux/klist.h" 1
# 19 "include/linux/klist.h"
struct klist_node;
struct klist {
 spinlock_t k_lock;
 struct list_head k_list;
 void (*get)(struct klist_node *);
 void (*put)(struct klist_node *);
} __attribute__ ((aligned (4)));
# 36 "include/linux/klist.h"
extern void klist_init(struct klist *k, void (*get)(struct klist_node *),
         void (*put)(struct klist_node *));

struct klist_node {
 void *n_klist;
 struct list_head n_node;
 struct kref n_ref;
};

extern void klist_add_tail(struct klist_node *n, struct klist *k);
extern void klist_add_head(struct klist_node *n, struct klist *k);
extern void klist_add_after(struct klist_node *n, struct klist_node *pos);
extern void klist_add_before(struct klist_node *n, struct klist_node *pos);

extern void klist_del(struct klist_node *n);
extern void klist_remove(struct klist_node *n);

extern int klist_node_attached(struct klist_node *n);


struct klist_iter {
 struct klist *i_klist;
 struct klist_node *i_cur;
};


extern void klist_iter_init(struct klist *k, struct klist_iter *i);
extern void klist_iter_init_node(struct klist *k, struct klist_iter *i,
     struct klist_node *n);
extern void klist_iter_exit(struct klist_iter *i);
extern struct klist_node *klist_next(struct klist_iter *i);
# 19 "include/linux/device.h" 2





# 1 "include/linux/pm.h" 1
# 34 "include/linux/pm.h"
extern void (*pm_idle)(void);
extern void (*pm_power_off)(void);
extern void (*pm_power_off_prepare)(void);





struct device;

typedef struct pm_message {
 int event;
} pm_message_t;
# 198 "include/linux/pm.h"
struct dev_pm_ops {
 int (*prepare)(struct device *dev);
 void (*complete)(struct device *dev);
 int (*suspend)(struct device *dev);
 int (*resume)(struct device *dev);
 int (*freeze)(struct device *dev);
 int (*thaw)(struct device *dev);
 int (*poweroff)(struct device *dev);
 int (*restore)(struct device *dev);
 int (*suspend_noirq)(struct device *dev);
 int (*resume_noirq)(struct device *dev);
 int (*freeze_noirq)(struct device *dev);
 int (*thaw_noirq)(struct device *dev);
 int (*poweroff_noirq)(struct device *dev);
 int (*restore_noirq)(struct device *dev);
 int (*runtime_suspend)(struct device *dev);
 int (*runtime_resume)(struct device *dev);
 int (*runtime_idle)(struct device *dev);
};
# 392 "include/linux/pm.h"
enum dpm_state {
 DPM_INVALID,
 DPM_ON,
 DPM_PREPARING,
 DPM_RESUMING,
 DPM_SUSPENDING,
 DPM_OFF,
 DPM_OFF_IRQ,
};
# 425 "include/linux/pm.h"
enum rpm_status {
 RPM_ACTIVE = 0,
 RPM_RESUMING,
 RPM_SUSPENDED,
 RPM_SUSPENDING,
};
# 444 "include/linux/pm.h"
enum rpm_request {
 RPM_REQ_NONE = 0,
 RPM_REQ_IDLE,
 RPM_REQ_SUSPEND,
 RPM_REQ_RESUME,
};

struct dev_pm_info {
 pm_message_t power_state;
 unsigned int can_wakeup:1;
 unsigned int should_wakeup:1;
 unsigned async_suspend:1;
 enum dpm_state status;
# 484 "include/linux/pm.h"
};

extern void update_pm_runtime_accounting(struct device *dev);
# 572 "include/linux/pm.h"
static inline __attribute__((always_inline)) int dpm_suspend_start(pm_message_t state)
{
 return 0;
}



static inline __attribute__((always_inline)) void device_pm_wait_for_dev(struct device *a, struct device *b) {}

static inline __attribute__((always_inline)) void pm_wakeup_event(struct device *dev, unsigned int msec) {}
static inline __attribute__((always_inline)) void pm_stay_awake(struct device *dev) {}
static inline __attribute__((always_inline)) void pm_relax(void) {}



enum dpm_order {
 DPM_ORDER_NONE,
 DPM_ORDER_DEV_AFTER_PARENT,
 DPM_ORDER_PARENT_BEFORE_DEV,
 DPM_ORDER_DEV_LAST,
};





extern unsigned int pm_flags;
# 25 "include/linux/device.h" 2

# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/device.h" 1





# 1 "include/asm-generic/device.h" 1
# 9 "include/asm-generic/device.h"
struct dev_archdata {
};

struct pdev_archdata {
};
# 6 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/device.h" 2
# 27 "include/linux/device.h" 2

struct device;
struct device_private;
struct device_driver;
struct driver_private;
struct class;
struct class_private;
struct bus_type;
struct bus_type_private;
struct device_node;

struct bus_attribute {
 struct attribute attr;
 ssize_t (*show)(struct bus_type *bus, char *buf);
 ssize_t (*store)(struct bus_type *bus, const char *buf, size_t count);
};




extern int bus_create_file(struct bus_type *,
     struct bus_attribute *);
extern void bus_remove_file(struct bus_type *, struct bus_attribute *);

struct bus_type {
 const char *name;
 struct bus_attribute *bus_attrs;
 struct device_attribute *dev_attrs;
 struct driver_attribute *drv_attrs;

 int (*match)(struct device *dev, struct device_driver *drv);
 int (*uevent)(struct device *dev, struct kobj_uevent_env *env);
 int (*probe)(struct device *dev);
 int (*remove)(struct device *dev);
 void (*shutdown)(struct device *dev);

 int (*suspend)(struct device *dev, pm_message_t state);
 int (*resume)(struct device *dev);

 const struct dev_pm_ops *pm;

 struct bus_type_private *p;
};

extern int bus_register(struct bus_type *bus);
extern void bus_unregister(struct bus_type *bus);

extern int bus_rescan_devices(struct bus_type *bus);



int bus_for_each_dev(struct bus_type *bus, struct device *start, void *data,
       int (*fn)(struct device *dev, void *data));
struct device *bus_find_device(struct bus_type *bus, struct device *start,
          void *data,
          int (*match)(struct device *dev, void *data));
struct device *bus_find_device_by_name(struct bus_type *bus,
           struct device *start,
           const char *name);

int bus_for_each_drv(struct bus_type *bus, struct device_driver *start,
       void *data, int (*fn)(struct device_driver *, void *));

void bus_sort_breadthfirst(struct bus_type *bus,
      int (*compare)(const struct device *a,
       const struct device *b));






struct notifier_block;

extern int bus_register_notifier(struct bus_type *bus,
     struct notifier_block *nb);
extern int bus_unregister_notifier(struct bus_type *bus,
       struct notifier_block *nb);
# 120 "include/linux/device.h"
extern struct kset *bus_get_kset(struct bus_type *bus);
extern struct klist *bus_get_device_klist(struct bus_type *bus);

struct device_driver {
 const char *name;
 struct bus_type *bus;

 struct module *owner;
 const char *mod_name;

 int suppress_bind_attrs;





 int (*probe) (struct device *dev);
 int (*remove) (struct device *dev);
 void (*shutdown) (struct device *dev);
 int (*suspend) (struct device *dev, pm_message_t state);
 int (*resume) (struct device *dev);
 const struct attribute_group **groups;

 const struct dev_pm_ops *pm;

 struct driver_private *p;
};


extern int driver_register(struct device_driver *drv);
extern void driver_unregister(struct device_driver *drv);

extern struct device_driver *get_driver(struct device_driver *drv);
extern void put_driver(struct device_driver *drv);
extern struct device_driver *driver_find(const char *name,
      struct bus_type *bus);
extern int driver_probe_done(void);
extern void wait_for_device_probe(void);




struct driver_attribute {
 struct attribute attr;
 ssize_t (*show)(struct device_driver *driver, char *buf);
 ssize_t (*store)(struct device_driver *driver, const char *buf,
    size_t count);
};





extern int driver_create_file(struct device_driver *driver,
     const struct driver_attribute *attr);
extern void driver_remove_file(struct device_driver *driver,
          const struct driver_attribute *attr);

extern int driver_add_kobj(struct device_driver *drv,
     struct kobject *kobj,
     const char *fmt, ...);

extern int driver_for_each_device(struct device_driver *drv,
            struct device *start,
            void *data,
            int (*fn)(struct device *dev,
        void *));
struct device *driver_find_device(struct device_driver *drv,
      struct device *start, void *data,
      int (*match)(struct device *dev, void *data));




struct class {
 const char *name;
 struct module *owner;

 struct class_attribute *class_attrs;
 struct device_attribute *dev_attrs;
 struct kobject *dev_kobj;

 int (*dev_uevent)(struct device *dev, struct kobj_uevent_env *env);
 char *(*devnode)(struct device *dev, mode_t *mode);

 void (*class_release)(struct class *class);
 void (*dev_release)(struct device *dev);

 int (*suspend)(struct device *dev, pm_message_t state);
 int (*resume)(struct device *dev);

 const struct kobj_ns_type_operations *ns_type;
 const void *(*namespace)(struct device *dev);

 const struct dev_pm_ops *pm;

 struct class_private *p;
};

struct class_dev_iter {
 struct klist_iter ki;
 const struct device_type *type;
};

extern struct kobject *sysfs_dev_block_kobj;
extern struct kobject *sysfs_dev_char_kobj;
extern int __class_register(struct class *class,
      struct lock_class_key *key);
extern void class_unregister(struct class *class);
# 238 "include/linux/device.h"
struct class_compat;
struct class_compat *class_compat_register(const char *name);
void class_compat_unregister(struct class_compat *cls);
int class_compat_create_link(struct class_compat *cls, struct device *dev,
        struct device *device_link);
void class_compat_remove_link(struct class_compat *cls, struct device *dev,
         struct device *device_link);

extern void class_dev_iter_init(struct class_dev_iter *iter,
    struct class *class,
    struct device *start,
    const struct device_type *type);
extern struct device *class_dev_iter_next(struct class_dev_iter *iter);
extern void class_dev_iter_exit(struct class_dev_iter *iter);

extern int class_for_each_device(struct class *class, struct device *start,
     void *data,
     int (*fn)(struct device *dev, void *data));
extern struct device *class_find_device(struct class *class,
     struct device *start, void *data,
     int (*match)(struct device *, void *));

struct class_attribute {
 struct attribute attr;
 ssize_t (*show)(struct class *class, struct class_attribute *attr,
   char *buf);
 ssize_t (*store)(struct class *class, struct class_attribute *attr,
   const char *buf, size_t count);
};




extern int class_create_file(struct class *class,
       const struct class_attribute *attr);
extern void class_remove_file(struct class *class,
         const struct class_attribute *attr);



struct class_attribute_string {
 struct class_attribute attr;
 char *str;
};
# 290 "include/linux/device.h"
extern ssize_t show_class_attr_string(struct class *class, struct class_attribute *attr,
                        char *buf);

struct class_interface {
 struct list_head node;
 struct class *class;

 int (*add_dev) (struct device *, struct class_interface *);
 void (*remove_dev) (struct device *, struct class_interface *);
};

extern int class_interface_register(struct class_interface *);
extern void class_interface_unregister(struct class_interface *);

extern struct class * __class_create(struct module *owner,
        const char *name,
        struct lock_class_key *key);
extern void class_destroy(struct class *cls);
# 326 "include/linux/device.h"
struct device_type {
 const char *name;
 const struct attribute_group **groups;
 int (*uevent)(struct device *dev, struct kobj_uevent_env *env);
 char *(*devnode)(struct device *dev, mode_t *mode);
 void (*release)(struct device *dev);

 const struct dev_pm_ops *pm;
};


struct device_attribute {
 struct attribute attr;
 ssize_t (*show)(struct device *dev, struct device_attribute *attr,
   char *buf);
 ssize_t (*store)(struct device *dev, struct device_attribute *attr,
    const char *buf, size_t count);
};




extern int device_create_file(struct device *device,
     const struct device_attribute *entry);
extern void device_remove_file(struct device *dev,
          const struct device_attribute *attr);
extern int device_create_bin_file(struct device *dev,
     const struct bin_attribute *attr);
extern void device_remove_bin_file(struct device *dev,
       const struct bin_attribute *attr);
extern int device_schedule_callback_owner(struct device *dev,
  void (*func)(struct device *dev), struct module *owner);






typedef void (*dr_release_t)(struct device *dev, void *res);
typedef int (*dr_match_t)(struct device *dev, void *res, void *match_data);







extern void *devres_alloc(dr_release_t release, size_t size, gfp_t gfp);

extern void devres_free(void *res);
extern void devres_add(struct device *dev, void *res);
extern void *devres_find(struct device *dev, dr_release_t release,
    dr_match_t match, void *match_data);
extern void *devres_get(struct device *dev, void *new_res,
   dr_match_t match, void *match_data);
extern void *devres_remove(struct device *dev, dr_release_t release,
      dr_match_t match, void *match_data);
extern int devres_destroy(struct device *dev, dr_release_t release,
     dr_match_t match, void *match_data);


extern void * devres_open_group(struct device *dev, void *id,
          gfp_t gfp);
extern void devres_close_group(struct device *dev, void *id);
extern void devres_remove_group(struct device *dev, void *id);
extern int devres_release_group(struct device *dev, void *id);


extern void *devm_kzalloc(struct device *dev, size_t size, gfp_t gfp);
extern void devm_kfree(struct device *dev, void *p);

struct device_dma_parameters {




 unsigned int max_segment_size;
 unsigned long segment_boundary_mask;
};

struct device {
 struct device *parent;

 struct device_private *p;

 struct kobject kobj;
 const char *init_name;
 struct device_type *type;

 struct mutex mutex;



 struct bus_type *bus;
 struct device_driver *driver;

 void *platform_data;

 struct dev_pm_info power;




 u64 *dma_mask;
 u64 coherent_dma_mask;





 struct device_dma_parameters *dma_parms;

 struct list_head dma_pools;

 struct dma_coherent_mem *dma_mem;


 struct dev_archdata archdata;




 dev_t devt;

 spinlock_t devres_lock;
 struct list_head devres_head;

 struct klist_node knode_class;
 struct class *class;
 const struct attribute_group **groups;

 void (*release)(struct device *dev);
};


# 1 "include/linux/pm_wakeup.h" 1
# 66 "include/linux/pm_wakeup.h"
static inline __attribute__((always_inline)) void device_init_wakeup(struct device *dev, int val)
{
 dev->power.can_wakeup = val;
}

static inline __attribute__((always_inline)) void device_set_wakeup_capable(struct device *dev, int capable)
{
 dev->power.can_wakeup = capable;
}

static inline __attribute__((always_inline)) int device_can_wakeup(struct device *dev)
{
 return dev->power.can_wakeup;
}

static inline __attribute__((always_inline)) void device_set_wakeup_enable(struct device *dev, int enable)
{
}

static inline __attribute__((always_inline)) int device_may_wakeup(struct device *dev)
{
 return false;
}
# 462 "include/linux/device.h" 2

static inline __attribute__((always_inline)) const char *dev_name(const struct device *dev)
{

 if (dev->init_name)
  return dev->init_name;

 return kobject_name(&dev->kobj);
}

extern int dev_set_name(struct device *dev, const char *name, ...)
   __attribute__((format(printf, 2, 3)));
# 485 "include/linux/device.h"
static inline __attribute__((always_inline)) int dev_to_node(struct device *dev)
{
 return -1;
}
static inline __attribute__((always_inline)) void set_dev_node(struct device *dev, int node)
{
}


static inline __attribute__((always_inline)) unsigned int dev_get_uevent_suppress(const struct device *dev)
{
 return dev->kobj.uevent_suppress;
}

static inline __attribute__((always_inline)) void dev_set_uevent_suppress(struct device *dev, int val)
{
 dev->kobj.uevent_suppress = val;
}

static inline __attribute__((always_inline)) int device_is_registered(struct device *dev)
{
 return dev->kobj.state_in_sysfs;
}

static inline __attribute__((always_inline)) void device_enable_async_suspend(struct device *dev)
{
 if (dev->power.status == DPM_ON)
  dev->power.async_suspend = true;
}

static inline __attribute__((always_inline)) void device_disable_async_suspend(struct device *dev)
{
 if (dev->power.status == DPM_ON)
  dev->power.async_suspend = false;
}

static inline __attribute__((always_inline)) int device_async_suspend_enabled(struct device *dev)
{
 return !!dev->power.async_suspend;
}

static inline __attribute__((always_inline)) void device_lock(struct device *dev)
{
 mutex_lock(&dev->mutex);
}

static inline __attribute__((always_inline)) int device_trylock(struct device *dev)
{
 return mutex_trylock(&dev->mutex);
}

static inline __attribute__((always_inline)) void device_unlock(struct device *dev)
{
 mutex_unlock(&dev->mutex);
}

void driver_init(void);




extern int device_register(struct device *dev);
extern void device_unregister(struct device *dev);
extern void device_initialize(struct device *dev);
extern int device_add(struct device *dev);
extern void device_del(struct device *dev);
extern int device_for_each_child(struct device *dev, void *data,
       int (*fn)(struct device *dev, void *data));
extern struct device *device_find_child(struct device *dev, void *data,
    int (*match)(struct device *dev, void *data));
extern int device_rename(struct device *dev, const char *new_name);
extern int device_move(struct device *dev, struct device *new_parent,
         enum dpm_order dpm_order);
extern const char *device_get_devnode(struct device *dev,
          mode_t *mode, const char **tmp);
extern void *dev_get_drvdata(const struct device *dev);
extern void dev_set_drvdata(struct device *dev, void *data);




extern struct device *__root_device_register(const char *name,
          struct module *owner);
static inline __attribute__((always_inline)) struct device *root_device_register(const char *name)
{
 return __root_device_register(name, (&__this_module));
}
extern void root_device_unregister(struct device *root);

static inline __attribute__((always_inline)) void *dev_get_platdata(const struct device *dev)
{
 return dev->platform_data;
}





extern int device_bind_driver(struct device *dev);
extern void device_release_driver(struct device *dev);
extern int device_attach(struct device *dev);
extern int driver_attach(struct device_driver *drv);
extern int device_reprobe(struct device *dev);




extern struct device *device_create_vargs(struct class *cls,
       struct device *parent,
       dev_t devt,
       void *drvdata,
       const char *fmt,
       va_list vargs);
extern struct device *device_create(struct class *cls, struct device *parent,
        dev_t devt, void *drvdata,
        const char *fmt, ...)
        __attribute__((format(printf, 5, 6)));
extern void device_destroy(struct class *cls, dev_t devt);







extern int (*platform_notify)(struct device *dev);

extern int (*platform_notify_remove)(struct device *dev);






extern struct device *get_device(struct device *dev);
extern void put_device(struct device *dev);

extern void wait_for_device_probe(void);






static inline __attribute__((always_inline)) int devtmpfs_create_node(struct device *dev) { return 0; }
static inline __attribute__((always_inline)) int devtmpfs_delete_node(struct device *dev) { return 0; }
static inline __attribute__((always_inline)) int devtmpfs_mount(const char *mountpoint) { return 0; }



extern void device_shutdown(void);


extern void sysdev_shutdown(void);


extern const char *dev_driver_string(const struct device *dev);




extern int dev_printk(const char *level, const struct device *dev,
        const char *fmt, ...)
 __attribute__ ((format (printf, 3, 4)));
extern int dev_emerg(const struct device *dev, const char *fmt, ...)
 __attribute__ ((format (printf, 2, 3)));
extern int dev_alert(const struct device *dev, const char *fmt, ...)
 __attribute__ ((format (printf, 2, 3)));
extern int dev_crit(const struct device *dev, const char *fmt, ...)
 __attribute__ ((format (printf, 2, 3)));
extern int dev_err(const struct device *dev, const char *fmt, ...)
 __attribute__ ((format (printf, 2, 3)));
extern int dev_warn(const struct device *dev, const char *fmt, ...)
 __attribute__ ((format (printf, 2, 3)));
extern int dev_notice(const struct device *dev, const char *fmt, ...)
 __attribute__ ((format (printf, 2, 3)));
extern int _dev_info(const struct device *dev, const char *fmt, ...)
 __attribute__ ((format (printf, 2, 3)));
# 5 "include/linux/dma-mapping.h" 2
# 1 "include/linux/err.h" 1
# 22 "include/linux/err.h"
static inline __attribute__((always_inline)) void * ERR_PTR(long error)
{
 return (void *) error;
}

static inline __attribute__((always_inline)) long PTR_ERR(const void *ptr)
{
 return (long) ptr;
}

static inline __attribute__((always_inline)) long IS_ERR(const void *ptr)
{
 return __builtin_expect(!!(((unsigned long)ptr) >= (unsigned long)-4095), 0);
}

static inline __attribute__((always_inline)) long IS_ERR_OR_NULL(const void *ptr)
{
 return !ptr || __builtin_expect(!!(((unsigned long)ptr) >= (unsigned long)-4095), 0);
}
# 49 "include/linux/err.h"
static inline __attribute__((always_inline)) void * ERR_CAST(const void *ptr)
{

 return (void *) ptr;
}
# 6 "include/linux/dma-mapping.h" 2
# 1 "include/linux/dma-attrs.h" 1





# 1 "include/linux/bug.h" 1





enum bug_trap_type {
 BUG_TRAP_TYPE_NONE = 0,
 BUG_TRAP_TYPE_WARN = 1,
 BUG_TRAP_TYPE_BUG = 2,
};

struct pt_regs;
# 31 "include/linux/bug.h"
static inline __attribute__((always_inline)) enum bug_trap_type report_bug(unsigned long bug_addr,
         struct pt_regs *regs)
{
 return BUG_TRAP_TYPE_BUG;
}
# 7 "include/linux/dma-attrs.h" 2






enum dma_attr {
 DMA_ATTR_WRITE_BARRIER,
 DMA_ATTR_WEAK_ORDERING,
 DMA_ATTR_MAX,
};







struct dma_attrs {
 unsigned long flags[(((DMA_ATTR_MAX) + (8 * sizeof(long)) - 1) / (8 * sizeof(long)))];
};






static inline __attribute__((always_inline)) void init_dma_attrs(struct dma_attrs *attrs)
{
 bitmap_zero(attrs->flags, (((DMA_ATTR_MAX) + (8 * sizeof(long)) - 1) / (8 * sizeof(long))));
}
# 66 "include/linux/dma-attrs.h"
static inline __attribute__((always_inline)) void dma_set_attr(enum dma_attr attr, struct dma_attrs *attrs)
{
}

static inline __attribute__((always_inline)) int dma_get_attr(enum dma_attr attr, struct dma_attrs *attrs)
{
 return 0;
}
# 7 "include/linux/dma-mapping.h" 2
# 1 "include/linux/scatterlist.h" 1




# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/scatterlist.h" 1



# 1 "include/asm-generic/scatterlist.h" 1





struct scatterlist {



 unsigned long page_link;
 unsigned int offset;
 unsigned int length;
 dma_addr_t dma_address;



};
# 5 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/scatterlist.h" 2
# 6 "include/linux/scatterlist.h" 2
# 1 "include/linux/mm.h" 1
# 11 "include/linux/mm.h"
# 1 "include/linux/rbtree.h" 1
# 100 "include/linux/rbtree.h"
struct rb_node
{
 unsigned long rb_parent_color;


 struct rb_node *rb_right;
 struct rb_node *rb_left;
} __attribute__((aligned(sizeof(long))));


struct rb_root
{
 struct rb_node *rb_node;
};
# 123 "include/linux/rbtree.h"
static inline __attribute__((always_inline)) void rb_set_parent(struct rb_node *rb, struct rb_node *p)
{
 rb->rb_parent_color = (rb->rb_parent_color & 3) | (unsigned long)p;
}
static inline __attribute__((always_inline)) void rb_set_color(struct rb_node *rb, int color)
{
 rb->rb_parent_color = (rb->rb_parent_color & ~1) | color;
}
# 139 "include/linux/rbtree.h"
extern void rb_insert_color(struct rb_node *, struct rb_root *);
extern void rb_erase(struct rb_node *, struct rb_root *);

typedef void (*rb_augment_f)(struct rb_node *node, void *data);

extern void rb_augment_insert(struct rb_node *node,
         rb_augment_f func, void *data);
extern struct rb_node *rb_augment_erase_begin(struct rb_node *node);
extern void rb_augment_erase_end(struct rb_node *node,
     rb_augment_f func, void *data);


extern struct rb_node *rb_next(const struct rb_node *);
extern struct rb_node *rb_prev(const struct rb_node *);
extern struct rb_node *rb_first(const struct rb_root *);
extern struct rb_node *rb_last(const struct rb_root *);


extern void rb_replace_node(struct rb_node *victim, struct rb_node *new,
       struct rb_root *root);

static inline __attribute__((always_inline)) void rb_link_node(struct rb_node * node, struct rb_node * parent,
    struct rb_node ** rb_link)
{
 node->rb_parent_color = (unsigned long )parent;
 node->rb_left = node->rb_right = ((void *)0);

 *rb_link = node;
}
# 12 "include/linux/mm.h" 2
# 1 "include/linux/prio_tree.h" 1
# 14 "include/linux/prio_tree.h"
struct raw_prio_tree_node {
 struct prio_tree_node *left;
 struct prio_tree_node *right;
 struct prio_tree_node *parent;
};

struct prio_tree_node {
 struct prio_tree_node *left;
 struct prio_tree_node *right;
 struct prio_tree_node *parent;
 unsigned long start;
 unsigned long last;
};

struct prio_tree_root {
 struct prio_tree_node *prio_tree_node;
 unsigned short index_bits;
 unsigned short raw;




};

struct prio_tree_iter {
 struct prio_tree_node *cur;
 unsigned long mask;
 unsigned long value;
 int size_level;

 struct prio_tree_root *root;
 unsigned long r_index;
 unsigned long h_index;
};

static inline __attribute__((always_inline)) void prio_tree_iter_init(struct prio_tree_iter *iter,
  struct prio_tree_root *root, unsigned long r_index, unsigned long h_index)
{
 iter->root = root;
 iter->r_index = r_index;
 iter->h_index = h_index;
 iter->cur = ((void *)0);
}
# 84 "include/linux/prio_tree.h"
static inline __attribute__((always_inline)) int prio_tree_empty(const struct prio_tree_root *root)
{
 return root->prio_tree_node == ((void *)0);
}

static inline __attribute__((always_inline)) int prio_tree_root(const struct prio_tree_node *node)
{
 return node->parent == node;
}

static inline __attribute__((always_inline)) int prio_tree_left_empty(const struct prio_tree_node *node)
{
 return node->left == node;
}

static inline __attribute__((always_inline)) int prio_tree_right_empty(const struct prio_tree_node *node)
{
 return node->right == node;
}


struct prio_tree_node *prio_tree_replace(struct prio_tree_root *root,
                struct prio_tree_node *old, struct prio_tree_node *node);
struct prio_tree_node *prio_tree_insert(struct prio_tree_root *root,
                struct prio_tree_node *node);
void prio_tree_remove(struct prio_tree_root *root, struct prio_tree_node *node);
struct prio_tree_node *prio_tree_next(struct prio_tree_iter *iter);
# 13 "include/linux/mm.h" 2
# 1 "include/linux/debug_locks.h" 1







struct task_struct;

extern int debug_locks;
extern int debug_locks_silent;


static inline __attribute__((always_inline)) int __debug_locks_off(void)
{
 return ({ ((void)(sizeof(struct { int:-!!(sizeof(*(&debug_locks)) & ~0xc); }))); ((__typeof__(*(&debug_locks))) __xchg((unsigned long)(0), (&debug_locks), sizeof(*(&debug_locks)))); });
}




extern int debug_locks_off(void);
# 48 "include/linux/debug_locks.h"
struct task_struct;
# 57 "include/linux/debug_locks.h"
static inline __attribute__((always_inline)) void debug_show_all_locks(void)
{
}

static inline __attribute__((always_inline)) void __debug_show_held_locks(struct task_struct *task)
{
}

static inline __attribute__((always_inline)) void debug_show_held_locks(struct task_struct *task)
{
}

static inline __attribute__((always_inline)) void
debug_check_no_locks_freed(const void *from, unsigned long len)
{
}

static inline __attribute__((always_inline)) void
debug_check_no_locks_held(struct task_struct *task)
{
}
# 14 "include/linux/mm.h" 2
# 1 "include/linux/mm_types.h" 1



# 1 "include/linux/auxvec.h" 1



# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/auxvec.h" 1
# 5 "include/linux/auxvec.h" 2
# 5 "include/linux/mm_types.h" 2
# 14 "include/linux/mm_types.h"
# 1 "include/linux/page-debug-flags.h" 1
# 14 "include/linux/page-debug-flags.h"
enum page_debug_flags {
 PAGE_DEBUG_FLAG_POISON,
};
# 15 "include/linux/mm_types.h" 2

# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/mmu.h" 1



typedef struct {
 unsigned long asid[4];
 void *vdso;
} mm_context_t;
# 17 "include/linux/mm_types.h" 2






struct address_space;
# 34 "include/linux/mm_types.h"
struct page {
 unsigned long flags;

 atomic_t _count;
 union {
  atomic_t _mapcount;



  struct {
   u16 inuse;
   u16 objects;
  };
 };
 union {
     struct {
  unsigned long private;






  struct address_space *mapping;






     };

     spinlock_t ptl;

     struct kmem_cache *slab;
     struct page *first_page;
 };
 union {
  unsigned long index;
  void *freelist;
 };
 struct list_head lru;
# 103 "include/linux/mm_types.h"
};






struct vm_region {
 struct rb_node vm_rb;
 unsigned long vm_flags;
 unsigned long vm_start;
 unsigned long vm_end;
 unsigned long vm_top;
 unsigned long vm_pgoff;
 struct file *vm_file;

 int vm_usage;
 int vm_icache_flushed : 1;

};







struct vm_area_struct {
 struct mm_struct * vm_mm;
 unsigned long vm_start;
 unsigned long vm_end;



 struct vm_area_struct *vm_next, *vm_prev;

 pgprot_t vm_page_prot;
 unsigned long vm_flags;

 struct rb_node vm_rb;







 union {
  struct {
   struct list_head list;
   void *parent;
   struct vm_area_struct *head;
  } vm_set;

  struct raw_prio_tree_node prio_tree_node;
 } shared;







 struct list_head anon_vma_chain;

 struct anon_vma *anon_vma;


 const struct vm_operations_struct *vm_ops;


 unsigned long vm_pgoff;

 struct file * vm_file;
 void * vm_private_data;
 unsigned long vm_truncate_count;







};

struct core_thread {
 struct task_struct *task;
 struct core_thread *next;
};

struct core_state {
 atomic_t nr_threads;
 struct core_thread dumper;
 struct completion startup;
};

enum {
 MM_FILEPAGES,
 MM_ANONPAGES,
 MM_SWAPENTS,
 NR_MM_COUNTERS
};



struct mm_rss_stat {
 atomic_long_t count[NR_MM_COUNTERS];
};

struct task_rss_stat {
 int events;
 int count[NR_MM_COUNTERS];
};






struct mm_struct {
 struct vm_area_struct * mmap;
 struct rb_root mm_rb;
 struct vm_area_struct * mmap_cache;

 unsigned long (*get_unmapped_area) (struct file *filp,
    unsigned long addr, unsigned long len,
    unsigned long pgoff, unsigned long flags);
 void (*unmap_area) (struct mm_struct *mm, unsigned long addr);

 unsigned long mmap_base;
 unsigned long task_size;
 unsigned long cached_hole_size;
 unsigned long free_area_cache;
 pgd_t * pgd;
 atomic_t mm_users;
 atomic_t mm_count;
 int map_count;
 struct rw_semaphore mmap_sem;
 spinlock_t page_table_lock;

 struct list_head mmlist;





 unsigned long hiwater_rss;
 unsigned long hiwater_vm;

 unsigned long total_vm, locked_vm, shared_vm, exec_vm;
 unsigned long stack_vm, reserved_vm, def_flags, nr_ptes;
 unsigned long start_code, end_code, start_data, end_data;
 unsigned long start_brk, brk, start_stack;
 unsigned long arg_start, arg_end, env_start, env_end;

 unsigned long saved_auxv[(2*(0 + 19 + 1))];





 struct mm_rss_stat rss_stat;

 struct linux_binfmt *binfmt;

 cpumask_t cpu_vm_mask;


 mm_context_t context;
# 280 "include/linux/mm_types.h"
 unsigned int faultstamp;
 unsigned int token_priority;
 unsigned int last_interval;

 unsigned long flags;

 struct core_state *core_state;

 spinlock_t ioctx_lock;
 struct hlist_head ioctx_list;
# 307 "include/linux/mm_types.h"
 struct file *exe_file;
 unsigned long num_exe_file_vmas;




};
# 15 "include/linux/mm.h" 2
# 1 "include/linux/range.h" 1



struct range {
 u64 start;
 u64 end;
};

int add_range(struct range *range, int az, int nr_range,
  u64 start, u64 end);


int add_range_with_merge(struct range *range, int az, int nr_range,
    u64 start, u64 end);

void subtract_range(struct range *range, int az, u64 start, u64 end);

int clean_sort_range(struct range *range, int az);

void sort_range(struct range *range, int nr_range);


static inline __attribute__((always_inline)) resource_size_t cap_resource(u64 val)
{
 if (val > ((resource_size_t)~0))
  return ((resource_size_t)~0);

 return val;
}
# 16 "include/linux/mm.h" 2


struct mempolicy;
struct anon_vma;
struct file_ra_state;
struct user_struct;
struct writeback_control;


extern unsigned long max_mapnr;


extern unsigned long num_physpages;
extern unsigned long totalram_pages;
extern void * high_memory;
extern int page_cluster;


extern int sysctl_legacy_va_layout;





# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/pgtable.h" 1
# 12 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/pgtable.h"
# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/pgtable-32.h" 1
# 17 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/pgtable-32.h"
# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/fixmap.h" 1
# 47 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/fixmap.h"
enum fixed_addresses {

 FIX_CMAP_BEGIN,

 FIX_CMAP_END = FIX_CMAP_BEGIN + (8 * 4 * 2),
# 60 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/fixmap.h"
 __end_of_fixed_addresses
};
# 85 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/fixmap.h"
extern void __this_fixmap_does_not_exist(void);






static inline __attribute__((always_inline)) unsigned long fix_to_virt(const unsigned int idx)
{
# 103 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/fixmap.h"
 if (idx >= __end_of_fixed_addresses)
  __this_fixmap_does_not_exist();

        return (((unsigned long)(long)(int)0xfffe0000) - ((idx) << 12));
}

static inline __attribute__((always_inline)) unsigned long virt_to_fix(const unsigned long vaddr)
{
 __BUG_ON((unsigned long)(vaddr >= ((unsigned long)(long)(int)0xfffe0000) || vaddr < (((unsigned long)(long)(int)0xfffe0000) - (__end_of_fixed_addresses << 12))));
 return ((((unsigned long)(long)(int)0xfffe0000) - ((vaddr)&(~((1 << 12) - 1)))) >> 12);
}







extern void fixrange_init(unsigned long start, unsigned long end,
        pgd_t *pgd_base);
# 18 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/pgtable-32.h" 2

# 1 "include/asm-generic/pgtable-nopmd.h" 1





# 1 "include/asm-generic/pgtable-nopud.h" 1
# 13 "include/asm-generic/pgtable-nopud.h"
typedef struct { pgd_t pgd; } pud_t;
# 25 "include/asm-generic/pgtable-nopud.h"
static inline __attribute__((always_inline)) int pgd_none(pgd_t pgd) { return 0; }
static inline __attribute__((always_inline)) int pgd_bad(pgd_t pgd) { return 0; }
static inline __attribute__((always_inline)) int pgd_present(pgd_t pgd) { return 1; }
static inline __attribute__((always_inline)) void pgd_clear(pgd_t *pgd) { }
# 38 "include/asm-generic/pgtable-nopud.h"
static inline __attribute__((always_inline)) pud_t * pud_offset(pgd_t * pgd, unsigned long address)
{
 return (pud_t *)pgd;
}
# 7 "include/asm-generic/pgtable-nopmd.h" 2

struct mm_struct;
# 17 "include/asm-generic/pgtable-nopmd.h"
typedef struct { pud_t pud; } pmd_t;
# 29 "include/asm-generic/pgtable-nopmd.h"
static inline __attribute__((always_inline)) int pud_none(pud_t pud) { return 0; }
static inline __attribute__((always_inline)) int pud_bad(pud_t pud) { return 0; }
static inline __attribute__((always_inline)) int pud_present(pud_t pud) { return 1; }
static inline __attribute__((always_inline)) void pud_clear(pud_t *pud) { }
# 43 "include/asm-generic/pgtable-nopmd.h"
static inline __attribute__((always_inline)) pmd_t * pmd_offset(pud_t * pud, unsigned long address)
{
 return (pmd_t *)pud;
}
# 59 "include/asm-generic/pgtable-nopmd.h"
static inline __attribute__((always_inline)) void pmd_free(struct mm_struct *mm, pmd_t *pmd)
{
}
# 20 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/pgtable-32.h" 2




extern void add_wired_entry(unsigned long entrylo0, unsigned long entrylo1,
          unsigned long entryhi, unsigned long pagemask);
# 34 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/pgtable-32.h"
extern int add_temporary_entry(unsigned long entrylo0, unsigned long entrylo1,
          unsigned long entryhi, unsigned long pagemask);
# 86 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/pgtable-32.h"
extern void load_pgd(unsigned long pg_dir);

extern pte_t invalid_pte_table[((1UL) << 12)/sizeof(pte_t)];




static inline __attribute__((always_inline)) int pmd_none(pmd_t pmd)
{
 return ((((((pmd).pud).pgd).pgd))) == (unsigned long) invalid_pte_table;
}



static inline __attribute__((always_inline)) int pmd_present(pmd_t pmd)
{
 return ((((((pmd).pud).pgd).pgd))) != (unsigned long) invalid_pte_table;
}

static inline __attribute__((always_inline)) void pmd_clear(pmd_t *pmdp)
{
 ((((((*pmdp).pud).pgd).pgd))) = ((unsigned long) invalid_pte_table);
}
# 13 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/pgtable.h" 2
# 21 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/pgtable.h"
struct mm_struct;
struct vm_area_struct;
# 67 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/pgtable.h"
extern unsigned long _page_cachable_default;






extern unsigned long empty_zero_page;
extern unsigned long zero_page_mask;





static inline __attribute__((always_inline)) int is_zero_pfn(unsigned long pfn)
{
 extern unsigned long zero_pfn;
 unsigned long offset_from_zero_pfn = pfn - zero_pfn;
 return offset_from_zero_pfn <= (zero_page_mask >> 12);
}



extern void paging_init(void);
# 146 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/pgtable.h"
static inline __attribute__((always_inline)) void set_pte(pte_t *ptep, pte_t pteval)
{
 *ptep = pteval;

 if (((pteval).pte) & (1 << ((0 ? (0 ? (((((0 ? (0) : (0) + 1) + 1) + 1) + 1)) + 1 : (((((0 ? (0) : (0) + 1) + 1) + 1) + 1))) + 1 : (0 ? (((((0 ? (0) : (0) + 1) + 1) + 1) + 1)) + 1 : (((((0 ? (0) : (0) + 1) + 1) + 1) + 1)))) + 1))) {
  pte_t *buddy = ((pte_t *)((unsigned long)(ptep) ^ sizeof(pte_t)));




  if ((!(((*buddy).pte) & ~(1 << ((0 ? (0 ? (((((0 ? (0) : (0) + 1) + 1) + 1) + 1)) + 1 : (((((0 ? (0) : (0) + 1) + 1) + 1) + 1))) + 1 : (0 ? (((((0 ? (0) : (0) + 1) + 1) + 1) + 1)) + 1 : (((((0 ? (0) : (0) + 1) + 1) + 1) + 1)))) + 1)))))
   ((*buddy).pte) = ((*buddy).pte) | (1 << ((0 ? (0 ? (((((0 ? (0) : (0) + 1) + 1) + 1) + 1)) + 1 : (((((0 ? (0) : (0) + 1) + 1) + 1) + 1))) + 1 : (0 ? (((((0 ? (0) : (0) + 1) + 1) + 1) + 1)) + 1 : (((((0 ? (0) : (0) + 1) + 1) + 1) + 1)))) + 1));
 }

}


static inline __attribute__((always_inline)) void pte_clear(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
{


 if (((*((pte_t *)((unsigned long)(ptep) ^ sizeof(pte_t)))).pte) & (1 << ((0 ? (0 ? (((((0 ? (0) : (0) + 1) + 1) + 1) + 1)) + 1 : (((((0 ? (0) : (0) + 1) + 1) + 1) + 1))) + 1 : (0 ? (((((0 ? (0) : (0) + 1) + 1) + 1) + 1)) + 1 : (((((0 ? (0) : (0) + 1) + 1) + 1) + 1)))) + 1)))
  set_pte(ptep, ((pte_t) { ((1 << ((0 ? (0 ? (((((0 ? (0) : (0) + 1) + 1) + 1) + 1)) + 1 : (((((0 ? (0) : (0) + 1) + 1) + 1) + 1))) + 1 : (0 ? (((((0 ? (0) : (0) + 1) + 1) + 1) + 1)) + 1 : (((((0 ? (0) : (0) + 1) + 1) + 1) + 1)))) + 1))) } ));
 else

  set_pte(ptep, ((pte_t) { (0) } ));
}
# 197 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/pgtable.h"
extern pgd_t swapper_pg_dir[];
# 260 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/pgtable.h"
static inline __attribute__((always_inline)) int pte_write(pte_t pte) { return ((pte).pte) & (1 << ((0 ? (0) : (0) + 1) + 1)); }
static inline __attribute__((always_inline)) int pte_dirty(pte_t pte) { return ((pte).pte) & (1 << ((((0 ? (0) : (0) + 1) + 1) + 1) + 1)); }
static inline __attribute__((always_inline)) int pte_young(pte_t pte) { return ((pte).pte) & (1 << (((0 ? (0) : (0) + 1) + 1) + 1)); }
static inline __attribute__((always_inline)) int pte_file(pte_t pte) { return ((pte).pte) & ((1 << ((((0 ? (0) : (0) + 1) + 1) + 1) + 1))); }

static inline __attribute__((always_inline)) pte_t pte_wrprotect(pte_t pte)
{
 ((pte).pte) &= ~((1 << ((0 ? (0) : (0) + 1) + 1)) | ((1 << ((((0 ? (0 ? (((((0 ? (0) : (0) + 1) + 1) + 1) + 1)) + 1 : (((((0 ? (0) : (0) + 1) + 1) + 1) + 1))) + 1 : (0 ? (((((0 ? (0) : (0) + 1) + 1) + 1) + 1)) + 1 : (((((0 ? (0) : (0) + 1) + 1) + 1) + 1)))) + 1) + 1) + 1))));
 return pte;
}

static inline __attribute__((always_inline)) pte_t pte_mkclean(pte_t pte)
{
 ((pte).pte) &= ~((1 << ((((0 ? (0) : (0) + 1) + 1) + 1) + 1))|((1 << ((((0 ? (0 ? (((((0 ? (0) : (0) + 1) + 1) + 1) + 1)) + 1 : (((((0 ? (0) : (0) + 1) + 1) + 1) + 1))) + 1 : (0 ? (((((0 ? (0) : (0) + 1) + 1) + 1) + 1)) + 1 : (((((0 ? (0) : (0) + 1) + 1) + 1) + 1)))) + 1) + 1) + 1))));
 return pte;
}

static inline __attribute__((always_inline)) pte_t pte_mkold(pte_t pte)
{
 ((pte).pte) &= ~((1 << (((0 ? (0) : (0) + 1) + 1) + 1))|((1 << (((0 ? (0 ? (((((0 ? (0) : (0) + 1) + 1) + 1) + 1)) + 1 : (((((0 ? (0) : (0) + 1) + 1) + 1) + 1))) + 1 : (0 ? (((((0 ? (0) : (0) + 1) + 1) + 1) + 1)) + 1 : (((((0 ? (0) : (0) + 1) + 1) + 1) + 1)))) + 1) + 1))));
 return pte;
}

static inline __attribute__((always_inline)) pte_t pte_mkwrite(pte_t pte)
{
 ((pte).pte) |= (1 << ((0 ? (0) : (0) + 1) + 1));
 if (((pte).pte) & (1 << ((((0 ? (0) : (0) + 1) + 1) + 1) + 1)))
  ((pte).pte) |= ((1 << ((((0 ? (0 ? (((((0 ? (0) : (0) + 1) + 1) + 1) + 1)) + 1 : (((((0 ? (0) : (0) + 1) + 1) + 1) + 1))) + 1 : (0 ? (((((0 ? (0) : (0) + 1) + 1) + 1) + 1)) + 1 : (((((0 ? (0) : (0) + 1) + 1) + 1) + 1)))) + 1) + 1) + 1)));
 return pte;
}

static inline __attribute__((always_inline)) pte_t pte_mkdirty(pte_t pte)
{
 ((pte).pte) |= (1 << ((((0 ? (0) : (0) + 1) + 1) + 1) + 1));
 if (((pte).pte) & (1 << ((0 ? (0) : (0) + 1) + 1)))
  ((pte).pte) |= ((1 << ((((0 ? (0 ? (((((0 ? (0) : (0) + 1) + 1) + 1) + 1)) + 1 : (((((0 ? (0) : (0) + 1) + 1) + 1) + 1))) + 1 : (0 ? (((((0 ? (0) : (0) + 1) + 1) + 1) + 1)) + 1 : (((((0 ? (0) : (0) + 1) + 1) + 1) + 1)))) + 1) + 1) + 1)));
 return pte;
}

static inline __attribute__((always_inline)) pte_t pte_mkyoung(pte_t pte)
{
 ((pte).pte) |= (1 << (((0 ? (0) : (0) + 1) + 1) + 1));
 if (0) {
  if (!(((pte).pte) & ({if (!0) BUG(); 1 << (0 ? (0 ? (((((0 ? (0) : (0) + 1) + 1) + 1) + 1)) + 1 : (((((0 ? (0) : (0) + 1) + 1) + 1) + 1))) + 1 : (0 ? (((((0 ? (0) : (0) + 1) + 1) + 1) + 1)) + 1 : (((((0 ? (0) : (0) + 1) + 1) + 1) + 1)))); })))
   ((pte).pte) |= ((1 << (((0 ? (0 ? (((((0 ? (0) : (0) + 1) + 1) + 1) + 1)) + 1 : (((((0 ? (0) : (0) + 1) + 1) + 1) + 1))) + 1 : (0 ? (((((0 ? (0) : (0) + 1) + 1) + 1) + 1)) + 1 : (((((0 ? (0) : (0) + 1) + 1) + 1) + 1)))) + 1) + 1)));
 } else {
  if (((pte).pte) & ({if (0) BUG(); 1 << (0 ? (0) : (0) + 1); }))
   ((pte).pte) |= ((1 << (((0 ? (0 ? (((((0 ? (0) : (0) + 1) + 1) + 1) + 1)) + 1 : (((((0 ? (0) : (0) + 1) + 1) + 1) + 1))) + 1 : (0 ? (((((0 ? (0) : (0) + 1) + 1) + 1) + 1)) + 1 : (((((0 ? (0) : (0) + 1) + 1) + 1) + 1)))) + 1) + 1)));
 }
 return pte;
}


static inline __attribute__((always_inline)) int pte_huge(pte_t pte) { return ((pte).pte) & ({BUG(); 1; }); }

static inline __attribute__((always_inline)) pte_t pte_mkhuge(pte_t pte)
{
 ((pte).pte) |= ({BUG(); 1; });
 return pte;
}


static inline __attribute__((always_inline)) int pte_special(pte_t pte) { return 0; }
static inline __attribute__((always_inline)) pte_t pte_mkspecial(pte_t pte) { return pte; }
# 333 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/pgtable.h"
static inline __attribute__((always_inline)) pgprot_t pgprot_noncached(pgprot_t _prot)
{
 unsigned long prot = ((_prot).pgprot);

 prot = (prot & ~(7 << (((((0 ? (0 ? (((((0 ? (0) : (0) + 1) + 1) + 1) + 1)) + 1 : (((((0 ? (0) : (0) + 1) + 1) + 1) + 1))) + 1 : (0 ? (((((0 ? (0) : (0) + 1) + 1) + 1) + 1)) + 1 : (((((0 ? (0) : (0) + 1) + 1) + 1) + 1)))) + 1) + 1) + 1) + 1))) | (2<<(((((0 ? (0 ? (((((0 ? (0) : (0) + 1) + 1) + 1) + 1)) + 1 : (((((0 ? (0) : (0) + 1) + 1) + 1) + 1))) + 1 : (0 ? (((((0 ? (0) : (0) + 1) + 1) + 1) + 1)) + 1 : (((((0 ? (0) : (0) + 1) + 1) + 1) + 1)))) + 1) + 1) + 1) + 1));

 return ((pgprot_t) { (prot) } );
}
# 358 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/pgtable.h"
static inline __attribute__((always_inline)) pte_t pte_modify(pte_t pte, pgprot_t newprot)
{
 return ((pte_t) { ((((pte).pte) & ((~((1 << ((12 - 12 + (((((0 ? (0 ? (((((0 ? (0) : (0) + 1) + 1) + 1) + 1)) + 1 : (((((0 ? (0) : (0) + 1) + 1) + 1) + 1))) + 1 : (0 ? (((((0 ? (0) : (0) + 1) + 1) + 1) + 1)) + 1 : (((((0 ? (0) : (0) + 1) + 1) + 1) + 1)))) + 1) + 1) + 1) + 1) + 3))) - 1)) | (1 << (((0 ? (0) : (0) + 1) + 1) + 1)) | (1 << ((((0 ? (0) : (0) + 1) + 1) + 1) + 1)) | (7 << (((((0 ? (0 ? (((((0 ? (0) : (0) + 1) + 1) + 1) + 1)) + 1 : (((((0 ? (0) : (0) + 1) + 1) + 1) + 1))) + 1 : (0 ? (((((0 ? (0) : (0) + 1) + 1) + 1) + 1)) + 1 : (((((0 ? (0) : (0) + 1) + 1) + 1) + 1)))) + 1) + 1) + 1) + 1)))) | ((newprot).pgprot)) } );
}



extern void __update_tlb(struct vm_area_struct *vma, unsigned long address,
 pte_t pte);
extern void __update_cache(struct vm_area_struct *vma, unsigned long address,
 pte_t pte);

static inline __attribute__((always_inline)) void update_mmu_cache(struct vm_area_struct *vma,
 unsigned long address, pte_t *ptep)
{
 pte_t pte = *ptep;
 __update_tlb(vma, address, pte);
 __update_cache(vma, address, pte);
}
# 397 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/pgtable.h"
# 1 "include/asm-generic/pgtable.h" 1
# 94 "include/asm-generic/pgtable.h"
struct mm_struct;
static inline __attribute__((always_inline)) void ptep_set_wrprotect(struct mm_struct *mm, unsigned long address, pte_t *ptep)
{
 pte_t old_pte = *ptep;
 set_pte(ptep, pte_wrprotect(old_pte));
}
# 170 "include/asm-generic/pgtable.h"
void pgd_clear_bad(pgd_t *);
void pud_clear_bad(pud_t *);
void pmd_clear_bad(pmd_t *);

static inline __attribute__((always_inline)) int pgd_none_or_clear_bad(pgd_t *pgd)
{
 if (pgd_none(*pgd))
  return 1;
 if (__builtin_expect(!!(pgd_bad(*pgd)), 0)) {
  pgd_clear_bad(pgd);
  return 1;
 }
 return 0;
}

static inline __attribute__((always_inline)) int pud_none_or_clear_bad(pud_t *pud)
{
 if (pud_none(*pud))
  return 1;
 if (__builtin_expect(!!(pud_bad(*pud)), 0)) {
  pud_clear_bad(pud);
  return 1;
 }
 return 0;
}

static inline __attribute__((always_inline)) int pmd_none_or_clear_bad(pmd_t *pmd)
{
 if (pmd_none(*pmd))
  return 1;
 if (__builtin_expect(!!((((((((*pmd).pud).pgd).pgd))) & ~(~((1 << 12) - 1)))), 0)) {
  pmd_clear_bad(pmd);
  return 1;
 }
 return 0;
}

static inline __attribute__((always_inline)) pte_t __ptep_modify_prot_start(struct mm_struct *mm,
          unsigned long addr,
          pte_t *ptep)
{





 return ({ pte_t __pte = *(ptep); pte_clear((mm), (addr), (ptep)); __pte; });
}

static inline __attribute__((always_inline)) void __ptep_modify_prot_commit(struct mm_struct *mm,
          unsigned long addr,
          pte_t *ptep, pte_t pte)
{




 set_pte(ptep, pte);
}
# 245 "include/asm-generic/pgtable.h"
static inline __attribute__((always_inline)) pte_t ptep_modify_prot_start(struct mm_struct *mm,
        unsigned long addr,
        pte_t *ptep)
{
 return __ptep_modify_prot_start(mm, addr, ptep);
}





static inline __attribute__((always_inline)) void ptep_modify_prot_commit(struct mm_struct *mm,
        unsigned long addr,
        pte_t *ptep, pte_t pte)
{
 __ptep_modify_prot_commit(mm, addr, ptep, pte);
}
# 309 "include/asm-generic/pgtable.h"
static inline __attribute__((always_inline)) int track_pfn_vma_new(struct vm_area_struct *vma, pgprot_t *prot,
     unsigned long pfn, unsigned long size)
{
 return 0;
}
# 322 "include/asm-generic/pgtable.h"
static inline __attribute__((always_inline)) int track_pfn_vma_copy(struct vm_area_struct *vma)
{
 return 0;
}
# 335 "include/asm-generic/pgtable.h"
static inline __attribute__((always_inline)) void untrack_pfn_vma(struct vm_area_struct *vma,
     unsigned long pfn, unsigned long size)
{
}
# 398 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/pgtable.h" 2
# 41 "include/linux/mm.h" 2
# 57 "include/linux/mm.h"
extern struct kmem_cache *vm_area_cachep;
# 142 "include/linux/mm.h"
extern pgprot_t protection_map[16];
# 156 "include/linux/mm.h"
static inline __attribute__((always_inline)) int is_linear_pfn_mapping(struct vm_area_struct *vma)
{
 return (vma->vm_flags & 0x40000000);
}

static inline __attribute__((always_inline)) int is_pfn_mapping(struct vm_area_struct *vma)
{
 return (vma->vm_flags & 0x00000400);
}
# 175 "include/linux/mm.h"
struct vm_fault {
 unsigned int flags;
 unsigned long pgoff;
 void *virtual_address;

 struct page *page;




};






struct vm_operations_struct {
 void (*open)(struct vm_area_struct * area);
 void (*close)(struct vm_area_struct * area);
 int (*fault)(struct vm_area_struct *vma, struct vm_fault *vmf);



 int (*page_mkwrite)(struct vm_area_struct *vma, struct vm_fault *vmf);




 int (*access)(struct vm_area_struct *vma, unsigned long addr,
        void *buf, int len, int write);
# 231 "include/linux/mm.h"
};

struct mmu_gather;
struct inode;
# 243 "include/linux/mm.h"
# 1 "include/linux/page-flags.h" 1
# 75 "include/linux/page-flags.h"
enum pageflags {
 PG_locked,
 PG_error,
 PG_referenced,
 PG_uptodate,
 PG_dirty,
 PG_lru,
 PG_active,
 PG_slab,
 PG_owner_priv_1,
 PG_arch_1,
 PG_reserved,
 PG_private,
 PG_private_2,
 PG_writeback,

 PG_head,
 PG_tail,



 PG_swapcache,
 PG_mappedtodisk,
 PG_reclaim,
 PG_buddy,
 PG_swapbacked,
 PG_unevictable,

 PG_mlocked,







 __NR_PAGEFLAGS,


 PG_checked = PG_owner_priv_1,





 PG_fscache = PG_private_2,


 PG_pinned = PG_owner_priv_1,
 PG_savepinned = PG_dirty,


 PG_slob_free = PG_private,


 PG_slub_frozen = PG_active,
};
# 198 "include/linux/page-flags.h"
struct page;

static inline __attribute__((always_inline)) int PageLocked(struct page *page) { return test_bit(PG_locked, &page->flags); } static inline __attribute__((always_inline)) int TestSetPageLocked(struct page *page) { return test_and_set_bit(PG_locked, &page->flags); }
static inline __attribute__((always_inline)) int PageError(struct page *page) { return test_bit(PG_error, &page->flags); } static inline __attribute__((always_inline)) void SetPageError(struct page *page) { set_bit(PG_error, &page->flags); } static inline __attribute__((always_inline)) void ClearPageError(struct page *page) { clear_bit(PG_error, &page->flags); }
static inline __attribute__((always_inline)) int PageReferenced(struct page *page) { return test_bit(PG_referenced, &page->flags); } static inline __attribute__((always_inline)) void SetPageReferenced(struct page *page) { set_bit(PG_referenced, &page->flags); } static inline __attribute__((always_inline)) void ClearPageReferenced(struct page *page) { clear_bit(PG_referenced, &page->flags); } static inline __attribute__((always_inline)) int TestClearPageReferenced(struct page *page) { return test_and_clear_bit(PG_referenced, &page->flags); }
static inline __attribute__((always_inline)) int PageDirty(struct page *page) { return test_bit(PG_dirty, &page->flags); } static inline __attribute__((always_inline)) void SetPageDirty(struct page *page) { set_bit(PG_dirty, &page->flags); } static inline __attribute__((always_inline)) void ClearPageDirty(struct page *page) { clear_bit(PG_dirty, &page->flags); } static inline __attribute__((always_inline)) int TestSetPageDirty(struct page *page) { return test_and_set_bit(PG_dirty, &page->flags); } static inline __attribute__((always_inline)) int TestClearPageDirty(struct page *page) { return test_and_clear_bit(PG_dirty, &page->flags); } static inline __attribute__((always_inline)) void __ClearPageDirty(struct page *page) { __clear_bit(PG_dirty, &page->flags); }
static inline __attribute__((always_inline)) int PageLRU(struct page *page) { return test_bit(PG_lru, &page->flags); } static inline __attribute__((always_inline)) void SetPageLRU(struct page *page) { set_bit(PG_lru, &page->flags); } static inline __attribute__((always_inline)) void ClearPageLRU(struct page *page) { clear_bit(PG_lru, &page->flags); } static inline __attribute__((always_inline)) void __ClearPageLRU(struct page *page) { __clear_bit(PG_lru, &page->flags); }
static inline __attribute__((always_inline)) int PageActive(struct page *page) { return test_bit(PG_active, &page->flags); } static inline __attribute__((always_inline)) void SetPageActive(struct page *page) { set_bit(PG_active, &page->flags); } static inline __attribute__((always_inline)) void ClearPageActive(struct page *page) { clear_bit(PG_active, &page->flags); } static inline __attribute__((always_inline)) void __ClearPageActive(struct page *page) { __clear_bit(PG_active, &page->flags); }
 static inline __attribute__((always_inline)) int TestClearPageActive(struct page *page) { return test_and_clear_bit(PG_active, &page->flags); }
static inline __attribute__((always_inline)) int PageSlab(struct page *page) { return test_bit(PG_slab, &page->flags); } static inline __attribute__((always_inline)) void __SetPageSlab(struct page *page) { __set_bit(PG_slab, &page->flags); } static inline __attribute__((always_inline)) void __ClearPageSlab(struct page *page) { __clear_bit(PG_slab, &page->flags); }
static inline __attribute__((always_inline)) int PageChecked(struct page *page) { return test_bit(PG_checked, &page->flags); } static inline __attribute__((always_inline)) void SetPageChecked(struct page *page) { set_bit(PG_checked, &page->flags); } static inline __attribute__((always_inline)) void ClearPageChecked(struct page *page) { clear_bit(PG_checked, &page->flags); }
static inline __attribute__((always_inline)) int PagePinned(struct page *page) { return test_bit(PG_pinned, &page->flags); } static inline __attribute__((always_inline)) void SetPagePinned(struct page *page) { set_bit(PG_pinned, &page->flags); } static inline __attribute__((always_inline)) void ClearPagePinned(struct page *page) { clear_bit(PG_pinned, &page->flags); } static inline __attribute__((always_inline)) int TestSetPagePinned(struct page *page) { return test_and_set_bit(PG_pinned, &page->flags); } static inline __attribute__((always_inline)) int TestClearPagePinned(struct page *page) { return test_and_clear_bit(PG_pinned, &page->flags); }
static inline __attribute__((always_inline)) int PageSavePinned(struct page *page) { return test_bit(PG_savepinned, &page->flags); } static inline __attribute__((always_inline)) void SetPageSavePinned(struct page *page) { set_bit(PG_savepinned, &page->flags); } static inline __attribute__((always_inline)) void ClearPageSavePinned(struct page *page) { clear_bit(PG_savepinned, &page->flags); };
static inline __attribute__((always_inline)) int PageReserved(struct page *page) { return test_bit(PG_reserved, &page->flags); } static inline __attribute__((always_inline)) void SetPageReserved(struct page *page) { set_bit(PG_reserved, &page->flags); } static inline __attribute__((always_inline)) void ClearPageReserved(struct page *page) { clear_bit(PG_reserved, &page->flags); } static inline __attribute__((always_inline)) void __ClearPageReserved(struct page *page) { __clear_bit(PG_reserved, &page->flags); }
static inline __attribute__((always_inline)) int PageSwapBacked(struct page *page) { return test_bit(PG_swapbacked, &page->flags); } static inline __attribute__((always_inline)) void SetPageSwapBacked(struct page *page) { set_bit(PG_swapbacked, &page->flags); } static inline __attribute__((always_inline)) void ClearPageSwapBacked(struct page *page) { clear_bit(PG_swapbacked, &page->flags); } static inline __attribute__((always_inline)) void __ClearPageSwapBacked(struct page *page) { __clear_bit(PG_swapbacked, &page->flags); }

static inline __attribute__((always_inline)) int PageSlobFree(struct page *page) { return test_bit(PG_slob_free, &page->flags); } static inline __attribute__((always_inline)) void __SetPageSlobFree(struct page *page) { __set_bit(PG_slob_free, &page->flags); } static inline __attribute__((always_inline)) void __ClearPageSlobFree(struct page *page) { __clear_bit(PG_slob_free, &page->flags); }

static inline __attribute__((always_inline)) int PageSlubFrozen(struct page *page) { return test_bit(PG_slub_frozen, &page->flags); } static inline __attribute__((always_inline)) void __SetPageSlubFrozen(struct page *page) { __set_bit(PG_slub_frozen, &page->flags); } static inline __attribute__((always_inline)) void __ClearPageSlubFrozen(struct page *page) { __clear_bit(PG_slub_frozen, &page->flags); }






static inline __attribute__((always_inline)) int PagePrivate(struct page *page) { return test_bit(PG_private, &page->flags); } static inline __attribute__((always_inline)) void SetPagePrivate(struct page *page) { set_bit(PG_private, &page->flags); } static inline __attribute__((always_inline)) void ClearPagePrivate(struct page *page) { clear_bit(PG_private, &page->flags); } static inline __attribute__((always_inline)) void __SetPagePrivate(struct page *page) { __set_bit(PG_private, &page->flags); }
 static inline __attribute__((always_inline)) void __ClearPagePrivate(struct page *page) { __clear_bit(PG_private, &page->flags); }
static inline __attribute__((always_inline)) int PagePrivate2(struct page *page) { return test_bit(PG_private_2, &page->flags); } static inline __attribute__((always_inline)) void SetPagePrivate2(struct page *page) { set_bit(PG_private_2, &page->flags); } static inline __attribute__((always_inline)) void ClearPagePrivate2(struct page *page) { clear_bit(PG_private_2, &page->flags); } static inline __attribute__((always_inline)) int TestSetPagePrivate2(struct page *page) { return test_and_set_bit(PG_private_2, &page->flags); } static inline __attribute__((always_inline)) int TestClearPagePrivate2(struct page *page) { return test_and_clear_bit(PG_private_2, &page->flags); }
static inline __attribute__((always_inline)) int PageOwnerPriv1(struct page *page) { return test_bit(PG_owner_priv_1, &page->flags); } static inline __attribute__((always_inline)) void SetPageOwnerPriv1(struct page *page) { set_bit(PG_owner_priv_1, &page->flags); } static inline __attribute__((always_inline)) void ClearPageOwnerPriv1(struct page *page) { clear_bit(PG_owner_priv_1, &page->flags); } static inline __attribute__((always_inline)) int TestClearPageOwnerPriv1(struct page *page) { return test_and_clear_bit(PG_owner_priv_1, &page->flags); }





static inline __attribute__((always_inline)) int PageWriteback(struct page *page) { return test_bit(PG_writeback, &page->flags); } static inline __attribute__((always_inline)) int TestSetPageWriteback(struct page *page) { return test_and_set_bit(PG_writeback, &page->flags); } static inline __attribute__((always_inline)) int TestClearPageWriteback(struct page *page) { return test_and_clear_bit(PG_writeback, &page->flags); }
static inline __attribute__((always_inline)) int PageBuddy(struct page *page) { return test_bit(PG_buddy, &page->flags); } static inline __attribute__((always_inline)) void __SetPageBuddy(struct page *page) { __set_bit(PG_buddy, &page->flags); } static inline __attribute__((always_inline)) void __ClearPageBuddy(struct page *page) { __clear_bit(PG_buddy, &page->flags); }
static inline __attribute__((always_inline)) int PageMappedToDisk(struct page *page) { return test_bit(PG_mappedtodisk, &page->flags); } static inline __attribute__((always_inline)) void SetPageMappedToDisk(struct page *page) { set_bit(PG_mappedtodisk, &page->flags); } static inline __attribute__((always_inline)) void ClearPageMappedToDisk(struct page *page) { clear_bit(PG_mappedtodisk, &page->flags); }


static inline __attribute__((always_inline)) int PageReclaim(struct page *page) { return test_bit(PG_reclaim, &page->flags); } static inline __attribute__((always_inline)) void SetPageReclaim(struct page *page) { set_bit(PG_reclaim, &page->flags); } static inline __attribute__((always_inline)) void ClearPageReclaim(struct page *page) { clear_bit(PG_reclaim, &page->flags); } static inline __attribute__((always_inline)) int TestClearPageReclaim(struct page *page) { return test_and_clear_bit(PG_reclaim, &page->flags); }
static inline __attribute__((always_inline)) int PageReadahead(struct page *page) { return test_bit(PG_reclaim, &page->flags); } static inline __attribute__((always_inline)) void SetPageReadahead(struct page *page) { set_bit(PG_reclaim, &page->flags); } static inline __attribute__((always_inline)) void ClearPageReadahead(struct page *page) { clear_bit(PG_reclaim, &page->flags); }
# 247 "include/linux/page-flags.h"
static inline __attribute__((always_inline)) int PageHighMem(struct page *page) { return 0; }





static inline __attribute__((always_inline)) int PageSwapCache(struct page *page) { return 0; }
 static inline __attribute__((always_inline)) void SetPageSwapCache(struct page *page) { } static inline __attribute__((always_inline)) void ClearPageSwapCache(struct page *page) { }


static inline __attribute__((always_inline)) int PageUnevictable(struct page *page) { return test_bit(PG_unevictable, &page->flags); } static inline __attribute__((always_inline)) void SetPageUnevictable(struct page *page) { set_bit(PG_unevictable, &page->flags); } static inline __attribute__((always_inline)) void ClearPageUnevictable(struct page *page) { clear_bit(PG_unevictable, &page->flags); } static inline __attribute__((always_inline)) void __ClearPageUnevictable(struct page *page) { __clear_bit(PG_unevictable, &page->flags); }
 static inline __attribute__((always_inline)) int TestClearPageUnevictable(struct page *page) { return test_and_clear_bit(PG_unevictable, &page->flags); }


static inline __attribute__((always_inline)) int PageMlocked(struct page *page) { return test_bit(PG_mlocked, &page->flags); } static inline __attribute__((always_inline)) void SetPageMlocked(struct page *page) { set_bit(PG_mlocked, &page->flags); } static inline __attribute__((always_inline)) void ClearPageMlocked(struct page *page) { clear_bit(PG_mlocked, &page->flags); } static inline __attribute__((always_inline)) void __ClearPageMlocked(struct page *page) { __clear_bit(PG_mlocked, &page->flags); }
 static inline __attribute__((always_inline)) int TestSetPageMlocked(struct page *page) { return test_and_set_bit(PG_mlocked, &page->flags); } static inline __attribute__((always_inline)) int TestClearPageMlocked(struct page *page) { return test_and_clear_bit(PG_mlocked, &page->flags); } static inline __attribute__((always_inline)) int __TestClearPageMlocked(struct page *page) { return __test_and_clear_bit(PG_mlocked, &page->flags); }
# 271 "include/linux/page-flags.h"
static inline __attribute__((always_inline)) int PageUncached(struct page *page) { return 0; }







static inline __attribute__((always_inline)) int PageHWPoison(struct page *page) { return 0; }



u64 stable_page_flags(struct page *page);

static inline __attribute__((always_inline)) int PageUptodate(struct page *page)
{
 int ret = test_bit(PG_uptodate, &(page)->flags);
# 297 "include/linux/page-flags.h"
 if (ret)
  __asm__ __volatile__("": : :"memory");

 return ret;
}

static inline __attribute__((always_inline)) void __SetPageUptodate(struct page *page)
{
 __asm__ __volatile__("": : :"memory");
 __set_bit(PG_uptodate, &(page)->flags);
}

static inline __attribute__((always_inline)) void SetPageUptodate(struct page *page)
{
# 323 "include/linux/page-flags.h"
 __asm__ __volatile__("": : :"memory");
 set_bit(PG_uptodate, &(page)->flags);

}

static inline __attribute__((always_inline)) void ClearPageUptodate(struct page *page) { clear_bit(PG_uptodate, &page->flags); }

extern void cancel_dirty_page(struct page *page, unsigned int account_size);

int test_clear_page_writeback(struct page *page);
int test_set_page_writeback(struct page *page);

static inline __attribute__((always_inline)) void set_page_writeback(struct page *page)
{
 test_set_page_writeback(page);
}
# 347 "include/linux/page-flags.h"
static inline __attribute__((always_inline)) int PageHead(struct page *page) { return test_bit(PG_head, &page->flags); } static inline __attribute__((always_inline)) void __SetPageHead(struct page *page) { __set_bit(PG_head, &page->flags); } static inline __attribute__((always_inline)) void __ClearPageHead(struct page *page) { __clear_bit(PG_head, &page->flags); }
static inline __attribute__((always_inline)) int PageTail(struct page *page) { return test_bit(PG_tail, &page->flags); } static inline __attribute__((always_inline)) void __SetPageTail(struct page *page) { __set_bit(PG_tail, &page->flags); } static inline __attribute__((always_inline)) void __ClearPageTail(struct page *page) { __clear_bit(PG_tail, &page->flags); }

static inline __attribute__((always_inline)) int PageCompound(struct page *page)
{
 return page->flags & ((1L << PG_head) | (1L << PG_tail));

}
# 427 "include/linux/page-flags.h"
static inline __attribute__((always_inline)) int page_has_private(struct page *page)
{
 return !!(page->flags & (1 << PG_private | 1 << PG_private_2));
}
# 244 "include/linux/mm.h" 2
# 261 "include/linux/mm.h"
static inline __attribute__((always_inline)) int put_page_testzero(struct page *page)
{
 do { (void)((*(volatile int *)&(&page->_count)->counter) == 0); } while (0);
 return (atomic_sub_return(1, (&page->_count)) == 0);
}





static inline __attribute__((always_inline)) int get_page_unless_zero(struct page *page)
{
 return atomic_add_unless((&page->_count), 1, 0);
}

extern int page_is_ram(unsigned long pfn);


struct page *vmalloc_to_page(const void *addr);
unsigned long vmalloc_to_pfn(const void *addr);







static inline __attribute__((always_inline)) int is_vmalloc_addr(const void *x)
{

 unsigned long addr = (unsigned long)x;

 return addr >= (0xc0000000UL) && addr < ((((unsigned long)(long)(int)0xfffe0000) - (__end_of_fixed_addresses << 12))-2*((1UL) << 12));



}

extern int is_vmalloc_or_module_addr(const void *x);







static inline __attribute__((always_inline)) struct page *compound_head(struct page *page)
{
 if (__builtin_expect(!!(PageTail(page)), 0))
  return page->first_page;
 return page;
}

static inline __attribute__((always_inline)) int page_count(struct page *page)
{
 return (*(volatile int *)&(&compound_head(page)->_count)->counter);
}

static inline __attribute__((always_inline)) void get_page(struct page *page)
{
 page = compound_head(page);
 do { (void)((*(volatile int *)&(&page->_count)->counter) == 0); } while (0);
 atomic_add(1, (&page->_count));
}

static inline __attribute__((always_inline)) struct page *virt_to_head_page(const void *x)
{
 struct page *page = (mem_map + ((((virt_to_phys(x)) >> 12)) - ((((0UL)) + ((1UL) << 12)-1) >> 12)));
 return compound_head(page);
}





static inline __attribute__((always_inline)) void init_page_count(struct page *page)
{
 ((&page->_count)->counter = (1));
}

void put_page(struct page *page);
void put_pages_list(struct list_head *pages);

void split_page(struct page *page, unsigned int order);
int split_free_page(struct page *page);






typedef void compound_page_dtor(struct page *);

static inline __attribute__((always_inline)) void set_compound_page_dtor(struct page *page,
      compound_page_dtor *dtor)
{
 page[1].lru.next = (void *)dtor;
}

static inline __attribute__((always_inline)) compound_page_dtor *get_compound_page_dtor(struct page *page)
{
 return (compound_page_dtor *)page[1].lru.next;
}

static inline __attribute__((always_inline)) int compound_order(struct page *page)
{
 if (!PageHead(page))
  return 0;
 return (unsigned long)page[1].lru.prev;
}

static inline __attribute__((always_inline)) void set_compound_order(struct page *page, unsigned long order)
{
 page[1].lru.prev = (void *)order;
}
# 522 "include/linux/mm.h"
static inline __attribute__((always_inline)) enum zone_type page_zonenum(struct page *page)
{
 return (page->flags >> (((((sizeof(unsigned long)*8) - 0) - 0) - 1) * (1 != 0))) & ((1UL << 1) - 1);
}
# 535 "include/linux/mm.h"
static inline __attribute__((always_inline)) int page_zone_id(struct page *page)
{
 return (page->flags >> ((((((sizeof(unsigned long)*8) - 0) - 0) < ((((sizeof(unsigned long)*8) - 0) - 0) - 1))? (((sizeof(unsigned long)*8) - 0) - 0) : ((((sizeof(unsigned long)*8) - 0) - 0) - 1)) * ((0 + 1) != 0))) & ((1UL << (0 + 1)) - 1);
}

static inline __attribute__((always_inline)) int zone_to_nid(struct zone *zone)
{



 return 0;

}




static inline __attribute__((always_inline)) int page_to_nid(struct page *page)
{
 return (page->flags >> ((((sizeof(unsigned long)*8) - 0) - 0) * (0 != 0))) & ((1UL << 0) - 1);
}


static inline __attribute__((always_inline)) struct zone *page_zone(struct page *page)
{
 return &(&contig_page_data)->node_zones[page_zonenum(page)];
}
# 570 "include/linux/mm.h"
static inline __attribute__((always_inline)) void set_page_zone(struct page *page, enum zone_type zone)
{
 page->flags &= ~(((1UL << 1) - 1) << (((((sizeof(unsigned long)*8) - 0) - 0) - 1) * (1 != 0)));
 page->flags |= (zone & ((1UL << 1) - 1)) << (((((sizeof(unsigned long)*8) - 0) - 0) - 1) * (1 != 0));
}

static inline __attribute__((always_inline)) void set_page_node(struct page *page, unsigned long node)
{
 page->flags &= ~(((1UL << 0) - 1) << ((((sizeof(unsigned long)*8) - 0) - 0) * (0 != 0)));
 page->flags |= (node & ((1UL << 0) - 1)) << ((((sizeof(unsigned long)*8) - 0) - 0) * (0 != 0));
}

static inline __attribute__((always_inline)) void set_page_section(struct page *page, unsigned long section)
{
 page->flags &= ~(((1UL << 0) - 1) << (((sizeof(unsigned long)*8) - 0) * (0 != 0)));
 page->flags |= (section & ((1UL << 0) - 1)) << (((sizeof(unsigned long)*8) - 0) * (0 != 0));
}

static inline __attribute__((always_inline)) void set_page_links(struct page *page, enum zone_type zone,
 unsigned long node, unsigned long pfn)
{
 set_page_zone(page, zone);
 set_page_node(page, node);
 set_page_section(page, ((pfn) >> 0));
}




# 1 "include/linux/vmstat.h" 1





# 1 "include/linux/mm.h" 1
# 7 "include/linux/vmstat.h" 2
# 31 "include/linux/vmstat.h"
enum vm_event_item { PGPGIN, PGPGOUT, PSWPIN, PSWPOUT,
  PGALLOC_NORMAL , PGALLOC_MOVABLE,
  PGFREE, PGACTIVATE, PGDEACTIVATE,
  PGFAULT, PGMAJFAULT,
  PGREFILL_NORMAL , PGREFILL_MOVABLE,
  PGSTEAL_NORMAL , PGSTEAL_MOVABLE,
  PGSCAN_KSWAPD_NORMAL , PGSCAN_KSWAPD_MOVABLE,
  PGSCAN_DIRECT_NORMAL , PGSCAN_DIRECT_MOVABLE,



  PGINODESTEAL, SLABS_SCANNED, KSWAPD_STEAL, KSWAPD_INODESTEAL,
  KSWAPD_LOW_WMARK_HIT_QUICKLY, KSWAPD_HIGH_WMARK_HIT_QUICKLY,
  KSWAPD_SKIP_CONGESTION_WAIT,
  PAGEOUTRUN, ALLOCSTALL, PGROTATED,







  UNEVICTABLE_PGCULLED,
  UNEVICTABLE_PGSCANNED,
  UNEVICTABLE_PGRESCUED,
  UNEVICTABLE_PGMLOCKED,
  UNEVICTABLE_PGMUNLOCKED,
  UNEVICTABLE_PGCLEARED,
  UNEVICTABLE_PGSTRANDED,
  UNEVICTABLE_MLOCKFREED,
  NR_VM_EVENT_ITEMS
};

extern int sysctl_stat_interval;
# 77 "include/linux/vmstat.h"
struct vm_event_state {
 unsigned long event[NR_VM_EVENT_ITEMS];
};

extern __attribute__((section(".data..percpu" ""))) __typeof__(struct vm_event_state) vm_event_states;

static inline __attribute__((always_inline)) void __count_vm_event(enum vm_event_item item)
{
 do { do { const void *__vpp_verify = (typeof(&(((vm_event_states.event[item])))))((void *)0); (void)__vpp_verify; } while (0); switch(sizeof(((vm_event_states.event[item])))) { case 1: do { *({ do { const void *__vpp_verify = (typeof((&((((vm_event_states.event[item])))))))((void *)0); (void)__vpp_verify; } while (0); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"((typeof(*(&((((vm_event_states.event[item])))))) *)(&((((vm_event_states.event[item]))))))); (typeof((typeof(*(&((((vm_event_states.event[item])))))) *)(&((((vm_event_states.event[item]))))))) (__ptr + (((__per_cpu_offset[(__current_thread_info->cpu)])))); }); }) += ((1)); } while (0);break; case 2: do { *({ do { const void *__vpp_verify = (typeof((&((((vm_event_states.event[item])))))))((void *)0); (void)__vpp_verify; } while (0); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"((typeof(*(&((((vm_event_states.event[item])))))) *)(&((((vm_event_states.event[item]))))))); (typeof((typeof(*(&((((vm_event_states.event[item])))))) *)(&((((vm_event_states.event[item]))))))) (__ptr + (((__per_cpu_offset[(__current_thread_info->cpu)])))); }); }) += ((1)); } while (0);break; case 4: do { *({ do { const void *__vpp_verify = (typeof((&((((vm_event_states.event[item])))))))((void *)0); (void)__vpp_verify; } while (0); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"((typeof(*(&((((vm_event_states.event[item])))))) *)(&((((vm_event_states.event[item]))))))); (typeof((typeof(*(&((((vm_event_states.event[item])))))) *)(&((((vm_event_states.event[item]))))))) (__ptr + (((__per_cpu_offset[(__current_thread_info->cpu)])))); }); }) += ((1)); } while (0);break; case 8: do { *({ do { const void *__vpp_verify = (typeof((&((((vm_event_states.event[item])))))))((void *)0); (void)__vpp_verify; } while (0); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"((typeof(*(&((((vm_event_states.event[item])))))) *)(&((((vm_event_states.event[item]))))))); (typeof((typeof(*(&((((vm_event_states.event[item])))))) *)(&((((vm_event_states.event[item]))))))) (__ptr + (((__per_cpu_offset[(__current_thread_info->cpu)])))); }); }) += ((1)); } while (0);break; default: __bad_size_call_parameter();break; } } while (0);
}

static inline __attribute__((always_inline)) void count_vm_event(enum vm_event_item item)
{
 do { do { const void *__vpp_verify = (typeof(&(((vm_event_states.event[item])))))((void *)0); (void)__vpp_verify; } while (0); switch(sizeof(((vm_event_states.event[item])))) { case 1: do { do { } while (0); *({ do { const void *__vpp_verify = (typeof((&((((vm_event_states.event[item])))))))((void *)0); (void)__vpp_verify; } while (0); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"((typeof(*(&((((vm_event_states.event[item])))))) *)(&((((vm_event_states.event[item]))))))); (typeof((typeof(*(&((((vm_event_states.event[item])))))) *)(&((((vm_event_states.event[item]))))))) (__ptr + (((__per_cpu_offset[(__current_thread_info->cpu)])))); }); }) += ((1)); do { } while (0); } while (0);break; case 2: do { do { } while (0); *({ do { const void *__vpp_verify = (typeof((&((((vm_event_states.event[item])))))))((void *)0); (void)__vpp_verify; } while (0); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"((typeof(*(&((((vm_event_states.event[item])))))) *)(&((((vm_event_states.event[item]))))))); (typeof((typeof(*(&((((vm_event_states.event[item])))))) *)(&((((vm_event_states.event[item]))))))) (__ptr + (((__per_cpu_offset[(__current_thread_info->cpu)])))); }); }) += ((1)); do { } while (0); } while (0);break; case 4: do { do { } while (0); *({ do { const void *__vpp_verify = (typeof((&((((vm_event_states.event[item])))))))((void *)0); (void)__vpp_verify; } while (0); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"((typeof(*(&((((vm_event_states.event[item])))))) *)(&((((vm_event_states.event[item]))))))); (typeof((typeof(*(&((((vm_event_states.event[item])))))) *)(&((((vm_event_states.event[item]))))))) (__ptr + (((__per_cpu_offset[(__current_thread_info->cpu)])))); }); }) += ((1)); do { } while (0); } while (0);break; case 8: do { do { } while (0); *({ do { const void *__vpp_verify = (typeof((&((((vm_event_states.event[item])))))))((void *)0); (void)__vpp_verify; } while (0); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"((typeof(*(&((((vm_event_states.event[item])))))) *)(&((((vm_event_states.event[item]))))))); (typeof((typeof(*(&((((vm_event_states.event[item])))))) *)(&((((vm_event_states.event[item]))))))) (__ptr + (((__per_cpu_offset[(__current_thread_info->cpu)])))); }); }) += ((1)); do { } while (0); } while (0);break; default: __bad_size_call_parameter();break; } } while (0);
}

static inline __attribute__((always_inline)) void __count_vm_events(enum vm_event_item item, long delta)
{
 do { do { const void *__vpp_verify = (typeof(&((vm_event_states.event[item]))))((void *)0); (void)__vpp_verify; } while (0); switch(sizeof((vm_event_states.event[item]))) { case 1: do { *({ do { const void *__vpp_verify = (typeof((&(((vm_event_states.event[item]))))))((void *)0); (void)__vpp_verify; } while (0); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"((typeof(*(&(((vm_event_states.event[item]))))) *)(&(((vm_event_states.event[item])))))); (typeof((typeof(*(&(((vm_event_states.event[item]))))) *)(&(((vm_event_states.event[item])))))) (__ptr + (((__per_cpu_offset[(__current_thread_info->cpu)])))); }); }) += ((delta)); } while (0);break; case 2: do { *({ do { const void *__vpp_verify = (typeof((&(((vm_event_states.event[item]))))))((void *)0); (void)__vpp_verify; } while (0); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"((typeof(*(&(((vm_event_states.event[item]))))) *)(&(((vm_event_states.event[item])))))); (typeof((typeof(*(&(((vm_event_states.event[item]))))) *)(&(((vm_event_states.event[item])))))) (__ptr + (((__per_cpu_offset[(__current_thread_info->cpu)])))); }); }) += ((delta)); } while (0);break; case 4: do { *({ do { const void *__vpp_verify = (typeof((&(((vm_event_states.event[item]))))))((void *)0); (void)__vpp_verify; } while (0); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"((typeof(*(&(((vm_event_states.event[item]))))) *)(&(((vm_event_states.event[item])))))); (typeof((typeof(*(&(((vm_event_states.event[item]))))) *)(&(((vm_event_states.event[item])))))) (__ptr + (((__per_cpu_offset[(__current_thread_info->cpu)])))); }); }) += ((delta)); } while (0);break; case 8: do { *({ do { const void *__vpp_verify = (typeof((&(((vm_event_states.event[item]))))))((void *)0); (void)__vpp_verify; } while (0); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"((typeof(*(&(((vm_event_states.event[item]))))) *)(&(((vm_event_states.event[item])))))); (typeof((typeof(*(&(((vm_event_states.event[item]))))) *)(&(((vm_event_states.event[item])))))) (__ptr + (((__per_cpu_offset[(__current_thread_info->cpu)])))); }); }) += ((delta)); } while (0);break; default: __bad_size_call_parameter();break; } } while (0);
}

static inline __attribute__((always_inline)) void count_vm_events(enum vm_event_item item, long delta)
{
 do { do { const void *__vpp_verify = (typeof(&((vm_event_states.event[item]))))((void *)0); (void)__vpp_verify; } while (0); switch(sizeof((vm_event_states.event[item]))) { case 1: do { do { } while (0); *({ do { const void *__vpp_verify = (typeof((&(((vm_event_states.event[item]))))))((void *)0); (void)__vpp_verify; } while (0); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"((typeof(*(&(((vm_event_states.event[item]))))) *)(&(((vm_event_states.event[item])))))); (typeof((typeof(*(&(((vm_event_states.event[item]))))) *)(&(((vm_event_states.event[item])))))) (__ptr + (((__per_cpu_offset[(__current_thread_info->cpu)])))); }); }) += ((delta)); do { } while (0); } while (0);break; case 2: do { do { } while (0); *({ do { const void *__vpp_verify = (typeof((&(((vm_event_states.event[item]))))))((void *)0); (void)__vpp_verify; } while (0); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"((typeof(*(&(((vm_event_states.event[item]))))) *)(&(((vm_event_states.event[item])))))); (typeof((typeof(*(&(((vm_event_states.event[item]))))) *)(&(((vm_event_states.event[item])))))) (__ptr + (((__per_cpu_offset[(__current_thread_info->cpu)])))); }); }) += ((delta)); do { } while (0); } while (0);break; case 4: do { do { } while (0); *({ do { const void *__vpp_verify = (typeof((&(((vm_event_states.event[item]))))))((void *)0); (void)__vpp_verify; } while (0); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"((typeof(*(&(((vm_event_states.event[item]))))) *)(&(((vm_event_states.event[item])))))); (typeof((typeof(*(&(((vm_event_states.event[item]))))) *)(&(((vm_event_states.event[item])))))) (__ptr + (((__per_cpu_offset[(__current_thread_info->cpu)])))); }); }) += ((delta)); do { } while (0); } while (0);break; case 8: do { do { } while (0); *({ do { const void *__vpp_verify = (typeof((&(((vm_event_states.event[item]))))))((void *)0); (void)__vpp_verify; } while (0); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"((typeof(*(&(((vm_event_states.event[item]))))) *)(&(((vm_event_states.event[item])))))); (typeof((typeof(*(&(((vm_event_states.event[item]))))) *)(&(((vm_event_states.event[item])))))) (__ptr + (((__per_cpu_offset[(__current_thread_info->cpu)])))); }); }) += ((delta)); do { } while (0); } while (0);break; default: __bad_size_call_parameter();break; } } while (0);
}

extern void all_vm_events(unsigned long *);



static inline __attribute__((always_inline)) void vm_events_fold_cpu(int cpu)
{
}
# 143 "include/linux/vmstat.h"
extern atomic_long_t vm_stat[NR_VM_ZONE_STAT_ITEMS];

static inline __attribute__((always_inline)) void zone_page_state_add(long x, struct zone *zone,
     enum zone_stat_item item)
{
 atomic_long_add(x, &zone->vm_stat[item]);
 atomic_long_add(x, &vm_stat[item]);
}

static inline __attribute__((always_inline)) unsigned long global_page_state(enum zone_stat_item item)
{
 long x = atomic_long_read(&vm_stat[item]);

 if (x < 0)
  x = 0;

 return x;
}

static inline __attribute__((always_inline)) unsigned long zone_page_state(struct zone *zone,
     enum zone_stat_item item)
{
 long x = atomic_long_read(&zone->vm_stat[item]);

 if (x < 0)
  x = 0;

 return x;
}







static inline __attribute__((always_inline)) unsigned long zone_page_state_snapshot(struct zone *zone,
     enum zone_stat_item item)
{
 long x = atomic_long_read(&zone->vm_stat[item]);


 int cpu;
 for (((cpu)) = -1; ((cpu)) = cpumask_next(((cpu)), (cpu_online_mask)), ((cpu)) < nr_cpu_ids;)
  x += ({ do { const void *__vpp_verify = (typeof(((zone->pageset))))((void *)0); (void)__vpp_verify; } while (0); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"((typeof(*((zone->pageset))) *)((zone->pageset)))); (typeof((typeof(*((zone->pageset))) *)((zone->pageset)))) (__ptr + (((__per_cpu_offset[(cpu)])))); }); })->vm_stat_diff[item];

 if (x < 0)
  x = 0;

 return x;
}

extern unsigned long global_reclaimable_pages(void);
extern unsigned long zone_reclaimable_pages(struct zone *zone);
# 235 "include/linux/vmstat.h"
static inline __attribute__((always_inline)) void zap_zone_vm_stats(struct zone *zone)
{
 memset(zone->vm_stat, 0, sizeof(zone->vm_stat));
}

extern void inc_zone_state(struct zone *, enum zone_stat_item);


void __mod_zone_page_state(struct zone *, enum zone_stat_item item, int);
void __inc_zone_page_state(struct page *, enum zone_stat_item);
void __dec_zone_page_state(struct page *, enum zone_stat_item);

void mod_zone_page_state(struct zone *, enum zone_stat_item, int);
void inc_zone_page_state(struct page *, enum zone_stat_item);
void dec_zone_page_state(struct page *, enum zone_stat_item);

extern void inc_zone_state(struct zone *, enum zone_stat_item);
extern void __inc_zone_state(struct zone *, enum zone_stat_item);
extern void dec_zone_state(struct zone *, enum zone_stat_item);
extern void __dec_zone_state(struct zone *, enum zone_stat_item);

void refresh_cpu_vm_stats(int);
# 600 "include/linux/mm.h" 2

static inline __attribute__((always_inline)) __attribute__((always_inline)) void *lowmem_page_address(struct page *page)
{
 return ((void *)((unsigned long)(((phys_addr_t)(((unsigned long)((page) - mem_map) + ((((0UL)) + ((1UL) << 12)-1) >> 12))) << 12)) + ((0x80000000UL) + (0UL)) - (0UL)));
}
# 651 "include/linux/mm.h"
extern struct address_space swapper_space;
static inline __attribute__((always_inline)) struct address_space *page_mapping(struct page *page)
{
 struct address_space *mapping = page->mapping;

 do { (void)(PageSlab(page)); } while (0);
 if (__builtin_expect(!!(PageSwapCache(page)), 0))
  mapping = &swapper_space;
 else if (__builtin_expect(!!((unsigned long)mapping & 1), 0))
  mapping = ((void *)0);
 return mapping;
}


static inline __attribute__((always_inline)) void *page_rmapping(struct page *page)
{
 return (void *)((unsigned long)page->mapping & ~(1 | 2));
}

static inline __attribute__((always_inline)) int PageAnon(struct page *page)
{
 return ((unsigned long)page->mapping & 1) != 0;
}





static inline __attribute__((always_inline)) unsigned long page_index(struct page *page)
{
 if (__builtin_expect(!!(PageSwapCache(page)), 0))
  return ((page)->private);
 return page->index;
}






static inline __attribute__((always_inline)) void reset_page_mapcount(struct page *page)
{
 ((&(page)->_mapcount)->counter = (-1));
}

static inline __attribute__((always_inline)) int page_mapcount(struct page *page)
{
 return (*(volatile int *)&(&(page)->_mapcount)->counter) + 1;
}




static inline __attribute__((always_inline)) int page_mapped(struct page *page)
{
 return (*(volatile int *)&(&(page)->_mapcount)->counter) >= 0;
}
# 731 "include/linux/mm.h"
extern void pagefault_out_of_memory(void);



extern void show_free_areas(void);

int shmem_lock(struct file *file, int lock, struct user_struct *user);
struct file *shmem_file_setup(const char *name, loff_t size, unsigned long flags);
int shmem_zero_setup(struct vm_area_struct *);
# 749 "include/linux/mm.h"
extern int can_do_mlock(void);
extern int user_shm_lock(size_t, struct user_struct *);
extern void user_shm_unlock(size_t, struct user_struct *);




struct zap_details {
 struct vm_area_struct *nonlinear_vma;
 struct address_space *check_mapping;
 unsigned long first_index;
 unsigned long last_index;
 spinlock_t *i_mmap_lock;
 unsigned long truncate_count;
};

struct page *vm_normal_page(struct vm_area_struct *vma, unsigned long addr,
  pte_t pte);

int zap_vma_ptes(struct vm_area_struct *vma, unsigned long address,
  unsigned long size);
unsigned long zap_page_range(struct vm_area_struct *vma, unsigned long address,
  unsigned long size, struct zap_details *);
unsigned long unmap_vmas(struct mmu_gather **tlb,
  struct vm_area_struct *start_vma, unsigned long start_addr,
  unsigned long end_addr, unsigned long *nr_accounted,
  struct zap_details *);
# 788 "include/linux/mm.h"
struct mm_walk {
 int (*pgd_entry)(pgd_t *, unsigned long, unsigned long, struct mm_walk *);
 int (*pud_entry)(pud_t *, unsigned long, unsigned long, struct mm_walk *);
 int (*pmd_entry)(pmd_t *, unsigned long, unsigned long, struct mm_walk *);
 int (*pte_entry)(pte_t *, unsigned long, unsigned long, struct mm_walk *);
 int (*pte_hole)(unsigned long, unsigned long, struct mm_walk *);
 int (*hugetlb_entry)(pte_t *, unsigned long,
        unsigned long, unsigned long, struct mm_walk *);
 struct mm_struct *mm;
 void *private;
};

int walk_page_range(unsigned long addr, unsigned long end,
  struct mm_walk *walk);
void free_pgd_range(struct mmu_gather *tlb, unsigned long addr,
  unsigned long end, unsigned long floor, unsigned long ceiling);
int copy_page_range(struct mm_struct *dst, struct mm_struct *src,
   struct vm_area_struct *vma);
void unmap_mapping_range(struct address_space *mapping,
  loff_t const holebegin, loff_t const holelen, int even_cows);
int follow_pfn(struct vm_area_struct *vma, unsigned long address,
 unsigned long *pfn);
int follow_phys(struct vm_area_struct *vma, unsigned long address,
  unsigned int flags, unsigned long *prot, resource_size_t *phys);
int generic_access_phys(struct vm_area_struct *vma, unsigned long addr,
   void *buf, int len, int write);

static inline __attribute__((always_inline)) void unmap_shared_mapping_range(struct address_space *mapping,
  loff_t const holebegin, loff_t const holelen)
{
 unmap_mapping_range(mapping, holebegin, holelen, 0);
}

extern void truncate_pagecache(struct inode *inode, loff_t old, loff_t new);
extern void truncate_setsize(struct inode *inode, loff_t newsize);
extern int vmtruncate(struct inode *inode, loff_t offset);
extern int vmtruncate_range(struct inode *inode, loff_t offset, loff_t end);

int truncate_inode_page(struct address_space *mapping, struct page *page);
int generic_error_remove_page(struct address_space *mapping, struct page *page);

int invalidate_inode_page(struct page *page);


extern int handle_mm_fault(struct mm_struct *mm, struct vm_area_struct *vma,
   unsigned long address, unsigned int flags);
# 845 "include/linux/mm.h"
extern int make_pages_present(unsigned long addr, unsigned long end);
extern int access_process_vm(struct task_struct *tsk, unsigned long addr, void *buf, int len, int write);

int get_user_pages(struct task_struct *tsk, struct mm_struct *mm,
   unsigned long start, int nr_pages, int write, int force,
   struct page **pages, struct vm_area_struct **vmas);
int get_user_pages_fast(unsigned long start, int nr_pages, int write,
   struct page **pages);
struct page *get_dump_page(unsigned long addr);

extern int try_to_release_page(struct page * page, gfp_t gfp_mask);
extern void do_invalidatepage(struct page *page, unsigned long offset);

int __set_page_dirty_nobuffers(struct page *page);
int __set_page_dirty_no_writeback(struct page *page);
int redirty_page_for_writepage(struct writeback_control *wbc,
    struct page *page);
void account_page_dirtied(struct page *page, struct address_space *mapping);
int set_page_dirty(struct page *page);
int set_page_dirty_lock(struct page *page);
int clear_page_dirty_for_io(struct page *page);


static inline __attribute__((always_inline)) int vma_stack_continue(struct vm_area_struct *vma, unsigned long addr)
{
 return vma && (vma->vm_end == addr) && (vma->vm_flags & 0x00000100);
}

extern unsigned long move_page_tables(struct vm_area_struct *vma,
  unsigned long old_addr, struct vm_area_struct *new_vma,
  unsigned long new_addr, unsigned long len);
extern unsigned long do_mremap(unsigned long addr,
          unsigned long old_len, unsigned long new_len,
          unsigned long flags, unsigned long new_addr);
extern int mprotect_fixup(struct vm_area_struct *vma,
     struct vm_area_struct **pprev, unsigned long start,
     unsigned long end, unsigned long newflags);




int __get_user_pages_fast(unsigned long start, int nr_pages, int write,
     struct page **pages);
# 896 "include/linux/mm.h"
static inline __attribute__((always_inline)) void set_mm_counter(struct mm_struct *mm, int member, long value)
{
 atomic_long_set(&mm->rss_stat.count[member], value);
}

unsigned long get_mm_counter(struct mm_struct *mm, int member);

static inline __attribute__((always_inline)) void add_mm_counter(struct mm_struct *mm, int member, long value)
{
 atomic_long_add(value, &mm->rss_stat.count[member]);
}

static inline __attribute__((always_inline)) void inc_mm_counter(struct mm_struct *mm, int member)
{
 atomic_long_inc(&mm->rss_stat.count[member]);
}

static inline __attribute__((always_inline)) void dec_mm_counter(struct mm_struct *mm, int member)
{
 atomic_long_dec(&mm->rss_stat.count[member]);
}
# 950 "include/linux/mm.h"
static inline __attribute__((always_inline)) unsigned long get_mm_rss(struct mm_struct *mm)
{
 return get_mm_counter(mm, MM_FILEPAGES) +
  get_mm_counter(mm, MM_ANONPAGES);
}

static inline __attribute__((always_inline)) unsigned long get_mm_hiwater_rss(struct mm_struct *mm)
{
 return ({ typeof(mm->hiwater_rss) _max1 = (mm->hiwater_rss); typeof(get_mm_rss(mm)) _max2 = (get_mm_rss(mm)); (void) (&_max1 == &_max2); _max1 > _max2 ? _max1 : _max2; });
}

static inline __attribute__((always_inline)) unsigned long get_mm_hiwater_vm(struct mm_struct *mm)
{
 return ({ typeof(mm->hiwater_vm) _max1 = (mm->hiwater_vm); typeof(mm->total_vm) _max2 = (mm->total_vm); (void) (&_max1 == &_max2); _max1 > _max2 ? _max1 : _max2; });
}

static inline __attribute__((always_inline)) void update_hiwater_rss(struct mm_struct *mm)
{
 unsigned long _rss = get_mm_rss(mm);

 if ((mm)->hiwater_rss < _rss)
  (mm)->hiwater_rss = _rss;
}

static inline __attribute__((always_inline)) void update_hiwater_vm(struct mm_struct *mm)
{
 if (mm->hiwater_vm < mm->total_vm)
  mm->hiwater_vm = mm->total_vm;
}

static inline __attribute__((always_inline)) void setmax_mm_hiwater_rss(unsigned long *maxrss,
      struct mm_struct *mm)
{
 unsigned long hiwater_rss = get_mm_hiwater_rss(mm);

 if (*maxrss < hiwater_rss)
  *maxrss = hiwater_rss;
}


void sync_mm_rss(struct task_struct *task, struct mm_struct *mm);
# 1012 "include/linux/mm.h"
struct shrinker {
 int (*shrink)(struct shrinker *, int nr_to_scan, gfp_t gfp_mask);
 int seeks;


 struct list_head list;
 long nr;
};

extern void register_shrinker(struct shrinker *);
extern void unregister_shrinker(struct shrinker *);

int vma_wants_writenotify(struct vm_area_struct *vma);

extern pte_t *get_locked_pte(struct mm_struct *mm, unsigned long addr, spinlock_t **ptl);


static inline __attribute__((always_inline)) int __pud_alloc(struct mm_struct *mm, pgd_t *pgd,
      unsigned long address)
{
 return 0;
}





static inline __attribute__((always_inline)) int __pmd_alloc(struct mm_struct *mm, pud_t *pud,
      unsigned long address)
{
 return 0;
}




int __pte_alloc(struct mm_struct *mm, pmd_t *pmd, unsigned long address);
int __pte_alloc_kernel(pmd_t *pmd, unsigned long address);






static inline __attribute__((always_inline)) pud_t *pud_alloc(struct mm_struct *mm, pgd_t *pgd, unsigned long address)
{
 return (__builtin_expect(!!(pgd_none(*pgd)), 0) && __pud_alloc(mm, pgd, address))?
  ((void *)0): pud_offset(pgd, address);
}

static inline __attribute__((always_inline)) pmd_t *pmd_alloc(struct mm_struct *mm, pud_t *pud, unsigned long address)
{
 return (__builtin_expect(!!(pud_none(*pud)), 0) && __pmd_alloc(mm, pud, address))?
  ((void *)0): pmd_offset(pud, address);
}
# 1091 "include/linux/mm.h"
static inline __attribute__((always_inline)) void pgtable_page_ctor(struct page *page)
{
 do { do { spinlock_check(&((page)->ptl)); do { *(&(&((page)->ptl))->rlock) = (raw_spinlock_t) { .raw_lock = { .lock = 0 }, }; } while (0); } while (0); } while (0);
 inc_zone_page_state(page, NR_PAGETABLE);
}

static inline __attribute__((always_inline)) void pgtable_page_dtor(struct page *page)
{
 ((page)->mapping = ((void *)0));
 dec_zone_page_state(page, NR_PAGETABLE);
}
# 1129 "include/linux/mm.h"
extern void free_area_init(unsigned long * zones_size);
extern void free_area_init_node(int nid, unsigned long * zones_size,
  unsigned long zone_start_pfn, unsigned long *zholes_size);
# 1160 "include/linux/mm.h"
extern void free_area_init_nodes(unsigned long *max_zone_pfn);
extern void add_active_range(unsigned int nid, unsigned long start_pfn,
     unsigned long end_pfn);
extern void remove_active_range(unsigned int nid, unsigned long start_pfn,
     unsigned long end_pfn);
extern void remove_all_active_ranges(void);
void sort_node_map(void);
unsigned long __absent_pages_in_range(int nid, unsigned long start_pfn,
      unsigned long end_pfn);
extern unsigned long absent_pages_in_range(unsigned long start_pfn,
      unsigned long end_pfn);
extern void get_pfn_range_for_nid(unsigned int nid,
   unsigned long *start_pfn, unsigned long *end_pfn);
extern unsigned long find_min_pfn_with_active_regions(void);
extern void free_bootmem_with_active_regions(int nid,
      unsigned long max_low_pfn);
int add_from_early_node_map(struct range *range, int az,
       int nr_range, int nid);
void *__alloc_memory_core_early(int nodeid, u64 size, u64 align,
     u64 goal, u64 limit);
typedef int (*work_fn_t)(unsigned long, unsigned long, void *);
extern void work_with_active_regions(int nid, work_fn_t work_fn, void *data);
extern void sparse_memory_present_with_active_regions(int nid);
# 1193 "include/linux/mm.h"
extern int __attribute__ ((__section__(".meminit.text"))) __attribute__((__cold__)) early_pfn_to_nid(unsigned long pfn);






extern void set_dma_reserve(unsigned long new_dma_reserve);
extern void memmap_init_zone(unsigned long, int, unsigned long,
    unsigned long, enum memmap_context);
extern void setup_per_zone_wmarks(void);
extern void calculate_zone_inactive_ratio(struct zone *zone);
extern void mem_init(void);
extern void __attribute__ ((__section__(".init.text"))) __attribute__((__cold__)) __attribute__((no_instrument_function)) mmap_init(void);
extern void show_mem(void);
extern void si_meminfo(struct sysinfo * val);
extern void si_meminfo_node(struct sysinfo *val, int nid);
extern int after_bootmem;

extern void setup_per_cpu_pageset(void);

extern void zone_pcp_update(struct zone *zone);


extern atomic_long_t mmap_pages_allocated;
extern int nommu_shrink_inode_mappings(struct inode *, size_t, size_t);


void vma_prio_tree_add(struct vm_area_struct *, struct vm_area_struct *old);
void vma_prio_tree_insert(struct vm_area_struct *, struct prio_tree_root *);
void vma_prio_tree_remove(struct vm_area_struct *, struct prio_tree_root *);
struct vm_area_struct *vma_prio_tree_next(struct vm_area_struct *vma,
 struct prio_tree_iter *iter);





static inline __attribute__((always_inline)) void vma_nonlinear_insert(struct vm_area_struct *vma,
     struct list_head *list)
{
 vma->shared.vm_set.parent = ((void *)0);
 list_add_tail(&vma->shared.vm_set.list, list);
}


extern int __vm_enough_memory(struct mm_struct *mm, long pages, int cap_sys_admin);
extern int vma_adjust(struct vm_area_struct *vma, unsigned long start,
 unsigned long end, unsigned long pgoff, struct vm_area_struct *insert);
extern struct vm_area_struct *vma_merge(struct mm_struct *,
 struct vm_area_struct *prev, unsigned long addr, unsigned long end,
 unsigned long vm_flags, struct anon_vma *, struct file *, unsigned long,
 struct mempolicy *);
extern struct anon_vma *find_mergeable_anon_vma(struct vm_area_struct *);
extern int split_vma(struct mm_struct *,
 struct vm_area_struct *, unsigned long addr, int new_below);
extern int insert_vm_struct(struct mm_struct *, struct vm_area_struct *);
extern void __vma_link_rb(struct mm_struct *, struct vm_area_struct *,
 struct rb_node **, struct rb_node *);
extern void unlink_file_vma(struct vm_area_struct *);
extern struct vm_area_struct *copy_vma(struct vm_area_struct **,
 unsigned long addr, unsigned long len, unsigned long pgoff);
extern void exit_mmap(struct mm_struct *);

extern int mm_take_all_locks(struct mm_struct *mm);
extern void mm_drop_all_locks(struct mm_struct *mm);



extern void added_exe_file_vma(struct mm_struct *mm);
extern void removed_exe_file_vma(struct mm_struct *mm);
# 1272 "include/linux/mm.h"
extern int may_expand_vm(struct mm_struct *mm, unsigned long npages);
extern int install_special_mapping(struct mm_struct *mm,
       unsigned long addr, unsigned long len,
       unsigned long flags, struct page **pages);

extern unsigned long get_unmapped_area(struct file *, unsigned long, unsigned long, unsigned long, unsigned long);

extern unsigned long do_mmap_pgoff(struct file *file, unsigned long addr,
 unsigned long len, unsigned long prot,
 unsigned long flag, unsigned long pgoff);
extern unsigned long mmap_region(struct file *file, unsigned long addr,
 unsigned long len, unsigned long flags,
 unsigned int vm_flags, unsigned long pgoff);

static inline __attribute__((always_inline)) unsigned long do_mmap(struct file *file, unsigned long addr,
 unsigned long len, unsigned long prot,
 unsigned long flag, unsigned long offset)
{
 unsigned long ret = -22;
 if ((offset + ((((len)) + ((typeof((len)))((((1UL) << 12))) - 1)) & ~((typeof((len)))((((1UL) << 12))) - 1))) < offset)
  goto out;
 if (!(offset & ~(~((1 << 12) - 1))))
  ret = do_mmap_pgoff(file, addr, len, prot, flag, offset >> 12);
out:
 return ret;
}

extern int do_munmap(struct mm_struct *, unsigned long, size_t);

extern unsigned long do_brk(unsigned long, unsigned long);


extern unsigned long page_unuse(struct page *);
extern void truncate_inode_pages(struct address_space *, loff_t);
extern void truncate_inode_pages_range(struct address_space *,
           loff_t lstart, loff_t lend);


extern int filemap_fault(struct vm_area_struct *, struct vm_fault *);


int write_one_page(struct page *page, int wait);
void task_dirty_inc(struct task_struct *tsk);





int force_page_cache_readahead(struct address_space *mapping, struct file *filp,
   unsigned long offset, unsigned long nr_to_read);

void page_cache_sync_readahead(struct address_space *mapping,
          struct file_ra_state *ra,
          struct file *filp,
          unsigned long offset,
          unsigned long size);

void page_cache_async_readahead(struct address_space *mapping,
    struct file_ra_state *ra,
    struct file *filp,
    struct page *pg,
    unsigned long offset,
    unsigned long size);

unsigned long max_sane_readahead(unsigned long nr);
unsigned long ra_submit(struct file_ra_state *ra,
   struct address_space *mapping,
   struct file *filp);


extern int expand_stack(struct vm_area_struct *vma, unsigned long address);





extern int expand_stack_downwards(struct vm_area_struct *vma,
      unsigned long address);


extern struct vm_area_struct * find_vma(struct mm_struct * mm, unsigned long addr);
extern struct vm_area_struct * find_vma_prev(struct mm_struct * mm, unsigned long addr,
          struct vm_area_struct **pprev);



static inline __attribute__((always_inline)) struct vm_area_struct * find_vma_intersection(struct mm_struct * mm, unsigned long start_addr, unsigned long end_addr)
{
 struct vm_area_struct * vma = find_vma(mm,start_addr);

 if (vma && end_addr <= vma->vm_start)
  vma = ((void *)0);
 return vma;
}

static inline __attribute__((always_inline)) unsigned long vma_pages(struct vm_area_struct *vma)
{
 return (vma->vm_end - vma->vm_start) >> 12;
}


pgprot_t vm_get_page_prot(unsigned long vm_flags);







struct vm_area_struct *find_extend_vma(struct mm_struct *, unsigned long addr);
int remap_pfn_range(struct vm_area_struct *, unsigned long addr,
   unsigned long pfn, unsigned long size, pgprot_t);
int vm_insert_page(struct vm_area_struct *, unsigned long addr, struct page *);
int vm_insert_pfn(struct vm_area_struct *vma, unsigned long addr,
   unsigned long pfn);
int vm_insert_mixed(struct vm_area_struct *vma, unsigned long addr,
   unsigned long pfn);

struct page *follow_page(struct vm_area_struct *, unsigned long address,
   unsigned int foll_flags);






typedef int (*pte_fn_t)(pte_t *pte, pgtable_t token, unsigned long addr,
   void *data);
extern int apply_to_page_range(struct mm_struct *mm, unsigned long address,
          unsigned long size, pte_fn_t fn, void *data);


void vm_stat_account(struct mm_struct *, unsigned long, struct file *, long);
# 1425 "include/linux/mm.h"
static inline __attribute__((always_inline)) void
kernel_map_pages(struct page *page, int numpages, int enable) {}
static inline __attribute__((always_inline)) void enable_debug_pagealloc(void)
{
}





extern struct vm_area_struct *get_gate_vma(struct task_struct *tsk);




int in_gate_area_no_task(unsigned long addr);



int drop_caches_sysctl_handler(struct ctl_table *, int,
     void *, size_t *, loff_t *);
unsigned long shrink_slab(unsigned long scanned, gfp_t gfp_mask,
   unsigned long lru_pages);




extern int randomize_va_space;


const char * arch_vma_name(struct vm_area_struct *vma);
void print_vma_addr(char *prefix, unsigned long rip);

void sparse_mem_maps_populate_node(struct page **map_map,
       unsigned long pnum_begin,
       unsigned long pnum_end,
       unsigned long map_count,
       int nodeid);

struct page *sparse_mem_map_populate(unsigned long pnum, int nid);
pgd_t *vmemmap_pgd_populate(unsigned long addr, int node);
pud_t *vmemmap_pud_populate(pgd_t *pgd, unsigned long addr, int node);
pmd_t *vmemmap_pmd_populate(pud_t *pud, unsigned long addr, int node);
pte_t *vmemmap_pte_populate(pmd_t *pmd, unsigned long addr, int node);
void *vmemmap_alloc_block(unsigned long size, int node);
void *vmemmap_alloc_block_buf(unsigned long size, int node);
void vmemmap_verify(pte_t *, int, unsigned long, unsigned long);
int vmemmap_populate_basepages(struct page *start_page,
      unsigned long pages, int node);
int vmemmap_populate(struct page *start_page, unsigned long pages, int node);
void vmemmap_populate_print_last(void);


enum mf_flags {
 MF_COUNT_INCREASED = 1 << 0,
};
extern void memory_failure(unsigned long pfn, int trapno);
extern int __memory_failure(unsigned long pfn, int trapno, int flags);
extern int unpoison_memory(unsigned long pfn);
extern int sysctl_memory_failure_early_kill;
extern int sysctl_memory_failure_recovery;
extern void shake_page(struct page *p, int access);
extern atomic_long_t mce_bad_pages;
extern int soft_offline_page(struct page *page, int flags);



static inline __attribute__((always_inline)) int is_hwpoison_address(unsigned long addr)
{
 return 0;
}


extern void dump_page(struct page *page);
# 7 "include/linux/scatterlist.h" 2



struct sg_table {
 struct scatterlist *sgl;
 unsigned int nents;
 unsigned int orig_nents;
};
# 55 "include/linux/scatterlist.h"
static inline __attribute__((always_inline)) void sg_assign_page(struct scatterlist *sg, struct page *page)
{
 unsigned long page_link = sg->page_link & 0x3;





 __BUG_ON((unsigned long)((unsigned long) page & 0x03));




 sg->page_link = page_link | (unsigned long) page;
}
# 85 "include/linux/scatterlist.h"
static inline __attribute__((always_inline)) void sg_set_page(struct scatterlist *sg, struct page *page,
          unsigned int len, unsigned int offset)
{
 sg_assign_page(sg, page);
 sg->offset = offset;
 sg->length = len;
}

static inline __attribute__((always_inline)) struct page *sg_page(struct scatterlist *sg)
{




 return (struct page *)((sg)->page_link & ~0x3);
}
# 109 "include/linux/scatterlist.h"
static inline __attribute__((always_inline)) void sg_set_buf(struct scatterlist *sg, const void *buf,
         unsigned int buflen)
{
 sg_set_page(sg, (mem_map + ((((virt_to_phys(buf)) >> 12)) - ((((0UL)) + ((1UL) << 12)-1) >> 12))), buflen, ((unsigned long)(buf) & ~(~((1 << 12) - 1))));
}
# 131 "include/linux/scatterlist.h"
static inline __attribute__((always_inline)) void sg_chain(struct scatterlist *prv, unsigned int prv_nents,
       struct scatterlist *sgl)
{

 BUG();





 prv[prv_nents - 1].offset = 0;
 prv[prv_nents - 1].length = 0;





 prv[prv_nents - 1].page_link = ((unsigned long) sgl | 0x01) & ~0x02;
}
# 160 "include/linux/scatterlist.h"
static inline __attribute__((always_inline)) void sg_mark_end(struct scatterlist *sg)
{






 sg->page_link |= 0x02;
 sg->page_link &= ~0x01;
}
# 182 "include/linux/scatterlist.h"
static inline __attribute__((always_inline)) dma_addr_t sg_phys(struct scatterlist *sg)
{
 return ((dma_addr_t)((unsigned long)((sg_page(sg)) - mem_map) + ((((0UL)) + ((1UL) << 12)-1) >> 12)) << 12) + sg->offset;
}
# 197 "include/linux/scatterlist.h"
static inline __attribute__((always_inline)) void *sg_virt(struct scatterlist *sg)
{
 return lowmem_page_address(sg_page(sg)) + sg->offset;
}

struct scatterlist *sg_next(struct scatterlist *);
struct scatterlist *sg_last(struct scatterlist *s, unsigned int);
void sg_init_table(struct scatterlist *, unsigned int);
void sg_init_one(struct scatterlist *, const void *, unsigned int);

typedef struct scatterlist *(sg_alloc_fn)(unsigned int, gfp_t);
typedef void (sg_free_fn)(struct scatterlist *, unsigned int);

void __sg_free_table(struct sg_table *, unsigned int, sg_free_fn *);
void sg_free_table(struct sg_table *);
int __sg_alloc_table(struct sg_table *, unsigned int, unsigned int, gfp_t,
       sg_alloc_fn *);
int sg_alloc_table(struct sg_table *, unsigned int, gfp_t);

size_t sg_copy_from_buffer(struct scatterlist *sgl, unsigned int nents,
      void *buf, size_t buflen);
size_t sg_copy_to_buffer(struct scatterlist *sgl, unsigned int nents,
    void *buf, size_t buflen);
# 248 "include/linux/scatterlist.h"
struct sg_mapping_iter {

 struct page *page;
 void *addr;
 size_t length;
 size_t consumed;


 struct scatterlist *__sg;
 unsigned int __nents;
 unsigned int __offset;
 unsigned int __flags;
};

void sg_miter_start(struct sg_mapping_iter *miter, struct scatterlist *sgl,
      unsigned int nents, unsigned int flags);
int sg_miter_next(struct sg_mapping_iter *miter);
void sg_miter_stop(struct sg_mapping_iter *miter);
# 8 "include/linux/dma-mapping.h" 2



enum dma_data_direction {
 DMA_BIDIRECTIONAL = 0,
 DMA_TO_DEVICE = 1,
 DMA_FROM_DEVICE = 2,
 DMA_NONE = 3,
};

struct dma_map_ops {
 void* (*alloc_coherent)(struct device *dev, size_t size,
    dma_addr_t *dma_handle, gfp_t gfp);
 void (*free_coherent)(struct device *dev, size_t size,
         void *vaddr, dma_addr_t dma_handle);
 dma_addr_t (*map_page)(struct device *dev, struct page *page,
          unsigned long offset, size_t size,
          enum dma_data_direction dir,
          struct dma_attrs *attrs);
 void (*unmap_page)(struct device *dev, dma_addr_t dma_handle,
      size_t size, enum dma_data_direction dir,
      struct dma_attrs *attrs);
 int (*map_sg)(struct device *dev, struct scatterlist *sg,
        int nents, enum dma_data_direction dir,
        struct dma_attrs *attrs);
 void (*unmap_sg)(struct device *dev,
    struct scatterlist *sg, int nents,
    enum dma_data_direction dir,
    struct dma_attrs *attrs);
 void (*sync_single_for_cpu)(struct device *dev,
        dma_addr_t dma_handle, size_t size,
        enum dma_data_direction dir);
 void (*sync_single_for_device)(struct device *dev,
           dma_addr_t dma_handle, size_t size,
           enum dma_data_direction dir);
 void (*sync_sg_for_cpu)(struct device *dev,
    struct scatterlist *sg, int nents,
    enum dma_data_direction dir);
 void (*sync_sg_for_device)(struct device *dev,
       struct scatterlist *sg, int nents,
       enum dma_data_direction dir);
 int (*mapping_error)(struct device *dev, dma_addr_t dma_addr);
 int (*dma_supported)(struct device *dev, u64 mask);
 int (*set_dma_mask)(struct device *dev, u64 mask);
 int is_phys;
};



typedef u64 DMA_nnBIT_MASK __attribute__((deprecated));
# 80 "include/linux/dma-mapping.h"
static inline __attribute__((always_inline)) int valid_dma_direction(int dma_direction)
{
 return ((dma_direction == DMA_BIDIRECTIONAL) ||
  (dma_direction == DMA_TO_DEVICE) ||
  (dma_direction == DMA_FROM_DEVICE));
}

static inline __attribute__((always_inline)) int is_device_dma_capable(struct device *dev)
{
 return dev->dma_mask != ((void *)0) && *dev->dma_mask != 0x0ULL;
}


# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/dma-mapping.h" 1





# 1 "include/asm-generic/dma-coherent.h" 1
# 9 "include/asm-generic/dma-coherent.h"
int dma_alloc_from_coherent(struct device *dev, ssize_t size,
           dma_addr_t *dma_handle, void **ret);
int dma_release_from_coherent(struct device *dev, int order, void *vaddr);





extern int
dma_declare_coherent_memory(struct device *dev, dma_addr_t bus_addr,
       dma_addr_t device_addr, size_t size, int flags);

extern void
dma_release_declared_memory(struct device *dev);

extern void *
dma_mark_declared_memory_occupied(struct device *dev,
      dma_addr_t device_addr, size_t size);
# 7 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/dma-mapping.h" 2

void *dma_alloc_noncoherent(struct device *dev, size_t size,
      dma_addr_t *dma_handle, gfp_t flag);

void dma_free_noncoherent(struct device *dev, size_t size,
    void *vaddr, dma_addr_t dma_handle);

void *dma_alloc_coherent(struct device *dev, size_t size,
      dma_addr_t *dma_handle, gfp_t flag);

void dma_free_coherent(struct device *dev, size_t size,
    void *vaddr, dma_addr_t dma_handle);

extern dma_addr_t dma_map_single(struct device *dev, void *ptr, size_t size,
 enum dma_data_direction direction);
extern void dma_unmap_single(struct device *dev, dma_addr_t dma_addr,
 size_t size, enum dma_data_direction direction);
extern int dma_map_sg(struct device *dev, struct scatterlist *sg, int nents,
 enum dma_data_direction direction);
extern dma_addr_t dma_map_page(struct device *dev, struct page *page,
 unsigned long offset, size_t size, enum dma_data_direction direction);

static inline __attribute__((always_inline)) void dma_unmap_page(struct device *dev, dma_addr_t dma_address,
 size_t size, enum dma_data_direction direction)
{
 dma_unmap_single(dev, dma_address, size, direction);
}

extern void dma_unmap_sg(struct device *dev, struct scatterlist *sg,
 int nhwentries, enum dma_data_direction direction);
extern void dma_sync_single_for_cpu(struct device *dev, dma_addr_t dma_handle,
 size_t size, enum dma_data_direction direction);
extern void dma_sync_single_for_device(struct device *dev,
 dma_addr_t dma_handle, size_t size, enum dma_data_direction direction);
extern void dma_sync_single_range_for_cpu(struct device *dev,
 dma_addr_t dma_handle, unsigned long offset, size_t size,
 enum dma_data_direction direction);
extern void dma_sync_single_range_for_device(struct device *dev,
 dma_addr_t dma_handle, unsigned long offset, size_t size,
 enum dma_data_direction direction);
extern void dma_sync_sg_for_cpu(struct device *dev, struct scatterlist *sg,
 int nelems, enum dma_data_direction direction);
extern void dma_sync_sg_for_device(struct device *dev, struct scatterlist *sg,
 int nelems, enum dma_data_direction direction);
extern int dma_mapping_error(struct device *dev, dma_addr_t dma_addr);
extern int dma_supported(struct device *dev, u64 mask);

static inline __attribute__((always_inline)) int
dma_set_mask(struct device *dev, u64 mask)
{
 if(!dev->dma_mask || !dma_supported(dev, mask))
  return -5;

 *dev->dma_mask = mask;

 return 0;
}

extern void dma_cache_sync(struct device *dev, void *vaddr, size_t size,
        enum dma_data_direction direction);
# 94 "include/linux/dma-mapping.h" 2




static inline __attribute__((always_inline)) u64 dma_get_mask(struct device *dev)
{
 if (dev && dev->dma_mask && *dev->dma_mask)
  return *dev->dma_mask;
 return (((32) == 64) ? ~0ULL : ((1ULL<<(32))-1));
}




static inline __attribute__((always_inline)) int dma_set_coherent_mask(struct device *dev, u64 mask)
{
 if (!dma_supported(dev, mask))
  return -5;
 dev->coherent_dma_mask = mask;
 return 0;
}


extern u64 dma_get_required_mask(struct device *dev);

static inline __attribute__((always_inline)) unsigned int dma_get_max_seg_size(struct device *dev)
{
 return dev->dma_parms ? dev->dma_parms->max_segment_size : 65536;
}

static inline __attribute__((always_inline)) unsigned int dma_set_max_seg_size(struct device *dev,
      unsigned int size)
{
 if (dev->dma_parms) {
  dev->dma_parms->max_segment_size = size;
  return 0;
 } else
  return -5;
}

static inline __attribute__((always_inline)) unsigned long dma_get_seg_boundary(struct device *dev)
{
 return dev->dma_parms ?
  dev->dma_parms->segment_boundary_mask : 0xffffffff;
}

static inline __attribute__((always_inline)) int dma_set_seg_boundary(struct device *dev, unsigned long mask)
{
 if (dev->dma_parms) {
  dev->dma_parms->segment_boundary_mask = mask;
  return 0;
 } else
  return -5;
}


static inline __attribute__((always_inline)) int dma_get_cache_alignment(void)
{

 return 128;

 return 1;
}
# 189 "include/linux/dma-mapping.h"
extern void *dmam_alloc_coherent(struct device *dev, size_t size,
     dma_addr_t *dma_handle, gfp_t gfp);
extern void dmam_free_coherent(struct device *dev, size_t size, void *vaddr,
          dma_addr_t dma_handle);
extern void *dmam_alloc_noncoherent(struct device *dev, size_t size,
        dma_addr_t *dma_handle, gfp_t gfp);
extern void dmam_free_noncoherent(struct device *dev, size_t size, void *vaddr,
      dma_addr_t dma_handle);

extern int dmam_declare_coherent_memory(struct device *dev, dma_addr_t bus_addr,
     dma_addr_t device_addr, size_t size,
     int flags);
extern void dmam_release_declared_memory(struct device *dev);
# 216 "include/linux/dma-mapping.h"
struct dma_attrs;
# 5 "/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_bmgr.c" 2
# 1 "include/linux/proc_fs.h" 1



# 1 "include/linux/slab.h" 1
# 98 "include/linux/slab.h"
void __attribute__ ((__section__(".init.text"))) __attribute__((__cold__)) __attribute__((no_instrument_function)) kmem_cache_init(void);
int slab_is_available(void);

struct kmem_cache *kmem_cache_create(const char *, size_t, size_t,
   unsigned long,
   void (*)(void *));
void kmem_cache_destroy(struct kmem_cache *);
int kmem_cache_shrink(struct kmem_cache *);
void kmem_cache_free(struct kmem_cache *, void *);
unsigned int kmem_cache_size(struct kmem_cache *);
const char *kmem_cache_name(struct kmem_cache *);
int kern_ptr_validate(const void *ptr, unsigned long size);
int kmem_ptr_validate(struct kmem_cache *cachep, const void *ptr);
# 142 "include/linux/slab.h"
void * __krealloc(const void *, size_t, gfp_t);
void * krealloc(const void *, size_t, gfp_t);
void kfree(const void *);
void kzfree(const void *);
size_t ksize(const void *);
# 168 "include/linux/slab.h"
# 1 "include/linux/slub_def.h" 1
# 13 "include/linux/slub_def.h"
# 1 "include/linux/kmemleak.h" 1
# 59 "include/linux/kmemleak.h"
static inline __attribute__((always_inline)) void kmemleak_init(void)
{
}
static inline __attribute__((always_inline)) void kmemleak_alloc(const void *ptr, size_t size, int min_count,
      gfp_t gfp)
{
}
static inline __attribute__((always_inline)) void kmemleak_alloc_recursive(const void *ptr, size_t size,
         int min_count, unsigned long flags,
         gfp_t gfp)
{
}
static inline __attribute__((always_inline)) void kmemleak_free(const void *ptr)
{
}
static inline __attribute__((always_inline)) void kmemleak_free_part(const void *ptr, size_t size)
{
}
static inline __attribute__((always_inline)) void kmemleak_free_recursive(const void *ptr, unsigned long flags)
{
}
static inline __attribute__((always_inline)) void kmemleak_not_leak(const void *ptr)
{
}
static inline __attribute__((always_inline)) void kmemleak_ignore(const void *ptr)
{
}
static inline __attribute__((always_inline)) void kmemleak_scan_area(const void *ptr, size_t size, gfp_t gfp)
{
}
static inline __attribute__((always_inline)) void kmemleak_erase(void **ptr)
{
}
static inline __attribute__((always_inline)) void kmemleak_no_scan(const void *ptr)
{
}
# 14 "include/linux/slub_def.h" 2

# 1 "include/trace/events/kmem.h" 1







# 1 "include/linux/tracepoint.h" 1
# 9 "include/trace/events/kmem.h" 2
# 1 "include/trace/events/gfpflags.h" 1
# 10 "include/trace/events/kmem.h" 2

;
# 45 "include/trace/events/kmem.h"
static inline __attribute__((always_inline)) void trace_kmalloc(unsigned long call_site, const void *ptr, size_t bytes_req, size_t bytes_alloc, gfp_t gfp_flags) { } static inline __attribute__((always_inline)) int register_trace_kmalloc(void (*probe)(void *__data, unsigned long call_site, const void *ptr, size_t bytes_req, size_t bytes_alloc, gfp_t gfp_flags), void *data) { return -89; } static inline __attribute__((always_inline)) int unregister_trace_kmalloc(void (*probe)(void *__data, unsigned long call_site, const void *ptr, size_t bytes_req, size_t bytes_alloc, gfp_t gfp_flags), void *data) { return -89; } static inline __attribute__((always_inline)) void check_trace_callback_type_kmalloc(void (*cb)(void *__data, unsigned long call_site, const void *ptr, size_t bytes_req, size_t bytes_alloc, gfp_t gfp_flags)) { };







static inline __attribute__((always_inline)) void trace_kmem_cache_alloc(unsigned long call_site, const void *ptr, size_t bytes_req, size_t bytes_alloc, gfp_t gfp_flags) { } static inline __attribute__((always_inline)) int register_trace_kmem_cache_alloc(void (*probe)(void *__data, unsigned long call_site, const void *ptr, size_t bytes_req, size_t bytes_alloc, gfp_t gfp_flags), void *data) { return -89; } static inline __attribute__((always_inline)) int unregister_trace_kmem_cache_alloc(void (*probe)(void *__data, unsigned long call_site, const void *ptr, size_t bytes_req, size_t bytes_alloc, gfp_t gfp_flags), void *data) { return -89; } static inline __attribute__((always_inline)) void check_trace_callback_type_kmem_cache_alloc(void (*cb)(void *__data, unsigned long call_site, const void *ptr, size_t bytes_req, size_t bytes_alloc, gfp_t gfp_flags)) { };







;
# 99 "include/trace/events/kmem.h"
static inline __attribute__((always_inline)) void trace_kmalloc_node(unsigned long call_site, const void *ptr, size_t bytes_req, size_t bytes_alloc, gfp_t gfp_flags, int node) { } static inline __attribute__((always_inline)) int register_trace_kmalloc_node(void (*probe)(void *__data, unsigned long call_site, const void *ptr, size_t bytes_req, size_t bytes_alloc, gfp_t gfp_flags, int node), void *data) { return -89; } static inline __attribute__((always_inline)) int unregister_trace_kmalloc_node(void (*probe)(void *__data, unsigned long call_site, const void *ptr, size_t bytes_req, size_t bytes_alloc, gfp_t gfp_flags, int node), void *data) { return -89; } static inline __attribute__((always_inline)) void check_trace_callback_type_kmalloc_node(void (*cb)(void *__data, unsigned long call_site, const void *ptr, size_t bytes_req, size_t bytes_alloc, gfp_t gfp_flags, int node)) { };
# 108 "include/trace/events/kmem.h"
static inline __attribute__((always_inline)) void trace_kmem_cache_alloc_node(unsigned long call_site, const void *ptr, size_t bytes_req, size_t bytes_alloc, gfp_t gfp_flags, int node) { } static inline __attribute__((always_inline)) int register_trace_kmem_cache_alloc_node(void (*probe)(void *__data, unsigned long call_site, const void *ptr, size_t bytes_req, size_t bytes_alloc, gfp_t gfp_flags, int node), void *data) { return -89; } static inline __attribute__((always_inline)) int unregister_trace_kmem_cache_alloc_node(void (*probe)(void *__data, unsigned long call_site, const void *ptr, size_t bytes_req, size_t bytes_alloc, gfp_t gfp_flags, int node), void *data) { return -89; } static inline __attribute__((always_inline)) void check_trace_callback_type_kmem_cache_alloc_node(void (*cb)(void *__data, unsigned long call_site, const void *ptr, size_t bytes_req, size_t bytes_alloc, gfp_t gfp_flags, int node)) { };
# 117 "include/trace/events/kmem.h"
;
# 136 "include/trace/events/kmem.h"
static inline __attribute__((always_inline)) void trace_kfree(unsigned long call_site, const void *ptr) { } static inline __attribute__((always_inline)) int register_trace_kfree(void (*probe)(void *__data, unsigned long call_site, const void *ptr), void *data) { return -89; } static inline __attribute__((always_inline)) int unregister_trace_kfree(void (*probe)(void *__data, unsigned long call_site, const void *ptr), void *data) { return -89; } static inline __attribute__((always_inline)) void check_trace_callback_type_kfree(void (*cb)(void *__data, unsigned long call_site, const void *ptr)) { };






static inline __attribute__((always_inline)) void trace_kmem_cache_free(unsigned long call_site, const void *ptr) { } static inline __attribute__((always_inline)) int register_trace_kmem_cache_free(void (*probe)(void *__data, unsigned long call_site, const void *ptr), void *data) { return -89; } static inline __attribute__((always_inline)) int unregister_trace_kmem_cache_free(void (*probe)(void *__data, unsigned long call_site, const void *ptr), void *data) { return -89; } static inline __attribute__((always_inline)) void check_trace_callback_type_kmem_cache_free(void (*cb)(void *__data, unsigned long call_site, const void *ptr)) { };






static inline __attribute__((always_inline)) void trace_mm_page_free_direct(struct page *page, unsigned int order) { } static inline __attribute__((always_inline)) int register_trace_mm_page_free_direct(void (*probe)(void *__data, struct page *page, unsigned int order), void *data) { return -89; } static inline __attribute__((always_inline)) int unregister_trace_mm_page_free_direct(void (*probe)(void *__data, struct page *page, unsigned int order), void *data) { return -89; } static inline __attribute__((always_inline)) void check_trace_callback_type_mm_page_free_direct(void (*cb)(void *__data, struct page *page, unsigned int order)) { };
# 172 "include/trace/events/kmem.h"
static inline __attribute__((always_inline)) void trace_mm_pagevec_free(struct page *page, int cold) { } static inline __attribute__((always_inline)) int register_trace_mm_pagevec_free(void (*probe)(void *__data, struct page *page, int cold), void *data) { return -89; } static inline __attribute__((always_inline)) int unregister_trace_mm_pagevec_free(void (*probe)(void *__data, struct page *page, int cold), void *data) { return -89; } static inline __attribute__((always_inline)) void check_trace_callback_type_mm_pagevec_free(void (*cb)(void *__data, struct page *page, int cold)) { };
# 194 "include/trace/events/kmem.h"
static inline __attribute__((always_inline)) void trace_mm_page_alloc(struct page *page, unsigned int order, gfp_t gfp_flags, int migratetype) { } static inline __attribute__((always_inline)) int register_trace_mm_page_alloc(void (*probe)(void *__data, struct page *page, unsigned int order, gfp_t gfp_flags, int migratetype), void *data) { return -89; } static inline __attribute__((always_inline)) int unregister_trace_mm_page_alloc(void (*probe)(void *__data, struct page *page, unsigned int order, gfp_t gfp_flags, int migratetype), void *data) { return -89; } static inline __attribute__((always_inline)) void check_trace_callback_type_mm_page_alloc(void (*cb)(void *__data, struct page *page, unsigned int order, gfp_t gfp_flags, int migratetype)) { };
# 223 "include/trace/events/kmem.h"
;
# 249 "include/trace/events/kmem.h"
static inline __attribute__((always_inline)) void trace_mm_page_alloc_zone_locked(struct page *page, unsigned int order, int migratetype) { } static inline __attribute__((always_inline)) int register_trace_mm_page_alloc_zone_locked(void (*probe)(void *__data, struct page *page, unsigned int order, int migratetype), void *data) { return -89; } static inline __attribute__((always_inline)) int unregister_trace_mm_page_alloc_zone_locked(void (*probe)(void *__data, struct page *page, unsigned int order, int migratetype), void *data) { return -89; } static inline __attribute__((always_inline)) void check_trace_callback_type_mm_page_alloc_zone_locked(void (*cb)(void *__data, struct page *page, unsigned int order, int migratetype)) { };






static inline __attribute__((always_inline)) void trace_mm_page_pcpu_drain(struct page *page, unsigned int order, int migratetype) { } static inline __attribute__((always_inline)) int register_trace_mm_page_pcpu_drain(void (*probe)(void *__data, struct page *page, unsigned int order, int migratetype), void *data) { return -89; } static inline __attribute__((always_inline)) int unregister_trace_mm_page_pcpu_drain(void (*probe)(void *__data, struct page *page, unsigned int order, int migratetype), void *data) { return -89; } static inline __attribute__((always_inline)) void check_trace_callback_type_mm_page_pcpu_drain(void (*cb)(void *__data, struct page *page, unsigned int order, int migratetype)) { };
# 267 "include/trace/events/kmem.h"
static inline __attribute__((always_inline)) void trace_mm_page_alloc_extfrag(struct page *page, int alloc_order, int fallback_order, int alloc_migratetype, int fallback_migratetype) { } static inline __attribute__((always_inline)) int register_trace_mm_page_alloc_extfrag(void (*probe)(void *__data, struct page *page, int alloc_order, int fallback_order, int alloc_migratetype, int fallback_migratetype), void *data) { return -89; } static inline __attribute__((always_inline)) int unregister_trace_mm_page_alloc_extfrag(void (*probe)(void *__data, struct page *page, int alloc_order, int fallback_order, int alloc_migratetype, int fallback_migratetype), void *data) { return -89; } static inline __attribute__((always_inline)) void check_trace_callback_type_mm_page_alloc_extfrag(void (*cb)(void *__data, struct page *page, int alloc_order, int fallback_order, int alloc_migratetype, int fallback_migratetype)) { };
# 308 "include/trace/events/kmem.h"
# 1 "include/trace/define_trace.h" 1
# 308 "include/trace/events/kmem.h" 2
# 16 "include/linux/slub_def.h" 2

enum stat_item {
 ALLOC_FASTPATH,
 ALLOC_SLOWPATH,
 FREE_FASTPATH,
 FREE_SLOWPATH,
 FREE_FROZEN,
 FREE_ADD_PARTIAL,
 FREE_REMOVE_PARTIAL,
 ALLOC_FROM_PARTIAL,
 ALLOC_SLAB,
 ALLOC_REFILL,
 FREE_SLAB,
 CPUSLAB_FLUSH,
 DEACTIVATE_FULL,
 DEACTIVATE_EMPTY,
 DEACTIVATE_TO_HEAD,
 DEACTIVATE_TO_TAIL,
 DEACTIVATE_REMOTE_FREES,
 ORDER_FALLBACK,
 NR_SLUB_STAT_ITEMS };

struct kmem_cache_cpu {
 void **freelist;
 struct page *page;
 int node;



};

struct kmem_cache_node {
 spinlock_t list_lock;
 unsigned long nr_partial;
 struct list_head partial;





};






struct kmem_cache_order_objects {
 unsigned long x;
};




struct kmem_cache {
 struct kmem_cache_cpu *cpu_slab;

 unsigned long flags;
 int size;
 int objsize;
 int offset;
 struct kmem_cache_order_objects oo;


 struct kmem_cache_order_objects max;
 struct kmem_cache_order_objects min;
 gfp_t allocflags;
 int refcount;
 void (*ctor)(void *);
 int inuse;
 int align;
 unsigned long min_partial;
 const char *name;
 struct list_head list;
# 102 "include/linux/slub_def.h"
 struct kmem_cache_node local_node;

};
# 154 "include/linux/slub_def.h"
extern struct kmem_cache kmalloc_caches[(12 + 2)];





static inline __attribute__((always_inline)) __attribute__((always_inline)) int kmalloc_index(size_t size)
{
 if (!size)
  return 0;

 if (size <= 128)
  return ( __builtin_constant_p(128) ? ( (128) < 1 ? ____ilog2_NaN() : (128) & (1ULL << 63) ? 63 : (128) & (1ULL << 62) ? 62 : (128) & (1ULL << 61) ? 61 : (128) & (1ULL << 60) ? 60 : (128) & (1ULL << 59) ? 59 : (128) & (1ULL << 58) ? 58 : (128) & (1ULL << 57) ? 57 : (128) & (1ULL << 56) ? 56 : (128) & (1ULL << 55) ? 55 : (128) & (1ULL << 54) ? 54 : (128) & (1ULL << 53) ? 53 : (128) & (1ULL << 52) ? 52 : (128) & (1ULL << 51) ? 51 : (128) & (1ULL << 50) ? 50 : (128) & (1ULL << 49) ? 49 : (128) & (1ULL << 48) ? 48 : (128) & (1ULL << 47) ? 47 : (128) & (1ULL << 46) ? 46 : (128) & (1ULL << 45) ? 45 : (128) & (1ULL << 44) ? 44 : (128) & (1ULL << 43) ? 43 : (128) & (1ULL << 42) ? 42 : (128) & (1ULL << 41) ? 41 : (128) & (1ULL << 40) ? 40 : (128) & (1ULL << 39) ? 39 : (128) & (1ULL << 38) ? 38 : (128) & (1ULL << 37) ? 37 : (128) & (1ULL << 36) ? 36 : (128) & (1ULL << 35) ? 35 : (128) & (1ULL << 34) ? 34 : (128) & (1ULL << 33) ? 33 : (128) & (1ULL << 32) ? 32 : (128) & (1ULL << 31) ? 31 : (128) & (1ULL << 30) ? 30 : (128) & (1ULL << 29) ? 29 : (128) & (1ULL << 28) ? 28 : (128) & (1ULL << 27) ? 27 : (128) & (1ULL << 26) ? 26 : (128) & (1ULL << 25) ? 25 : (128) & (1ULL << 24) ? 24 : (128) & (1ULL << 23) ? 23 : (128) & (1ULL << 22) ? 22 : (128) & (1ULL << 21) ? 21 : (128) & (1ULL << 20) ? 20 : (128) & (1ULL << 19) ? 19 : (128) & (1ULL << 18) ? 18 : (128) & (1ULL << 17) ? 17 : (128) & (1ULL << 16) ? 16 : (128) & (1ULL << 15) ? 15 : (128) & (1ULL << 14) ? 14 : (128) & (1ULL << 13) ? 13 : (128) & (1ULL << 12) ? 12 : (128) & (1ULL << 11) ? 11 : (128) & (1ULL << 10) ? 10 : (128) & (1ULL << 9) ? 9 : (128) & (1ULL << 8) ? 8 : (128) & (1ULL << 7) ? 7 : (128) & (1ULL << 6) ? 6 : (128) & (1ULL << 5) ? 5 : (128) & (1ULL << 4) ? 4 : (128) & (1ULL << 3) ? 3 : (128) & (1ULL << 2) ? 2 : (128) & (1ULL << 1) ? 1 : (128) & (1ULL << 0) ? 0 : ____ilog2_NaN() ) : (sizeof(128) <= 4) ? __ilog2_u32(128) : __ilog2_u64(128) );

 if (128 <= 32 && size > 64 && size <= 96)
  return 1;
 if (128 <= 64 && size > 128 && size <= 192)
  return 2;
 if (size <= 8) return 3;
 if (size <= 16) return 4;
 if (size <= 32) return 5;
 if (size <= 64) return 6;
 if (size <= 128) return 7;
 if (size <= 256) return 8;
 if (size <= 512) return 9;
 if (size <= 1024) return 10;
 if (size <= 2 * 1024) return 11;
 if (size <= 4 * 1024) return 12;




 if (size <= 8 * 1024) return 13;
 if (size <= 16 * 1024) return 14;
 if (size <= 32 * 1024) return 15;
 if (size <= 64 * 1024) return 16;
 if (size <= 128 * 1024) return 17;
 if (size <= 256 * 1024) return 18;
 if (size <= 512 * 1024) return 19;
 if (size <= 1024 * 1024) return 20;
 if (size <= 2 * 1024 * 1024) return 21;
 return -1;
# 204 "include/linux/slub_def.h"
}







static inline __attribute__((always_inline)) __attribute__((always_inline)) struct kmem_cache *kmalloc_slab(size_t size)
{
 int index = kmalloc_index(size);

 if (index == 0)
  return ((void *)0);

 return &kmalloc_caches[index];
}

void *kmem_cache_alloc(struct kmem_cache *, gfp_t);
void *__kmalloc(size_t size, gfp_t flags);




static inline __attribute__((always_inline)) __attribute__((always_inline)) void *
kmem_cache_alloc_notrace(struct kmem_cache *s, gfp_t gfpflags)
{
 return kmem_cache_alloc(s, gfpflags);
}


static inline __attribute__((always_inline)) __attribute__((always_inline)) void *kmalloc_large(size_t size, gfp_t flags)
{
 unsigned int order = get_order(size);
 void *ret = (void *) __get_free_pages(flags | (( gfp_t)0x4000u), order);

 kmemleak_alloc(ret, size, 1, flags);
 trace_kmalloc(({ __label__ __here; __here: (unsigned long)&&__here; }), ret, size, ((1UL) << 12) << order, flags);

 return ret;
}

static inline __attribute__((always_inline)) __attribute__((always_inline)) void *kmalloc(size_t size, gfp_t flags)
{
 void *ret;

 if (__builtin_constant_p(size)) {
  if (size > (2 * ((1UL) << 12)))
   return kmalloc_large(size, flags);

  if (!(flags & ( gfp_t)0)) {
   struct kmem_cache *s = kmalloc_slab(size);

   if (!s)
    return ((void *)16);

   ret = kmem_cache_alloc_notrace(s, flags);

   trace_kmalloc(({ __label__ __here; __here: (unsigned long)&&__here; }), ret, size, s->size, flags);

   return ret;
  }
 }
 return __kmalloc(size, flags);
}
# 169 "include/linux/slab.h" 2
# 226 "include/linux/slab.h"
static inline __attribute__((always_inline)) void *kcalloc(size_t n, size_t size, gfp_t flags)
{
 if (size != 0 && n > (~0UL) / size)
  return ((void *)0);
 return __kmalloc(n * size, flags | (( gfp_t)0x8000u));
}
# 244 "include/linux/slab.h"
static inline __attribute__((always_inline)) void *kmalloc_node(size_t size, gfp_t flags, int node)
{
 return kmalloc(size, flags);
}

static inline __attribute__((always_inline)) void *__kmalloc_node(size_t size, gfp_t flags, int node)
{
 return __kmalloc(size, flags);
}

void *kmem_cache_alloc(struct kmem_cache *, gfp_t);

static inline __attribute__((always_inline)) void *kmem_cache_alloc_node(struct kmem_cache *cachep,
     gfp_t flags, int node)
{
 return kmem_cache_alloc(cachep, flags);
}
# 273 "include/linux/slab.h"
extern void *__kmalloc_track_caller(size_t, gfp_t, unsigned long);
# 311 "include/linux/slab.h"
static inline __attribute__((always_inline)) void *kmem_cache_zalloc(struct kmem_cache *k, gfp_t flags)
{
 return kmem_cache_alloc(k, flags | (( gfp_t)0x8000u));
}






static inline __attribute__((always_inline)) void *kzalloc(size_t size, gfp_t flags)
{
 return kmalloc(size, flags | (( gfp_t)0x8000u));
}







static inline __attribute__((always_inline)) void *kzalloc_node(size_t size, gfp_t flags, int node)
{
 return kmalloc_node(size, flags | (( gfp_t)0x8000u), node);
}

void __attribute__ ((__section__(".init.text"))) __attribute__((__cold__)) __attribute__((no_instrument_function)) kmem_cache_init_late(void);
# 5 "include/linux/proc_fs.h" 2
# 1 "include/linux/fs.h" 1
# 9 "include/linux/fs.h"
# 1 "include/linux/limits.h" 1
# 10 "include/linux/fs.h" 2
# 1 "include/linux/ioctl.h" 1



# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/ioctl.h" 1
# 25 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/ioctl.h"
# 1 "include/asm-generic/ioctl.h" 1
# 73 "include/asm-generic/ioctl.h"
extern unsigned int __invalid_size_argument_for_IOC;
# 26 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/ioctl.h" 2
# 5 "include/linux/ioctl.h" 2
# 11 "include/linux/fs.h" 2
# 1 "include/linux/blk_types.h" 1
# 12 "include/linux/blk_types.h"
struct bio_set;
struct bio;
struct bio_integrity_payload;
struct page;
struct block_device;
typedef void (bio_end_io_t) (struct bio *, int);
typedef void (bio_destructor_t) (struct bio *);




struct bio_vec {
 struct page *bv_page;
 unsigned int bv_len;
 unsigned int bv_offset;
};





struct bio {
 sector_t bi_sector;

 struct bio *bi_next;
 struct block_device *bi_bdev;
 unsigned long bi_flags;
 unsigned long bi_rw;



 unsigned short bi_vcnt;
 unsigned short bi_idx;




 unsigned int bi_phys_segments;

 unsigned int bi_size;





 unsigned int bi_seg_front_size;
 unsigned int bi_seg_back_size;

 unsigned int bi_max_vecs;

 unsigned int bi_comp_cpu;

 atomic_t bi_cnt;

 struct bio_vec *bi_io_vec;

 bio_end_io_t *bi_end_io;

 void *bi_private;




 bio_destructor_t *bi_destructor;






 struct bio_vec bi_inline_vecs[0];
};
# 117 "include/linux/blk_types.h"
enum rq_flag_bits {

 __REQ_WRITE,
 __REQ_FAILFAST_DEV,
 __REQ_FAILFAST_TRANSPORT,
 __REQ_FAILFAST_DRIVER,

 __REQ_HARDBARRIER,
 __REQ_SYNC,
 __REQ_META,
 __REQ_DISCARD,
 __REQ_NOIDLE,


 __REQ_UNPLUG,
 __REQ_RAHEAD,


 __REQ_SORTED,
 __REQ_SOFTBARRIER,
 __REQ_FUA,
 __REQ_NOMERGE,
 __REQ_STARTED,
 __REQ_DONTPREP,
 __REQ_QUEUED,
 __REQ_ELVPRIV,
 __REQ_FAILED,
 __REQ_QUIET,
 __REQ_PREEMPT,
 __REQ_ORDERED_COLOR,
 __REQ_ALLOCED,
 __REQ_COPY_USER,
 __REQ_INTEGRITY,
 __REQ_FLUSH,
 __REQ_IO_STAT,
 __REQ_MIXED_MERGE,
 __REQ_SECURE,
 __REQ_NR_BITS,
};
# 12 "include/linux/fs.h" 2
# 36 "include/linux/fs.h"
struct files_stat_struct {
 int nr_files;
 int nr_free_files;
 int max_files;
};

struct inodes_stat_t {
 int nr_inodes;
 int nr_unused;
 int dummy[5];
};
# 371 "include/linux/fs.h"
# 1 "include/linux/kdev_t.h" 1
# 21 "include/linux/kdev_t.h"
static inline __attribute__((always_inline)) int old_valid_dev(dev_t dev)
{
 return ((unsigned int) ((dev) >> 20)) < 256 && ((unsigned int) ((dev) & ((1U << 20) - 1))) < 256;
}

static inline __attribute__((always_inline)) u16 old_encode_dev(dev_t dev)
{
 return (((unsigned int) ((dev) >> 20)) << 8) | ((unsigned int) ((dev) & ((1U << 20) - 1)));
}

static inline __attribute__((always_inline)) dev_t old_decode_dev(u16 val)
{
 return ((((val >> 8) & 255) << 20) | (val & 255));
}

static inline __attribute__((always_inline)) int new_valid_dev(dev_t dev)
{
 return 1;
}

static inline __attribute__((always_inline)) u32 new_encode_dev(dev_t dev)
{
 unsigned major = ((unsigned int) ((dev) >> 20));
 unsigned minor = ((unsigned int) ((dev) & ((1U << 20) - 1)));
 return (minor & 0xff) | (major << 8) | ((minor & ~0xff) << 12);
}

static inline __attribute__((always_inline)) dev_t new_decode_dev(u32 dev)
{
 unsigned major = (dev & 0xfff00) >> 8;
 unsigned minor = (dev & 0xff) | ((dev >> 12) & 0xfff00);
 return (((major) << 20) | (minor));
}

static inline __attribute__((always_inline)) int huge_valid_dev(dev_t dev)
{
 return 1;
}

static inline __attribute__((always_inline)) u64 huge_encode_dev(dev_t dev)
{
 return new_encode_dev(dev);
}

static inline __attribute__((always_inline)) dev_t huge_decode_dev(u64 dev)
{
 return new_decode_dev(dev);
}

static inline __attribute__((always_inline)) int sysv_valid_dev(dev_t dev)
{
 return ((unsigned int) ((dev) >> 20)) < (1<<14) && ((unsigned int) ((dev) & ((1U << 20) - 1))) < (1<<18);
}

static inline __attribute__((always_inline)) u32 sysv_encode_dev(dev_t dev)
{
 return ((unsigned int) ((dev) & ((1U << 20) - 1))) | (((unsigned int) ((dev) >> 20)) << 18);
}

static inline __attribute__((always_inline)) unsigned sysv_major(u32 dev)
{
 return (dev >> 18) & 0x3fff;
}

static inline __attribute__((always_inline)) unsigned sysv_minor(u32 dev)
{
 return dev & 0x3ffff;
}
# 372 "include/linux/fs.h" 2
# 1 "include/linux/dcache.h" 1





# 1 "include/linux/rculist.h" 1
# 18 "include/linux/rculist.h"
static inline __attribute__((always_inline)) void __list_add_rcu(struct list_head *new,
  struct list_head *prev, struct list_head *next)
{
 new->next = next;
 new->prev = prev;
 ({ if (!__builtin_constant_p(new) || ((new) != ((void *)0))) __asm__ __volatile__("": : :"memory"); (prev->next) = (new); });
 next->prev = new;
}
# 43 "include/linux/rculist.h"
static inline __attribute__((always_inline)) void list_add_rcu(struct list_head *new, struct list_head *head)
{
 __list_add_rcu(new, head, head->next);
}
# 64 "include/linux/rculist.h"
static inline __attribute__((always_inline)) void list_add_tail_rcu(struct list_head *new,
     struct list_head *head)
{
 __list_add_rcu(new, head->prev, head);
}
# 94 "include/linux/rculist.h"
static inline __attribute__((always_inline)) void list_del_rcu(struct list_head *entry)
{
 __list_del(entry->prev, entry->next);
 entry->prev = ((void *) 0x00200200 + 0);
}
# 120 "include/linux/rculist.h"
static inline __attribute__((always_inline)) void hlist_del_init_rcu(struct hlist_node *n)
{
 if (!hlist_unhashed(n)) {
  __hlist_del(n);
  n->pprev = ((void *)0);
 }
}
# 136 "include/linux/rculist.h"
static inline __attribute__((always_inline)) void list_replace_rcu(struct list_head *old,
    struct list_head *new)
{
 new->next = old->next;
 new->prev = old->prev;
 ({ if (!__builtin_constant_p(new) || ((new) != ((void *)0))) __asm__ __volatile__("": : :"memory"); (new->prev->next) = (new); });
 new->next->prev = new;
 old->prev = ((void *) 0x00200200 + 0);
}
# 163 "include/linux/rculist.h"
static inline __attribute__((always_inline)) void list_splice_init_rcu(struct list_head *list,
     struct list_head *head,
     void (*sync)(void))
{
 struct list_head *first = list->next;
 struct list_head *last = list->prev;
 struct list_head *at = head->next;

 if (list_empty(head))
  return;



 INIT_LIST_HEAD(list);
# 185 "include/linux/rculist.h"
 sync();
# 195 "include/linux/rculist.h"
 last->next = at;
 ({ if (!__builtin_constant_p(first) || ((first) != ((void *)0))) __asm__ __volatile__("": : :"memory"); (head->next) = (first); });
 first->prev = head;
 at->prev = last;
}
# 297 "include/linux/rculist.h"
static inline __attribute__((always_inline)) void hlist_del_rcu(struct hlist_node *n)
{
 __hlist_del(n);
 n->pprev = ((void *) 0x00200200 + 0);
}
# 310 "include/linux/rculist.h"
static inline __attribute__((always_inline)) void hlist_replace_rcu(struct hlist_node *old,
     struct hlist_node *new)
{
 struct hlist_node *next = old->next;

 new->next = next;
 new->pprev = old->pprev;
 ({ if (!__builtin_constant_p(new) || ((new) != ((void *)0))) __asm__ __volatile__("": : :"memory"); (*new->pprev) = (new); });
 if (next)
  new->next->pprev = &new->next;
 old->pprev = ((void *) 0x00200200 + 0);
}
# 342 "include/linux/rculist.h"
static inline __attribute__((always_inline)) void hlist_add_head_rcu(struct hlist_node *n,
     struct hlist_head *h)
{
 struct hlist_node *first = h->first;

 n->next = first;
 n->pprev = &h->first;
 ({ if (!__builtin_constant_p(n) || ((n) != ((void *)0))) __asm__ __volatile__("": : :"memory"); (h->first) = (n); });
 if (first)
  first->pprev = &n->next;
}
# 372 "include/linux/rculist.h"
static inline __attribute__((always_inline)) void hlist_add_before_rcu(struct hlist_node *n,
     struct hlist_node *next)
{
 n->pprev = next->pprev;
 n->next = next;
 ({ if (!__builtin_constant_p(n) || ((n) != ((void *)0))) __asm__ __volatile__("": : :"memory"); (*(n->pprev)) = (n); });
 next->pprev = &n->next;
}
# 399 "include/linux/rculist.h"
static inline __attribute__((always_inline)) void hlist_add_after_rcu(struct hlist_node *prev,
           struct hlist_node *n)
{
 n->next = prev->next;
 n->pprev = &prev->next;
 ({ if (!__builtin_constant_p(n) || ((n) != ((void *)0))) __asm__ __volatile__("": : :"memory"); (prev->next) = (n); });
 if (n->next)
  n->next->pprev = &n->next;
}
# 7 "include/linux/dcache.h" 2




struct nameidata;
struct path;
struct vfsmount;
# 33 "include/linux/dcache.h"
struct qstr {
 unsigned int hash;
 unsigned int len;
 const unsigned char *name;
};

struct dentry_stat_t {
 int nr_dentry;
 int nr_unused;
 int age_limit;
 int want_pages;
 int dummy[2];
};
extern struct dentry_stat_t dentry_stat;






static inline __attribute__((always_inline)) unsigned long
partial_name_hash(unsigned long c, unsigned long prevhash)
{
 return (prevhash + (c << 4) + (c >> 4)) * 11;
}





static inline __attribute__((always_inline)) unsigned long end_name_hash(unsigned long hash)
{
 return (unsigned int) hash;
}


static inline __attribute__((always_inline)) unsigned int
full_name_hash(const unsigned char *name, unsigned int len)
{
 unsigned long hash = 0;
 while (len--)
  hash = partial_name_hash(*name++, hash);
 return end_name_hash(hash);
}
# 89 "include/linux/dcache.h"
struct dentry {
 atomic_t d_count;
 unsigned int d_flags;
 spinlock_t d_lock;
 int d_mounted;
 struct inode *d_inode;





 struct hlist_node d_hash;
 struct dentry *d_parent;
 struct qstr d_name;

 struct list_head d_lru;



 union {
  struct list_head d_child;
   struct rcu_head d_rcu;
 } d_u;
 struct list_head d_subdirs;
 struct list_head d_alias;
 unsigned long d_time;
 const struct dentry_operations *d_op;
 struct super_block *d_sb;
 void *d_fsdata;

 unsigned char d_iname[40];
};







enum dentry_d_lock_class
{
 DENTRY_D_LOCK_NORMAL,
 DENTRY_D_LOCK_NESTED
};

struct dentry_operations {
 int (*d_revalidate)(struct dentry *, struct nameidata *);
 int (*d_hash) (struct dentry *, struct qstr *);
 int (*d_compare) (struct dentry *, struct qstr *, struct qstr *);
 int (*d_delete)(struct dentry *);
 void (*d_release)(struct dentry *);
 void (*d_iput)(struct dentry *, struct inode *);
 char *(*d_dname)(struct dentry *, char *, int);
};
# 191 "include/linux/dcache.h"
extern spinlock_t dcache_lock;
extern seqlock_t rename_lock;
# 210 "include/linux/dcache.h"
static inline __attribute__((always_inline)) void __d_drop(struct dentry *dentry)
{
 if (!(dentry->d_flags & 0x0010)) {
  dentry->d_flags |= 0x0010;
  hlist_del_rcu(&dentry->d_hash);
 }
}

static inline __attribute__((always_inline)) void d_drop(struct dentry *dentry)
{
 spin_lock(&dcache_lock);
 spin_lock(&dentry->d_lock);
  __d_drop(dentry);
 spin_unlock(&dentry->d_lock);
 spin_unlock(&dcache_lock);
}

static inline __attribute__((always_inline)) int dname_external(struct dentry *dentry)
{
 return dentry->d_name.name != dentry->d_iname;
}




extern void d_instantiate(struct dentry *, struct inode *);
extern struct dentry * d_instantiate_unique(struct dentry *, struct inode *);
extern struct dentry * d_materialise_unique(struct dentry *, struct inode *);
extern void d_delete(struct dentry *);


extern struct dentry * d_alloc(struct dentry *, const struct qstr *);
extern struct dentry * d_splice_alias(struct inode *, struct dentry *);
extern struct dentry * d_add_ci(struct dentry *, struct inode *, struct qstr *);
extern struct dentry * d_obtain_alias(struct inode *);
extern void shrink_dcache_sb(struct super_block *);
extern void shrink_dcache_parent(struct dentry *);
extern void shrink_dcache_for_umount(struct super_block *);
extern int d_invalidate(struct dentry *);


extern struct dentry * d_alloc_root(struct inode *);


extern void d_genocide(struct dentry *);

extern struct dentry *d_find_alias(struct inode *);
extern void d_prune_aliases(struct inode *);


extern int have_submounts(struct dentry *);




extern void d_rehash(struct dentry *);
# 276 "include/linux/dcache.h"
static inline __attribute__((always_inline)) void d_add(struct dentry *entry, struct inode *inode)
{
 d_instantiate(entry, inode);
 d_rehash(entry);
}
# 290 "include/linux/dcache.h"
static inline __attribute__((always_inline)) struct dentry *d_add_unique(struct dentry *entry, struct inode *inode)
{
 struct dentry *res;

 res = d_instantiate_unique(entry, inode);
 d_rehash(res != ((void *)0) ? res : entry);
 return res;
}


extern void d_move(struct dentry *, struct dentry *);
extern struct dentry *d_ancestor(struct dentry *, struct dentry *);


extern struct dentry * d_lookup(struct dentry *, struct qstr *);
extern struct dentry * __d_lookup(struct dentry *, struct qstr *);
extern struct dentry * d_hash_and_lookup(struct dentry *, struct qstr *);


extern int d_validate(struct dentry *, struct dentry *);




extern char *dynamic_dname(struct dentry *, char *, int, const char *, ...);

extern char *__d_path(const struct path *path, struct path *root, char *, int);
extern char *d_path(const struct path *, char *, int);
extern char *d_path_with_unreachable(const struct path *, char *, int);
extern char *__dentry_path(struct dentry *, char *, int);
extern char *dentry_path(struct dentry *, char *, int);
# 337 "include/linux/dcache.h"
static inline __attribute__((always_inline)) struct dentry *dget(struct dentry *dentry)
{
 if (dentry) {
  __BUG_ON((unsigned long)(!(*(volatile int *)&(&dentry->d_count)->counter)));
  atomic_add(1, (&dentry->d_count));
 }
 return dentry;
}

extern struct dentry * dget_locked(struct dentry *);
# 355 "include/linux/dcache.h"
static inline __attribute__((always_inline)) int d_unhashed(struct dentry *dentry)
{
 return (dentry->d_flags & 0x0010);
}

static inline __attribute__((always_inline)) int d_unlinked(struct dentry *dentry)
{
 return d_unhashed(dentry) && !((dentry) == (dentry)->d_parent);
}

static inline __attribute__((always_inline)) int cant_mount(struct dentry *dentry)
{
 return (dentry->d_flags & 0x0100);
}

static inline __attribute__((always_inline)) void dont_mount(struct dentry *dentry)
{
 spin_lock(&dentry->d_lock);
 dentry->d_flags |= 0x0100;
 spin_unlock(&dentry->d_lock);
}

static inline __attribute__((always_inline)) struct dentry *dget_parent(struct dentry *dentry)
{
 struct dentry *ret;

 spin_lock(&dentry->d_lock);
 ret = dget(dentry->d_parent);
 spin_unlock(&dentry->d_lock);
 return ret;
}

extern void dput(struct dentry *);

static inline __attribute__((always_inline)) int d_mountpoint(struct dentry *dentry)
{
 return dentry->d_mounted;
}

extern struct vfsmount *lookup_mnt(struct path *);
extern struct dentry *lookup_create(struct nameidata *nd, int is_dir);

extern int sysctl_vfs_cache_pressure;
# 373 "include/linux/fs.h" 2
# 1 "include/linux/path.h" 1



struct dentry;
struct vfsmount;

struct path {
 struct vfsmount *mnt;
 struct dentry *dentry;
};

extern void path_get(struct path *);
extern void path_put(struct path *);

static inline __attribute__((always_inline)) int path_equal(const struct path *path1, const struct path *path2)
{
 return path1->mnt == path2->mnt && path1->dentry == path2->dentry;
}
# 374 "include/linux/fs.h" 2




# 1 "include/linux/radix-tree.h" 1
# 41 "include/linux/radix-tree.h"
static inline __attribute__((always_inline)) void *radix_tree_ptr_to_indirect(void *ptr)
{
 return (void *)((unsigned long)ptr | 1);
}

static inline __attribute__((always_inline)) void *radix_tree_indirect_to_ptr(void *ptr)
{
 return (void *)((unsigned long)ptr & ~1);
}

static inline __attribute__((always_inline)) int radix_tree_is_indirect_ptr(void *ptr)
{
 return (int)((unsigned long)ptr & 1);
}






struct radix_tree_root {
 unsigned int height;
 gfp_t gfp_mask;
 struct radix_tree_node *rnode;
};
# 144 "include/linux/radix-tree.h"
static inline __attribute__((always_inline)) void *radix_tree_deref_slot(void **pslot)
{
 void *ret = ({ typeof(*pslot) _________p1 = (*(volatile typeof(*pslot) *)&(*pslot)); do { } while(0); (_________p1); });
 if (__builtin_expect(!!(radix_tree_is_indirect_ptr(ret)), 0))
  ret = ((void *)-1UL);
 return ret;
}
# 159 "include/linux/radix-tree.h"
static inline __attribute__((always_inline)) void radix_tree_replace_slot(void **pslot, void *item)
{
 __BUG_ON((unsigned long)(radix_tree_is_indirect_ptr(item)));
 ({ if (!__builtin_constant_p(item) || ((item) != ((void *)0))) __asm__ __volatile__("": : :"memory"); (*pslot) = (item); });
}

int radix_tree_insert(struct radix_tree_root *, unsigned long, void *);
void *radix_tree_lookup(struct radix_tree_root *, unsigned long);
void **radix_tree_lookup_slot(struct radix_tree_root *, unsigned long);
void *radix_tree_delete(struct radix_tree_root *, unsigned long);
unsigned int
radix_tree_gang_lookup(struct radix_tree_root *root, void **results,
   unsigned long first_index, unsigned int max_items);
unsigned int
radix_tree_gang_lookup_slot(struct radix_tree_root *root, void ***results,
   unsigned long first_index, unsigned int max_items);
unsigned long radix_tree_next_hole(struct radix_tree_root *root,
    unsigned long index, unsigned long max_scan);
unsigned long radix_tree_prev_hole(struct radix_tree_root *root,
    unsigned long index, unsigned long max_scan);
int radix_tree_preload(gfp_t gfp_mask);
void radix_tree_init(void);
void *radix_tree_tag_set(struct radix_tree_root *root,
   unsigned long index, unsigned int tag);
void *radix_tree_tag_clear(struct radix_tree_root *root,
   unsigned long index, unsigned int tag);
int radix_tree_tag_get(struct radix_tree_root *root,
   unsigned long index, unsigned int tag);
unsigned int
radix_tree_gang_lookup_tag(struct radix_tree_root *root, void **results,
  unsigned long first_index, unsigned int max_items,
  unsigned int tag);
unsigned int
radix_tree_gang_lookup_tag_slot(struct radix_tree_root *root, void ***results,
  unsigned long first_index, unsigned int max_items,
  unsigned int tag);
unsigned long radix_tree_range_tag_if_tagged(struct radix_tree_root *root,
  unsigned long *first_indexp, unsigned long last_index,
  unsigned long nr_to_tag,
  unsigned int fromtag, unsigned int totag);
int radix_tree_tagged(struct radix_tree_root *root, unsigned int tag);

static inline __attribute__((always_inline)) void radix_tree_preload_end(void)
{
 do { } while (0);
}
# 379 "include/linux/fs.h" 2


# 1 "include/linux/pid.h" 1





enum pid_type
{
 PIDTYPE_PID,
 PIDTYPE_PGID,
 PIDTYPE_SID,
 PIDTYPE_MAX
};
# 50 "include/linux/pid.h"
struct upid {

 int nr;
 struct pid_namespace *ns;
 struct hlist_node pid_chain;
};

struct pid
{
 atomic_t count;
 unsigned int level;

 struct hlist_head tasks[PIDTYPE_MAX];
 struct rcu_head rcu;
 struct upid numbers[1];
};

extern struct pid init_struct_pid;

struct pid_link
{
 struct hlist_node node;
 struct pid *pid;
};

static inline __attribute__((always_inline)) struct pid *get_pid(struct pid *pid)
{
 if (pid)
  atomic_add(1, (&pid->count));
 return pid;
}

extern void put_pid(struct pid *pid);
extern struct task_struct *pid_task(struct pid *pid, enum pid_type);
extern struct task_struct *get_pid_task(struct pid *pid, enum pid_type);

extern struct pid *get_task_pid(struct task_struct *task, enum pid_type type);





extern void attach_pid(struct task_struct *task, enum pid_type type,
   struct pid *pid);
extern void detach_pid(struct task_struct *task, enum pid_type);
extern void change_pid(struct task_struct *task, enum pid_type,
   struct pid *pid);
extern void transfer_pid(struct task_struct *old, struct task_struct *new,
    enum pid_type);

struct pid_namespace;
extern struct pid_namespace init_pid_ns;
# 112 "include/linux/pid.h"
extern struct pid *find_pid_ns(int nr, struct pid_namespace *ns);
extern struct pid *find_vpid(int nr);




extern struct pid *find_get_pid(int nr);
extern struct pid *find_ge_pid(int nr, struct pid_namespace *);
int next_pidmap(struct pid_namespace *pid_ns, int last);

extern struct pid *alloc_pid(struct pid_namespace *ns);
extern void free_pid(struct pid *pid);
# 135 "include/linux/pid.h"
static inline __attribute__((always_inline)) struct pid_namespace *ns_of_pid(struct pid *pid)
{
 struct pid_namespace *ns = ((void *)0);
 if (pid)
  ns = pid->numbers[pid->level].ns;
 return ns;
}
# 154 "include/linux/pid.h"
static inline __attribute__((always_inline)) pid_t pid_nr(struct pid *pid)
{
 pid_t nr = 0;
 if (pid)
  nr = pid->numbers[0].nr;
 return nr;
}

pid_t pid_nr_ns(struct pid *pid, struct pid_namespace *ns);
pid_t pid_vnr(struct pid *pid);
# 382 "include/linux/fs.h" 2

# 1 "include/linux/capability.h" 1
# 18 "include/linux/capability.h"
struct task_struct;
# 40 "include/linux/capability.h"
typedef struct __user_cap_header_struct {
 __u32 version;
 int pid;
} *cap_user_header_t;

typedef struct __user_cap_data_struct {
        __u32 effective;
        __u32 permitted;
        __u32 inheritable;
} *cap_user_data_t;
# 69 "include/linux/capability.h"
struct vfs_cap_data {
 __le32 magic_etc;
 struct {
  __le32 permitted;
  __le32 inheritable;
 } data[2];
};
# 92 "include/linux/capability.h"
extern int file_caps_enabled;

typedef struct kernel_cap_struct {
 __u32 cap[2];
} kernel_cap_t;


struct cpu_vfs_cap_data {
 __u32 magic_etc;
 kernel_cap_t permitted;
 kernel_cap_t inheritable;
};
# 439 "include/linux/capability.h"
static inline __attribute__((always_inline)) kernel_cap_t cap_combine(const kernel_cap_t a,
           const kernel_cap_t b)
{
 kernel_cap_t dest;
 do { unsigned __capi; for (__capi = 0; __capi < 2; ++__capi) { dest.cap[__capi] = a.cap[__capi] | b.cap[__capi]; } } while (0);
 return dest;
}

static inline __attribute__((always_inline)) kernel_cap_t cap_intersect(const kernel_cap_t a,
      const kernel_cap_t b)
{
 kernel_cap_t dest;
 do { unsigned __capi; for (__capi = 0; __capi < 2; ++__capi) { dest.cap[__capi] = a.cap[__capi] & b.cap[__capi]; } } while (0);
 return dest;
}

static inline __attribute__((always_inline)) kernel_cap_t cap_drop(const kernel_cap_t a,
        const kernel_cap_t drop)
{
 kernel_cap_t dest;
 do { unsigned __capi; for (__capi = 0; __capi < 2; ++__capi) { dest.cap[__capi] = a.cap[__capi] &~ drop.cap[__capi]; } } while (0);
 return dest;
}

static inline __attribute__((always_inline)) kernel_cap_t cap_invert(const kernel_cap_t c)
{
 kernel_cap_t dest;
 do { unsigned __capi; for (__capi = 0; __capi < 2; ++__capi) { dest.cap[__capi] = ~ c.cap[__capi]; } } while (0);
 return dest;
}

static inline __attribute__((always_inline)) int cap_isclear(const kernel_cap_t a)
{
 unsigned __capi;
 for (__capi = 0; __capi < 2; ++__capi) {
  if (a.cap[__capi] != 0)
   return 0;
 }
 return 1;
}
# 487 "include/linux/capability.h"
static inline __attribute__((always_inline)) int cap_issubset(const kernel_cap_t a, const kernel_cap_t set)
{
 kernel_cap_t dest;
 dest = cap_drop(a, set);
 return cap_isclear(dest);
}



static inline __attribute__((always_inline)) int cap_is_fs_cap(int cap)
{
 const kernel_cap_t __cap_fs_set = ((kernel_cap_t){{ ((1 << ((0) & 31)) | (1 << ((27) & 31)) | (1 << ((1) & 31)) | (1 << ((2) & 31)) | (1 << ((3) & 31)) | (1 << ((4) & 31))) | (1 << ((9) & 31)), ((1 << ((32) & 31))) } });
 return !!((1 << ((cap) & 31)) & __cap_fs_set.cap[((cap) >> 5)]);
}

static inline __attribute__((always_inline)) kernel_cap_t cap_drop_fs_set(const kernel_cap_t a)
{
 const kernel_cap_t __cap_fs_set = ((kernel_cap_t){{ ((1 << ((0) & 31)) | (1 << ((27) & 31)) | (1 << ((1) & 31)) | (1 << ((2) & 31)) | (1 << ((3) & 31)) | (1 << ((4) & 31))) | (1 << ((9) & 31)), ((1 << ((32) & 31))) } });
 return cap_drop(a, __cap_fs_set);
}

static inline __attribute__((always_inline)) kernel_cap_t cap_raise_fs_set(const kernel_cap_t a,
         const kernel_cap_t permitted)
{
 const kernel_cap_t __cap_fs_set = ((kernel_cap_t){{ ((1 << ((0) & 31)) | (1 << ((27) & 31)) | (1 << ((1) & 31)) | (1 << ((2) & 31)) | (1 << ((3) & 31)) | (1 << ((4) & 31))) | (1 << ((9) & 31)), ((1 << ((32) & 31))) } });
 return cap_combine(a,
      cap_intersect(permitted, __cap_fs_set));
}

static inline __attribute__((always_inline)) kernel_cap_t cap_drop_nfsd_set(const kernel_cap_t a)
{
 const kernel_cap_t __cap_fs_set = ((kernel_cap_t){{ ((1 << ((0) & 31)) | (1 << ((27) & 31)) | (1 << ((1) & 31)) | (1 << ((2) & 31)) | (1 << ((3) & 31)) | (1 << ((4) & 31))) | (1 << ((24) & 31)), ((1 << ((32) & 31))) } });
 return cap_drop(a, __cap_fs_set);
}

static inline __attribute__((always_inline)) kernel_cap_t cap_raise_nfsd_set(const kernel_cap_t a,
           const kernel_cap_t permitted)
{
 const kernel_cap_t __cap_nfsd_set = ((kernel_cap_t){{ ((1 << ((0) & 31)) | (1 << ((27) & 31)) | (1 << ((1) & 31)) | (1 << ((2) & 31)) | (1 << ((3) & 31)) | (1 << ((4) & 31))) | (1 << ((24) & 31)), ((1 << ((32) & 31))) } });
 return cap_combine(a,
      cap_intersect(permitted, __cap_nfsd_set));
}

extern const kernel_cap_t __cap_empty_set;
extern const kernel_cap_t __cap_full_set;
extern const kernel_cap_t __cap_init_eff_set;
# 560 "include/linux/capability.h"
extern int capable(int cap);


struct dentry;
extern int get_vfs_caps_from_disk(const struct dentry *dentry, struct cpu_vfs_cap_data *cpu_caps);
# 384 "include/linux/fs.h" 2
# 1 "include/linux/semaphore.h" 1
# 16 "include/linux/semaphore.h"
struct semaphore {
 spinlock_t lock;
 unsigned int count;
 struct list_head wait_list;
};
# 35 "include/linux/semaphore.h"
static inline __attribute__((always_inline)) void sema_init(struct semaphore *sem, int val)
{
 static struct lock_class_key __key;
 *sem = (struct semaphore) { .lock = (spinlock_t ) { { .rlock = { .raw_lock = { .lock = 0 }, } } }, .count = val, .wait_list = { &((*sem).wait_list), &((*sem).wait_list) }, };
 do { (void)("semaphore->lock"); (void)(&__key); } while (0);
}




extern void down(struct semaphore *sem);
extern int down_interruptible(struct semaphore *sem);
extern int down_killable(struct semaphore *sem);
extern int down_trylock(struct semaphore *sem);
extern int down_timeout(struct semaphore *sem, long jiffies);
extern void up(struct semaphore *sem);
# 385 "include/linux/fs.h" 2
# 1 "include/linux/fiemap.h" 1
# 16 "include/linux/fiemap.h"
struct fiemap_extent {
 __u64 fe_logical;

 __u64 fe_physical;

 __u64 fe_length;
 __u64 fe_reserved64[2];
 __u32 fe_flags;
 __u32 fe_reserved[3];
};

struct fiemap {
 __u64 fm_start;

 __u64 fm_length;

 __u32 fm_flags;
 __u32 fm_mapped_extents;
 __u32 fm_extent_count;
 __u32 fm_reserved;
 struct fiemap_extent fm_extents[0];
};
# 386 "include/linux/fs.h" 2




struct export_operations;
struct hd_geometry;
struct iovec;
struct nameidata;
struct kiocb;
struct pipe_inode_info;
struct poll_table_struct;
struct kstatfs;
struct vm_area_struct;
struct vfsmount;
struct cred;

extern void __attribute__ ((__section__(".init.text"))) __attribute__((__cold__)) __attribute__((no_instrument_function)) inode_init(void);
extern void __attribute__ ((__section__(".init.text"))) __attribute__((__cold__)) __attribute__((no_instrument_function)) inode_init_early(void);
extern void __attribute__ ((__section__(".init.text"))) __attribute__((__cold__)) __attribute__((no_instrument_function)) files_init(unsigned long);

extern struct files_stat_struct files_stat;
extern int get_max_files(void);
extern int sysctl_nr_open;
extern struct inodes_stat_t inodes_stat;
extern int leases_enable, lease_break_time;

struct buffer_head;
typedef int (get_block_t)(struct inode *inode, sector_t iblock,
   struct buffer_head *bh_result, int create);
typedef void (dio_iodone_t)(struct kiocb *iocb, loff_t offset,
   ssize_t bytes, void *private, int ret,
   int is_async);
# 450 "include/linux/fs.h"
struct iattr {
 unsigned int ia_valid;
 umode_t ia_mode;
 uid_t ia_uid;
 gid_t ia_gid;
 loff_t ia_size;
 struct timespec ia_atime;
 struct timespec ia_mtime;
 struct timespec ia_ctime;






 struct file *ia_file;
};




# 1 "include/linux/quota.h" 1
# 88 "include/linux/quota.h"
enum {
 QIF_BLIMITS_B = 0,
 QIF_SPACE_B,
 QIF_ILIMITS_B,
 QIF_INODES_B,
 QIF_BTIME_B,
 QIF_ITIME_B,
};
# 108 "include/linux/quota.h"
struct if_dqblk {
 __u64 dqb_bhardlimit;
 __u64 dqb_bsoftlimit;
 __u64 dqb_curspace;
 __u64 dqb_ihardlimit;
 __u64 dqb_isoftlimit;
 __u64 dqb_curinodes;
 __u64 dqb_btime;
 __u64 dqb_itime;
 __u32 dqb_valid;
};
# 129 "include/linux/quota.h"
struct if_dqinfo {
 __u64 dqi_bgrace;
 __u64 dqi_igrace;
 __u32 dqi_flags;
 __u32 dqi_valid;
};
# 151 "include/linux/quota.h"
enum {
 QUOTA_NL_C_UNSPEC,
 QUOTA_NL_C_WARNING,
 __QUOTA_NL_C_MAX,
};


enum {
 QUOTA_NL_A_UNSPEC,
 QUOTA_NL_A_QTYPE,
 QUOTA_NL_A_EXCESS_ID,
 QUOTA_NL_A_WARNING,
 QUOTA_NL_A_DEV_MAJOR,
 QUOTA_NL_A_DEV_MINOR,
 QUOTA_NL_A_CAUSED_ID,
 __QUOTA_NL_A_MAX,
};
# 177 "include/linux/quota.h"
# 1 "include/linux/percpu_counter.h" 1
# 18 "include/linux/percpu_counter.h"
struct percpu_counter {
 spinlock_t lock;
 s64 count;



 s32 *counters;
};

extern int percpu_counter_batch;

int __percpu_counter_init(struct percpu_counter *fbc, s64 amount,
     struct lock_class_key *key);
# 39 "include/linux/percpu_counter.h"
void percpu_counter_destroy(struct percpu_counter *fbc);
void percpu_counter_set(struct percpu_counter *fbc, s64 amount);
void __percpu_counter_add(struct percpu_counter *fbc, s64 amount, s32 batch);
s64 __percpu_counter_sum(struct percpu_counter *fbc);
int percpu_counter_compare(struct percpu_counter *fbc, s64 rhs);

static inline __attribute__((always_inline)) void percpu_counter_add(struct percpu_counter *fbc, s64 amount)
{
 __percpu_counter_add(fbc, amount, percpu_counter_batch);
}

static inline __attribute__((always_inline)) s64 percpu_counter_sum_positive(struct percpu_counter *fbc)
{
 s64 ret = __percpu_counter_sum(fbc);
 return ret < 0 ? 0 : ret;
}

static inline __attribute__((always_inline)) s64 percpu_counter_sum(struct percpu_counter *fbc)
{
 return __percpu_counter_sum(fbc);
}

static inline __attribute__((always_inline)) s64 percpu_counter_read(struct percpu_counter *fbc)
{
 return fbc->count;
}






static inline __attribute__((always_inline)) s64 percpu_counter_read_positive(struct percpu_counter *fbc)
{
 s64 ret = fbc->count;

 __asm__ __volatile__("": : :"memory");
 if (ret >= 0)
  return ret;
 return 1;
}
# 148 "include/linux/percpu_counter.h"
static inline __attribute__((always_inline)) void percpu_counter_inc(struct percpu_counter *fbc)
{
 percpu_counter_add(fbc, 1);
}

static inline __attribute__((always_inline)) void percpu_counter_dec(struct percpu_counter *fbc)
{
 percpu_counter_add(fbc, -1);
}

static inline __attribute__((always_inline)) void percpu_counter_sub(struct percpu_counter *fbc, s64 amount)
{
 percpu_counter_add(fbc, -amount);
}
# 178 "include/linux/quota.h" 2

# 1 "include/linux/dqblk_xfs.h" 1
# 50 "include/linux/dqblk_xfs.h"
typedef struct fs_disk_quota {
 __s8 d_version;
 __s8 d_flags;
 __u16 d_fieldmask;
 __u32 d_id;
 __u64 d_blk_hardlimit;
 __u64 d_blk_softlimit;
 __u64 d_ino_hardlimit;
 __u64 d_ino_softlimit;
 __u64 d_bcount;
 __u64 d_icount;
 __s32 d_itimer;

 __s32 d_btimer;
 __u16 d_iwarns;
 __u16 d_bwarns;
 __s32 d_padding2;
 __u64 d_rtb_hardlimit;
 __u64 d_rtb_softlimit;
 __u64 d_rtbcount;
 __s32 d_rtbtimer;
 __u16 d_rtbwarns;
 __s16 d_padding3;
 char d_padding4[8];
} fs_disk_quota_t;
# 146 "include/linux/dqblk_xfs.h"
typedef struct fs_qfilestat {
 __u64 qfs_ino;
 __u64 qfs_nblks;
 __u32 qfs_nextents;
} fs_qfilestat_t;

typedef struct fs_quota_stat {
 __s8 qs_version;
 __u16 qs_flags;
 __s8 qs_pad;
 fs_qfilestat_t qs_uquota;
 fs_qfilestat_t qs_gquota;
 __u32 qs_incoredqs;
 __s32 qs_btimelimit;
 __s32 qs_itimelimit;
 __s32 qs_rtbtimelimit;
 __u16 qs_bwarnlimit;
 __u16 qs_iwarnlimit;
} fs_quota_stat_t;
# 180 "include/linux/quota.h" 2
# 1 "include/linux/dqblk_v1.h" 1
# 181 "include/linux/quota.h" 2
# 1 "include/linux/dqblk_v2.h" 1







# 1 "include/linux/dqblk_qtree.h" 1
# 17 "include/linux/dqblk_qtree.h"
struct dquot;


struct qtree_fmt_operations {
 void (*mem2disk_dqblk)(void *disk, struct dquot *dquot);
 void (*disk2mem_dqblk)(struct dquot *dquot, void *disk);
 int (*is_id)(void *disk, struct dquot *dquot);
};


struct qtree_mem_dqinfo {
 struct super_block *dqi_sb;
 int dqi_type;
 unsigned int dqi_blocks;
 unsigned int dqi_free_blk;
 unsigned int dqi_free_entry;
 unsigned int dqi_blocksize_bits;
 unsigned int dqi_entry_size;
 unsigned int dqi_usable_bs;
 unsigned int dqi_qtree_depth;
 struct qtree_fmt_operations *dqi_ops;
};

int qtree_write_dquot(struct qtree_mem_dqinfo *info, struct dquot *dquot);
int qtree_read_dquot(struct qtree_mem_dqinfo *info, struct dquot *dquot);
int qtree_delete_dquot(struct qtree_mem_dqinfo *info, struct dquot *dquot);
int qtree_release_dquot(struct qtree_mem_dqinfo *info, struct dquot *dquot);
int qtree_entry_unused(struct qtree_mem_dqinfo *info, char *disk);
static inline __attribute__((always_inline)) int qtree_depth(struct qtree_mem_dqinfo *info)
{
 unsigned int epb = info->dqi_usable_bs >> 2;
 unsigned long long entries = epb;
 int i;

 for (i = 1; entries < (1ULL << 32); i++)
  entries *= epb;
 return i;
}
# 9 "include/linux/dqblk_v2.h" 2
# 182 "include/linux/quota.h" 2



typedef __kernel_uid32_t qid_t;
typedef long long qsize_t;

extern spinlock_t dq_data_lock;
# 200 "include/linux/quota.h"
struct mem_dqblk {
 qsize_t dqb_bhardlimit;
 qsize_t dqb_bsoftlimit;
 qsize_t dqb_curspace;
 qsize_t dqb_rsvspace;
 qsize_t dqb_ihardlimit;
 qsize_t dqb_isoftlimit;
 qsize_t dqb_curinodes;
 time_t dqb_btime;
 time_t dqb_itime;
};




struct quota_format_type;

struct mem_dqinfo {
 struct quota_format_type *dqi_format;
 int dqi_fmt_id;

 struct list_head dqi_dirty_list;
 unsigned long dqi_flags;
 unsigned int dqi_bgrace;
 unsigned int dqi_igrace;
 qsize_t dqi_maxblimit;
 qsize_t dqi_maxilimit;
 void *dqi_priv;
};

struct super_block;





extern void mark_info_dirty(struct super_block *sb, int type);
static inline __attribute__((always_inline)) int info_dirty(struct mem_dqinfo *info)
{
 return test_bit(16, &info->dqi_flags);
}

enum {
 DQST_LOOKUPS,
 DQST_DROPS,
 DQST_READS,
 DQST_WRITES,
 DQST_CACHE_HITS,
 DQST_ALLOC_DQUOTS,
 DQST_FREE_DQUOTS,
 DQST_SYNCS,
 _DQST_DQSTAT_LAST
};

struct dqstats {
 int stat[_DQST_DQSTAT_LAST];
 struct percpu_counter counter[_DQST_DQSTAT_LAST];
};

extern struct dqstats *dqstats_pcpu;
extern struct dqstats dqstats;

static inline __attribute__((always_inline)) void dqstats_inc(unsigned int type)
{
 percpu_counter_inc(&dqstats.counter[type]);
}

static inline __attribute__((always_inline)) void dqstats_dec(unsigned int type)
{
 percpu_counter_dec(&dqstats.counter[type]);
}
# 284 "include/linux/quota.h"
struct dquot {
 struct hlist_node dq_hash;
 struct list_head dq_inuse;
 struct list_head dq_free;
 struct list_head dq_dirty;
 struct mutex dq_lock;
 atomic_t dq_count;
 wait_queue_head_t dq_wait_unused;
 struct super_block *dq_sb;
 unsigned int dq_id;
 loff_t dq_off;
 unsigned long dq_flags;
 short dq_type;
 struct mem_dqblk dq_dqb;
};


struct quota_format_ops {
 int (*check_quota_file)(struct super_block *sb, int type);
 int (*read_file_info)(struct super_block *sb, int type);
 int (*write_file_info)(struct super_block *sb, int type);
 int (*free_file_info)(struct super_block *sb, int type);
 int (*read_dqblk)(struct dquot *dquot);
 int (*commit_dqblk)(struct dquot *dquot);
 int (*release_dqblk)(struct dquot *dquot);
};


struct dquot_operations {
 int (*write_dquot) (struct dquot *);
 struct dquot *(*alloc_dquot)(struct super_block *, int);
 void (*destroy_dquot)(struct dquot *);
 int (*acquire_dquot) (struct dquot *);
 int (*release_dquot) (struct dquot *);
 int (*mark_dirty) (struct dquot *);
 int (*write_info) (struct super_block *, int);


 qsize_t *(*get_reserved_space) (struct inode *);
};


struct quotactl_ops {
 int (*quota_on)(struct super_block *, int, int, char *);
 int (*quota_off)(struct super_block *, int);
 int (*quota_sync)(struct super_block *, int, int);
 int (*get_info)(struct super_block *, int, struct if_dqinfo *);
 int (*set_info)(struct super_block *, int, struct if_dqinfo *);
 int (*get_dqblk)(struct super_block *, int, qid_t, struct fs_disk_quota *);
 int (*set_dqblk)(struct super_block *, int, qid_t, struct fs_disk_quota *);
 int (*get_xstate)(struct super_block *, struct fs_quota_stat *);
 int (*set_xstate)(struct super_block *, unsigned int, int);
};

struct quota_format_type {
 int qf_fmt_id;
 const struct quota_format_ops *qf_ops;
 struct module *qf_owner;
 struct quota_format_type *qf_next;
};


enum {
 _DQUOT_USAGE_ENABLED = 0,
 _DQUOT_LIMITS_ENABLED,
 _DQUOT_SUSPENDED,


 _DQUOT_STATE_FLAGS
};
# 371 "include/linux/quota.h"
static inline __attribute__((always_inline)) unsigned int dquot_state_flag(unsigned int flags, int type)
{
 return flags << _DQUOT_STATE_FLAGS * type;
}

static inline __attribute__((always_inline)) unsigned int dquot_generic_flag(unsigned int flags, int type)
{
 return (flags >> _DQUOT_STATE_FLAGS * type) & ((1 << _DQUOT_USAGE_ENABLED) | (1 << _DQUOT_LIMITS_ENABLED) | (1 << _DQUOT_SUSPENDED));
}





static inline __attribute__((always_inline)) void quota_send_warning(short type, unsigned int id, dev_t dev,
          const char warntype)
{
 return;
}


struct quota_info {
 unsigned int flags;
 struct mutex dqio_mutex;
 struct mutex dqonoff_mutex;
 struct rw_semaphore dqptr_sem;
 struct inode *files[2];
 struct mem_dqinfo info[2];
 const struct quota_format_ops *ops[2];
};

int register_quota_format(struct quota_format_type *fmt);
void unregister_quota_format(struct quota_format_type *fmt);

struct quota_module_name {
 int qm_fmt_id;
 char *qm_mod_name;
};
# 472 "include/linux/fs.h" 2
# 499 "include/linux/fs.h"
enum positive_aop_returns {
 AOP_WRITEPAGE_ACTIVATE = 0x80000,
 AOP_TRUNCATED_PAGE = 0x80001,
};
# 513 "include/linux/fs.h"
struct page;
struct address_space;
struct writeback_control;

struct iov_iter {
 const struct iovec *iov;
 unsigned long nr_segs;
 size_t iov_offset;
 size_t count;
};

size_t iov_iter_copy_from_user_atomic(struct page *page,
  struct iov_iter *i, unsigned long offset, size_t bytes);
size_t iov_iter_copy_from_user(struct page *page,
  struct iov_iter *i, unsigned long offset, size_t bytes);
void iov_iter_advance(struct iov_iter *i, size_t bytes);
int iov_iter_fault_in_readable(struct iov_iter *i, size_t bytes);
size_t iov_iter_single_seg_count(struct iov_iter *i);

static inline __attribute__((always_inline)) void iov_iter_init(struct iov_iter *i,
   const struct iovec *iov, unsigned long nr_segs,
   size_t count, size_t written)
{
 i->iov = iov;
 i->nr_segs = nr_segs;
 i->iov_offset = 0;
 i->count = count + written;

 iov_iter_advance(i, written);
}

static inline __attribute__((always_inline)) size_t iov_iter_count(struct iov_iter *i)
{
 return i->count;
}
# 558 "include/linux/fs.h"
typedef struct {
 size_t written;
 size_t count;
 union {
  char *buf;
  void *data;
 } arg;
 int error;
} read_descriptor_t;

typedef int (*read_actor_t)(read_descriptor_t *, struct page *,
  unsigned long, unsigned long);

struct address_space_operations {
 int (*writepage)(struct page *page, struct writeback_control *wbc);
 int (*readpage)(struct file *, struct page *);
 void (*sync_page)(struct page *);


 int (*writepages)(struct address_space *, struct writeback_control *);


 int (*set_page_dirty)(struct page *page);

 int (*readpages)(struct file *filp, struct address_space *mapping,
   struct list_head *pages, unsigned nr_pages);

 int (*write_begin)(struct file *, struct address_space *mapping,
    loff_t pos, unsigned len, unsigned flags,
    struct page **pagep, void **fsdata);
 int (*write_end)(struct file *, struct address_space *mapping,
    loff_t pos, unsigned len, unsigned copied,
    struct page *page, void *fsdata);


 sector_t (*bmap)(struct address_space *, sector_t);
 void (*invalidatepage) (struct page *, unsigned long);
 int (*releasepage) (struct page *, gfp_t);
 ssize_t (*direct_IO)(int, struct kiocb *, const struct iovec *iov,
   loff_t offset, unsigned long nr_segs);
 int (*get_xip_mem)(struct address_space *, unsigned long, int,
      void **, unsigned long *);

 int (*migratepage) (struct address_space *,
   struct page *, struct page *);
 int (*launder_page) (struct page *);
 int (*is_partially_uptodate) (struct page *, read_descriptor_t *,
     unsigned long);
 int (*error_remove_page)(struct address_space *, struct page *);
};





int pagecache_write_begin(struct file *, struct address_space *mapping,
    loff_t pos, unsigned len, unsigned flags,
    struct page **pagep, void **fsdata);

int pagecache_write_end(struct file *, struct address_space *mapping,
    loff_t pos, unsigned len, unsigned copied,
    struct page *page, void *fsdata);

struct backing_dev_info;
struct address_space {
 struct inode *host;
 struct radix_tree_root page_tree;
 spinlock_t tree_lock;
 unsigned int i_mmap_writable;
 struct prio_tree_root i_mmap;
 struct list_head i_mmap_nonlinear;
 spinlock_t i_mmap_lock;
 unsigned int truncate_count;
 unsigned long nrpages;
 unsigned long writeback_index;
 const struct address_space_operations *a_ops;
 unsigned long flags;
 struct backing_dev_info *backing_dev_info;
 spinlock_t private_lock;
 struct list_head private_list;
 struct address_space *assoc_mapping;
} __attribute__((aligned(sizeof(long))));






struct block_device {
 dev_t bd_dev;
 struct inode * bd_inode;
 struct super_block * bd_super;
 int bd_openers;
 struct mutex bd_mutex;
 struct list_head bd_inodes;
 void * bd_claiming;
 void * bd_holder;
 int bd_holders;



 struct block_device * bd_contains;
 unsigned bd_block_size;
 struct hd_struct * bd_part;

 unsigned bd_part_count;
 int bd_invalidated;
 struct gendisk * bd_disk;
 struct list_head bd_list;






 unsigned long bd_private;


 int bd_fsfreeze_count;

 struct mutex bd_fsfreeze_mutex;
};
# 689 "include/linux/fs.h"
int mapping_tagged(struct address_space *mapping, int tag);




static inline __attribute__((always_inline)) int mapping_mapped(struct address_space *mapping)
{
 return !prio_tree_empty(&mapping->i_mmap) ||
  !list_empty(&mapping->i_mmap_nonlinear);
}







static inline __attribute__((always_inline)) int mapping_writably_mapped(struct address_space *mapping)
{
 return mapping->i_mmap_writable != 0;
}
# 722 "include/linux/fs.h"
struct posix_acl;


struct inode {
 struct hlist_node i_hash;
 struct list_head i_list;
 struct list_head i_sb_list;
 struct list_head i_dentry;
 unsigned long i_ino;
 atomic_t i_count;
 unsigned int i_nlink;
 uid_t i_uid;
 gid_t i_gid;
 dev_t i_rdev;
 unsigned int i_blkbits;
 u64 i_version;
 loff_t i_size;

 seqcount_t i_size_seqcount;

 struct timespec i_atime;
 struct timespec i_mtime;
 struct timespec i_ctime;
 blkcnt_t i_blocks;
 unsigned short i_bytes;
 umode_t i_mode;
 spinlock_t i_lock;
 struct mutex i_mutex;
 struct rw_semaphore i_alloc_sem;
 const struct inode_operations *i_op;
 const struct file_operations *i_fop;
 struct super_block *i_sb;
 struct file_lock *i_flock;
 struct address_space *i_mapping;
 struct address_space i_data;



 struct list_head i_devices;
 union {
  struct pipe_inode_info *i_pipe;
  struct block_device *i_bdev;
  struct cdev *i_cdev;
 };

 __u32 i_generation;


 __u32 i_fsnotify_mask;
 struct hlist_head i_fsnotify_marks;


 unsigned long i_state;
 unsigned long dirtied_when;

 unsigned int i_flags;

 atomic_t i_writecount;




 struct posix_acl *i_acl;
 struct posix_acl *i_default_acl;

 void *i_private;
};
# 801 "include/linux/fs.h"
enum inode_i_mutex_lock_class
{
 I_MUTEX_NORMAL,
 I_MUTEX_PARENT,
 I_MUTEX_CHILD,
 I_MUTEX_XATTR,
 I_MUTEX_QUOTA
};
# 820 "include/linux/fs.h"
static inline __attribute__((always_inline)) loff_t i_size_read(const struct inode *inode)
{

 loff_t i_size;
 unsigned int seq;

 do {
  seq = read_seqcount_begin(&inode->i_size_seqcount);
  i_size = inode->i_size;
 } while (read_seqcount_retry(&inode->i_size_seqcount, seq));
 return i_size;
# 841 "include/linux/fs.h"
}






static inline __attribute__((always_inline)) void i_size_write(struct inode *inode, loff_t i_size)
{

 write_seqcount_begin(&inode->i_size_seqcount);
 inode->i_size = i_size;
 write_seqcount_end(&inode->i_size_seqcount);







}

static inline __attribute__((always_inline)) unsigned iminor(const struct inode *inode)
{
 return ((unsigned int) ((inode->i_rdev) & ((1U << 20) - 1)));
}

static inline __attribute__((always_inline)) unsigned imajor(const struct inode *inode)
{
 return ((unsigned int) ((inode->i_rdev) >> 20));
}

extern struct block_device *I_BDEV(struct inode *inode);

struct fown_struct {
 rwlock_t lock;
 struct pid *pid;
 enum pid_type pid_type;
 uid_t uid, euid;
 int signum;
};




struct file_ra_state {
 unsigned long start;
 unsigned int size;
 unsigned int async_size;


 unsigned int ra_pages;
 unsigned int mmap_miss;
 loff_t prev_pos;
};




static inline __attribute__((always_inline)) int ra_has_index(struct file_ra_state *ra, unsigned long index)
{
 return (index >= ra->start &&
  index < ra->start + ra->size);
}




struct file {




 union {
  struct list_head fu_list;
  struct rcu_head fu_rcuhead;
 } f_u;
 struct path f_path;


 const struct file_operations *f_op;
 spinlock_t f_lock;

 int f_sb_list_cpu;

 atomic_long_t f_count;
 unsigned int f_flags;
 fmode_t f_mode;
 loff_t f_pos;
 struct fown_struct f_owner;
 const struct cred *f_cred;
 struct file_ra_state f_ra;

 u64 f_version;




 void *private_data;



 struct list_head f_ep_links;

 struct address_space *f_mapping;



};
# 988 "include/linux/fs.h"
static inline __attribute__((always_inline)) void file_take_write(struct file *filp) {}
static inline __attribute__((always_inline)) void file_release_write(struct file *filp) {}
static inline __attribute__((always_inline)) void file_reset_write(struct file *filp) {}
static inline __attribute__((always_inline)) void file_check_state(struct file *filp) {}
static inline __attribute__((always_inline)) int file_check_writeable(struct file *filp)
{
 return 0;
}
# 1029 "include/linux/fs.h"
typedef struct files_struct *fl_owner_t;

struct file_lock_operations {
 void (*fl_copy_lock)(struct file_lock *, struct file_lock *);
 void (*fl_release_private)(struct file_lock *);
};

struct lock_manager_operations {
 int (*fl_compare_owner)(struct file_lock *, struct file_lock *);
 void (*fl_notify)(struct file_lock *);
 int (*fl_grant)(struct file_lock *, struct file_lock *, int);
 void (*fl_copy_lock)(struct file_lock *, struct file_lock *);
 void (*fl_release_private)(struct file_lock *);
 void (*fl_break)(struct file_lock *);
 int (*fl_mylease)(struct file_lock *, struct file_lock *);
 int (*fl_change)(struct file_lock **, int);
};

struct lock_manager {
 struct list_head list;
};

void locks_start_grace(struct lock_manager *);
void locks_end_grace(struct lock_manager *);
int locks_in_grace(void);


# 1 "include/linux/nfs_fs_i.h" 1





# 1 "include/linux/nfs.h" 1
# 40 "include/linux/nfs.h"
 enum nfs_stat {
 NFS_OK = 0,
 NFSERR_PERM = 1,
 NFSERR_NOENT = 2,
 NFSERR_IO = 5,
 NFSERR_NXIO = 6,
 NFSERR_EAGAIN = 11,
 NFSERR_ACCES = 13,
 NFSERR_EXIST = 17,
 NFSERR_XDEV = 18,
 NFSERR_NODEV = 19,
 NFSERR_NOTDIR = 20,
 NFSERR_ISDIR = 21,
 NFSERR_INVAL = 22,
 NFSERR_FBIG = 27,
 NFSERR_NOSPC = 28,
 NFSERR_ROFS = 30,
 NFSERR_MLINK = 31,
 NFSERR_OPNOTSUPP = 45,
 NFSERR_NAMETOOLONG = 63,
 NFSERR_NOTEMPTY = 66,
 NFSERR_DQUOT = 69,
 NFSERR_STALE = 70,
 NFSERR_REMOTE = 71,
 NFSERR_WFLUSH = 99,
 NFSERR_BADHANDLE = 10001,
 NFSERR_NOT_SYNC = 10002,
 NFSERR_BAD_COOKIE = 10003,
 NFSERR_NOTSUPP = 10004,
 NFSERR_TOOSMALL = 10005,
 NFSERR_SERVERFAULT = 10006,
 NFSERR_BADTYPE = 10007,
 NFSERR_JUKEBOX = 10008,
 NFSERR_SAME = 10009,
 NFSERR_DENIED = 10010,
 NFSERR_EXPIRED = 10011,
 NFSERR_LOCKED = 10012,
 NFSERR_GRACE = 10013,
 NFSERR_FHEXPIRED = 10014,
 NFSERR_SHARE_DENIED = 10015,
 NFSERR_WRONGSEC = 10016,
 NFSERR_CLID_INUSE = 10017,
 NFSERR_RESOURCE = 10018,
 NFSERR_MOVED = 10019,
 NFSERR_NOFILEHANDLE = 10020,
 NFSERR_MINOR_VERS_MISMATCH = 10021,
 NFSERR_STALE_CLIENTID = 10022,
 NFSERR_STALE_STATEID = 10023,
 NFSERR_OLD_STATEID = 10024,
 NFSERR_BAD_STATEID = 10025,
 NFSERR_BAD_SEQID = 10026,
 NFSERR_NOT_SAME = 10027,
 NFSERR_LOCK_RANGE = 10028,
 NFSERR_SYMLINK = 10029,
 NFSERR_RESTOREFH = 10030,
 NFSERR_LEASE_MOVED = 10031,
 NFSERR_ATTRNOTSUPP = 10032,
 NFSERR_NO_GRACE = 10033,
 NFSERR_RECLAIM_BAD = 10034,
 NFSERR_RECLAIM_CONFLICT = 10035,
 NFSERR_BAD_XDR = 10036,
 NFSERR_LOCKS_HELD = 10037,
 NFSERR_OPENMODE = 10038,
 NFSERR_BADOWNER = 10039,
 NFSERR_BADCHAR = 10040,
 NFSERR_BADNAME = 10041,
 NFSERR_BAD_RANGE = 10042,
 NFSERR_LOCK_NOTSUPP = 10043,
 NFSERR_OP_ILLEGAL = 10044,
 NFSERR_DEADLOCK = 10045,
 NFSERR_FILE_OPEN = 10046,
 NFSERR_ADMIN_REVOKED = 10047,
 NFSERR_CB_PATH_DOWN = 10048,
};



enum nfs_ftype {
 NFNON = 0,
 NFREG = 1,
 NFDIR = 2,
 NFBLK = 3,
 NFCHR = 4,
 NFLNK = 5,
 NFSOCK = 6,
 NFBAD = 7,
 NFFIFO = 8
};


# 1 "include/linux/sunrpc/msg_prot.h" 1
# 18 "include/linux/sunrpc/msg_prot.h"
typedef u32 rpc_authflavor_t;

enum rpc_auth_flavors {
 RPC_AUTH_NULL = 0,
 RPC_AUTH_UNIX = 1,
 RPC_AUTH_SHORT = 2,
 RPC_AUTH_DES = 3,
 RPC_AUTH_KRB = 4,
 RPC_AUTH_GSS = 6,
 RPC_AUTH_MAXFLAVOR = 8,

 RPC_AUTH_GSS_KRB5 = 390003,
 RPC_AUTH_GSS_KRB5I = 390004,
 RPC_AUTH_GSS_KRB5P = 390005,
 RPC_AUTH_GSS_LKEY = 390006,
 RPC_AUTH_GSS_LKEYI = 390007,
 RPC_AUTH_GSS_LKEYP = 390008,
 RPC_AUTH_GSS_SPKM = 390009,
 RPC_AUTH_GSS_SPKMI = 390010,
 RPC_AUTH_GSS_SPKMP = 390011,
};




enum rpc_msg_type {
 RPC_CALL = 0,
 RPC_REPLY = 1
};

enum rpc_reply_stat {
 RPC_MSG_ACCEPTED = 0,
 RPC_MSG_DENIED = 1
};

enum rpc_accept_stat {
 RPC_SUCCESS = 0,
 RPC_PROG_UNAVAIL = 1,
 RPC_PROG_MISMATCH = 2,
 RPC_PROC_UNAVAIL = 3,
 RPC_GARBAGE_ARGS = 4,
 RPC_SYSTEM_ERR = 5,

 RPC_DROP_REPLY = 60000,
};

enum rpc_reject_stat {
 RPC_MISMATCH = 0,
 RPC_AUTH_ERROR = 1
};

enum rpc_auth_stat {
 RPC_AUTH_OK = 0,
 RPC_AUTH_BADCRED = 1,
 RPC_AUTH_REJECTEDCRED = 2,
 RPC_AUTH_BADVERF = 3,
 RPC_AUTH_REJECTEDVERF = 4,
 RPC_AUTH_TOOWEAK = 5,

 RPCSEC_GSS_CREDPROBLEM = 13,
 RPCSEC_GSS_CTXPROBLEM = 14
};
# 102 "include/linux/sunrpc/msg_prot.h"
typedef __be32 rpc_fraghdr;
# 193 "include/linux/sunrpc/msg_prot.h"
# 1 "include/linux/inet.h" 1
# 54 "include/linux/inet.h"
extern __be32 in_aton(const char *str);
extern int in4_pton(const char *src, int srclen, u8 *dst, int delim, const char **end);
extern int in6_pton(const char *src, int srclen, u8 *dst, int delim, const char **end);
# 194 "include/linux/sunrpc/msg_prot.h" 2
# 131 "include/linux/nfs.h" 2






struct nfs_fh {
 unsigned short size;
 unsigned char data[128];
};





static inline __attribute__((always_inline)) int nfs_compare_fh(const struct nfs_fh *a, const struct nfs_fh *b)
{
 return a->size != b->size || memcmp(a->data, b->data, a->size) != 0;
}

static inline __attribute__((always_inline)) void nfs_copy_fh(struct nfs_fh *target, const struct nfs_fh *source)
{
 target->size = source->size;
 memcpy(target->data, source->data, source->size);
}
# 165 "include/linux/nfs.h"
enum nfs3_stable_how {
 NFS_UNSTABLE = 0,
 NFS_DATA_SYNC = 1,
 NFS_FILE_SYNC = 2
};
# 7 "include/linux/nfs_fs_i.h" 2

struct nlm_lockowner;




struct nfs_lock_info {
 u32 state;
 struct nlm_lockowner *owner;
 struct list_head list;
};

struct nfs4_lock_state;
struct nfs4_lock_info {
 struct nfs4_lock_state *owner;
};
# 1057 "include/linux/fs.h" 2

struct file_lock {
 struct file_lock *fl_next;
 struct list_head fl_link;
 struct list_head fl_block;
 fl_owner_t fl_owner;
 unsigned char fl_flags;
 unsigned char fl_type;
 unsigned int fl_pid;
 struct pid *fl_nspid;
 wait_queue_head_t fl_wait;
 struct file *fl_file;
 loff_t fl_start;
 loff_t fl_end;

 struct fasync_struct * fl_fasync;
 unsigned long fl_break_time;

 const struct file_lock_operations *fl_ops;
 const struct lock_manager_operations *fl_lmops;
 union {
  struct nfs_lock_info nfs_fl;
  struct nfs4_lock_info nfs4_fl;
  struct {
   struct list_head link;
   int state;
  } afs;
 } fl_u;
};
# 1094 "include/linux/fs.h"
# 1 "include/linux/fcntl.h" 1



# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/fcntl.h" 1
# 61 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/fcntl.h"
struct flock {
 short l_type;
 short l_whence;
 off_t l_start;
 off_t l_len;
 long l_sysid;
 __kernel_pid_t l_pid;
 long pad[4];
};





# 1 "include/asm-generic/fcntl.h" 1
# 123 "include/asm-generic/fcntl.h"
struct f_owner_ex {
 int type;
 pid_t pid;
};
# 185 "include/asm-generic/fcntl.h"
struct flock64 {
 short l_type;
 short l_whence;
 __kernel_loff_t l_start;
 __kernel_loff_t l_len;
 __kernel_pid_t l_pid;

};
# 76 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/fcntl.h" 2
# 5 "include/linux/fcntl.h" 2
# 1095 "include/linux/fs.h" 2





extern void send_sigio(struct fown_struct *fown, int fd, int band);


extern int fcntl_getlk(struct file *, struct flock *);
extern int fcntl_setlk(unsigned int, struct file *, unsigned int,
   struct flock *);


extern int fcntl_getlk64(struct file *, struct flock64 *);
extern int fcntl_setlk64(unsigned int, struct file *, unsigned int,
   struct flock64 *);


extern int fcntl_setlease(unsigned int fd, struct file *filp, long arg);
extern int fcntl_getlease(struct file *filp);


extern void locks_init_lock(struct file_lock *);
extern void locks_copy_lock(struct file_lock *, struct file_lock *);
extern void __locks_copy_lock(struct file_lock *, const struct file_lock *);
extern void locks_remove_posix(struct file *, fl_owner_t);
extern void locks_remove_flock(struct file *);
extern void locks_release_private(struct file_lock *);
extern void posix_test_lock(struct file *, struct file_lock *);
extern int posix_lock_file(struct file *, struct file_lock *, struct file_lock *);
extern int posix_lock_file_wait(struct file *, struct file_lock *);
extern int posix_unblock_lock(struct file *, struct file_lock *);
extern int vfs_test_lock(struct file *, struct file_lock *);
extern int vfs_lock_file(struct file *, unsigned int, struct file_lock *, struct file_lock *);
extern int vfs_cancel_lock(struct file *filp, struct file_lock *fl);
extern int flock_lock_file_wait(struct file *filp, struct file_lock *fl);
extern int __break_lease(struct inode *inode, unsigned int flags);
extern void lease_get_mtime(struct inode *, struct timespec *time);
extern int generic_setlease(struct file *, long, struct file_lock **);
extern int vfs_setlease(struct file *, long, struct file_lock **);
extern int lease_modify(struct file_lock **, int);
extern int lock_may_read(struct inode *, loff_t start, unsigned long count);
extern int lock_may_write(struct inode *, loff_t start, unsigned long count);
# 1283 "include/linux/fs.h"
struct fasync_struct {
 spinlock_t fa_lock;
 int magic;
 int fa_fd;
 struct fasync_struct *fa_next;
 struct file *fa_file;
 struct rcu_head fa_rcu;
};




extern int fasync_helper(int, struct file *, int, struct fasync_struct **);

extern void kill_fasync(struct fasync_struct **, int, int);

extern int __f_setown(struct file *filp, struct pid *, enum pid_type, int force);
extern int f_setown(struct file *filp, unsigned long arg, int force);
extern void f_delown(struct file *filp);
extern pid_t f_getown(struct file *filp);
extern int send_sigurg(struct fown_struct *fown);
# 1315 "include/linux/fs.h"
extern struct list_head super_blocks;
extern spinlock_t sb_lock;

struct super_block {
 struct list_head s_list;
 dev_t s_dev;
 unsigned char s_dirt;
 unsigned char s_blocksize_bits;
 unsigned long s_blocksize;
 loff_t s_maxbytes;
 struct file_system_type *s_type;
 const struct super_operations *s_op;
 const struct dquot_operations *dq_op;
 const struct quotactl_ops *s_qcop;
 const struct export_operations *s_export_op;
 unsigned long s_flags;
 unsigned long s_magic;
 struct dentry *s_root;
 struct rw_semaphore s_umount;
 struct mutex s_lock;
 int s_count;
 atomic_t s_active;



 const struct xattr_handler **s_xattr;

 struct list_head s_inodes;
 struct hlist_head s_anon;

 struct list_head *s_files;




 struct list_head s_dentry_lru;
 int s_nr_dentry_unused;

 struct block_device *s_bdev;
 struct backing_dev_info *s_bdi;
 struct mtd_info *s_mtd;
 struct list_head s_instances;
 struct quota_info s_dquot;

 int s_frozen;
 wait_queue_head_t s_wait_unfrozen;

 char s_id[32];

 void *s_fs_info;
 fmode_t s_mode;



 u32 s_time_gran;





 struct mutex s_vfs_rename_mutex;





 char *s_subtype;





 char *s_options;
};

extern struct timespec current_fs_time(struct super_block *sb);




enum {
 SB_UNFROZEN = 0,
 SB_FREEZE_WRITE = 1,
 SB_FREEZE_TRANS = 2,
};
# 1412 "include/linux/fs.h"
extern void lock_super(struct super_block *);
extern void unlock_super(struct super_block *);




extern int vfs_create(struct inode *, struct dentry *, int, struct nameidata *);
extern int vfs_mkdir(struct inode *, struct dentry *, int);
extern int vfs_mknod(struct inode *, struct dentry *, int, dev_t);
extern int vfs_symlink(struct inode *, struct dentry *, const char *);
extern int vfs_link(struct dentry *, struct inode *, struct dentry *);
extern int vfs_rmdir(struct inode *, struct dentry *);
extern int vfs_unlink(struct inode *, struct dentry *);
extern int vfs_rename(struct inode *, struct dentry *, struct inode *, struct dentry *);




extern void dentry_unhash(struct dentry *dentry);




extern int file_permission(struct file *, int);
extern void inode_init_owner(struct inode *inode, const struct inode *dir,
   mode_t mode);



struct fiemap_extent_info {
 unsigned int fi_flags;
 unsigned int fi_extents_mapped;
 unsigned int fi_extents_max;
 struct fiemap_extent *fi_extents_start;

};
int fiemap_fill_next_extent(struct fiemap_extent_info *info, u64 logical,
       u64 phys, u64 len, u32 flags);
int fiemap_check_flags(struct fiemap_extent_info *fieinfo, u32 fs_flags);
# 1474 "include/linux/fs.h"
typedef int (*filldir_t)(void *, const char *, int, loff_t, u64, unsigned);
struct block_device_operations;
# 1488 "include/linux/fs.h"
struct file_operations {
 struct module *owner;
 loff_t (*llseek) (struct file *, loff_t, int);
 ssize_t (*read) (struct file *, char *, size_t, loff_t *);
 ssize_t (*write) (struct file *, const char *, size_t, loff_t *);
 ssize_t (*aio_read) (struct kiocb *, const struct iovec *, unsigned long, loff_t);
 ssize_t (*aio_write) (struct kiocb *, const struct iovec *, unsigned long, loff_t);
 int (*readdir) (struct file *, void *, filldir_t);
 unsigned int (*poll) (struct file *, struct poll_table_struct *);
 long (*unlocked_ioctl) (struct file *, unsigned int, unsigned long);
 long (*compat_ioctl) (struct file *, unsigned int, unsigned long);
 int (*mmap) (struct file *, struct vm_area_struct *);
 int (*open) (struct inode *, struct file *);
 int (*flush) (struct file *, fl_owner_t id);
 int (*release) (struct inode *, struct file *);
 int (*fsync) (struct file *, int datasync);
 int (*aio_fsync) (struct kiocb *, int datasync);
 int (*fasync) (int, struct file *, int);
 int (*lock) (struct file *, int, struct file_lock *);
 ssize_t (*sendpage) (struct file *, struct page *, int, size_t, loff_t *, int);
 unsigned long (*get_unmapped_area)(struct file *, unsigned long, unsigned long, unsigned long, unsigned long);
 int (*check_flags)(int);
 int (*flock) (struct file *, int, struct file_lock *);
 ssize_t (*splice_write)(struct pipe_inode_info *, struct file *, loff_t *, size_t, unsigned int);
 ssize_t (*splice_read)(struct file *, loff_t *, struct pipe_inode_info *, size_t, unsigned int);
 int (*setlease)(struct file *, long, struct file_lock **);
};

struct inode_operations {
 int (*create) (struct inode *,struct dentry *,int, struct nameidata *);
 struct dentry * (*lookup) (struct inode *,struct dentry *, struct nameidata *);
 int (*link) (struct dentry *,struct inode *,struct dentry *);
 int (*unlink) (struct inode *,struct dentry *);
 int (*symlink) (struct inode *,struct dentry *,const char *);
 int (*mkdir) (struct inode *,struct dentry *,int);
 int (*rmdir) (struct inode *,struct dentry *);
 int (*mknod) (struct inode *,struct dentry *,int,dev_t);
 int (*rename) (struct inode *, struct dentry *,
   struct inode *, struct dentry *);
 int (*readlink) (struct dentry *, char *,int);
 void * (*follow_link) (struct dentry *, struct nameidata *);
 void (*put_link) (struct dentry *, struct nameidata *, void *);
 void (*truncate) (struct inode *);
 int (*permission) (struct inode *, int);
 int (*check_acl)(struct inode *, int);
 int (*setattr) (struct dentry *, struct iattr *);
 int (*getattr) (struct vfsmount *mnt, struct dentry *, struct kstat *);
 int (*setxattr) (struct dentry *, const char *,const void *,size_t,int);
 ssize_t (*getxattr) (struct dentry *, const char *, void *, size_t);
 ssize_t (*listxattr) (struct dentry *, char *, size_t);
 int (*removexattr) (struct dentry *, const char *);
 void (*truncate_range)(struct inode *, loff_t, loff_t);
 long (*fallocate)(struct inode *inode, int mode, loff_t offset,
     loff_t len);
 int (*fiemap)(struct inode *, struct fiemap_extent_info *, u64 start,
        u64 len);
};

struct seq_file;

ssize_t rw_copy_check_uvector(int type, const struct iovec * uvector,
    unsigned long nr_segs, unsigned long fast_segs,
    struct iovec *fast_pointer,
    struct iovec **ret_pointer);

extern ssize_t vfs_read(struct file *, char *, size_t, loff_t *);
extern ssize_t vfs_write(struct file *, const char *, size_t, loff_t *);
extern ssize_t vfs_readv(struct file *, const struct iovec *,
  unsigned long, loff_t *);
extern ssize_t vfs_writev(struct file *, const struct iovec *,
  unsigned long, loff_t *);

struct super_operations {
    struct inode *(*alloc_inode)(struct super_block *sb);
 void (*destroy_inode)(struct inode *);

    void (*dirty_inode) (struct inode *);
 int (*write_inode) (struct inode *, struct writeback_control *wbc);
 int (*drop_inode) (struct inode *);
 void (*evict_inode) (struct inode *);
 void (*put_super) (struct super_block *);
 void (*write_super) (struct super_block *);
 int (*sync_fs)(struct super_block *sb, int wait);
 int (*freeze_fs) (struct super_block *);
 int (*unfreeze_fs) (struct super_block *);
 int (*statfs) (struct dentry *, struct kstatfs *);
 int (*remount_fs) (struct super_block *, int *, char *);
 void (*umount_begin) (struct super_block *);

 int (*show_options)(struct seq_file *, struct vfsmount *);
 int (*show_stats)(struct seq_file *, struct vfsmount *);




 int (*bdev_try_to_free_page)(struct super_block*, struct page*, gfp_t);
};
# 1647 "include/linux/fs.h"
extern void __mark_inode_dirty(struct inode *, int);
static inline __attribute__((always_inline)) void mark_inode_dirty(struct inode *inode)
{
 __mark_inode_dirty(inode, (1 | 2 | 4));
}

static inline __attribute__((always_inline)) void mark_inode_dirty_sync(struct inode *inode)
{
 __mark_inode_dirty(inode, 1);
}
# 1666 "include/linux/fs.h"
static inline __attribute__((always_inline)) void inc_nlink(struct inode *inode)
{
 inode->i_nlink++;
}

static inline __attribute__((always_inline)) void inode_inc_link_count(struct inode *inode)
{
 inc_nlink(inode);
 mark_inode_dirty(inode);
}
# 1688 "include/linux/fs.h"
static inline __attribute__((always_inline)) void drop_nlink(struct inode *inode)
{
 inode->i_nlink--;
}
# 1701 "include/linux/fs.h"
static inline __attribute__((always_inline)) void clear_nlink(struct inode *inode)
{
 inode->i_nlink = 0;
}

static inline __attribute__((always_inline)) void inode_dec_link_count(struct inode *inode)
{
 drop_nlink(inode);
 mark_inode_dirty(inode);
}
# 1720 "include/linux/fs.h"
static inline __attribute__((always_inline)) void inode_inc_iversion(struct inode *inode)
{
       spin_lock(&inode->i_lock);
       inode->i_version++;
       spin_unlock(&inode->i_lock);
}

extern void touch_atime(struct vfsmount *mnt, struct dentry *dentry);
static inline __attribute__((always_inline)) void file_accessed(struct file *file)
{
 if (!(file->f_flags & 01000000))
  touch_atime(file->f_path.mnt, file->f_path.dentry);
}

int sync_inode(struct inode *inode, struct writeback_control *wbc);

struct file_system_type {
 const char *name;
 int fs_flags;
 int (*get_sb) (struct file_system_type *, int,
         const char *, void *, struct vfsmount *);
 void (*kill_sb) (struct super_block *);
 struct module *owner;
 struct file_system_type * next;
 struct list_head fs_supers;

 struct lock_class_key s_lock_key;
 struct lock_class_key s_umount_key;
 struct lock_class_key s_vfs_rename_key;

 struct lock_class_key i_lock_key;
 struct lock_class_key i_mutex_key;
 struct lock_class_key i_mutex_dir_key;
 struct lock_class_key i_alloc_sem_key;
};

extern int get_sb_ns(struct file_system_type *fs_type, int flags, void *data,
 int (*fill_super)(struct super_block *, void *, int),
 struct vfsmount *mnt);
extern int get_sb_bdev(struct file_system_type *fs_type,
 int flags, const char *dev_name, void *data,
 int (*fill_super)(struct super_block *, void *, int),
 struct vfsmount *mnt);
extern int get_sb_single(struct file_system_type *fs_type,
 int flags, void *data,
 int (*fill_super)(struct super_block *, void *, int),
 struct vfsmount *mnt);
extern int get_sb_nodev(struct file_system_type *fs_type,
 int flags, void *data,
 int (*fill_super)(struct super_block *, void *, int),
 struct vfsmount *mnt);
void generic_shutdown_super(struct super_block *sb);
void kill_block_super(struct super_block *sb);
void kill_anon_super(struct super_block *sb);
void kill_litter_super(struct super_block *sb);
void deactivate_super(struct super_block *sb);
void deactivate_locked_super(struct super_block *sb);
int set_anon_super(struct super_block *s, void *data);
struct super_block *sget(struct file_system_type *type,
   int (*test)(struct super_block *,void *),
   int (*set)(struct super_block *,void *),
   void *data);
extern int get_sb_pseudo(struct file_system_type *, char *,
 const struct super_operations *ops, unsigned long,
 struct vfsmount *mnt);
extern void simple_set_mnt(struct vfsmount *mnt, struct super_block *sb);

static inline __attribute__((always_inline)) void sb_mark_dirty(struct super_block *sb)
{
 sb->s_dirt = 1;
}
static inline __attribute__((always_inline)) void sb_mark_clean(struct super_block *sb)
{
 sb->s_dirt = 0;
}
static inline __attribute__((always_inline)) int sb_is_dirty(struct super_block *sb)
{
 return sb->s_dirt;
}







extern int register_filesystem(struct file_system_type *);
extern int unregister_filesystem(struct file_system_type *);
extern struct vfsmount *kern_mount_data(struct file_system_type *, void *data);

extern int may_umount_tree(struct vfsmount *);
extern int may_umount(struct vfsmount *);
extern long do_mount(char *, char *, char *, unsigned long, void *);
extern struct vfsmount *collect_mounts(struct path *);
extern void drop_collected_mounts(struct vfsmount *);
extern int iterate_mounts(int (*)(struct vfsmount *, void *), void *,
     struct vfsmount *);
extern int vfs_statfs(struct path *, struct kstatfs *);
extern int statfs_by_dentry(struct dentry *, struct kstatfs *);
extern int freeze_super(struct super_block *super);
extern int thaw_super(struct super_block *super);

extern int current_umask(void);


extern struct kobject *fs_kobj;

extern int rw_verify_area(int, struct file *, loff_t *, size_t);





extern int locks_mandatory_locked(struct inode *);
extern int locks_mandatory_area(int, struct inode *, struct file *, loff_t, size_t);






static inline __attribute__((always_inline)) int __mandatory_lock(struct inode *ino)
{
 return (ino->i_mode & (0002000 | 00010)) == 0002000;
}






static inline __attribute__((always_inline)) int mandatory_lock(struct inode *ino)
{
 return ((ino)->i_sb->s_flags & (64)) && __mandatory_lock(ino);
}

static inline __attribute__((always_inline)) int locks_verify_locked(struct inode *inode)
{
 if (mandatory_lock(inode))
  return locks_mandatory_locked(inode);
 return 0;
}

static inline __attribute__((always_inline)) int locks_verify_truncate(struct inode *inode,
        struct file *filp,
        loff_t size)
{
 if (inode->i_flock && mandatory_lock(inode))
  return locks_mandatory_area(
   2, inode, filp,
   size < inode->i_size ? size : inode->i_size,
   (size < inode->i_size ? inode->i_size - size
    : size - inode->i_size)
  );
 return 0;
}

static inline __attribute__((always_inline)) int break_lease(struct inode *inode, unsigned int mode)
{
 if (inode->i_flock)
  return __break_lease(inode, mode);
 return 0;
}
# 1926 "include/linux/fs.h"
extern int do_truncate(struct dentry *, loff_t start, unsigned int time_attrs,
         struct file *filp);
extern int do_fallocate(struct file *file, int mode, loff_t offset,
   loff_t len);
extern long do_sys_open(int dfd, const char *filename, int flags,
   int mode);
extern struct file *filp_open(const char *, int, int);
extern struct file * dentry_open(struct dentry *, struct vfsmount *, int,
     const struct cred *);
extern int filp_close(struct file *, fl_owner_t id);
extern char * getname(const char *);



extern int ioctl_preallocate(struct file *filp, void *argp);


extern void __attribute__ ((__section__(".init.text"))) __attribute__((__cold__)) __attribute__((no_instrument_function)) vfs_caches_init_early(void);
extern void __attribute__ ((__section__(".init.text"))) __attribute__((__cold__)) __attribute__((no_instrument_function)) vfs_caches_init(unsigned long);

extern struct kmem_cache *names_cachep;
# 1958 "include/linux/fs.h"
extern int register_blkdev(unsigned int, const char *);
extern void unregister_blkdev(unsigned int, const char *);
extern struct block_device *bdget(dev_t);
extern struct block_device *bdgrab(struct block_device *bdev);
extern void bd_set_size(struct block_device *, loff_t size);
extern void bd_forget(struct inode *inode);
extern void bdput(struct block_device *);
extern struct block_device *open_by_devnum(dev_t, fmode_t);
extern void invalidate_bdev(struct block_device *);
extern int sync_blockdev(struct block_device *bdev);
extern struct super_block *freeze_bdev(struct block_device *);
extern void emergency_thaw_all(void);
extern int thaw_bdev(struct block_device *bdev, struct super_block *sb);
extern int fsync_bdev(struct block_device *);
# 1987 "include/linux/fs.h"
extern int sync_filesystem(struct super_block *);
extern const struct file_operations def_blk_fops;
extern const struct file_operations def_chr_fops;
extern const struct file_operations bad_sock_fops;
extern const struct file_operations def_fifo_fops;

extern int ioctl_by_bdev(struct block_device *, unsigned, unsigned long);
extern int blkdev_ioctl(struct block_device *, fmode_t, unsigned, unsigned long);
extern long compat_blkdev_ioctl(struct file *, unsigned, unsigned long);
extern int blkdev_get(struct block_device *, fmode_t);
extern int blkdev_put(struct block_device *, fmode_t);
extern int bd_claim(struct block_device *, void *);
extern void bd_release(struct block_device *);
# 2011 "include/linux/fs.h"
extern int alloc_chrdev_region(dev_t *, unsigned, unsigned, const char *);
extern int register_chrdev_region(dev_t, unsigned, const char *);
extern int __register_chrdev(unsigned int major, unsigned int baseminor,
        unsigned int count, const char *name,
        const struct file_operations *fops);
extern void __unregister_chrdev(unsigned int major, unsigned int baseminor,
    unsigned int count, const char *name);
extern void unregister_chrdev_region(dev_t, unsigned);
extern void chrdev_show(struct seq_file *,off_t);

static inline __attribute__((always_inline)) int register_chrdev(unsigned int major, const char *name,
      const struct file_operations *fops)
{
 return __register_chrdev(major, 0, 256, name, fops);
}

static inline __attribute__((always_inline)) void unregister_chrdev(unsigned int major, const char *name)
{
 __unregister_chrdev(major, 0, 256, name);
}







extern const char *__bdevname(dev_t, char *buffer);
extern const char *bdevname(struct block_device *bdev, char *buffer);
extern struct block_device *lookup_bdev(const char *);
extern struct block_device *open_bdev_exclusive(const char *, fmode_t, void *);
extern void close_bdev_exclusive(struct block_device *, fmode_t);
extern void blkdev_show(struct seq_file *,off_t);





extern void init_special_inode(struct inode *, umode_t, dev_t);


extern void make_bad_inode(struct inode *);
extern int is_bad_inode(struct inode *);

extern const struct file_operations read_pipefifo_fops;
extern const struct file_operations write_pipefifo_fops;
extern const struct file_operations rdwr_pipefifo_fops;

extern int fs_may_remount_ro(struct super_block *);
# 2072 "include/linux/fs.h"
extern void check_disk_size_change(struct gendisk *disk,
       struct block_device *bdev);
extern int revalidate_disk(struct gendisk *);
extern int check_disk_change(struct block_device *);
extern int __invalidate_device(struct block_device *);
extern int invalidate_partition(struct gendisk *, int);

extern int invalidate_inodes(struct super_block *);
unsigned long invalidate_mapping_pages(struct address_space *mapping,
     unsigned long start, unsigned long end);

static inline __attribute__((always_inline)) void invalidate_remote_inode(struct inode *inode)
{
 if ((((inode->i_mode) & 00170000) == 0100000) || (((inode->i_mode) & 00170000) == 0040000) ||
     (((inode->i_mode) & 00170000) == 0120000))
  invalidate_mapping_pages(inode->i_mapping, 0, -1);
}
extern int invalidate_inode_pages2(struct address_space *mapping);
extern int invalidate_inode_pages2_range(struct address_space *mapping,
      unsigned long start, unsigned long end);
extern int write_inode_now(struct inode *, int);
extern int filemap_fdatawrite(struct address_space *);
extern int filemap_flush(struct address_space *);
extern int filemap_fdatawait(struct address_space *);
extern int filemap_fdatawait_range(struct address_space *, loff_t lstart,
       loff_t lend);
extern int filemap_write_and_wait(struct address_space *mapping);
extern int filemap_write_and_wait_range(struct address_space *mapping,
            loff_t lstart, loff_t lend);
extern int __filemap_fdatawrite_range(struct address_space *mapping,
    loff_t start, loff_t end, int sync_mode);
extern int filemap_fdatawrite_range(struct address_space *mapping,
    loff_t start, loff_t end);

extern int vfs_fsync_range(struct file *file, loff_t start, loff_t end,
      int datasync);
extern int vfs_fsync(struct file *file, int datasync);
extern int generic_write_sync(struct file *file, loff_t pos, loff_t count);
extern void sync_supers(void);
extern void emergency_sync(void);
extern void emergency_remount(void);

extern sector_t bmap(struct inode *, sector_t);

extern int notify_change(struct dentry *, struct iattr *);
extern int inode_permission(struct inode *, int);
extern int generic_permission(struct inode *, int,
  int (*check_acl)(struct inode *, int));

static inline __attribute__((always_inline)) int execute_ok(struct inode *inode)
{
 return (inode->i_mode & (00100|00010|00001)) || (((inode->i_mode) & 00170000) == 0040000);
}

extern int get_write_access(struct inode *);
extern int deny_write_access(struct file *);
static inline __attribute__((always_inline)) void put_write_access(struct inode * inode)
{
 atomic_sub(1, (&inode->i_writecount));
}
static inline __attribute__((always_inline)) void allow_write_access(struct file *file)
{
 if (file)
  atomic_add(1, (&file->f_path.dentry->d_inode->i_writecount));
}
extern int do_pipe_flags(int *, int);
extern struct file *create_read_pipe(struct file *f, int flags);
extern struct file *create_write_pipe(int flags);
extern void free_write_pipe(struct file *);

extern struct file *do_filp_open(int dfd, const char *pathname,
  int open_flag, int mode, int acc_mode);
extern int may_open(struct path *, int, int);

extern int kernel_read(struct file *, loff_t, char *, unsigned long);
extern struct file * open_exec(const char *);


extern int is_subdir(struct dentry *, struct dentry *);
extern int path_is_under(struct path *, struct path *);
extern ino_t find_inode_number(struct dentry *, struct qstr *);




extern loff_t default_llseek(struct file *file, loff_t offset, int origin);

extern loff_t vfs_llseek(struct file *file, loff_t offset, int origin);

extern int inode_init_always(struct super_block *, struct inode *);
extern void inode_init_once(struct inode *);
extern void inode_add_to_lists(struct super_block *, struct inode *);
extern void iput(struct inode *);
extern struct inode * igrab(struct inode *);
extern ino_t iunique(struct super_block *, ino_t);
extern int inode_needs_sync(struct inode *inode);
extern int generic_delete_inode(struct inode *inode);
extern int generic_drop_inode(struct inode *inode);

extern struct inode *ilookup5_nowait(struct super_block *sb,
  unsigned long hashval, int (*test)(struct inode *, void *),
  void *data);
extern struct inode *ilookup5(struct super_block *sb, unsigned long hashval,
  int (*test)(struct inode *, void *), void *data);
extern struct inode *ilookup(struct super_block *sb, unsigned long ino);

extern struct inode * iget5_locked(struct super_block *, unsigned long, int (*test)(struct inode *, void *), int (*set)(struct inode *, void *), void *);
extern struct inode * iget_locked(struct super_block *, unsigned long);
extern int insert_inode_locked4(struct inode *, unsigned long, int (*test)(struct inode *, void *), void *);
extern int insert_inode_locked(struct inode *);
extern void unlock_new_inode(struct inode *);

extern void __iget(struct inode * inode);
extern void iget_failed(struct inode *);
extern void end_writeback(struct inode *);
extern void destroy_inode(struct inode *);
extern void __destroy_inode(struct inode *);
extern struct inode *new_inode(struct super_block *);
extern int should_remove_suid(struct dentry *);
extern int file_remove_suid(struct file *);

extern void __insert_inode_hash(struct inode *, unsigned long hashval);
extern void remove_inode_hash(struct inode *);
static inline __attribute__((always_inline)) void insert_inode_hash(struct inode *inode) {
 __insert_inode_hash(inode, inode->i_ino);
}


extern void submit_bio(int, struct bio *);
extern int bdev_read_only(struct block_device *);

extern int set_blocksize(struct block_device *, int);
extern int sb_set_blocksize(struct super_block *, int);
extern int sb_min_blocksize(struct super_block *, int);

extern int generic_file_mmap(struct file *, struct vm_area_struct *);
extern int generic_file_readonly_mmap(struct file *, struct vm_area_struct *);
extern int file_read_actor(read_descriptor_t * desc, struct page *page, unsigned long offset, unsigned long size);
int generic_write_checks(struct file *file, loff_t *pos, size_t *count, int isblk);
extern ssize_t generic_file_aio_read(struct kiocb *, const struct iovec *, unsigned long, loff_t);
extern ssize_t __generic_file_aio_write(struct kiocb *, const struct iovec *, unsigned long,
  loff_t *);
extern ssize_t generic_file_aio_write(struct kiocb *, const struct iovec *, unsigned long, loff_t);
extern ssize_t generic_file_direct_write(struct kiocb *, const struct iovec *,
  unsigned long *, loff_t, loff_t *, size_t, size_t);
extern ssize_t generic_file_buffered_write(struct kiocb *, const struct iovec *,
  unsigned long, loff_t, loff_t *, size_t, ssize_t);
extern ssize_t do_sync_read(struct file *filp, char *buf, size_t len, loff_t *ppos);
extern ssize_t do_sync_write(struct file *filp, const char *buf, size_t len, loff_t *ppos);
extern int generic_segment_checks(const struct iovec *iov,
  unsigned long *nr_segs, size_t *count, int access_flags);


extern ssize_t blkdev_aio_write(struct kiocb *iocb, const struct iovec *iov,
    unsigned long nr_segs, loff_t pos);
extern int blkdev_fsync(struct file *filp, int datasync);


extern ssize_t generic_file_splice_read(struct file *, loff_t *,
  struct pipe_inode_info *, size_t, unsigned int);
extern ssize_t default_file_splice_read(struct file *, loff_t *,
  struct pipe_inode_info *, size_t, unsigned int);
extern ssize_t generic_file_splice_write(struct pipe_inode_info *,
  struct file *, loff_t *, size_t, unsigned int);
extern ssize_t generic_splice_sendpage(struct pipe_inode_info *pipe,
  struct file *out, loff_t *, size_t len, unsigned int flags);
extern long do_splice_direct(struct file *in, loff_t *ppos, struct file *out,
  size_t len, unsigned int flags);

extern void
file_ra_state_init(struct file_ra_state *ra, struct address_space *mapping);
extern loff_t noop_llseek(struct file *file, loff_t offset, int origin);
extern loff_t no_llseek(struct file *file, loff_t offset, int origin);
extern loff_t generic_file_llseek(struct file *file, loff_t offset, int origin);
extern loff_t generic_file_llseek_unlocked(struct file *file, loff_t offset,
   int origin);
extern int generic_file_open(struct inode * inode, struct file * filp);
extern int nonseekable_open(struct inode * inode, struct file * filp);


extern ssize_t xip_file_read(struct file *filp, char *buf, size_t len,
        loff_t *ppos);
extern int xip_file_mmap(struct file * file, struct vm_area_struct * vma);
extern ssize_t xip_file_write(struct file *filp, const char *buf,
         size_t len, loff_t *ppos);
extern int xip_truncate_page(struct address_space *mapping, loff_t from);
# 2266 "include/linux/fs.h"
typedef void (dio_submit_t)(int rw, struct bio *bio, struct inode *inode,
       loff_t file_offset);

enum {

 DIO_LOCKING = 0x01,


 DIO_SKIP_HOLES = 0x02,
};

void dio_end_io(struct bio *bio, int error);

ssize_t __blockdev_direct_IO(int rw, struct kiocb *iocb, struct inode *inode,
 struct block_device *bdev, const struct iovec *iov, loff_t offset,
 unsigned long nr_segs, get_block_t get_block, dio_iodone_t end_io,
 dio_submit_t submit_io, int flags);

static inline __attribute__((always_inline)) ssize_t blockdev_direct_IO(int rw, struct kiocb *iocb,
 struct inode *inode, struct block_device *bdev, const struct iovec *iov,
 loff_t offset, unsigned long nr_segs, get_block_t get_block,
 dio_iodone_t end_io)
{
 return __blockdev_direct_IO(rw, iocb, inode, bdev, iov, offset,
        nr_segs, get_block, end_io, ((void *)0),
        DIO_LOCKING | DIO_SKIP_HOLES);
}


extern const struct file_operations generic_ro_fops;



extern int vfs_readlink(struct dentry *, char *, int, const char *);
extern int vfs_follow_link(struct nameidata *, const char *);
extern int page_readlink(struct dentry *, char *, int);
extern void *page_follow_link_light(struct dentry *, struct nameidata *);
extern void page_put_link(struct dentry *, struct nameidata *, void *);
extern int __page_symlink(struct inode *inode, const char *symname, int len,
  int nofs);
extern int page_symlink(struct inode *inode, const char *symname, int len);
extern const struct inode_operations page_symlink_inode_operations;
extern int generic_readlink(struct dentry *, char *, int);
extern void generic_fillattr(struct inode *, struct kstat *);
extern int vfs_getattr(struct vfsmount *, struct dentry *, struct kstat *);
void __inode_add_bytes(struct inode *inode, loff_t bytes);
void inode_add_bytes(struct inode *inode, loff_t bytes);
void inode_sub_bytes(struct inode *inode, loff_t bytes);
loff_t inode_get_bytes(struct inode *inode);
void inode_set_bytes(struct inode *inode, loff_t bytes);

extern int vfs_readdir(struct file *, filldir_t, void *);

extern int vfs_stat(const char *, struct kstat *);
extern int vfs_lstat(const char *, struct kstat *);
extern int vfs_fstat(unsigned int, struct kstat *);
extern int vfs_fstatat(int , const char *, struct kstat *, int);

extern int do_vfs_ioctl(struct file *filp, unsigned int fd, unsigned int cmd,
      unsigned long arg);
extern int __generic_block_fiemap(struct inode *inode,
      struct fiemap_extent_info *fieinfo,
      loff_t start, loff_t len,
      get_block_t *get_block);
extern int generic_block_fiemap(struct inode *inode,
    struct fiemap_extent_info *fieinfo, u64 start,
    u64 len, get_block_t *get_block);

extern void get_filesystem(struct file_system_type *fs);
extern void put_filesystem(struct file_system_type *fs);
extern struct file_system_type *get_fs_type(const char *name);
extern struct super_block *get_super(struct block_device *);
extern struct super_block *get_active_super(struct block_device *bdev);
extern struct super_block *user_get_super(dev_t);
extern void drop_super(struct super_block *sb);
extern void iterate_supers(void (*)(struct super_block *, void *), void *);

extern int dcache_dir_open(struct inode *, struct file *);
extern int dcache_dir_close(struct inode *, struct file *);
extern loff_t dcache_dir_lseek(struct file *, loff_t, int);
extern int dcache_readdir(struct file *, void *, filldir_t);
extern int simple_setattr(struct dentry *, struct iattr *);
extern int simple_getattr(struct vfsmount *, struct dentry *, struct kstat *);
extern int simple_statfs(struct dentry *, struct kstatfs *);
extern int simple_link(struct dentry *, struct inode *, struct dentry *);
extern int simple_unlink(struct inode *, struct dentry *);
extern int simple_rmdir(struct inode *, struct dentry *);
extern int simple_rename(struct inode *, struct dentry *, struct inode *, struct dentry *);
extern int noop_fsync(struct file *, int);
extern int simple_empty(struct dentry *);
extern int simple_readpage(struct file *file, struct page *page);
extern int simple_write_begin(struct file *file, struct address_space *mapping,
   loff_t pos, unsigned len, unsigned flags,
   struct page **pagep, void **fsdata);
extern int simple_write_end(struct file *file, struct address_space *mapping,
   loff_t pos, unsigned len, unsigned copied,
   struct page *page, void *fsdata);

extern struct dentry *simple_lookup(struct inode *, struct dentry *, struct nameidata *);
extern ssize_t generic_read_dir(struct file *, char *, size_t, loff_t *);
extern const struct file_operations simple_dir_operations;
extern const struct inode_operations simple_dir_inode_operations;
struct tree_descr { char *name; const struct file_operations *ops; int mode; };
struct dentry *d_alloc_name(struct dentry *, const char *);
extern int simple_fill_super(struct super_block *, unsigned long, struct tree_descr *);
extern int simple_pin_fs(struct file_system_type *, struct vfsmount **mount, int *count);
extern void simple_release_fs(struct vfsmount **mount, int *count);

extern ssize_t simple_read_from_buffer(void *to, size_t count,
   loff_t *ppos, const void *from, size_t available);
extern ssize_t simple_write_to_buffer(void *to, size_t available, loff_t *ppos,
  const void *from, size_t count);

extern int generic_file_fsync(struct file *, int);
# 2388 "include/linux/fs.h"
extern int inode_change_ok(const struct inode *, struct iattr *);
extern int inode_newsize_ok(const struct inode *, loff_t offset);
extern void setattr_copy(struct inode *inode, const struct iattr *attr);

extern void file_update_time(struct file *file);

extern int generic_show_options(struct seq_file *m, struct vfsmount *mnt);
extern void save_mount_options(struct super_block *sb, char *options);
extern void replace_mount_options(struct super_block *sb, char *options);

static inline __attribute__((always_inline)) ino_t parent_ino(struct dentry *dentry)
{
 ino_t res;

 spin_lock(&dentry->d_lock);
 res = dentry->d_parent->d_inode->i_ino;
 spin_unlock(&dentry->d_lock);
 return res;
}







struct simple_transaction_argresp {
 ssize_t size;
 char data[0];
};



char *simple_transaction_get(struct file *file, const char *buf,
    size_t size);
ssize_t simple_transaction_read(struct file *file, char *buf,
    size_t size, loff_t *pos);
int simple_transaction_release(struct inode *inode, struct file *file);

void simple_transaction_set(struct file *file, size_t n);
# 2459 "include/linux/fs.h"
static inline __attribute__((always_inline)) void __attribute__((format(printf, 1, 2)))
__simple_attr_check_format(const char *fmt, ...)
{

}

int simple_attr_open(struct inode *inode, struct file *file,
       int (*get)(void *, u64 *), int (*set)(void *, u64),
       const char *fmt);
int simple_attr_release(struct inode *inode, struct file *file);
ssize_t simple_attr_read(struct file *file, char *buf,
    size_t len, loff_t *ppos);
ssize_t simple_attr_write(struct file *file, const char *buf,
     size_t len, loff_t *ppos);

struct ctl_table;
int proc_nr_files(struct ctl_table *table, int write,
    void *buffer, size_t *lenp, loff_t *ppos);

int __attribute__ ((__section__(".init.text"))) __attribute__((__cold__)) __attribute__((no_instrument_function)) get_filesystem_list(char *buf);
# 6 "include/linux/proc_fs.h" 2

# 1 "include/linux/magic.h" 1
# 8 "include/linux/proc_fs.h" 2


struct net;
struct completion;
struct mm_struct;
# 30 "include/linux/proc_fs.h"
enum {
 PROC_ROOT_INO = 1,
};
# 46 "include/linux/proc_fs.h"
typedef int (read_proc_t)(char *page, char **start, off_t off,
     int count, int *eof, void *data);
typedef int (write_proc_t)(struct file *file, const char *buffer,
      unsigned long count, void *data);

struct proc_dir_entry {
 unsigned int low_ino;
 unsigned short namelen;
 const char *name;
 mode_t mode;
 nlink_t nlink;
 uid_t uid;
 gid_t gid;
 loff_t size;
 const struct inode_operations *proc_iops;
# 69 "include/linux/proc_fs.h"
 const struct file_operations *proc_fops;
 struct proc_dir_entry *next, *parent, *subdir;
 void *data;
 read_proc_t *read_proc;
 write_proc_t *write_proc;
 atomic_t count;
 int pde_users;
 spinlock_t pde_unload_lock;
 struct completion *pde_unload_completion;
 struct list_head pde_openers;
};

enum kcore_type {
 KCORE_TEXT,
 KCORE_VMALLOC,
 KCORE_RAM,
 KCORE_VMEMMAP,
 KCORE_OTHER,
};

struct kcore_list {
 struct list_head list;
 unsigned long addr;
 size_t size;
 int type;
};

struct vmcore {
 struct list_head list;
 unsigned long long paddr;
 unsigned long long size;
 loff_t offset;
};



extern void proc_root_init(void);

void proc_flush_task(struct task_struct *task);

extern struct proc_dir_entry *create_proc_entry(const char *name, mode_t mode,
      struct proc_dir_entry *parent);
struct proc_dir_entry *proc_create_data(const char *name, mode_t mode,
    struct proc_dir_entry *parent,
    const struct file_operations *proc_fops,
    void *data);
extern void remove_proc_entry(const char *name, struct proc_dir_entry *parent);

struct pid_namespace;

extern int pid_ns_prepare_proc(struct pid_namespace *ns);
extern void pid_ns_release_proc(struct pid_namespace *ns);




struct tty_driver;
extern void proc_tty_init(void);
extern void proc_tty_register_driver(struct tty_driver *driver);
extern void proc_tty_unregister_driver(struct tty_driver *driver);
# 146 "include/linux/proc_fs.h"
extern struct proc_dir_entry *proc_symlink(const char *,
  struct proc_dir_entry *, const char *);
extern struct proc_dir_entry *proc_mkdir(const char *,struct proc_dir_entry *);
extern struct proc_dir_entry *proc_mkdir_mode(const char *name, mode_t mode,
   struct proc_dir_entry *parent);

static inline __attribute__((always_inline)) struct proc_dir_entry *proc_create(const char *name, mode_t mode,
 struct proc_dir_entry *parent, const struct file_operations *proc_fops)
{
 return proc_create_data(name, mode, parent, proc_fops, ((void *)0));
}

static inline __attribute__((always_inline)) struct proc_dir_entry *create_proc_read_entry(const char *name,
 mode_t mode, struct proc_dir_entry *base,
 read_proc_t *read_proc, void * data)
{
 struct proc_dir_entry *res=create_proc_entry(name,mode,base);
 if (res) {
  res->read_proc=read_proc;
  res->data=data;
 }
 return res;
}

extern struct proc_dir_entry *proc_net_fops_create(struct net *net,
 const char *name, mode_t mode, const struct file_operations *fops);
extern void proc_net_remove(struct net *net, const char *name);
extern struct proc_dir_entry *proc_net_mkdir(struct net *net, const char *name,
 struct proc_dir_entry *parent);



extern void set_mm_exe_file(struct mm_struct *mm, struct file *new_exe_file);
extern struct file *get_mm_exe_file(struct mm_struct *mm);
extern void dup_mm_exe_file(struct mm_struct *oldmm, struct mm_struct *newmm);
# 245 "include/linux/proc_fs.h"
static inline __attribute__((always_inline)) void
kclist_add(struct kcore_list *new, void *addr, size_t size, int type)
{
}




union proc_op {
 int (*proc_get_link)(struct inode *, struct path *);
 int (*proc_read)(struct task_struct *task, char *page);
 int (*proc_show)(struct seq_file *m,
  struct pid_namespace *ns, struct pid *pid,
  struct task_struct *task);
};

struct ctl_table_header;
struct ctl_table;

struct proc_inode {
 struct pid *pid;
 int fd;
 union proc_op op;
 struct proc_dir_entry *pde;
 struct ctl_table_header *sysctl;
 struct ctl_table *sysctl_entry;
 struct inode vfs_inode;
};

static inline __attribute__((always_inline)) struct proc_inode *PROC_I(const struct inode *inode)
{
 return ({ const typeof( ((struct proc_inode *)0)->vfs_inode ) *__mptr = (inode); (struct proc_inode *)( (char *)__mptr - __builtin_offsetof(struct proc_inode,vfs_inode) );});
}

static inline __attribute__((always_inline)) struct proc_dir_entry *PDE(const struct inode *inode)
{
 return PROC_I(inode)->pde;
}

static inline __attribute__((always_inline)) struct net *PDE_NET(struct proc_dir_entry *pde)
{
 return pde->parent->data;
}

struct proc_maps_private {
 struct pid *pid;
 struct task_struct *task;

 struct vm_area_struct *tail_vma;

};
# 6 "/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_bmgr.c" 2

# 1 "include/linux/delay.h" 1
# 12 "include/linux/delay.h"
extern unsigned long loops_per_jiffy;

# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/delay.h" 1
# 16 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/delay.h"
extern void __delay(unsigned int loops);
extern void __ndelay(unsigned int ns);
extern void __udelay(unsigned int us);
# 15 "include/linux/delay.h" 2
# 44 "include/linux/delay.h"
extern unsigned long lpj_fine;
void calibrate_delay(void);
void msleep(unsigned int msecs);
unsigned long msleep_interruptible(unsigned int msecs);
void usleep_range(unsigned long min, unsigned long max);

static inline __attribute__((always_inline)) void ssleep(unsigned int seconds)
{
 msleep(seconds * 1000);
}
# 8 "/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_bmgr.c" 2

# 1 "/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_bmgr.h" 1



# 1 "include/linux/netdevice.h" 1
# 28 "include/linux/netdevice.h"
# 1 "include/linux/if.h" 1
# 23 "include/linux/if.h"
# 1 "include/linux/socket.h" 1
# 11 "include/linux/socket.h"
struct __kernel_sockaddr_storage {
 unsigned short ss_family;

 char __data[128 - sizeof(unsigned short)];


} __attribute__ ((aligned((__alignof__ (struct sockaddr *)))));



# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/socket.h" 1
# 12 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/socket.h"
# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/sockios.h" 1
# 13 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/socket.h" 2
# 101 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/socket.h"
enum sock_type {
 SOCK_DGRAM = 1,
 SOCK_STREAM = 2,
 SOCK_RAW = 3,
 SOCK_RDM = 4,
 SOCK_SEQPACKET = 5,
 SOCK_DCCP = 6,
 SOCK_PACKET = 10,
};
# 22 "include/linux/socket.h" 2
# 1 "include/linux/sockios.h" 1
# 23 "include/linux/socket.h" 2
# 1 "include/linux/uio.h" 1
# 16 "include/linux/uio.h"
struct iovec
{
 void *iov_base;
 __kernel_size_t iov_len;
};
# 31 "include/linux/uio.h"
struct kvec {
 void *iov_base;
 size_t iov_len;
};
# 43 "include/linux/uio.h"
static inline __attribute__((always_inline)) size_t iov_length(const struct iovec *iov, unsigned long nr_segs)
{
 unsigned long seg;
 size_t ret = 0;

 for (seg = 0; seg < nr_segs; seg++)
  ret += iov[seg].iov_len;
 return ret;
}

unsigned long iov_shorten(struct iovec *iov, unsigned long nr_segs, size_t to);
# 24 "include/linux/socket.h" 2



struct pid;
struct cred;






struct seq_file;
extern void socket_seq_show(struct seq_file *seq);



typedef unsigned short sa_family_t;





struct sockaddr {
 sa_family_t sa_family;
 char sa_data[14];
};

struct linger {
 int l_onoff;
 int l_linger;
};
# 64 "include/linux/socket.h"
struct msghdr {
 void * msg_name;
 int msg_namelen;
 struct iovec * msg_iov;
 __kernel_size_t msg_iovlen;
 void * msg_control;
 __kernel_size_t msg_controllen;
 unsigned msg_flags;
};


struct mmsghdr {
 struct msghdr msg_hdr;
 unsigned msg_len;
};







struct cmsghdr {
 __kernel_size_t cmsg_len;
        int cmsg_level;
        int cmsg_type;
};
# 128 "include/linux/socket.h"
static inline __attribute__((always_inline)) struct cmsghdr * __cmsg_nxthdr(void *__ctl, __kernel_size_t __size,
            struct cmsghdr *__cmsg)
{
 struct cmsghdr * __ptr;

 __ptr = (struct cmsghdr*)(((unsigned char *) __cmsg) + ( ((__cmsg->cmsg_len)+sizeof(long)-1) & ~(sizeof(long)-1) ));
 if ((unsigned long)((char*)(__ptr+1) - (char *) __ctl) > __size)
  return (struct cmsghdr *)0;

 return __ptr;
}

static inline __attribute__((always_inline)) struct cmsghdr * cmsg_nxthdr (struct msghdr *__msg, struct cmsghdr *__cmsg)
{
 return __cmsg_nxthdr(__msg->msg_control, __msg->msg_controllen, __cmsg);
}







struct ucred {
 __u32 pid;
 __u32 uid;
 __u32 gid;
};
# 315 "include/linux/socket.h"
extern void cred_to_ucred(struct pid *pid, const struct cred *cred, struct ucred *ucred);

extern int memcpy_fromiovec(unsigned char *kdata, struct iovec *iov, int len);
extern int memcpy_fromiovecend(unsigned char *kdata, const struct iovec *iov,
          int offset, int len);
extern int csum_partial_copy_fromiovecend(unsigned char *kdata,
       struct iovec *iov,
       int offset,
       unsigned int len, __wsum *csump);

extern long verify_iovec(struct msghdr *m, struct iovec *iov, struct sockaddr *address, int mode);
extern int memcpy_toiovec(struct iovec *v, unsigned char *kdata, int len);
extern int memcpy_toiovecend(const struct iovec *v, unsigned char *kdata,
        int offset, int len);
extern int move_addr_to_user(struct sockaddr *kaddr, int klen, void *uaddr, int *ulen);
extern int move_addr_to_kernel(void *uaddr, int ulen, struct sockaddr *kaddr);
extern int put_cmsg(struct msghdr*, int level, int type, int len, void *data);

struct timespec;

extern int __sys_recvmmsg(int fd, struct mmsghdr *mmsg, unsigned int vlen,
     unsigned int flags, struct timespec *timeout);
# 24 "include/linux/if.h" 2




# 1 "include/linux/hdlc/ioctl.h" 1
# 37 "include/linux/hdlc/ioctl.h"
typedef struct {
 unsigned int clock_rate;
 unsigned int clock_type;
 unsigned short loopback;
} sync_serial_settings;

typedef struct {
 unsigned int clock_rate;
 unsigned int clock_type;
 unsigned short loopback;
 unsigned int slot_map;
} te1_settings;

typedef struct {
 unsigned short encoding;
 unsigned short parity;
} raw_hdlc_proto;

typedef struct {
 unsigned int t391;
 unsigned int t392;
 unsigned int n391;
 unsigned int n392;
 unsigned int n393;
 unsigned short lmi;
 unsigned short dce;
} fr_proto;

typedef struct {
 unsigned int dlci;
} fr_proto_pvc;

typedef struct {
 unsigned int dlci;
 char master[16];
}fr_proto_pvc_info;

typedef struct {
    unsigned int interval;
    unsigned int timeout;
} cisco_proto;
# 29 "include/linux/if.h" 2
# 112 "include/linux/if.h"
enum {
 IF_OPER_UNKNOWN,
 IF_OPER_NOTPRESENT,
 IF_OPER_DOWN,
 IF_OPER_LOWERLAYERDOWN,
 IF_OPER_TESTING,
 IF_OPER_DORMANT,
 IF_OPER_UP,
};


enum {
 IF_LINK_MODE_DEFAULT,
 IF_LINK_MODE_DORMANT,
};
# 138 "include/linux/if.h"
struct ifmap {
 unsigned long mem_start;
 unsigned long mem_end;
 unsigned short base_addr;
 unsigned char irq;
 unsigned char dma;
 unsigned char port;

};

struct if_settings {
 unsigned int type;
 unsigned int size;
 union {

  raw_hdlc_proto *raw_hdlc;
  cisco_proto *cisco;
  fr_proto *fr;
  fr_proto_pvc *fr_pvc;
  fr_proto_pvc_info *fr_pvc_info;


  sync_serial_settings *sync;
  te1_settings *te1;
 } ifs_ifsu;
};
# 172 "include/linux/if.h"
struct ifreq {

 union
 {
  char ifrn_name[16];
 } ifr_ifrn;

 union {
  struct sockaddr ifru_addr;
  struct sockaddr ifru_dstaddr;
  struct sockaddr ifru_broadaddr;
  struct sockaddr ifru_netmask;
  struct sockaddr ifru_hwaddr;
  short ifru_flags;
  int ifru_ivalue;
  int ifru_mtu;
  struct ifmap ifru_map;
  char ifru_slave[16];
  char ifru_newname[16];
  void * ifru_data;
  struct if_settings ifru_settings;
 } ifr_ifru;
};
# 221 "include/linux/if.h"
struct ifconf {
 int ifc_len;
 union {
  char *ifcu_buf;
  struct ifreq *ifcu_req;
 } ifc_ifcu;
};
# 29 "include/linux/netdevice.h" 2
# 1 "include/linux/if_ether.h" 1
# 122 "include/linux/if_ether.h"
struct ethhdr {
 unsigned char h_dest[6];
 unsigned char h_source[6];
 __be16 h_proto;
} __attribute__((packed));


# 1 "include/linux/skbuff.h" 1
# 18 "include/linux/skbuff.h"
# 1 "include/linux/kmemcheck.h" 1
# 92 "include/linux/kmemcheck.h"
static inline __attribute__((always_inline)) void
kmemcheck_alloc_shadow(struct page *page, int order, gfp_t flags, int node)
{
}

static inline __attribute__((always_inline)) void
kmemcheck_free_shadow(struct page *page, int order)
{
}

static inline __attribute__((always_inline)) void
kmemcheck_slab_alloc(struct kmem_cache *s, gfp_t gfpflags, void *object,
       size_t size)
{
}

static inline __attribute__((always_inline)) void kmemcheck_slab_free(struct kmem_cache *s, void *object,
           size_t size)
{
}

static inline __attribute__((always_inline)) void kmemcheck_pagealloc_alloc(struct page *p,
 unsigned int order, gfp_t gfpflags)
{
}

static inline __attribute__((always_inline)) int kmemcheck_page_is_tracked(struct page *p)
{
 return false;
}

static inline __attribute__((always_inline)) void kmemcheck_mark_unallocated(void *address, unsigned int n)
{
}

static inline __attribute__((always_inline)) void kmemcheck_mark_uninitialized(void *address, unsigned int n)
{
}

static inline __attribute__((always_inline)) void kmemcheck_mark_initialized(void *address, unsigned int n)
{
}

static inline __attribute__((always_inline)) void kmemcheck_mark_freed(void *address, unsigned int n)
{
}

static inline __attribute__((always_inline)) void kmemcheck_mark_unallocated_pages(struct page *p,
          unsigned int n)
{
}

static inline __attribute__((always_inline)) void kmemcheck_mark_uninitialized_pages(struct page *p,
            unsigned int n)
{
}

static inline __attribute__((always_inline)) void kmemcheck_mark_initialized_pages(struct page *p,
          unsigned int n)
{
}

static inline __attribute__((always_inline)) int kmemcheck_is_obj_initialized(unsigned long addr, size_t size)
{
 return true;
}
# 19 "include/linux/skbuff.h" 2







# 1 "include/linux/net.h" 1
# 46 "include/linux/net.h"
typedef enum {
 SS_FREE = 0,
 SS_UNCONNECTED,
 SS_CONNECTING,
 SS_CONNECTED,
 SS_DISCONNECTING
} socket_state;





# 1 "include/linux/random.h" 1
# 12 "include/linux/random.h"
# 1 "include/linux/irqnr.h" 1
# 26 "include/linux/irqnr.h"
extern int nr_irqs;
extern struct irq_desc *irq_to_desc(unsigned int irq);
# 13 "include/linux/random.h" 2
# 37 "include/linux/random.h"
struct rand_pool_info {
 int entropy_count;
 int buf_size;
 __u32 buf[0];
};

struct rnd_state {
 __u32 s1, s2, s3;
};





extern void rand_initialize_irq(int irq);

extern void add_input_randomness(unsigned int type, unsigned int code,
     unsigned int value);
extern void add_interrupt_randomness(int irq);

extern void get_random_bytes(void *buf, int nbytes);
void generate_random_uuid(unsigned char uuid_out[16]);

extern __u32 secure_ip_id(__be32 daddr);
extern u32 secure_ipv4_port_ephemeral(__be32 saddr, __be32 daddr, __be16 dport);
extern u32 secure_ipv6_port_ephemeral(const __be32 *saddr, const __be32 *daddr,
          __be16 dport);
extern __u32 secure_tcp_sequence_number(__be32 saddr, __be32 daddr,
     __be16 sport, __be16 dport);
extern __u32 secure_tcpv6_sequence_number(__be32 *saddr, __be32 *daddr,
       __be16 sport, __be16 dport);
extern u64 secure_dccp_sequence_number(__be32 saddr, __be32 daddr,
           __be16 sport, __be16 dport);





unsigned int get_random_int(void);
unsigned long randomize_range(unsigned long start, unsigned long end, unsigned long len);

u32 random32(void);
void srandom32(u32 seed);

u32 prandom32(struct rnd_state *);




static inline __attribute__((always_inline)) u32 __seed(u32 x, u32 m)
{
 return (x < m) ? x + m : x;
}






static inline __attribute__((always_inline)) void prandom32_seed(struct rnd_state *state, u64 seed)
{
 u32 i = (seed >> 32) ^ (seed << 10) ^ seed;

 state->s1 = __seed(i, 1);
 state->s2 = __seed(i, 7);
 state->s3 = __seed(i, 15);
}
# 59 "include/linux/net.h" 2





struct poll_table_struct;
struct pipe_inode_info;
struct inode;
struct net;
# 114 "include/linux/net.h"
enum sock_shutdown_cmd {
 SHUT_RD = 0,
 SHUT_WR = 1,
 SHUT_RDWR = 2,
};

struct socket_wq {
 wait_queue_head_t wait;
 struct fasync_struct *fasync_list;
 struct rcu_head rcu;
} __attribute__((__aligned__((1 << 5))));
# 136 "include/linux/net.h"
struct socket {
 socket_state state;

 ;
 short type;
 ;

 unsigned long flags;

 struct socket_wq *wq;

 struct file *file;
 struct sock *sk;
 const struct proto_ops *ops;
};

struct vm_area_struct;
struct page;
struct kiocb;
struct sockaddr;
struct msghdr;
struct module;

struct proto_ops {
 int family;
 struct module *owner;
 int (*release) (struct socket *sock);
 int (*bind) (struct socket *sock,
          struct sockaddr *myaddr,
          int sockaddr_len);
 int (*connect) (struct socket *sock,
          struct sockaddr *vaddr,
          int sockaddr_len, int flags);
 int (*socketpair)(struct socket *sock1,
          struct socket *sock2);
 int (*accept) (struct socket *sock,
          struct socket *newsock, int flags);
 int (*getname) (struct socket *sock,
          struct sockaddr *addr,
          int *sockaddr_len, int peer);
 unsigned int (*poll) (struct file *file, struct socket *sock,
          struct poll_table_struct *wait);
 int (*ioctl) (struct socket *sock, unsigned int cmd,
          unsigned long arg);




 int (*listen) (struct socket *sock, int len);
 int (*shutdown) (struct socket *sock, int flags);
 int (*setsockopt)(struct socket *sock, int level,
          int optname, char *optval, unsigned int optlen);
 int (*getsockopt)(struct socket *sock, int level,
          int optname, char *optval, int *optlen);






 int (*sendmsg) (struct kiocb *iocb, struct socket *sock,
          struct msghdr *m, size_t total_len);
 int (*recvmsg) (struct kiocb *iocb, struct socket *sock,
          struct msghdr *m, size_t total_len,
          int flags);
 int (*mmap) (struct file *file, struct socket *sock,
          struct vm_area_struct * vma);
 ssize_t (*sendpage) (struct socket *sock, struct page *page,
          int offset, size_t size, int flags);
 ssize_t (*splice_read)(struct socket *sock, loff_t *ppos,
           struct pipe_inode_info *pipe, size_t len, unsigned int flags);
};




struct net_proto_family {
 int family;
 int (*create)(struct net *net, struct socket *sock,
      int protocol, int kern);
 struct module *owner;
};

struct iovec;
struct kvec;

enum {
 SOCK_WAKE_IO,
 SOCK_WAKE_WAITD,
 SOCK_WAKE_SPACE,
 SOCK_WAKE_URG,
};

extern int sock_wake_async(struct socket *sk, int how, int band);
extern int sock_register(const struct net_proto_family *fam);
extern void sock_unregister(int family);
extern int sock_create(int family, int type, int proto,
     struct socket **res);
extern int sock_create_kern(int family, int type, int proto,
          struct socket **res);
extern int sock_create_lite(int family, int type, int proto,
          struct socket **res);
extern void sock_release(struct socket *sock);
extern int sock_sendmsg(struct socket *sock, struct msghdr *msg,
      size_t len);
extern int sock_recvmsg(struct socket *sock, struct msghdr *msg,
      size_t size, int flags);
extern int sock_map_fd(struct socket *sock, int flags);
extern struct socket *sockfd_lookup(int fd, int *err);

extern int net_ratelimit(void);




extern int kernel_sendmsg(struct socket *sock, struct msghdr *msg,
        struct kvec *vec, size_t num, size_t len);
extern int kernel_recvmsg(struct socket *sock, struct msghdr *msg,
        struct kvec *vec, size_t num,
        size_t len, int flags);

extern int kernel_bind(struct socket *sock, struct sockaddr *addr,
         int addrlen);
extern int kernel_listen(struct socket *sock, int backlog);
extern int kernel_accept(struct socket *sock, struct socket **newsock,
    int flags);
extern int kernel_connect(struct socket *sock, struct sockaddr *addr,
     int addrlen, int flags);
extern int kernel_getsockname(struct socket *sock, struct sockaddr *addr,
         int *addrlen);
extern int kernel_getpeername(struct socket *sock, struct sockaddr *addr,
         int *addrlen);
extern int kernel_getsockopt(struct socket *sock, int level, int optname,
        char *optval, int *optlen);
extern int kernel_setsockopt(struct socket *sock, int level, int optname,
        char *optval, unsigned int optlen);
extern int kernel_sendpage(struct socket *sock, struct page *page, int offset,
      size_t size, int flags);
extern int kernel_sock_ioctl(struct socket *sock, int cmd, unsigned long arg);
extern int kernel_sock_shutdown(struct socket *sock,
    enum sock_shutdown_cmd how);
# 289 "include/linux/net.h"
# 1 "include/linux/sysctl.h" 1
# 29 "include/linux/sysctl.h"
struct completion;






struct __sysctl_args {
 int *name;
 int nlen;
 void *oldval;
 size_t *oldlenp;
 void *newval;
 size_t newlen;
 unsigned long __unused[4];
};





enum
{
 CTL_KERN=1,
 CTL_VM=2,
 CTL_NET=3,
 CTL_PROC=4,
 CTL_FS=5,
 CTL_DEBUG=6,
 CTL_DEV=7,
 CTL_BUS=8,
 CTL_ABI=9,
 CTL_CPU=10,
 CTL_ARLAN=254,
 CTL_S390DBF=5677,
 CTL_SUNRPC=7249,
 CTL_PM=9899,
 CTL_FRV=9898,
};


enum
{
 CTL_BUS_ISA=1
};


enum
{
 INOTIFY_MAX_USER_INSTANCES=1,
 INOTIFY_MAX_USER_WATCHES=2,
 INOTIFY_MAX_QUEUED_EVENTS=3
};


enum
{
 KERN_OSTYPE=1,
 KERN_OSRELEASE=2,
 KERN_OSREV=3,
 KERN_VERSION=4,
 KERN_SECUREMASK=5,
 KERN_PROF=6,
 KERN_NODENAME=7,
 KERN_DOMAINNAME=8,

 KERN_PANIC=15,
 KERN_REALROOTDEV=16,

 KERN_SPARC_REBOOT=21,
 KERN_CTLALTDEL=22,
 KERN_PRINTK=23,
 KERN_NAMETRANS=24,
 KERN_PPC_HTABRECLAIM=25,
 KERN_PPC_ZEROPAGED=26,
 KERN_PPC_POWERSAVE_NAP=27,
 KERN_MODPROBE=28,
 KERN_SG_BIG_BUFF=29,
 KERN_ACCT=30,
 KERN_PPC_L2CR=31,

 KERN_RTSIGNR=32,
 KERN_RTSIGMAX=33,

 KERN_SHMMAX=34,
 KERN_MSGMAX=35,
 KERN_MSGMNB=36,
 KERN_MSGPOOL=37,
 KERN_SYSRQ=38,
 KERN_MAX_THREADS=39,
  KERN_RANDOM=40,
  KERN_SHMALL=41,
  KERN_MSGMNI=42,
  KERN_SEM=43,
  KERN_SPARC_STOP_A=44,
  KERN_SHMMNI=45,
 KERN_OVERFLOWUID=46,
 KERN_OVERFLOWGID=47,
 KERN_SHMPATH=48,
 KERN_HOTPLUG=49,
 KERN_IEEE_EMULATION_WARNINGS=50,
 KERN_S390_USER_DEBUG_LOGGING=51,
 KERN_CORE_USES_PID=52,
 KERN_TAINTED=53,
 KERN_CADPID=54,
 KERN_PIDMAX=55,
   KERN_CORE_PATTERN=56,
 KERN_PANIC_ON_OOPS=57,
 KERN_HPPA_PWRSW=58,
 KERN_HPPA_UNALIGNED=59,
 KERN_PRINTK_RATELIMIT=60,
 KERN_PRINTK_RATELIMIT_BURST=61,
 KERN_PTY=62,
 KERN_NGROUPS_MAX=63,
 KERN_SPARC_SCONS_PWROFF=64,
 KERN_HZ_TIMER=65,
 KERN_UNKNOWN_NMI_PANIC=66,
 KERN_BOOTLOADER_TYPE=67,
 KERN_RANDOMIZE=68,
 KERN_SETUID_DUMPABLE=69,
 KERN_SPIN_RETRY=70,
 KERN_ACPI_VIDEO_FLAGS=71,
 KERN_IA64_UNALIGNED=72,
 KERN_COMPAT_LOG=73,
 KERN_MAX_LOCK_DEPTH=74,
 KERN_NMI_WATCHDOG=75,
 KERN_PANIC_ON_NMI=76,
};




enum
{
 VM_UNUSED1=1,
 VM_UNUSED2=2,
 VM_UNUSED3=3,
 VM_UNUSED4=4,
 VM_OVERCOMMIT_MEMORY=5,
 VM_UNUSED5=6,
 VM_UNUSED7=7,
 VM_UNUSED8=8,
 VM_UNUSED9=9,
 VM_PAGE_CLUSTER=10,
 VM_DIRTY_BACKGROUND=11,
 VM_DIRTY_RATIO=12,
 VM_DIRTY_WB_CS=13,
 VM_DIRTY_EXPIRE_CS=14,
 VM_NR_PDFLUSH_THREADS=15,
 VM_OVERCOMMIT_RATIO=16,
 VM_PAGEBUF=17,
 VM_HUGETLB_PAGES=18,
 VM_SWAPPINESS=19,
 VM_LOWMEM_RESERVE_RATIO=20,
 VM_MIN_FREE_KBYTES=21,
 VM_MAX_MAP_COUNT=22,
 VM_LAPTOP_MODE=23,
 VM_BLOCK_DUMP=24,
 VM_HUGETLB_GROUP=25,
 VM_VFS_CACHE_PRESSURE=26,
 VM_LEGACY_VA_LAYOUT=27,
 VM_SWAP_TOKEN_TIMEOUT=28,
 VM_DROP_PAGECACHE=29,
 VM_PERCPU_PAGELIST_FRACTION=30,
 VM_ZONE_RECLAIM_MODE=31,
 VM_MIN_UNMAPPED=32,
 VM_PANIC_ON_OOM=33,
 VM_VDSO_ENABLED=34,
 VM_MIN_SLAB=35,
};



enum
{
 NET_CORE=1,
 NET_ETHER=2,
 NET_802=3,
 NET_UNIX=4,
 NET_IPV4=5,
 NET_IPX=6,
 NET_ATALK=7,
 NET_NETROM=8,
 NET_AX25=9,
 NET_BRIDGE=10,
 NET_ROSE=11,
 NET_IPV6=12,
 NET_X25=13,
 NET_TR=14,
 NET_DECNET=15,
 NET_ECONET=16,
 NET_SCTP=17,
 NET_LLC=18,
 NET_NETFILTER=19,
 NET_DCCP=20,
 NET_IRDA=412,
};


enum
{
 RANDOM_POOLSIZE=1,
 RANDOM_ENTROPY_COUNT=2,
 RANDOM_READ_THRESH=3,
 RANDOM_WRITE_THRESH=4,
 RANDOM_BOOT_ID=5,
 RANDOM_UUID=6
};


enum
{
 PTY_MAX=1,
 PTY_NR=2
};


enum
{
 BUS_ISA_MEM_BASE=1,
 BUS_ISA_PORT_BASE=2,
 BUS_ISA_PORT_SHIFT=3
};


enum
{
 NET_CORE_WMEM_MAX=1,
 NET_CORE_RMEM_MAX=2,
 NET_CORE_WMEM_DEFAULT=3,
 NET_CORE_RMEM_DEFAULT=4,

 NET_CORE_MAX_BACKLOG=6,
 NET_CORE_FASTROUTE=7,
 NET_CORE_MSG_COST=8,
 NET_CORE_MSG_BURST=9,
 NET_CORE_OPTMEM_MAX=10,
 NET_CORE_HOT_LIST_LENGTH=11,
 NET_CORE_DIVERT_VERSION=12,
 NET_CORE_NO_CONG_THRESH=13,
 NET_CORE_NO_CONG=14,
 NET_CORE_LO_CONG=15,
 NET_CORE_MOD_CONG=16,
 NET_CORE_DEV_WEIGHT=17,
 NET_CORE_SOMAXCONN=18,
 NET_CORE_BUDGET=19,
 NET_CORE_AEVENT_ETIME=20,
 NET_CORE_AEVENT_RSEQTH=21,
 NET_CORE_WARNINGS=22,

 NET_CORE_QUEUE_MASK=23,

};







enum
{
 NET_UNIX_DESTROY_DELAY=1,
 NET_UNIX_DELETE_DELAY=2,
 NET_UNIX_MAX_DGRAM_QLEN=3,
};


enum
{
 NET_NF_CONNTRACK_MAX=1,
 NET_NF_CONNTRACK_TCP_TIMEOUT_SYN_SENT=2,
 NET_NF_CONNTRACK_TCP_TIMEOUT_SYN_RECV=3,
 NET_NF_CONNTRACK_TCP_TIMEOUT_ESTABLISHED=4,
 NET_NF_CONNTRACK_TCP_TIMEOUT_FIN_WAIT=5,
 NET_NF_CONNTRACK_TCP_TIMEOUT_CLOSE_WAIT=6,
 NET_NF_CONNTRACK_TCP_TIMEOUT_LAST_ACK=7,
 NET_NF_CONNTRACK_TCP_TIMEOUT_TIME_WAIT=8,
 NET_NF_CONNTRACK_TCP_TIMEOUT_CLOSE=9,
 NET_NF_CONNTRACK_UDP_TIMEOUT=10,
 NET_NF_CONNTRACK_UDP_TIMEOUT_STREAM=11,
 NET_NF_CONNTRACK_ICMP_TIMEOUT=12,
 NET_NF_CONNTRACK_GENERIC_TIMEOUT=13,
 NET_NF_CONNTRACK_BUCKETS=14,
 NET_NF_CONNTRACK_LOG_INVALID=15,
 NET_NF_CONNTRACK_TCP_TIMEOUT_MAX_RETRANS=16,
 NET_NF_CONNTRACK_TCP_LOOSE=17,
 NET_NF_CONNTRACK_TCP_BE_LIBERAL=18,
 NET_NF_CONNTRACK_TCP_MAX_RETRANS=19,
 NET_NF_CONNTRACK_SCTP_TIMEOUT_CLOSED=20,
 NET_NF_CONNTRACK_SCTP_TIMEOUT_COOKIE_WAIT=21,
 NET_NF_CONNTRACK_SCTP_TIMEOUT_COOKIE_ECHOED=22,
 NET_NF_CONNTRACK_SCTP_TIMEOUT_ESTABLISHED=23,
 NET_NF_CONNTRACK_SCTP_TIMEOUT_SHUTDOWN_SENT=24,
 NET_NF_CONNTRACK_SCTP_TIMEOUT_SHUTDOWN_RECD=25,
 NET_NF_CONNTRACK_SCTP_TIMEOUT_SHUTDOWN_ACK_SENT=26,
 NET_NF_CONNTRACK_COUNT=27,
 NET_NF_CONNTRACK_ICMPV6_TIMEOUT=28,
 NET_NF_CONNTRACK_FRAG6_TIMEOUT=29,
 NET_NF_CONNTRACK_FRAG6_LOW_THRESH=30,
 NET_NF_CONNTRACK_FRAG6_HIGH_THRESH=31,
 NET_NF_CONNTRACK_CHECKSUM=32,
 NET_NF_CONNTRACK_FTP_ENABLE=33,
 NET_NF_CONNTRACK_SIP_ENABLE=34,
 NET_NF_CONNTRACK_H323_ENABLE=35,
 NET_NF_CONNTRACK_RTSP_ENABLE=36,
 NET_NF_CONNTRACK_L2TP_ENABLE=37,
 NET_NF_CONNTRACK_IPSEC_ENABLE=38,
 NET_NF_CONNTRACK_PPTP_ENABLE=39,
};


enum
{

 NET_IPV4_FORWARD=8,
 NET_IPV4_DYNADDR=9,

 NET_IPV4_CONF=16,
 NET_IPV4_NEIGH=17,
 NET_IPV4_ROUTE=18,
 NET_IPV4_FIB_HASH=19,
 NET_IPV4_NETFILTER=20,

 NET_IPV4_TCP_TIMESTAMPS=33,
 NET_IPV4_TCP_WINDOW_SCALING=34,
 NET_IPV4_TCP_SACK=35,
 NET_IPV4_TCP_RETRANS_COLLAPSE=36,
 NET_IPV4_DEFAULT_TTL=37,
 NET_IPV4_AUTOCONFIG=38,
 NET_IPV4_NO_PMTU_DISC=39,
 NET_IPV4_TCP_SYN_RETRIES=40,
 NET_IPV4_IPFRAG_HIGH_THRESH=41,
 NET_IPV4_IPFRAG_LOW_THRESH=42,
 NET_IPV4_IPFRAG_TIME=43,
 NET_IPV4_TCP_MAX_KA_PROBES=44,
 NET_IPV4_TCP_KEEPALIVE_TIME=45,
 NET_IPV4_TCP_KEEPALIVE_PROBES=46,
 NET_IPV4_TCP_RETRIES1=47,
 NET_IPV4_TCP_RETRIES2=48,
 NET_IPV4_TCP_FIN_TIMEOUT=49,
 NET_IPV4_IP_MASQ_DEBUG=50,
 NET_TCP_SYNCOOKIES=51,
 NET_TCP_STDURG=52,
 NET_TCP_RFC1337=53,
 NET_TCP_SYN_TAILDROP=54,
 NET_TCP_MAX_SYN_BACKLOG=55,
 NET_IPV4_LOCAL_PORT_RANGE=56,
 NET_IPV4_ICMP_ECHO_IGNORE_ALL=57,
 NET_IPV4_ICMP_ECHO_IGNORE_BROADCASTS=58,
 NET_IPV4_ICMP_SOURCEQUENCH_RATE=59,
 NET_IPV4_ICMP_DESTUNREACH_RATE=60,
 NET_IPV4_ICMP_TIMEEXCEED_RATE=61,
 NET_IPV4_ICMP_PARAMPROB_RATE=62,
 NET_IPV4_ICMP_ECHOREPLY_RATE=63,
 NET_IPV4_ICMP_IGNORE_BOGUS_ERROR_RESPONSES=64,
 NET_IPV4_IGMP_MAX_MEMBERSHIPS=65,
 NET_TCP_TW_RECYCLE=66,
 NET_IPV4_ALWAYS_DEFRAG=67,
 NET_IPV4_TCP_KEEPALIVE_INTVL=68,
 NET_IPV4_INET_PEER_THRESHOLD=69,
 NET_IPV4_INET_PEER_MINTTL=70,
 NET_IPV4_INET_PEER_MAXTTL=71,
 NET_IPV4_INET_PEER_GC_MINTIME=72,
 NET_IPV4_INET_PEER_GC_MAXTIME=73,
 NET_TCP_ORPHAN_RETRIES=74,
 NET_TCP_ABORT_ON_OVERFLOW=75,
 NET_TCP_SYNACK_RETRIES=76,
 NET_TCP_MAX_ORPHANS=77,
 NET_TCP_MAX_TW_BUCKETS=78,
 NET_TCP_FACK=79,
 NET_TCP_REORDERING=80,
 NET_TCP_ECN=81,
 NET_TCP_DSACK=82,
 NET_TCP_MEM=83,
 NET_TCP_WMEM=84,
 NET_TCP_RMEM=85,
 NET_TCP_APP_WIN=86,
 NET_TCP_ADV_WIN_SCALE=87,
 NET_IPV4_NONLOCAL_BIND=88,
 NET_IPV4_ICMP_RATELIMIT=89,
 NET_IPV4_ICMP_RATEMASK=90,
 NET_TCP_TW_REUSE=91,
 NET_TCP_FRTO=92,
 NET_TCP_LOW_LATENCY=93,
 NET_IPV4_IPFRAG_SECRET_INTERVAL=94,
 NET_IPV4_IGMP_MAX_MSF=96,
 NET_TCP_NO_METRICS_SAVE=97,
 NET_TCP_DEFAULT_WIN_SCALE=105,
 NET_TCP_MODERATE_RCVBUF=106,
 NET_TCP_TSO_WIN_DIVISOR=107,
 NET_TCP_BIC_BETA=108,
 NET_IPV4_ICMP_ERRORS_USE_INBOUND_IFADDR=109,
 NET_TCP_CONG_CONTROL=110,
 NET_TCP_ABC=111,
 NET_IPV4_IPFRAG_MAX_DIST=112,
  NET_TCP_MTU_PROBING=113,
 NET_TCP_BASE_MSS=114,
 NET_IPV4_TCP_WORKAROUND_SIGNED_WINDOWS=115,
 NET_TCP_DMA_COPYBREAK=116,
 NET_TCP_SLOW_START_AFTER_IDLE=117,
 NET_CIPSOV4_CACHE_ENABLE=118,
 NET_CIPSOV4_CACHE_BUCKET_SIZE=119,
 NET_CIPSOV4_RBM_OPTFMT=120,
 NET_CIPSOV4_RBM_STRICTVALID=121,
 NET_TCP_AVAIL_CONG_CONTROL=122,
 NET_TCP_ALLOWED_CONG_CONTROL=123,
 NET_TCP_MAX_SSTHRESH=124,
 NET_TCP_FRTO_RESPONSE=125,
};

enum {
 NET_IPV4_ROUTE_FLUSH=1,
 NET_IPV4_ROUTE_MIN_DELAY=2,
 NET_IPV4_ROUTE_MAX_DELAY=3,
 NET_IPV4_ROUTE_GC_THRESH=4,
 NET_IPV4_ROUTE_MAX_SIZE=5,
 NET_IPV4_ROUTE_GC_MIN_INTERVAL=6,
 NET_IPV4_ROUTE_GC_TIMEOUT=7,
 NET_IPV4_ROUTE_GC_INTERVAL=8,
 NET_IPV4_ROUTE_REDIRECT_LOAD=9,
 NET_IPV4_ROUTE_REDIRECT_NUMBER=10,
 NET_IPV4_ROUTE_REDIRECT_SILENCE=11,
 NET_IPV4_ROUTE_ERROR_COST=12,
 NET_IPV4_ROUTE_ERROR_BURST=13,
 NET_IPV4_ROUTE_GC_ELASTICITY=14,
 NET_IPV4_ROUTE_MTU_EXPIRES=15,
 NET_IPV4_ROUTE_MIN_PMTU=16,
 NET_IPV4_ROUTE_MIN_ADVMSS=17,
 NET_IPV4_ROUTE_SECRET_INTERVAL=18,
 NET_IPV4_ROUTE_GC_MIN_INTERVAL_MS=19,
};

enum
{
 NET_PROTO_CONF_ALL=-2,
 NET_PROTO_CONF_DEFAULT=-3


};

enum
{
 NET_IPV4_CONF_FORWARDING=1,
 NET_IPV4_CONF_MC_FORWARDING=2,
 NET_IPV4_CONF_PROXY_ARP=3,
 NET_IPV4_CONF_ACCEPT_REDIRECTS=4,
 NET_IPV4_CONF_SECURE_REDIRECTS=5,
 NET_IPV4_CONF_SEND_REDIRECTS=6,
 NET_IPV4_CONF_SHARED_MEDIA=7,
 NET_IPV4_CONF_RP_FILTER=8,
 NET_IPV4_CONF_ACCEPT_SOURCE_ROUTE=9,
 NET_IPV4_CONF_BOOTP_RELAY=10,
 NET_IPV4_CONF_LOG_MARTIANS=11,
 NET_IPV4_CONF_TAG=12,
 NET_IPV4_CONF_ARPFILTER=13,
 NET_IPV4_CONF_MEDIUM_ID=14,
 NET_IPV4_CONF_NOXFRM=15,
 NET_IPV4_CONF_NOPOLICY=16,
 NET_IPV4_CONF_FORCE_IGMP_VERSION=17,
 NET_IPV4_CONF_ARP_ANNOUNCE=18,
 NET_IPV4_CONF_ARP_IGNORE=19,
 NET_IPV4_CONF_PROMOTE_SECONDARIES=20,
 NET_IPV4_CONF_ARP_ACCEPT=21,
 NET_IPV4_CONF_ARP_NOTIFY=22,
};


enum
{
 NET_IPV4_NF_CONNTRACK_MAX=1,
 NET_IPV4_NF_CONNTRACK_TCP_TIMEOUT_SYN_SENT=2,
 NET_IPV4_NF_CONNTRACK_TCP_TIMEOUT_SYN_RECV=3,
 NET_IPV4_NF_CONNTRACK_TCP_TIMEOUT_ESTABLISHED=4,
 NET_IPV4_NF_CONNTRACK_TCP_TIMEOUT_FIN_WAIT=5,
 NET_IPV4_NF_CONNTRACK_TCP_TIMEOUT_CLOSE_WAIT=6,
 NET_IPV4_NF_CONNTRACK_TCP_TIMEOUT_LAST_ACK=7,
 NET_IPV4_NF_CONNTRACK_TCP_TIMEOUT_TIME_WAIT=8,
 NET_IPV4_NF_CONNTRACK_TCP_TIMEOUT_CLOSE=9,
 NET_IPV4_NF_CONNTRACK_UDP_TIMEOUT=10,
 NET_IPV4_NF_CONNTRACK_UDP_TIMEOUT_STREAM=11,
 NET_IPV4_NF_CONNTRACK_ICMP_TIMEOUT=12,
 NET_IPV4_NF_CONNTRACK_GENERIC_TIMEOUT=13,
 NET_IPV4_NF_CONNTRACK_BUCKETS=14,
 NET_IPV4_NF_CONNTRACK_LOG_INVALID=15,
 NET_IPV4_NF_CONNTRACK_TCP_TIMEOUT_MAX_RETRANS=16,
 NET_IPV4_NF_CONNTRACK_TCP_LOOSE=17,
 NET_IPV4_NF_CONNTRACK_TCP_BE_LIBERAL=18,
 NET_IPV4_NF_CONNTRACK_TCP_MAX_RETRANS=19,
  NET_IPV4_NF_CONNTRACK_SCTP_TIMEOUT_CLOSED=20,
  NET_IPV4_NF_CONNTRACK_SCTP_TIMEOUT_COOKIE_WAIT=21,
  NET_IPV4_NF_CONNTRACK_SCTP_TIMEOUT_COOKIE_ECHOED=22,
  NET_IPV4_NF_CONNTRACK_SCTP_TIMEOUT_ESTABLISHED=23,
  NET_IPV4_NF_CONNTRACK_SCTP_TIMEOUT_SHUTDOWN_SENT=24,
  NET_IPV4_NF_CONNTRACK_SCTP_TIMEOUT_SHUTDOWN_RECD=25,
  NET_IPV4_NF_CONNTRACK_SCTP_TIMEOUT_SHUTDOWN_ACK_SENT=26,
 NET_IPV4_NF_CONNTRACK_COUNT=27,
 NET_IPV4_NF_CONNTRACK_CHECKSUM=28,
};


enum {
 NET_IPV6_CONF=16,
 NET_IPV6_NEIGH=17,
 NET_IPV6_ROUTE=18,
 NET_IPV6_ICMP=19,
 NET_IPV6_BINDV6ONLY=20,
 NET_IPV6_IP6FRAG_HIGH_THRESH=21,
 NET_IPV6_IP6FRAG_LOW_THRESH=22,
 NET_IPV6_IP6FRAG_TIME=23,
 NET_IPV6_IP6FRAG_SECRET_INTERVAL=24,
 NET_IPV6_MLD_MAX_MSF=25,
};

enum {
 NET_IPV6_ROUTE_FLUSH=1,
 NET_IPV6_ROUTE_GC_THRESH=2,
 NET_IPV6_ROUTE_MAX_SIZE=3,
 NET_IPV6_ROUTE_GC_MIN_INTERVAL=4,
 NET_IPV6_ROUTE_GC_TIMEOUT=5,
 NET_IPV6_ROUTE_GC_INTERVAL=6,
 NET_IPV6_ROUTE_GC_ELASTICITY=7,
 NET_IPV6_ROUTE_MTU_EXPIRES=8,
 NET_IPV6_ROUTE_MIN_ADVMSS=9,
 NET_IPV6_ROUTE_GC_MIN_INTERVAL_MS=10
};

enum {
 NET_IPV6_FORWARDING=1,
 NET_IPV6_HOP_LIMIT=2,
 NET_IPV6_MTU=3,
 NET_IPV6_ACCEPT_RA=4,
 NET_IPV6_ACCEPT_REDIRECTS=5,
 NET_IPV6_AUTOCONF=6,
 NET_IPV6_DAD_TRANSMITS=7,
 NET_IPV6_RTR_SOLICITS=8,
 NET_IPV6_RTR_SOLICIT_INTERVAL=9,
 NET_IPV6_RTR_SOLICIT_DELAY=10,
 NET_IPV6_USE_TEMPADDR=11,
 NET_IPV6_TEMP_VALID_LFT=12,
 NET_IPV6_TEMP_PREFERED_LFT=13,
 NET_IPV6_REGEN_MAX_RETRY=14,
 NET_IPV6_MAX_DESYNC_FACTOR=15,
 NET_IPV6_MAX_ADDRESSES=16,
 NET_IPV6_FORCE_MLD_VERSION=17,
 NET_IPV6_ACCEPT_RA_DEFRTR=18,
 NET_IPV6_ACCEPT_RA_PINFO=19,
 NET_IPV6_ACCEPT_RA_RTR_PREF=20,
 NET_IPV6_RTR_PROBE_INTERVAL=21,
 NET_IPV6_ACCEPT_RA_RT_INFO_MAX_PLEN=22,
 NET_IPV6_PROXY_NDP=23,
 NET_IPV6_ACCEPT_SOURCE_ROUTE=25,
 __NET_IPV6_MAX
};


enum {
 NET_IPV6_ICMP_RATELIMIT=1
};


enum {
 NET_NEIGH_MCAST_SOLICIT=1,
 NET_NEIGH_UCAST_SOLICIT=2,
 NET_NEIGH_APP_SOLICIT=3,
 NET_NEIGH_RETRANS_TIME=4,
 NET_NEIGH_REACHABLE_TIME=5,
 NET_NEIGH_DELAY_PROBE_TIME=6,
 NET_NEIGH_GC_STALE_TIME=7,
 NET_NEIGH_UNRES_QLEN=8,
 NET_NEIGH_PROXY_QLEN=9,
 NET_NEIGH_ANYCAST_DELAY=10,
 NET_NEIGH_PROXY_DELAY=11,
 NET_NEIGH_LOCKTIME=12,
 NET_NEIGH_GC_INTERVAL=13,
 NET_NEIGH_GC_THRESH1=14,
 NET_NEIGH_GC_THRESH2=15,
 NET_NEIGH_GC_THRESH3=16,
 NET_NEIGH_RETRANS_TIME_MS=17,
 NET_NEIGH_REACHABLE_TIME_MS=18,

 NET_NEIGH_DEFAULT_ROUTE=19,

};


enum {
 NET_DCCP_DEFAULT=1,
};


enum {
 NET_IPX_PPROP_BROADCASTING=1,
 NET_IPX_FORWARDING=2
};


enum {
 NET_LLC2=1,
 NET_LLC_STATION=2,
};


enum {
 NET_LLC2_TIMEOUT=1,
};


enum {
 NET_LLC_STATION_ACK_TIMEOUT=1,
};


enum {
 NET_LLC2_ACK_TIMEOUT=1,
 NET_LLC2_P_TIMEOUT=2,
 NET_LLC2_REJ_TIMEOUT=3,
 NET_LLC2_BUSY_TIMEOUT=4,
};


enum {
 NET_ATALK_AARP_EXPIRY_TIME=1,
 NET_ATALK_AARP_TICK_TIME=2,
 NET_ATALK_AARP_RETRANSMIT_LIMIT=3,
 NET_ATALK_AARP_RESOLVE_TIME=4
};



enum {
 NET_NETROM_DEFAULT_PATH_QUALITY=1,
 NET_NETROM_OBSOLESCENCE_COUNT_INITIALISER=2,
 NET_NETROM_NETWORK_TTL_INITIALISER=3,
 NET_NETROM_TRANSPORT_TIMEOUT=4,
 NET_NETROM_TRANSPORT_MAXIMUM_TRIES=5,
 NET_NETROM_TRANSPORT_ACKNOWLEDGE_DELAY=6,
 NET_NETROM_TRANSPORT_BUSY_DELAY=7,
 NET_NETROM_TRANSPORT_REQUESTED_WINDOW_SIZE=8,
 NET_NETROM_TRANSPORT_NO_ACTIVITY_TIMEOUT=9,
 NET_NETROM_ROUTING_CONTROL=10,
 NET_NETROM_LINK_FAILS_COUNT=11,
 NET_NETROM_RESET=12
};


enum {
 NET_AX25_IP_DEFAULT_MODE=1,
 NET_AX25_DEFAULT_MODE=2,
 NET_AX25_BACKOFF_TYPE=3,
 NET_AX25_CONNECT_MODE=4,
 NET_AX25_STANDARD_WINDOW=5,
 NET_AX25_EXTENDED_WINDOW=6,
 NET_AX25_T1_TIMEOUT=7,
 NET_AX25_T2_TIMEOUT=8,
 NET_AX25_T3_TIMEOUT=9,
 NET_AX25_IDLE_TIMEOUT=10,
 NET_AX25_N2=11,
 NET_AX25_PACLEN=12,
 NET_AX25_PROTOCOL=13,
 NET_AX25_DAMA_SLAVE_TIMEOUT=14
};


enum {
 NET_ROSE_RESTART_REQUEST_TIMEOUT=1,
 NET_ROSE_CALL_REQUEST_TIMEOUT=2,
 NET_ROSE_RESET_REQUEST_TIMEOUT=3,
 NET_ROSE_CLEAR_REQUEST_TIMEOUT=4,
 NET_ROSE_ACK_HOLD_BACK_TIMEOUT=5,
 NET_ROSE_ROUTING_CONTROL=6,
 NET_ROSE_LINK_FAIL_TIMEOUT=7,
 NET_ROSE_MAX_VCS=8,
 NET_ROSE_WINDOW_SIZE=9,
 NET_ROSE_NO_ACTIVITY_TIMEOUT=10
};


enum {
 NET_X25_RESTART_REQUEST_TIMEOUT=1,
 NET_X25_CALL_REQUEST_TIMEOUT=2,
 NET_X25_RESET_REQUEST_TIMEOUT=3,
 NET_X25_CLEAR_REQUEST_TIMEOUT=4,
 NET_X25_ACK_HOLD_BACK_TIMEOUT=5,
 NET_X25_FORWARD=6
};


enum
{
 NET_TR_RIF_TIMEOUT=1
};


enum {
 NET_DECNET_NODE_TYPE = 1,
 NET_DECNET_NODE_ADDRESS = 2,
 NET_DECNET_NODE_NAME = 3,
 NET_DECNET_DEFAULT_DEVICE = 4,
 NET_DECNET_TIME_WAIT = 5,
 NET_DECNET_DN_COUNT = 6,
 NET_DECNET_DI_COUNT = 7,
 NET_DECNET_DR_COUNT = 8,
 NET_DECNET_DST_GC_INTERVAL = 9,
 NET_DECNET_CONF = 10,
 NET_DECNET_NO_FC_MAX_CWND = 11,
 NET_DECNET_MEM = 12,
 NET_DECNET_RMEM = 13,
 NET_DECNET_WMEM = 14,
 NET_DECNET_DEBUG_LEVEL = 255
};


enum {
 NET_DECNET_CONF_LOOPBACK = -2,
 NET_DECNET_CONF_DDCMP = -3,
 NET_DECNET_CONF_PPP = -4,
 NET_DECNET_CONF_X25 = -5,
 NET_DECNET_CONF_GRE = -6,
 NET_DECNET_CONF_ETHER = -7


};


enum {
 NET_DECNET_CONF_DEV_PRIORITY = 1,
 NET_DECNET_CONF_DEV_T1 = 2,
 NET_DECNET_CONF_DEV_T2 = 3,
 NET_DECNET_CONF_DEV_T3 = 4,
 NET_DECNET_CONF_DEV_FORWARDING = 5,
 NET_DECNET_CONF_DEV_BLKSIZE = 6,
 NET_DECNET_CONF_DEV_STATE = 7
};


enum {
 NET_SCTP_RTO_INITIAL = 1,
 NET_SCTP_RTO_MIN = 2,
 NET_SCTP_RTO_MAX = 3,
 NET_SCTP_RTO_ALPHA = 4,
 NET_SCTP_RTO_BETA = 5,
 NET_SCTP_VALID_COOKIE_LIFE = 6,
 NET_SCTP_ASSOCIATION_MAX_RETRANS = 7,
 NET_SCTP_PATH_MAX_RETRANS = 8,
 NET_SCTP_MAX_INIT_RETRANSMITS = 9,
 NET_SCTP_HB_INTERVAL = 10,
 NET_SCTP_PRESERVE_ENABLE = 11,
 NET_SCTP_MAX_BURST = 12,
 NET_SCTP_ADDIP_ENABLE = 13,
 NET_SCTP_PRSCTP_ENABLE = 14,
 NET_SCTP_SNDBUF_POLICY = 15,
 NET_SCTP_SACK_TIMEOUT = 16,
 NET_SCTP_RCVBUF_POLICY = 17,
};


enum {
 NET_BRIDGE_NF_CALL_ARPTABLES = 1,
 NET_BRIDGE_NF_CALL_IPTABLES = 2,
 NET_BRIDGE_NF_CALL_IP6TABLES = 3,
 NET_BRIDGE_NF_FILTER_VLAN_TAGGED = 4,
 NET_BRIDGE_NF_FILTER_PPPOE_TAGGED = 5,
};


enum {
 NET_IRDA_DISCOVERY=1,
 NET_IRDA_DEVNAME=2,
 NET_IRDA_DEBUG=3,
 NET_IRDA_FAST_POLL=4,
 NET_IRDA_DISCOVERY_SLOTS=5,
 NET_IRDA_DISCOVERY_TIMEOUT=6,
 NET_IRDA_SLOT_TIMEOUT=7,
 NET_IRDA_MAX_BAUD_RATE=8,
 NET_IRDA_MIN_TX_TURN_TIME=9,
 NET_IRDA_MAX_TX_DATA_SIZE=10,
 NET_IRDA_MAX_TX_WINDOW=11,
 NET_IRDA_MAX_NOREPLY_TIME=12,
 NET_IRDA_WARN_NOREPLY_TIME=13,
 NET_IRDA_LAP_KEEPALIVE_TIME=14,
};



enum
{
 FS_NRINODE=1,
 FS_STATINODE=2,
 FS_MAXINODE=3,
 FS_NRDQUOT=4,
 FS_MAXDQUOT=5,
 FS_NRFILE=6,
 FS_MAXFILE=7,
 FS_DENTRY=8,
 FS_NRSUPER=9,
 FS_MAXSUPER=10,
 FS_OVERFLOWUID=11,
 FS_OVERFLOWGID=12,
 FS_LEASES=13,
 FS_DIR_NOTIFY=14,
 FS_LEASE_TIME=15,
 FS_DQSTATS=16,
 FS_XFS=17,
 FS_AIO_NR=18,
 FS_AIO_MAX_NR=19,
 FS_INOTIFY=20,
 FS_OCFS2=988,
};


enum {
 FS_DQ_LOOKUPS = 1,
 FS_DQ_DROPS = 2,
 FS_DQ_READS = 3,
 FS_DQ_WRITES = 4,
 FS_DQ_CACHE_HITS = 5,
 FS_DQ_ALLOCATED = 6,
 FS_DQ_FREE = 7,
 FS_DQ_SYNCS = 8,
 FS_DQ_WARNINGS = 9,
};




enum {
 DEV_CDROM=1,
 DEV_HWMON=2,
 DEV_PARPORT=3,
 DEV_RAID=4,
 DEV_MAC_HID=5,
 DEV_SCSI=6,
 DEV_IPMI=7,
};


enum {
 DEV_CDROM_INFO=1,
 DEV_CDROM_AUTOCLOSE=2,
 DEV_CDROM_AUTOEJECT=3,
 DEV_CDROM_DEBUG=4,
 DEV_CDROM_LOCK=5,
 DEV_CDROM_CHECK_MEDIA=6
};


enum {
 DEV_PARPORT_DEFAULT=-3
};


enum {
 DEV_RAID_SPEED_LIMIT_MIN=1,
 DEV_RAID_SPEED_LIMIT_MAX=2
};


enum {
 DEV_PARPORT_DEFAULT_TIMESLICE=1,
 DEV_PARPORT_DEFAULT_SPINTIME=2
};


enum {
 DEV_PARPORT_SPINTIME=1,
 DEV_PARPORT_BASE_ADDR=2,
 DEV_PARPORT_IRQ=3,
 DEV_PARPORT_DMA=4,
 DEV_PARPORT_MODES=5,
 DEV_PARPORT_DEVICES=6,
 DEV_PARPORT_AUTOPROBE=16
};


enum {
 DEV_PARPORT_DEVICES_ACTIVE=-3,
};


enum {
 DEV_PARPORT_DEVICE_TIMESLICE=1,
};


enum {
 DEV_MAC_HID_KEYBOARD_SENDS_LINUX_KEYCODES=1,
 DEV_MAC_HID_KEYBOARD_LOCK_KEYCODES=2,
 DEV_MAC_HID_MOUSE_BUTTON_EMULATION=3,
 DEV_MAC_HID_MOUSE_BUTTON2_KEYCODE=4,
 DEV_MAC_HID_MOUSE_BUTTON3_KEYCODE=5,
 DEV_MAC_HID_ADB_MOUSE_SENDS_KEYCODES=6
};


enum {
 DEV_SCSI_LOGGING_LEVEL=1,
};


enum {
 DEV_IPMI_POWEROFF_POWERCYCLE=1,
};


enum
{
 ABI_DEFHANDLER_COFF=1,
 ABI_DEFHANDLER_ELF=2,
 ABI_DEFHANDLER_LCALL7=3,
 ABI_DEFHANDLER_LIBCSO=4,
 ABI_TRACE=5,
 ABI_FAKE_UTSNAME=6,
};





struct ctl_table;
struct nsproxy;
struct ctl_table_root;

struct ctl_table_set {
 struct list_head list;
 struct ctl_table_set *parent;
 int (*is_seen)(struct ctl_table_set *);
};

extern void setup_sysctl_set(struct ctl_table_set *p,
 struct ctl_table_set *parent,
 int (*is_seen)(struct ctl_table_set *));

struct ctl_table_header;

extern void sysctl_head_get(struct ctl_table_header *);
extern void sysctl_head_put(struct ctl_table_header *);
extern int sysctl_is_seen(struct ctl_table_header *);
extern struct ctl_table_header *sysctl_head_grab(struct ctl_table_header *);
extern struct ctl_table_header *sysctl_head_next(struct ctl_table_header *prev);
extern struct ctl_table_header *__sysctl_head_next(struct nsproxy *namespaces,
      struct ctl_table_header *prev);
extern void sysctl_head_finish(struct ctl_table_header *prev);
extern int sysctl_perm(struct ctl_table_root *root,
  struct ctl_table *table, int op);

typedef struct ctl_table ctl_table;

typedef int proc_handler (struct ctl_table *ctl, int write,
     void *buffer, size_t *lenp, loff_t *ppos);

extern int proc_dostring(struct ctl_table *, int,
    void *, size_t *, loff_t *);
extern int proc_dointvec(struct ctl_table *, int,
    void *, size_t *, loff_t *);
extern int proc_dointvec_minmax(struct ctl_table *, int,
    void *, size_t *, loff_t *);
extern int proc_dointvec_jiffies(struct ctl_table *, int,
     void *, size_t *, loff_t *);
extern int proc_dointvec_userhz_jiffies(struct ctl_table *, int,
     void *, size_t *, loff_t *);
extern int proc_dointvec_ms_jiffies(struct ctl_table *, int,
        void *, size_t *, loff_t *);
extern int proc_doulongvec_minmax(struct ctl_table *, int,
      void *, size_t *, loff_t *);
extern int proc_doulongvec_ms_jiffies_minmax(struct ctl_table *table, int,
          void *, size_t *, loff_t *);
extern int proc_do_large_bitmap(struct ctl_table *, int,
    void *, size_t *, loff_t *);
# 1027 "include/linux/sysctl.h"
struct ctl_table
{
 const char *procname;
 void *data;
 int maxlen;
 mode_t mode;
 struct ctl_table *child;
 struct ctl_table *parent;
 proc_handler *proc_handler;
 void *extra1;
 void *extra2;
};

struct ctl_table_root {
 struct list_head root_list;
 struct ctl_table_set default_set;
 struct ctl_table_set *(*lookup)(struct ctl_table_root *root,
        struct nsproxy *namespaces);
 int (*permissions)(struct ctl_table_root *root,
   struct nsproxy *namespaces, struct ctl_table *table);
};



struct ctl_table_header
{
 struct ctl_table *ctl_table;
 struct list_head ctl_entry;
 int used;
 int count;
 struct completion *unregistering;
 struct ctl_table *ctl_table_arg;
 struct ctl_table_root *root;
 struct ctl_table_set *set;
 struct ctl_table *attached_by;
 struct ctl_table *attached_to;
 struct ctl_table_header *parent;
};


struct ctl_path {
 const char *procname;
};

void register_sysctl_root(struct ctl_table_root *root);
struct ctl_table_header *__register_sysctl_paths(
 struct ctl_table_root *root, struct nsproxy *namespaces,
 const struct ctl_path *path, struct ctl_table *table);
struct ctl_table_header *register_sysctl_table(struct ctl_table * table);
struct ctl_table_header *register_sysctl_paths(const struct ctl_path *path,
      struct ctl_table *table);

void unregister_sysctl_table(struct ctl_table_header * table);
int sysctl_check_table(struct nsproxy *namespaces, struct ctl_table *table);
# 290 "include/linux/net.h" 2
# 1 "include/linux/ratelimit.h" 1
# 10 "include/linux/ratelimit.h"
struct ratelimit_state {
 spinlock_t lock;

 int interval;
 int burst;
 int printed;
 int missed;
 unsigned long begin;
};
# 28 "include/linux/ratelimit.h"
static inline __attribute__((always_inline)) void ratelimit_state_init(struct ratelimit_state *rs,
     int interval, int burst)
{
 do { spinlock_check(&rs->lock); do { *(&(&rs->lock)->rlock) = (raw_spinlock_t) { .raw_lock = { .lock = 0 }, }; } while (0); } while (0);
 rs->interval = interval;
 rs->burst = burst;
 rs->printed = 0;
 rs->missed = 0;
 rs->begin = 0;
}

extern int ___ratelimit(struct ratelimit_state *rs, const char *func);
# 291 "include/linux/net.h" 2
extern struct ratelimit_state net_ratelimit_state;
# 27 "include/linux/skbuff.h" 2
# 1 "include/linux/textsearch.h" 1
# 11 "include/linux/textsearch.h"
struct ts_config;
# 21 "include/linux/textsearch.h"
struct ts_state
{
 unsigned int offset;
 char cb[40];
};
# 37 "include/linux/textsearch.h"
struct ts_ops
{
 const char *name;
 struct ts_config * (*init)(const void *, unsigned int, gfp_t, int);
 unsigned int (*find)(struct ts_config *,
     struct ts_state *);
 void (*destroy)(struct ts_config *);
 void * (*get_pattern)(struct ts_config *);
 unsigned int (*get_pattern_len)(struct ts_config *);
 struct module *owner;
 struct list_head list;
};
# 57 "include/linux/textsearch.h"
struct ts_config
{
 struct ts_ops *ops;
 int flags;
# 74 "include/linux/textsearch.h"
 unsigned int (*get_next_block)(unsigned int consumed,
        const u8 **dst,
        struct ts_config *conf,
        struct ts_state *state);
# 87 "include/linux/textsearch.h"
 void (*finish)(struct ts_config *conf,
       struct ts_state *state);
};
# 103 "include/linux/textsearch.h"
static inline __attribute__((always_inline)) unsigned int textsearch_next(struct ts_config *conf,
        struct ts_state *state)
{
 unsigned int ret = conf->ops->find(conf, state);

 if (conf->finish)
  conf->finish(conf, state);

 return ret;
}
# 122 "include/linux/textsearch.h"
static inline __attribute__((always_inline)) unsigned int textsearch_find(struct ts_config *conf,
        struct ts_state *state)
{
 state->offset = 0;
 return textsearch_next(conf, state);
}





static inline __attribute__((always_inline)) void *textsearch_get_pattern(struct ts_config *conf)
{
 return conf->ops->get_pattern(conf);
}





static inline __attribute__((always_inline)) unsigned int textsearch_get_pattern_len(struct ts_config *conf)
{
 return conf->ops->get_pattern_len(conf);
}

extern int textsearch_register(struct ts_ops *);
extern int textsearch_unregister(struct ts_ops *);
extern struct ts_config *textsearch_prepare(const char *, const void *,
         unsigned int, gfp_t, int);
extern void textsearch_destroy(struct ts_config *conf);
extern unsigned int textsearch_find_continuous(struct ts_config *,
            struct ts_state *,
            const void *, unsigned int);





static inline __attribute__((always_inline)) struct ts_config *alloc_ts_config(size_t payload,
      gfp_t gfp_mask)
{
 struct ts_config *conf;

 conf = kzalloc((((sizeof(*conf)) + 8 -1) & ~(8 -1)) + payload, gfp_mask);
 if (conf == ((void *)0))
  return ERR_PTR(-12);

 return conf;
}

static inline __attribute__((always_inline)) void *ts_config_priv(struct ts_config *conf)
{
 return ((u8 *) conf + (((sizeof(struct ts_config)) + 8 -1) & ~(8 -1)));
}
# 28 "include/linux/skbuff.h" 2
# 1 "include/net/checksum.h" 1
# 26 "include/net/checksum.h"
# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/checksum.h" 1
# 14 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/checksum.h"
# 1 "include/linux/in6.h" 1
# 30 "include/linux/in6.h"
struct in6_addr {
 union {
  __u8 u6_addr8[16];
  __be16 u6_addr16[8];
  __be32 u6_addr32[4];
 } in6_u;



};






extern const struct in6_addr in6addr_any;

extern const struct in6_addr in6addr_loopback;

extern const struct in6_addr in6addr_linklocal_allnodes;


extern const struct in6_addr in6addr_linklocal_allrouters;




struct sockaddr_in6 {
 unsigned short int sin6_family;
 __be16 sin6_port;
 __be32 sin6_flowinfo;
 struct in6_addr sin6_addr;
 __u32 sin6_scope_id;
};

struct ipv6_mreq {

 struct in6_addr ipv6mr_multiaddr;


 int ipv6mr_ifindex;
};



struct in6_flowlabel_req {
 struct in6_addr flr_dst;
 __be32 flr_label;
 __u8 flr_action;
 __u8 flr_share;
 __u16 flr_flags;
 __u16 flr_expires;
 __u16 flr_linger;
 __u32 __flr_pad;

};
# 15 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/checksum.h" 2
# 30 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/checksum.h"
__wsum csum_partial(const void *buff, int len, __wsum sum);

__wsum __csum_partial_copy_user(const void *src, void *dst,
    int len, __wsum sum, int *err_ptr);





static inline __attribute__((always_inline))
__wsum csum_partial_copy_from_user(const void *src, void *dst, int len,
       __wsum sum, int *err_ptr)
{
 might_fault();
 return __csum_partial_copy_user(( void *)src, dst,
     len, sum, err_ptr);
}





static inline __attribute__((always_inline))
__wsum csum_and_copy_to_user(const void *src, void *dst, int len,
        __wsum sum, int *err_ptr)
{
 might_fault();
 if (__builtin_expect(!!(({ unsigned long __addr = (unsigned long) ((dst)); unsigned long __size = (len); unsigned long __mask = (__current_thread_info->addr_limit).seg; unsigned long __ok; (void)0; __ok = (signed long)(__mask & (__addr | (__addr + __size) | ((__builtin_constant_p(__size) && (signed long) (__size) > 0) ? 0 : (__size)))); __ok == 0; })), 1))
  return __csum_partial_copy_user(src, ( void *)dst,
      len, sum, err_ptr);
 if (len)
  *err_ptr = -14;

 return ( __wsum)-1;
}





__wsum csum_partial_copy_nocheck(const void *src, void *dst,
           int len, __wsum sum);




static inline __attribute__((always_inline)) __sum16 csum_fold(__wsum sum)
{
 __asm__(
 "	.set	push		# csum_fold\n"
 "	.set	noat		\n"
 "	sll	$1, %0, 16	\n"
 "	addu	%0, $1		\n"
 "	sltu	$1, %0, $1	\n"
 "	srl	%0, %0, 16	\n"
 "	addu	%0, $1		\n"
 "	xori	%0, 0xffff	\n"
 "	.set	pop"
 : "=r" (sum)
 : "0" (sum));

 return ( __sum16)sum;
}
# 101 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/checksum.h"
static inline __attribute__((always_inline)) __sum16 ip_fast_csum(const void *iph, unsigned int ihl)
{
 const unsigned int *word = iph;
 const unsigned int *stop = word + ihl;
 unsigned int csum;
 int carry;

 csum = word[0];
 csum += word[1];
 carry = (csum < word[1]);
 csum += carry;

 csum += word[2];
 carry = (csum < word[2]);
 csum += carry;

 csum += word[3];
 carry = (csum < word[3]);
 csum += carry;

 word += 4;
 do {
  csum += *word;
  carry = (csum < *word);
  csum += carry;
  word++;
 } while (word != stop);

 return csum_fold(csum);
}

static inline __attribute__((always_inline)) __wsum csum_tcpudp_nofold(__be32 saddr,
 __be32 daddr, unsigned short len, unsigned short proto,
 __wsum sum)
{
 __asm__(
 "	.set	push		# csum_tcpudp_nofold\n"
 "	.set	noat		\n"

 "	addu	%0, %2		\n"
 "	sltu	$1, %0, %2	\n"
 "	addu	%0, $1		\n"

 "	addu	%0, %3		\n"
 "	sltu	$1, %0, %3	\n"
 "	addu	%0, $1		\n"

 "	addu	%0, %4		\n"
 "	sltu	$1, %0, %4	\n"
 "	addu	%0, $1		\n"
# 160 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/checksum.h"
 "	.set	pop"
 : "=r" (sum)
 : "0" (( unsigned long)daddr),
   "r" (( unsigned long)saddr),



   "r" (proto + len),

   "r" (( unsigned long)sum));

 return sum;
}





static inline __attribute__((always_inline)) __sum16 csum_tcpudp_magic(__be32 saddr, __be32 daddr,
         unsigned short len,
         unsigned short proto,
         __wsum sum)
{
 return csum_fold(csum_tcpudp_nofold(saddr, daddr, len, proto, sum));
}





static inline __attribute__((always_inline)) __sum16 ip_compute_csum(const void *buff, int len)
{
 return csum_fold(csum_partial(buff, len, 0));
}


static __inline__ __attribute__((always_inline)) __sum16 csum_ipv6_magic(const struct in6_addr *saddr,
              const struct in6_addr *daddr,
       __u32 len, unsigned short proto,
       __wsum sum)
{
 __asm__(
 "	.set	push		# csum_ipv6_magic\n"
 "	.set	noreorder	\n"
 "	.set	noat		\n"
 "	addu	%0, %5		# proto (long in network byte order)\n"
 "	sltu	$1, %0, %5	\n"
 "	addu	%0, $1		\n"

 "	addu	%0, %6		# csum\n"
 "	sltu	$1, %0, %6	\n"
 "	lw	%1, 0(%2)	# four words source address\n"
 "	addu	%0, $1		\n"
 "	addu	%0, %1		\n"
 "	sltu	$1, %0, %1	\n"

 "	lw	%1, 4(%2)	\n"
 "	addu	%0, $1		\n"
 "	addu	%0, %1		\n"
 "	sltu	$1, %0, %1	\n"

 "	lw	%1, 8(%2)	\n"
 "	addu	%0, $1		\n"
 "	addu	%0, %1		\n"
 "	sltu	$1, %0, %1	\n"

 "	lw	%1, 12(%2)	\n"
 "	addu	%0, $1		\n"
 "	addu	%0, %1		\n"
 "	sltu	$1, %0, %1	\n"

 "	lw	%1, 0(%3)	\n"
 "	addu	%0, $1		\n"
 "	addu	%0, %1		\n"
 "	sltu	$1, %0, %1	\n"

 "	lw	%1, 4(%3)	\n"
 "	addu	%0, $1		\n"
 "	addu	%0, %1		\n"
 "	sltu	$1, %0, %1	\n"

 "	lw	%1, 8(%3)	\n"
 "	addu	%0, $1		\n"
 "	addu	%0, %1		\n"
 "	sltu	$1, %0, %1	\n"

 "	lw	%1, 12(%3)	\n"
 "	addu	%0, $1		\n"
 "	addu	%0, %1		\n"
 "	sltu	$1, %0, %1	\n"

 "	addu	%0, $1		# Add final carry\n"
 "	.set	pop"
 : "=r" (sum), "=r" (proto)
 : "r" (saddr), "r" (daddr),
   "0" ((( __be32)(__u32)(len))), "1" ((( __be32)(__u32)(proto))), "r" (sum));

 return csum_fold(sum);
}
# 27 "include/net/checksum.h" 2


static inline __attribute__((always_inline))
__wsum csum_and_copy_from_user (const void *src, void *dst,
          int len, __wsum sum, int *err_ptr)
{
 if (__builtin_expect(!!(({ unsigned long __addr = (unsigned long) ((src)); unsigned long __size = (len); unsigned long __mask = (__current_thread_info->addr_limit).seg; unsigned long __ok; (void)0; __ok = (signed long)(__mask & (__addr | (__addr + __size) | ((__builtin_constant_p(__size) && (signed long) (__size) > 0) ? 0 : (__size)))); __ok == 0; })), 1))
  return csum_partial_copy_from_user(src, dst, len, sum, err_ptr);

 if (len)
  *err_ptr = -14;

 return sum;
}
# 60 "include/net/checksum.h"
static inline __attribute__((always_inline)) __wsum csum_add(__wsum csum, __wsum addend)
{
 u32 res = ( u32)csum;
 res += ( u32)addend;
 return ( __wsum)(res + (res < ( u32)addend));
}

static inline __attribute__((always_inline)) __wsum csum_sub(__wsum csum, __wsum addend)
{
 return csum_add(csum, ~addend);
}

static inline __attribute__((always_inline)) __wsum
csum_block_add(__wsum csum, __wsum csum2, int offset)
{
 u32 sum = ( u32)csum2;
 if (offset&1)
  sum = ((sum&0xFF00FF)<<8)+((sum>>8)&0xFF00FF);
 return csum_add(csum, ( __wsum)sum);
}

static inline __attribute__((always_inline)) __wsum
csum_block_sub(__wsum csum, __wsum csum2, int offset)
{
 u32 sum = ( u32)csum2;
 if (offset&1)
  sum = ((sum&0xFF00FF)<<8)+((sum>>8)&0xFF00FF);
 return csum_sub(csum, ( __wsum)sum);
}

static inline __attribute__((always_inline)) __wsum csum_unfold(__sum16 n)
{
 return ( __wsum)n;
}



static inline __attribute__((always_inline)) void csum_replace4(__sum16 *sum, __be32 from, __be32 to)
{
 __be32 diff[] = { ~from, to };

 *sum = csum_fold(csum_partial(diff, sizeof(diff), ~csum_unfold(*sum)));
}

static inline __attribute__((always_inline)) void csum_replace2(__sum16 *sum, __be16 from, __be16 to)
{
 csum_replace4(sum, ( __be32)from, ( __be32)to);
}

struct sk_buff;
extern void inet_proto_csum_replace4(__sum16 *sum, struct sk_buff *skb,
         __be32 from, __be32 to, int pseudohdr);

static inline __attribute__((always_inline)) void inet_proto_csum_replace2(__sum16 *sum, struct sk_buff *skb,
         __be16 from, __be16 to,
         int pseudohdr)
{
 inet_proto_csum_replace4(sum, skb, ( __be32)from,
     ( __be32)to, pseudohdr);
}
# 29 "include/linux/skbuff.h" 2

# 1 "include/linux/dmaengine.h" 1
# 33 "include/linux/dmaengine.h"
typedef s32 dma_cookie_t;
# 46 "include/linux/dmaengine.h"
enum dma_status {
 DMA_SUCCESS,
 DMA_IN_PROGRESS,
 DMA_PAUSED,
 DMA_ERROR,
};







enum dma_transaction_type {
 DMA_MEMCPY,
 DMA_XOR,
 DMA_PQ,
 DMA_XOR_VAL,
 DMA_PQ_VAL,
 DMA_MEMSET,
 DMA_INTERRUPT,
 DMA_PRIVATE,
 DMA_ASYNC_TX,
 DMA_SLAVE,
};
# 98 "include/linux/dmaengine.h"
enum dma_ctrl_flags {
 DMA_PREP_INTERRUPT = (1 << 0),
 DMA_CTRL_ACK = (1 << 1),
 DMA_COMPL_SKIP_SRC_UNMAP = (1 << 2),
 DMA_COMPL_SKIP_DEST_UNMAP = (1 << 3),
 DMA_COMPL_SRC_UNMAP_SINGLE = (1 << 4),
 DMA_COMPL_DEST_UNMAP_SINGLE = (1 << 5),
 DMA_PREP_PQ_DISABLE_P = (1 << 6),
 DMA_PREP_PQ_DISABLE_Q = (1 << 7),
 DMA_PREP_CONTINUE = (1 << 8),
 DMA_PREP_FENCE = (1 << 9),
};
# 123 "include/linux/dmaengine.h"
enum dma_ctrl_cmd {
 DMA_TERMINATE_ALL,
 DMA_PAUSE,
 DMA_RESUME,
 DMA_SLAVE_CONFIG,
};




enum sum_check_bits {
 SUM_CHECK_P = 0,
 SUM_CHECK_Q = 1,
};






enum sum_check_flags {
 SUM_CHECK_P_RESULT = (1 << SUM_CHECK_P),
 SUM_CHECK_Q_RESULT = (1 << SUM_CHECK_Q),
};






typedef struct { unsigned long bits[((((DMA_SLAVE + 1)) + (8 * sizeof(long)) - 1) / (8 * sizeof(long)))]; } dma_cap_mask_t;







struct dma_chan_percpu {

 unsigned long memcpy_count;
 unsigned long bytes_transferred;
};
# 179 "include/linux/dmaengine.h"
struct dma_chan {
 struct dma_device *device;
 dma_cookie_t cookie;


 int chan_id;
 struct dma_chan_dev *dev;

 struct list_head device_node;
 struct dma_chan_percpu *local;
 int client_count;
 int table_count;
 void *private;
};
# 201 "include/linux/dmaengine.h"
struct dma_chan_dev {
 struct dma_chan *chan;
 struct device device;
 int dev_id;
 atomic_t *idr_ref;
};





enum dma_slave_buswidth {
 DMA_SLAVE_BUSWIDTH_UNDEFINED = 0,
 DMA_SLAVE_BUSWIDTH_1_BYTE = 1,
 DMA_SLAVE_BUSWIDTH_2_BYTES = 2,
 DMA_SLAVE_BUSWIDTH_4_BYTES = 4,
 DMA_SLAVE_BUSWIDTH_8_BYTES = 8,
};
# 263 "include/linux/dmaengine.h"
struct dma_slave_config {
 enum dma_data_direction direction;
 dma_addr_t src_addr;
 dma_addr_t dst_addr;
 enum dma_slave_buswidth src_addr_width;
 enum dma_slave_buswidth dst_addr_width;
 u32 src_maxburst;
 u32 dst_maxburst;
};

static inline __attribute__((always_inline)) const char *dma_chan_name(struct dma_chan *chan)
{
 return dev_name(&chan->dev->device);
}

void dma_chan_cleanup(struct kref *kref);
# 291 "include/linux/dmaengine.h"
typedef int (*dma_filter_fn)(struct dma_chan *chan, void *filter_param);

typedef void (*dma_async_tx_callback)(void *dma_async_param);
# 311 "include/linux/dmaengine.h"
struct dma_async_tx_descriptor {
 dma_cookie_t cookie;
 enum dma_ctrl_flags flags;
 dma_addr_t phys;
 struct dma_chan *chan;
 dma_cookie_t (*tx_submit)(struct dma_async_tx_descriptor *tx);
 dma_async_tx_callback callback;
 void *callback_param;

 struct dma_async_tx_descriptor *next;
 struct dma_async_tx_descriptor *parent;
 spinlock_t lock;

};
# 353 "include/linux/dmaengine.h"
static inline __attribute__((always_inline)) void txd_lock(struct dma_async_tx_descriptor *txd)
{
 spin_lock_bh(&txd->lock);
}
static inline __attribute__((always_inline)) void txd_unlock(struct dma_async_tx_descriptor *txd)
{
 spin_unlock_bh(&txd->lock);
}
static inline __attribute__((always_inline)) void txd_chain(struct dma_async_tx_descriptor *txd, struct dma_async_tx_descriptor *next)
{
 txd->next = next;
 next->parent = txd;
}
static inline __attribute__((always_inline)) void txd_clear_parent(struct dma_async_tx_descriptor *txd)
{
 txd->parent = ((void *)0);
}
static inline __attribute__((always_inline)) void txd_clear_next(struct dma_async_tx_descriptor *txd)
{
 txd->next = ((void *)0);
}
static inline __attribute__((always_inline)) struct dma_async_tx_descriptor *txd_parent(struct dma_async_tx_descriptor *txd)
{
 return txd->parent;
}
static inline __attribute__((always_inline)) struct dma_async_tx_descriptor *txd_next(struct dma_async_tx_descriptor *txd)
{
 return txd->next;
}
# 393 "include/linux/dmaengine.h"
struct dma_tx_state {
 dma_cookie_t last;
 dma_cookie_t used;
 u32 residue;
};
# 433 "include/linux/dmaengine.h"
struct dma_device {

 unsigned int chancnt;
 unsigned int privatecnt;
 struct list_head channels;
 struct list_head global_node;
 dma_cap_mask_t cap_mask;
 unsigned short max_xor;
 unsigned short max_pq;
 u8 copy_align;
 u8 xor_align;
 u8 pq_align;
 u8 fill_align;


 int dev_id;
 struct device *dev;

 int (*device_alloc_chan_resources)(struct dma_chan *chan);
 void (*device_free_chan_resources)(struct dma_chan *chan);

 struct dma_async_tx_descriptor *(*device_prep_dma_memcpy)(
  struct dma_chan *chan, dma_addr_t dest, dma_addr_t src,
  size_t len, unsigned long flags);
 struct dma_async_tx_descriptor *(*device_prep_dma_xor)(
  struct dma_chan *chan, dma_addr_t dest, dma_addr_t *src,
  unsigned int src_cnt, size_t len, unsigned long flags);
 struct dma_async_tx_descriptor *(*device_prep_dma_xor_val)(
  struct dma_chan *chan, dma_addr_t *src, unsigned int src_cnt,
  size_t len, enum sum_check_flags *result, unsigned long flags);
 struct dma_async_tx_descriptor *(*device_prep_dma_pq)(
  struct dma_chan *chan, dma_addr_t *dst, dma_addr_t *src,
  unsigned int src_cnt, const unsigned char *scf,
  size_t len, unsigned long flags);
 struct dma_async_tx_descriptor *(*device_prep_dma_pq_val)(
  struct dma_chan *chan, dma_addr_t *pq, dma_addr_t *src,
  unsigned int src_cnt, const unsigned char *scf, size_t len,
  enum sum_check_flags *pqres, unsigned long flags);
 struct dma_async_tx_descriptor *(*device_prep_dma_memset)(
  struct dma_chan *chan, dma_addr_t dest, int value, size_t len,
  unsigned long flags);
 struct dma_async_tx_descriptor *(*device_prep_dma_interrupt)(
  struct dma_chan *chan, unsigned long flags);

 struct dma_async_tx_descriptor *(*device_prep_slave_sg)(
  struct dma_chan *chan, struct scatterlist *sgl,
  unsigned int sg_len, enum dma_data_direction direction,
  unsigned long flags);
 int (*device_control)(struct dma_chan *chan, enum dma_ctrl_cmd cmd,
  unsigned long arg);

 enum dma_status (*device_tx_status)(struct dma_chan *chan,
         dma_cookie_t cookie,
         struct dma_tx_state *txstate);
 void (*device_issue_pending)(struct dma_chan *chan);
};

static inline __attribute__((always_inline)) int dmaengine_check_align(u8 align, size_t off1, size_t off2, size_t len)
{
 size_t mask;

 if (!align)
  return true;
 mask = (1 << align) - 1;
 if (mask & (off1 | off2 | len))
  return false;
 return true;
}

static inline __attribute__((always_inline)) int is_dma_copy_aligned(struct dma_device *dev, size_t off1,
           size_t off2, size_t len)
{
 return dmaengine_check_align(dev->copy_align, off1, off2, len);
}

static inline __attribute__((always_inline)) int is_dma_xor_aligned(struct dma_device *dev, size_t off1,
          size_t off2, size_t len)
{
 return dmaengine_check_align(dev->xor_align, off1, off2, len);
}

static inline __attribute__((always_inline)) int is_dma_pq_aligned(struct dma_device *dev, size_t off1,
         size_t off2, size_t len)
{
 return dmaengine_check_align(dev->pq_align, off1, off2, len);
}

static inline __attribute__((always_inline)) int is_dma_fill_aligned(struct dma_device *dev, size_t off1,
           size_t off2, size_t len)
{
 return dmaengine_check_align(dev->fill_align, off1, off2, len);
}

static inline __attribute__((always_inline)) void
dma_set_maxpq(struct dma_device *dma, int maxpq, int has_pq_continue)
{
 dma->max_pq = maxpq;
 if (has_pq_continue)
  dma->max_pq |= (1 << 15);
}

static inline __attribute__((always_inline)) int dmaf_continue(enum dma_ctrl_flags flags)
{
 return (flags & DMA_PREP_CONTINUE) == DMA_PREP_CONTINUE;
}

static inline __attribute__((always_inline)) int dmaf_p_disabled_continue(enum dma_ctrl_flags flags)
{
 enum dma_ctrl_flags mask = DMA_PREP_CONTINUE | DMA_PREP_PQ_DISABLE_P;

 return (flags & mask) == mask;
}

static inline __attribute__((always_inline)) int dma_dev_has_pq_continue(struct dma_device *dma)
{
 return (dma->max_pq & (1 << 15)) == (1 << 15);
}

static inline __attribute__((always_inline)) unsigned short dma_dev_to_maxpq(struct dma_device *dma)
{
 return dma->max_pq & ~(1 << 15);
}
# 569 "include/linux/dmaengine.h"
static inline __attribute__((always_inline)) int dma_maxpq(struct dma_device *dma, enum dma_ctrl_flags flags)
{
 if (dma_dev_has_pq_continue(dma) || !dmaf_continue(flags))
  return dma_dev_to_maxpq(dma);
 else if (dmaf_p_disabled_continue(flags))
  return dma_dev_to_maxpq(dma) - 1;
 else if (dmaf_continue(flags))
  return dma_dev_to_maxpq(dma) - 3;
 BUG();
}







static inline __attribute__((always_inline)) void dmaengine_get(void)
{
}
static inline __attribute__((always_inline)) void dmaengine_put(void)
{
}






static inline __attribute__((always_inline)) void net_dmaengine_get(void)
{
}
static inline __attribute__((always_inline)) void net_dmaengine_put(void)
{
}
# 615 "include/linux/dmaengine.h"
static inline __attribute__((always_inline)) void async_dmaengine_get(void)
{
}
static inline __attribute__((always_inline)) void async_dmaengine_put(void)
{
}
static inline __attribute__((always_inline)) struct dma_chan *
async_dma_find_channel(enum dma_transaction_type type)
{
 return ((void *)0);
}


dma_cookie_t dma_async_memcpy_buf_to_buf(struct dma_chan *chan,
 void *dest, void *src, size_t len);
dma_cookie_t dma_async_memcpy_buf_to_pg(struct dma_chan *chan,
 struct page *page, unsigned int offset, void *kdata, size_t len);
dma_cookie_t dma_async_memcpy_pg_to_pg(struct dma_chan *chan,
 struct page *dest_pg, unsigned int dest_off, struct page *src_pg,
 unsigned int src_off, size_t len);
void dma_async_tx_descriptor_init(struct dma_async_tx_descriptor *tx,
 struct dma_chan *chan);

static inline __attribute__((always_inline)) void async_tx_ack(struct dma_async_tx_descriptor *tx)
{
 tx->flags |= DMA_CTRL_ACK;
}

static inline __attribute__((always_inline)) void async_tx_clear_ack(struct dma_async_tx_descriptor *tx)
{
 tx->flags &= ~DMA_CTRL_ACK;
}

static inline __attribute__((always_inline)) int async_tx_test_ack(struct dma_async_tx_descriptor *tx)
{
 return (tx->flags & DMA_CTRL_ACK) == DMA_CTRL_ACK;
}


static inline __attribute__((always_inline)) int __first_dma_cap(const dma_cap_mask_t *srcp)
{
 return ({ int __min1 = ((DMA_SLAVE + 1)); int __min2 = (find_next_bit((srcp->bits), ((DMA_SLAVE + 1)), 0)); __min1 < __min2 ? __min1: __min2; });

}


static inline __attribute__((always_inline)) int __next_dma_cap(int n, const dma_cap_mask_t *srcp)
{
 return ({ int __min1 = ((DMA_SLAVE + 1)); int __min2 = (find_next_bit(srcp->bits, (DMA_SLAVE + 1), n+1)); __min1 < __min2 ? __min1: __min2; });

}


static inline __attribute__((always_inline)) void
__dma_cap_set(enum dma_transaction_type tx_type, dma_cap_mask_t *dstp)
{
 set_bit(tx_type, dstp->bits);
}


static inline __attribute__((always_inline)) void
__dma_cap_clear(enum dma_transaction_type tx_type, dma_cap_mask_t *dstp)
{
 clear_bit(tx_type, dstp->bits);
}


static inline __attribute__((always_inline)) void __dma_cap_zero(dma_cap_mask_t *dstp)
{
 bitmap_zero(dstp->bits, (DMA_SLAVE + 1));
}


static inline __attribute__((always_inline)) int
__dma_has_cap(enum dma_transaction_type tx_type, dma_cap_mask_t *srcp)
{
 return test_bit(tx_type, srcp->bits);
}
# 706 "include/linux/dmaengine.h"
static inline __attribute__((always_inline)) void dma_async_issue_pending(struct dma_chan *chan)
{
 chan->device->device_issue_pending(chan);
}
# 724 "include/linux/dmaengine.h"
static inline __attribute__((always_inline)) enum dma_status dma_async_is_tx_complete(struct dma_chan *chan,
 dma_cookie_t cookie, dma_cookie_t *last, dma_cookie_t *used)
{
 struct dma_tx_state state;
 enum dma_status status;

 status = chan->device->device_tx_status(chan, cookie, &state);
 if (last)
  *last = state.last;
 if (used)
  *used = state.used;
 return status;
}
# 750 "include/linux/dmaengine.h"
static inline __attribute__((always_inline)) enum dma_status dma_async_is_complete(dma_cookie_t cookie,
   dma_cookie_t last_complete, dma_cookie_t last_used)
{
 if (last_complete <= last_used) {
  if ((cookie <= last_complete) || (cookie > last_used))
   return DMA_SUCCESS;
 } else {
  if ((cookie <= last_complete) && (cookie > last_used))
   return DMA_SUCCESS;
 }
 return DMA_IN_PROGRESS;
}

static inline __attribute__((always_inline)) void
dma_set_tx_state(struct dma_tx_state *st, dma_cookie_t last, dma_cookie_t used, u32 residue)
{
 if (st) {
  st->last = last;
  st->used = used;
  st->residue = residue;
 }
}

enum dma_status dma_sync_wait(struct dma_chan *chan, dma_cookie_t cookie);




static inline __attribute__((always_inline)) enum dma_status dma_wait_for_async_tx(struct dma_async_tx_descriptor *tx)
{
 return DMA_SUCCESS;
}
static inline __attribute__((always_inline)) void dma_issue_pending_all(void)
{
 do { } while (0);
}




int dma_async_device_register(struct dma_device *device);
void dma_async_device_unregister(struct dma_device *device);
void dma_run_dependencies(struct dma_async_tx_descriptor *tx);
struct dma_chan *dma_find_channel(enum dma_transaction_type tx_type);

struct dma_chan *__dma_request_channel(dma_cap_mask_t *mask, dma_filter_fn fn, void *fn_param);
void dma_release_channel(struct dma_chan *chan);



struct dma_page_list {
 char *base_address;
 int nr_pages;
 struct page **pages;
};

struct dma_pinned_list {
 int nr_iovecs;
 struct dma_page_list page_list[0];
};

struct dma_pinned_list *dma_pin_iovec_pages(struct iovec *iov, size_t len);
void dma_unpin_iovec_pages(struct dma_pinned_list* pinned_list);

dma_cookie_t dma_memcpy_to_iovec(struct dma_chan *chan, struct iovec *iov,
 struct dma_pinned_list *pinned_list, unsigned char *kdata, size_t len);
dma_cookie_t dma_memcpy_pg_to_iovec(struct dma_chan *chan, struct iovec *iov,
 struct dma_pinned_list *pinned_list, struct page *page,
 unsigned int offset, size_t len);
# 31 "include/linux/skbuff.h" 2
# 1 "include/linux/hrtimer.h" 1
# 27 "include/linux/hrtimer.h"
struct hrtimer_clock_base;
struct hrtimer_cpu_base;




enum hrtimer_mode {
 HRTIMER_MODE_ABS = 0x0,
 HRTIMER_MODE_REL = 0x1,
 HRTIMER_MODE_PINNED = 0x02,
 HRTIMER_MODE_ABS_PINNED = 0x02,
 HRTIMER_MODE_REL_PINNED = 0x03,
};




enum hrtimer_restart {
 HRTIMER_NORESTART,
 HRTIMER_RESTART,
};
# 103 "include/linux/hrtimer.h"
struct hrtimer {
 struct rb_node node;
 ktime_t _expires;
 ktime_t _softexpires;
 enum hrtimer_restart (*function)(struct hrtimer *);
 struct hrtimer_clock_base *base;
 unsigned long state;





};
# 124 "include/linux/hrtimer.h"
struct hrtimer_sleeper {
 struct hrtimer timer;
 struct task_struct *task;
};
# 141 "include/linux/hrtimer.h"
struct hrtimer_clock_base {
 struct hrtimer_cpu_base *cpu_base;
 clockid_t index;
 struct rb_root active;
 struct rb_node *first;
 ktime_t resolution;
 ktime_t (*get_time)(void);
 ktime_t softirq_time;



};
# 171 "include/linux/hrtimer.h"
struct hrtimer_cpu_base {
 raw_spinlock_t lock;
 struct hrtimer_clock_base clock_base[2];
# 183 "include/linux/hrtimer.h"
};

static inline __attribute__((always_inline)) void hrtimer_set_expires(struct hrtimer *timer, ktime_t time)
{
 timer->_expires = time;
 timer->_softexpires = time;
}

static inline __attribute__((always_inline)) void hrtimer_set_expires_range(struct hrtimer *timer, ktime_t time, ktime_t delta)
{
 timer->_softexpires = time;
 timer->_expires = ktime_add_safe(time, delta);
}

static inline __attribute__((always_inline)) void hrtimer_set_expires_range_ns(struct hrtimer *timer, ktime_t time, unsigned long delta)
{
 timer->_softexpires = time;
 timer->_expires = ktime_add_safe(time, ns_to_ktime(delta));
}

static inline __attribute__((always_inline)) void hrtimer_set_expires_tv64(struct hrtimer *timer, s64 tv64)
{
 timer->_expires.tv64 = tv64;
 timer->_softexpires.tv64 = tv64;
}

static inline __attribute__((always_inline)) void hrtimer_add_expires(struct hrtimer *timer, ktime_t time)
{
 timer->_expires = ktime_add_safe(timer->_expires, time);
 timer->_softexpires = ktime_add_safe(timer->_softexpires, time);
}

static inline __attribute__((always_inline)) void hrtimer_add_expires_ns(struct hrtimer *timer, u64 ns)
{
 timer->_expires = ktime_add_ns(timer->_expires, ns);
 timer->_softexpires = ktime_add_ns(timer->_softexpires, ns);
}

static inline __attribute__((always_inline)) ktime_t hrtimer_get_expires(const struct hrtimer *timer)
{
 return timer->_expires;
}

static inline __attribute__((always_inline)) ktime_t hrtimer_get_softexpires(const struct hrtimer *timer)
{
 return timer->_softexpires;
}

static inline __attribute__((always_inline)) s64 hrtimer_get_expires_tv64(const struct hrtimer *timer)
{
 return timer->_expires.tv64;
}
static inline __attribute__((always_inline)) s64 hrtimer_get_softexpires_tv64(const struct hrtimer *timer)
{
 return timer->_softexpires.tv64;
}

static inline __attribute__((always_inline)) s64 hrtimer_get_expires_ns(const struct hrtimer *timer)
{
 return ktime_to_ns(timer->_expires);
}

static inline __attribute__((always_inline)) ktime_t hrtimer_expires_remaining(const struct hrtimer *timer)
{
    return ktime_sub(timer->_expires, timer->base->get_time());
}
# 293 "include/linux/hrtimer.h"
static inline __attribute__((always_inline)) void clock_was_set(void) { }
static inline __attribute__((always_inline)) void hrtimer_peek_ahead_timers(void) { }

static inline __attribute__((always_inline)) void hres_timers_resume(void) { }





static inline __attribute__((always_inline)) ktime_t hrtimer_cb_get_time(struct hrtimer *timer)
{
 return timer->base->softirq_time;
}

static inline __attribute__((always_inline)) int hrtimer_is_hres_active(struct hrtimer *timer)
{
 return 0;
}


extern ktime_t ktime_get(void);
extern ktime_t ktime_get_real(void);


extern __attribute__((section(".data..percpu" ""))) __typeof__(struct tick_device) tick_cpu_device;





extern void hrtimer_init(struct hrtimer *timer, clockid_t which_clock,
    enum hrtimer_mode mode);







static inline __attribute__((always_inline)) void hrtimer_init_on_stack(struct hrtimer *timer,
      clockid_t which_clock,
      enum hrtimer_mode mode)
{
 hrtimer_init(timer, which_clock, mode);
}
static inline __attribute__((always_inline)) void destroy_hrtimer_on_stack(struct hrtimer *timer) { }



extern int hrtimer_start(struct hrtimer *timer, ktime_t tim,
    const enum hrtimer_mode mode);
extern int hrtimer_start_range_ns(struct hrtimer *timer, ktime_t tim,
   unsigned long range_ns, const enum hrtimer_mode mode);
extern int
__hrtimer_start_range_ns(struct hrtimer *timer, ktime_t tim,
    unsigned long delta_ns,
    const enum hrtimer_mode mode, int wakeup);

extern int hrtimer_cancel(struct hrtimer *timer);
extern int hrtimer_try_to_cancel(struct hrtimer *timer);

static inline __attribute__((always_inline)) int hrtimer_start_expires(struct hrtimer *timer,
      enum hrtimer_mode mode)
{
 unsigned long delta;
 ktime_t soft, hard;
 soft = hrtimer_get_softexpires(timer);
 hard = hrtimer_get_expires(timer);
 delta = ktime_to_ns(ktime_sub(hard, soft));
 return hrtimer_start_range_ns(timer, soft, delta, mode);
}

static inline __attribute__((always_inline)) int hrtimer_restart(struct hrtimer *timer)
{
 return hrtimer_start_expires(timer, HRTIMER_MODE_ABS);
}


extern ktime_t hrtimer_get_remaining(const struct hrtimer *timer);
extern int hrtimer_get_res(const clockid_t which_clock, struct timespec *tp);

extern ktime_t hrtimer_get_next_event(void);





static inline __attribute__((always_inline)) int hrtimer_active(const struct hrtimer *timer)
{
 return timer->state != 0x00;
}




static inline __attribute__((always_inline)) int hrtimer_is_queued(struct hrtimer *timer)
{
 return timer->state & 0x01;
}





static inline __attribute__((always_inline)) int hrtimer_callback_running(struct hrtimer *timer)
{
 return timer->state & 0x02;
}


extern u64
hrtimer_forward(struct hrtimer *timer, ktime_t now, ktime_t interval);


static inline __attribute__((always_inline)) u64 hrtimer_forward_now(struct hrtimer *timer,
          ktime_t interval)
{
 return hrtimer_forward(timer, timer->base->get_time(), interval);
}


extern long hrtimer_nanosleep(struct timespec *rqtp,
         struct timespec *rmtp,
         const enum hrtimer_mode mode,
         const clockid_t clockid);
extern long hrtimer_nanosleep_restart(struct restart_block *restart_block);

extern void hrtimer_init_sleeper(struct hrtimer_sleeper *sl,
     struct task_struct *tsk);

extern int schedule_hrtimeout_range(ktime_t *expires, unsigned long delta,
      const enum hrtimer_mode mode);
extern int schedule_hrtimeout_range_clock(ktime_t *expires,
  unsigned long delta, const enum hrtimer_mode mode, int clock);
extern int schedule_hrtimeout(ktime_t *expires, const enum hrtimer_mode mode);


extern void hrtimer_run_queues(void);
extern void hrtimer_run_pending(void);


extern void __attribute__ ((__section__(".init.text"))) __attribute__((__cold__)) __attribute__((no_instrument_function)) hrtimers_init(void);


extern u64 ktime_divns(const ktime_t kt, s64 div);





extern void sysrq_timer_list_show(void);
# 32 "include/linux/skbuff.h" 2
# 103 "include/linux/skbuff.h"
struct net_device;
struct scatterlist;
struct pipe_inode_info;


struct nf_conntrack {
 atomic_t use;
};
# 123 "include/linux/skbuff.h"
struct sk_buff_head {

 struct sk_buff *next;
 struct sk_buff *prev;

 __u32 qlen;
 spinlock_t lock;
};

struct sk_buff;




typedef struct skb_frag_struct skb_frag_t;

struct skb_frag_struct {
 struct page *page;
 __u32 page_offset;
 __u32 size;
};
# 170 "include/linux/skbuff.h"
struct skb_shared_hwtstamps {
 ktime_t hwtstamp;
 ktime_t syststamp;
};
# 187 "include/linux/skbuff.h"
union skb_shared_tx {
 struct {
  __u8 hardware:1,
   software:1,
   in_progress:1,
   prevent_sk_orphan:1;
 };
 __u8 flags;
};




struct skb_shared_info {
 unsigned short nr_frags;
 unsigned short gso_size;

 unsigned short gso_segs;
 unsigned short gso_type;
 __be32 ip6_frag_id;
 union skb_shared_tx tx_flags;
 struct sk_buff *frag_list;
 struct skb_shared_hwtstamps hwtstamps;




 atomic_t dataref;



 void * destructor_arg;

 skb_frag_t frags[(65536/((1UL) << 12) + 2)];
};
# 238 "include/linux/skbuff.h"
enum {
 SKB_FCLONE_UNAVAILABLE,
 SKB_FCLONE_ORIG,
 SKB_FCLONE_CLONE,
};

enum {
 SKB_GSO_TCPV4 = 1 << 0,
 SKB_GSO_UDP = 1 << 1,


 SKB_GSO_DODGY = 1 << 2,


 SKB_GSO_TCP_ECN = 1 << 3,

 SKB_GSO_TCPV6 = 1 << 4,

 SKB_GSO_FCOE = 1 << 5,
};
# 266 "include/linux/skbuff.h"
typedef unsigned char *sk_buff_data_t;
# 325 "include/linux/skbuff.h"
struct sk_buff {

 struct sk_buff *next;
 struct sk_buff *prev;

 ktime_t tstamp;

 struct sock *sk;
 struct net_device *dev;







 char cb[48] __attribute__((aligned(8)));




 unsigned long _skb_refdst;

 struct sec_path *sp;

 unsigned int len,
    data_len;
 __u16 mac_len,
    hdr_len;
 union {
  __wsum csum;
  struct {
   __u16 csum_start;
   __u16 csum_offset;
  };
 };
 __u32 priority;
 ;
 __u8 local_df:1,
    cloned:1,
    ip_summed:2,
    nohdr:1,
    nfctinfo:3;
 __u8 pkt_type:3,
    fclone:2,
    ipvs_property:1,
    peeked:1,
    nf_trace:1;
 ;
 __be16 protocol;

 void (*destructor)(struct sk_buff *skb);

 int (*skb_recycling_callback)(struct sk_buff *skb);
 int skb_recycling_ind;





 char foe[8];


 struct nf_conntrack *nfct;
 struct sk_buff *nfct_reasm;
# 398 "include/linux/skbuff.h"
 int skb_iif;

 __u16 tc_index;

 __u16 tc_verd;



 __u32 rxhash;

 ;
 __u16 queue_mapping:16;

 __u8 ndisc_nodetype:2,
    deliver_no_wcard:1;



 ;
# 435 "include/linux/skbuff.h"
  __u32 mark;
  __u32 dropcount;


 __u16 vlan_tci;





 __u32 portbind_mark;
 char orig_dev_name[16];



 __u16 vlan_tags[2];







 __u32 vlan_tag_flag;
# 526 "include/linux/skbuff.h"
  __u8 ipsec_pt_flag;
# 542 "include/linux/skbuff.h"
 sk_buff_data_t transport_header;
 sk_buff_data_t network_header;
 sk_buff_data_t mac_header;

 sk_buff_data_t tail;
 sk_buff_data_t end;
 unsigned char *head,
    *data;
 unsigned int truesize;
 atomic_t users;
};
# 575 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) struct dst_entry *skb_dst(const struct sk_buff *skb)
{



 ({ int __ret_warn_on = !!((skb->_skb_refdst & 1UL) && !rcu_read_lock_held() && !rcu_read_lock_bh_held()); if (__builtin_expect(!!(__ret_warn_on), 0)) warn_slowpath_null("include/linux/skbuff.h", 582); __builtin_expect(!!(__ret_warn_on), 0); });


 return (struct dst_entry *)(skb->_skb_refdst & ~(1UL));
}
# 594 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) void skb_dst_set(struct sk_buff *skb, struct dst_entry *dst)
{
 skb->_skb_refdst = (unsigned long)dst;
}
# 607 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) void skb_dst_set_noref(struct sk_buff *skb, struct dst_entry *dst)
{
 ({ int __ret_warn_on = !!(!rcu_read_lock_held() && !rcu_read_lock_bh_held()); if (__builtin_expect(!!(__ret_warn_on), 0)) warn_slowpath_null("include/linux/skbuff.h", 609); __builtin_expect(!!(__ret_warn_on), 0); });
 skb->_skb_refdst = (unsigned long)dst | 1UL;
}





static inline __attribute__((always_inline)) int skb_dst_is_noref(const struct sk_buff *skb)
{
 return (skb->_skb_refdst & 1UL) && skb_dst(skb);
}

static inline __attribute__((always_inline)) struct rtable *skb_rtable(const struct sk_buff *skb)
{
 return (struct rtable *)skb_dst(skb);
}







extern void kfree_skb(struct sk_buff *skb);
extern void consume_skb(struct sk_buff *skb);
extern void __kfree_skb(struct sk_buff *skb);
extern struct sk_buff *__alloc_skb(unsigned int size,
       gfp_t priority, int fclone, int node);
static inline __attribute__((always_inline)) struct sk_buff *alloc_skb(unsigned int size,
     gfp_t priority)
{
 return __alloc_skb(size, priority, 0, -1);
}

static inline __attribute__((always_inline)) struct sk_buff *alloc_skb_fclone(unsigned int size,
            gfp_t priority)
{
 return __alloc_skb(size, priority, 1, -1);
}

extern int skb_recycle_check(struct sk_buff *skb, int skb_size);

extern struct sk_buff *skb_morph(struct sk_buff *dst, struct sk_buff *src);
extern struct sk_buff *skb_clone(struct sk_buff *skb,
     gfp_t priority);
extern struct sk_buff *skb_copy(const struct sk_buff *skb,
    gfp_t priority);
extern struct sk_buff *pskb_copy(struct sk_buff *skb,
     gfp_t gfp_mask);
extern int pskb_expand_head(struct sk_buff *skb,
     int nhead, int ntail,
     gfp_t gfp_mask);
extern struct sk_buff *skb_realloc_headroom(struct sk_buff *skb,
         unsigned int headroom);
extern struct sk_buff *skb_copy_expand(const struct sk_buff *skb,
           int newheadroom, int newtailroom,
           gfp_t priority);
extern int skb_to_sgvec(struct sk_buff *skb,
        struct scatterlist *sg, int offset,
        int len);
extern int skb_cow_data(struct sk_buff *skb, int tailbits,
        struct sk_buff **trailer);
extern int skb_pad(struct sk_buff *skb, int pad);


extern int skb_append_datato_frags(struct sock *sk, struct sk_buff *skb,
   int getfrag(void *from, char *to, int offset,
   int len,int odd, struct sk_buff *skb),
   void *from, int length);

struct skb_seq_state {
 __u32 lower_offset;
 __u32 upper_offset;
 __u32 frag_idx;
 __u32 stepped_offset;
 struct sk_buff *root_skb;
 struct sk_buff *cur_skb;
 __u8 *frag_data;
};

extern void skb_prepare_seq_read(struct sk_buff *skb,
        unsigned int from, unsigned int to,
        struct skb_seq_state *st);
extern unsigned int skb_seq_read(unsigned int consumed, const u8 **data,
       struct skb_seq_state *st);
extern void skb_abort_seq_read(struct skb_seq_state *st);

extern unsigned int skb_find_text(struct sk_buff *skb, unsigned int from,
        unsigned int to, struct ts_config *config,
        struct ts_state *state);







static inline __attribute__((always_inline)) unsigned char *skb_end_pointer(const struct sk_buff *skb)
{
 return skb->end;
}





static inline __attribute__((always_inline)) struct skb_shared_hwtstamps *skb_hwtstamps(struct sk_buff *skb)
{
 return &((struct skb_shared_info *)(skb_end_pointer(skb)))->hwtstamps;
}

static inline __attribute__((always_inline)) union skb_shared_tx *skb_tx(struct sk_buff *skb)
{
 return &((struct skb_shared_info *)(skb_end_pointer(skb)))->tx_flags;
}







static inline __attribute__((always_inline)) int skb_queue_empty(const struct sk_buff_head *list)
{
 return list->next == (struct sk_buff *)list;
}
# 744 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) int skb_queue_is_last(const struct sk_buff_head *list,
         const struct sk_buff *skb)
{
 return (skb->next == (struct sk_buff *) list);
}
# 757 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) int skb_queue_is_first(const struct sk_buff_head *list,
          const struct sk_buff *skb)
{
 return (skb->prev == (struct sk_buff *) list);
}
# 771 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) struct sk_buff *skb_queue_next(const struct sk_buff_head *list,
          const struct sk_buff *skb)
{



 __BUG_ON((unsigned long)(skb_queue_is_last(list, skb)));
 return skb->next;
}
# 789 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) struct sk_buff *skb_queue_prev(const struct sk_buff_head *list,
          const struct sk_buff *skb)
{



 __BUG_ON((unsigned long)(skb_queue_is_first(list, skb)));
 return skb->prev;
}
# 806 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) struct sk_buff *skb_get(struct sk_buff *skb)
{
 atomic_add(1, (&skb->users));
 return skb;
}
# 825 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) int skb_cloned(const struct sk_buff *skb)
{
 return skb->cloned &&
        ((*(volatile int *)&(&((struct skb_shared_info *)(skb_end_pointer(skb)))->dataref)->counter) & ((1 << 16) - 1)) != 1;
}
# 838 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) int skb_header_cloned(const struct sk_buff *skb)
{
 int dataref;

 if (!skb->cloned)
  return 0;

 dataref = (*(volatile int *)&(&((struct skb_shared_info *)(skb_end_pointer(skb)))->dataref)->counter);
 dataref = (dataref & ((1 << 16) - 1)) - (dataref >> 16);
 return dataref != 1;
}
# 858 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) void skb_header_release(struct sk_buff *skb)
{
 __BUG_ON((unsigned long)(skb->nohdr));
 skb->nohdr = 1;
 atomic_add(1 << 16, &((struct skb_shared_info *)(skb_end_pointer(skb)))->dataref);
}
# 872 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) int skb_shared(const struct sk_buff *skb)
{
 return (*(volatile int *)&(&skb->users)->counter) != 1;
}
# 890 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) struct sk_buff *skb_share_check(struct sk_buff *skb,
           gfp_t pri)
{
 do { if (pri & (( gfp_t)0x10u)) do { do { } while (0); } while (0); } while (0);
 if (skb_shared(skb)) {
  struct sk_buff *nskb = skb_clone(skb, pri);
  kfree_skb(skb);
  skb = nskb;
 }
 return skb;
}
# 922 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) struct sk_buff *skb_unshare(struct sk_buff *skb,
       gfp_t pri)
{
 do { if (pri & (( gfp_t)0x10u)) do { do { } while (0); } while (0); } while (0);
 if (skb_cloned(skb)) {
  struct sk_buff *nskb = skb_copy(skb, pri);
  kfree_skb(skb);
  skb = nskb;
 }
 return skb;
}
# 947 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) struct sk_buff *skb_peek(struct sk_buff_head *list_)
{
 struct sk_buff *list = ((struct sk_buff *)list_)->next;
 if (list == (struct sk_buff *)list_)
  list = ((void *)0);
 return list;
}
# 968 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) struct sk_buff *skb_peek_tail(struct sk_buff_head *list_)
{
 struct sk_buff *list = ((struct sk_buff *)list_)->prev;
 if (list == (struct sk_buff *)list_)
  list = ((void *)0);
 return list;
}







static inline __attribute__((always_inline)) __u32 skb_queue_len(const struct sk_buff_head *list_)
{
 return list_->qlen;
}
# 997 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) void __skb_queue_head_init(struct sk_buff_head *list)
{
 list->prev = list->next = (struct sk_buff *)list;
 list->qlen = 0;
}
# 1011 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) void skb_queue_head_init(struct sk_buff_head *list)
{
 do { spinlock_check(&list->lock); do { *(&(&list->lock)->rlock) = (raw_spinlock_t) { .raw_lock = { .lock = 0 }, }; } while (0); } while (0);
 __skb_queue_head_init(list);
}

static inline __attribute__((always_inline)) void skb_queue_head_init_class(struct sk_buff_head *list,
  struct lock_class_key *class)
{
 skb_queue_head_init(list);
 do { (void)(class); } while (0);
}







extern void skb_insert(struct sk_buff *old, struct sk_buff *newsk, struct sk_buff_head *list);
static inline __attribute__((always_inline)) void __skb_insert(struct sk_buff *newsk,
    struct sk_buff *prev, struct sk_buff *next,
    struct sk_buff_head *list)
{
 newsk->next = next;
 newsk->prev = prev;
 next->prev = prev->next = newsk;
 list->qlen++;
}

static inline __attribute__((always_inline)) void __skb_queue_splice(const struct sk_buff_head *list,
          struct sk_buff *prev,
          struct sk_buff *next)
{
 struct sk_buff *first = list->next;
 struct sk_buff *last = list->prev;

 first->prev = prev;
 prev->next = first;

 last->next = next;
 next->prev = last;
}






static inline __attribute__((always_inline)) void skb_queue_splice(const struct sk_buff_head *list,
        struct sk_buff_head *head)
{
 if (!skb_queue_empty(list)) {
  __skb_queue_splice(list, (struct sk_buff *) head, head->next);
  head->qlen += list->qlen;
 }
}
# 1076 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) void skb_queue_splice_init(struct sk_buff_head *list,
      struct sk_buff_head *head)
{
 if (!skb_queue_empty(list)) {
  __skb_queue_splice(list, (struct sk_buff *) head, head->next);
  head->qlen += list->qlen;
  __skb_queue_head_init(list);
 }
}






static inline __attribute__((always_inline)) void skb_queue_splice_tail(const struct sk_buff_head *list,
      struct sk_buff_head *head)
{
 if (!skb_queue_empty(list)) {
  __skb_queue_splice(list, head->prev, (struct sk_buff *) head);
  head->qlen += list->qlen;
 }
}
# 1108 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) void skb_queue_splice_tail_init(struct sk_buff_head *list,
           struct sk_buff_head *head)
{
 if (!skb_queue_empty(list)) {
  __skb_queue_splice(list, head->prev, (struct sk_buff *) head);
  head->qlen += list->qlen;
  __skb_queue_head_init(list);
 }
}
# 1129 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) void __skb_queue_after(struct sk_buff_head *list,
         struct sk_buff *prev,
         struct sk_buff *newsk)
{
 __skb_insert(newsk, prev, prev->next, list);
}

extern void skb_append(struct sk_buff *old, struct sk_buff *newsk,
         struct sk_buff_head *list);

static inline __attribute__((always_inline)) void __skb_queue_before(struct sk_buff_head *list,
          struct sk_buff *next,
          struct sk_buff *newsk)
{
 __skb_insert(newsk, next->prev, next, list);
}
# 1156 "include/linux/skbuff.h"
extern void skb_queue_head(struct sk_buff_head *list, struct sk_buff *newsk);
static inline __attribute__((always_inline)) void __skb_queue_head(struct sk_buff_head *list,
        struct sk_buff *newsk)
{
 __skb_queue_after(list, (struct sk_buff *)list, newsk);
}
# 1173 "include/linux/skbuff.h"
extern void skb_queue_tail(struct sk_buff_head *list, struct sk_buff *newsk);
static inline __attribute__((always_inline)) void __skb_queue_tail(struct sk_buff_head *list,
       struct sk_buff *newsk)
{
 __skb_queue_before(list, (struct sk_buff *)list, newsk);
}





extern void skb_unlink(struct sk_buff *skb, struct sk_buff_head *list);
static inline __attribute__((always_inline)) void __skb_unlink(struct sk_buff *skb, struct sk_buff_head *list)
{
 struct sk_buff *next, *prev;

 list->qlen--;
 next = skb->next;
 prev = skb->prev;
 skb->next = skb->prev = ((void *)0);
 next->prev = prev;
 prev->next = next;
}
# 1205 "include/linux/skbuff.h"
extern struct sk_buff *skb_dequeue(struct sk_buff_head *list);
static inline __attribute__((always_inline)) struct sk_buff *__skb_dequeue(struct sk_buff_head *list)
{
 struct sk_buff *skb = skb_peek(list);
 if (skb)
  __skb_unlink(skb, list);
 return skb;
}
# 1222 "include/linux/skbuff.h"
extern struct sk_buff *skb_dequeue_tail(struct sk_buff_head *list);
static inline __attribute__((always_inline)) struct sk_buff *__skb_dequeue_tail(struct sk_buff_head *list)
{
 struct sk_buff *skb = skb_peek_tail(list);
 if (skb)
  __skb_unlink(skb, list);
 return skb;
}


static inline __attribute__((always_inline)) int skb_is_nonlinear(const struct sk_buff *skb)
{
 return skb->data_len;
}

static inline __attribute__((always_inline)) unsigned int skb_headlen(const struct sk_buff *skb)
{
 return skb->len - skb->data_len;
}

static inline __attribute__((always_inline)) int skb_pagelen(const struct sk_buff *skb)
{
 int i, len = 0;

 for (i = (int)((struct skb_shared_info *)(skb_end_pointer(skb)))->nr_frags - 1; i >= 0; i--)
  len += ((struct skb_shared_info *)(skb_end_pointer(skb)))->frags[i].size;
 return len + skb_headlen(skb);
}

static inline __attribute__((always_inline)) void skb_fill_page_desc(struct sk_buff *skb, int i,
          struct page *page, int off, int size)
{
 skb_frag_t *frag = &((struct skb_shared_info *)(skb_end_pointer(skb)))->frags[i];

 frag->page = page;
 frag->page_offset = off;
 frag->size = size;
 ((struct skb_shared_info *)(skb_end_pointer(skb)))->nr_frags = i + 1;
}

extern void skb_add_rx_frag(struct sk_buff *skb, int i, struct page *page,
       int off, int size);
# 1286 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) unsigned char *skb_tail_pointer(const struct sk_buff *skb)
{
 return skb->tail;
}

static inline __attribute__((always_inline)) void skb_reset_tail_pointer(struct sk_buff *skb)
{
 skb->tail = skb->data;
}

static inline __attribute__((always_inline)) void skb_set_tail_pointer(struct sk_buff *skb, const int offset)
{
 skb->tail = skb->data + offset;
}






extern unsigned char *skb_put(struct sk_buff *skb, unsigned int len);
static inline __attribute__((always_inline)) unsigned char *__skb_put(struct sk_buff *skb, unsigned int len)
{
 unsigned char *tmp = skb_tail_pointer(skb);
 __BUG_ON((unsigned long)(skb_is_nonlinear(skb)));
 skb->tail += len;
 skb->len += len;
 return tmp;
}

extern unsigned char *skb_push(struct sk_buff *skb, unsigned int len);
static inline __attribute__((always_inline)) unsigned char *__skb_push(struct sk_buff *skb, unsigned int len)
{
 skb->data -= len;
 skb->len += len;
 return skb->data;
}

extern unsigned char *skb_pull(struct sk_buff *skb, unsigned int len);
static inline __attribute__((always_inline)) unsigned char *__skb_pull(struct sk_buff *skb, unsigned int len)
{
 skb->len -= len;
 __BUG_ON((unsigned long)(skb->len < skb->data_len));
 return skb->data += len;
}

static inline __attribute__((always_inline)) unsigned char *skb_pull_inline(struct sk_buff *skb, unsigned int len)
{
 return __builtin_expect(!!(len > skb->len), 0) ? ((void *)0) : __skb_pull(skb, len);
}

extern unsigned char *__pskb_pull_tail(struct sk_buff *skb, int delta);

static inline __attribute__((always_inline)) unsigned char *__pskb_pull(struct sk_buff *skb, unsigned int len)
{
 if (len > skb_headlen(skb) &&
     !__pskb_pull_tail(skb, len - skb_headlen(skb)))
  return ((void *)0);
 skb->len -= len;
 return skb->data += len;
}

static inline __attribute__((always_inline)) unsigned char *pskb_pull(struct sk_buff *skb, unsigned int len)
{
 return __builtin_expect(!!(len > skb->len), 0) ? ((void *)0) : __pskb_pull(skb, len);
}

static inline __attribute__((always_inline)) int pskb_may_pull(struct sk_buff *skb, unsigned int len)
{
 if (__builtin_expect(!!(len <= skb_headlen(skb)), 1))
  return 1;
 if (__builtin_expect(!!(len > skb->len), 0))
  return 0;
 return __pskb_pull_tail(skb, len - skb_headlen(skb)) != ((void *)0);
}







static inline __attribute__((always_inline)) unsigned int skb_headroom(const struct sk_buff *skb)
{
 return skb->data - skb->head;
}







static inline __attribute__((always_inline)) int skb_tailroom(const struct sk_buff *skb)
{
 return skb_is_nonlinear(skb) ? 0 : skb->end - skb->tail;
}
# 1392 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) void skb_reserve(struct sk_buff *skb, int len)
{
 skb->data += len;
 skb->tail += len;
}
# 1455 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) unsigned char *skb_transport_header(const struct sk_buff *skb)
{
 return skb->transport_header;
}

static inline __attribute__((always_inline)) void skb_reset_transport_header(struct sk_buff *skb)
{
 skb->transport_header = skb->data;
}

static inline __attribute__((always_inline)) void skb_set_transport_header(struct sk_buff *skb,
         const int offset)
{
 skb->transport_header = skb->data + offset;
}

static inline __attribute__((always_inline)) unsigned char *skb_network_header(const struct sk_buff *skb)
{
 return skb->network_header;
}

static inline __attribute__((always_inline)) void skb_reset_network_header(struct sk_buff *skb)
{
 skb->network_header = skb->data;
}

static inline __attribute__((always_inline)) void skb_set_network_header(struct sk_buff *skb, const int offset)
{
 skb->network_header = skb->data + offset;
}

static inline __attribute__((always_inline)) unsigned char *skb_mac_header(const struct sk_buff *skb)
{
 return skb->mac_header;
}

static inline __attribute__((always_inline)) int skb_mac_header_was_set(const struct sk_buff *skb)
{
 return skb->mac_header != ((void *)0);
}

static inline __attribute__((always_inline)) void skb_reset_mac_header(struct sk_buff *skb)
{
 skb->mac_header = skb->data;
}

static inline __attribute__((always_inline)) void skb_set_mac_header(struct sk_buff *skb, const int offset)
{
 skb->mac_header = skb->data + offset;
}


static inline __attribute__((always_inline)) int skb_transport_offset(const struct sk_buff *skb)
{
 return skb_transport_header(skb) - skb->data;
}

static inline __attribute__((always_inline)) u32 skb_network_header_len(const struct sk_buff *skb)
{
 return skb->transport_header - skb->network_header;
}

static inline __attribute__((always_inline)) int skb_network_offset(const struct sk_buff *skb)
{
 return skb_network_header(skb) - skb->data;
}

static inline __attribute__((always_inline)) int pskb_network_may_pull(struct sk_buff *skb, unsigned int len)
{
 return pskb_may_pull(skb, skb_network_offset(skb) + len);
}
# 1579 "include/linux/skbuff.h"
extern int ___pskb_trim(struct sk_buff *skb, unsigned int len);

static inline __attribute__((always_inline)) void __skb_trim(struct sk_buff *skb, unsigned int len)
{
 if (__builtin_expect(!!(skb->data_len), 0)) {
  ({ int __ret_warn_on = !!(1); if (__builtin_expect(!!(__ret_warn_on), 0)) warn_slowpath_null("include/linux/skbuff.h", 1584); __builtin_expect(!!(__ret_warn_on), 0); });
  return;
 }
 skb->len = len;
 skb_set_tail_pointer(skb, len);
}

extern void skb_trim(struct sk_buff *skb, unsigned int len);

static inline __attribute__((always_inline)) int __pskb_trim(struct sk_buff *skb, unsigned int len)
{
 if (skb->data_len)
  return ___pskb_trim(skb, len);
 __skb_trim(skb, len);
 return 0;
}

static inline __attribute__((always_inline)) int pskb_trim(struct sk_buff *skb, unsigned int len)
{
 return (len < skb->len) ? __pskb_trim(skb, len) : 0;
}
# 1615 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) void pskb_trim_unique(struct sk_buff *skb, unsigned int len)
{
 int err = pskb_trim(skb, len);
 __BUG_ON((unsigned long)(err));
}
# 1629 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) void skb_orphan(struct sk_buff *skb)
{
 if (skb->destructor)
  skb->destructor(skb);
 skb->destructor = ((void *)0);
 skb->sk = ((void *)0);
}
# 1645 "include/linux/skbuff.h"
extern void skb_queue_purge(struct sk_buff_head *list);
static inline __attribute__((always_inline)) void __skb_queue_purge(struct sk_buff_head *list)
{
 struct sk_buff *skb;
 while ((skb = __skb_dequeue(list)) != ((void *)0))
  kfree_skb(skb);
}
# 1665 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) struct sk_buff *__dev_alloc_skb(unsigned int length,
           gfp_t gfp_mask)
{
 struct sk_buff *skb = alloc_skb(length + 32, gfp_mask);
 if (__builtin_expect(!!(skb), 1))
  skb_reserve(skb, 32);
 return skb;
}

extern struct sk_buff *dev_alloc_skb(unsigned int length);

extern struct sk_buff *__netdev_alloc_skb(struct net_device *dev,
  unsigned int length, gfp_t gfp_mask);
# 1692 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) struct sk_buff *netdev_alloc_skb(struct net_device *dev,
  unsigned int length)
{
 return __netdev_alloc_skb(dev, length, ((( gfp_t)0x20u)));
}

static inline __attribute__((always_inline)) struct sk_buff *netdev_alloc_skb_ip_align(struct net_device *dev,
  unsigned int length)
{
 struct sk_buff *skb = netdev_alloc_skb(dev, length + 2);

 if (2 && skb)
  skb_reserve(skb, 2);
 return skb;
}

extern struct page *__netdev_alloc_page(struct net_device *dev, gfp_t gfp_mask);
# 1718 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) struct page *netdev_alloc_page(struct net_device *dev)
{
 return __netdev_alloc_page(dev, ((( gfp_t)0x20u)));
}

static inline __attribute__((always_inline)) void netdev_free_page(struct net_device *dev, struct page *page)
{
 __free_pages((page), 0);
}
# 1736 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) int skb_clone_writable(struct sk_buff *skb, unsigned int len)
{
 return !skb_header_cloned(skb) &&
        skb_headroom(skb) + len <= skb->hdr_len;
}

static inline __attribute__((always_inline)) int __skb_cow(struct sk_buff *skb, unsigned int headroom,
       int cloned)
{
 int delta = 0;

 if (headroom < 32)
  headroom = 32;
 if (headroom > skb_headroom(skb))
  delta = headroom - skb_headroom(skb);

 if (delta || cloned)
  return pskb_expand_head(skb, ((((delta)) + ((typeof((delta)))((32)) - 1)) & ~((typeof((delta)))((32)) - 1)), 0,
     ((( gfp_t)0x20u)));
 return 0;
}
# 1770 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) int skb_cow(struct sk_buff *skb, unsigned int headroom)
{
 return __skb_cow(skb, headroom, skb_cloned(skb));
}
# 1785 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) int skb_cow_head(struct sk_buff *skb, unsigned int headroom)
{
 return __skb_cow(skb, headroom, skb_header_cloned(skb));
}
# 1801 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) int skb_padto(struct sk_buff *skb, unsigned int len)
{
 unsigned int size = skb->len;
 if (__builtin_expect(!!(size >= len), 1))
  return 0;
 return skb_pad(skb, len - size);
}

static inline __attribute__((always_inline)) int skb_add_data(struct sk_buff *skb,
          char *from, int copy)
{
 const int off = skb->len;

 if (skb->ip_summed == 0) {
  int err = 0;
  __wsum csum = csum_and_copy_from_user(from, skb_put(skb, copy),
           copy, 0, &err);
  if (!err) {
   skb->csum = csum_block_add(skb->csum, csum, off);
   return 0;
  }
 } else if (!({ void *__cu_to; const void *__cu_from; long __cu_len; __cu_to = (skb_put(skb, copy)); __cu_from = (from); __cu_len = (copy); if (__builtin_expect(!!(({ unsigned long __addr = (unsigned long) ((__cu_from)); unsigned long __size = (__cu_len); unsigned long __mask = (__current_thread_info->addr_limit).seg; unsigned long __ok; (void)0; __ok = (signed long)(__mask & (__addr | (__addr + __size) | ((__builtin_constant_p(__size) && (signed long) (__size) > 0) ? 0 : (__size)))); __ok == 0; })), 1)) { might_fault(); __cu_len = ({ register void *__cu_to_r __asm__("$4"); register const void *__cu_from_r __asm__("$5"); register long __cu_len_r __asm__("$6"); __cu_to_r = (__cu_to); __cu_from_r = (__cu_from); __cu_len_r = (__cu_len); __asm__ __volatile__( ".set\tnoreorder\n\t" ".set\tnoat\n\t" "la" "\t$1, " "__copy_user" "\n\t" "jalr\t$1\n\t" ".set\tat\n\t" ".set\tnoat\n\t" "addu" "\t$1, %1, %2\n\t" ".set\tat\n\t" ".set\treorder" : "+r" (__cu_to_r), "+r" (__cu_from_r), "+r" (__cu_len_r) : : "$8", "$9", "$10", "$11", "$12", "$15", "$24", "$31", "$0", "memory"); __cu_len_r; }); } __cu_len; }))
  return 0;

 __skb_trim(skb, off);
 return -14;
}

static inline __attribute__((always_inline)) int skb_can_coalesce(struct sk_buff *skb, int i,
       struct page *page, int off)
{
 if (i) {
  struct skb_frag_struct *frag = &((struct skb_shared_info *)(skb_end_pointer(skb)))->frags[i - 1];

  return page == frag->page &&
         off == frag->page_offset + frag->size;
 }
 return 0;
}

static inline __attribute__((always_inline)) int __skb_linearize(struct sk_buff *skb)
{
 return __pskb_pull_tail(skb, skb->data_len) ? 0 : -12;
}
# 1853 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) int skb_linearize(struct sk_buff *skb)
{
 return skb_is_nonlinear(skb) ? __skb_linearize(skb) : 0;
}
# 1865 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) int skb_linearize_cow(struct sk_buff *skb)
{
 return skb_is_nonlinear(skb) || skb_cloned(skb) ?
        __skb_linearize(skb) : 0;
}
# 1882 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) void skb_postpull_rcsum(struct sk_buff *skb,
          const void *start, unsigned int len)
{
 if (skb->ip_summed == 2)
  skb->csum = csum_sub(skb->csum, csum_partial(start, len, 0));
}

unsigned char *skb_pull_rcsum(struct sk_buff *skb, unsigned int len);
# 1900 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) int pskb_trim_rcsum(struct sk_buff *skb, unsigned int len)
{
 if (__builtin_expect(!!(len >= skb->len), 1))
  return 0;
 if (skb->ip_summed == 2)
  skb->ip_summed = 0;
 return __pskb_trim(skb, len);
}
# 1934 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) int skb_has_frags(const struct sk_buff *skb)
{
 return ((struct skb_shared_info *)(skb_end_pointer(skb)))->frag_list != ((void *)0);
}

static inline __attribute__((always_inline)) void skb_frag_list_init(struct sk_buff *skb)
{
 ((struct skb_shared_info *)(skb_end_pointer(skb)))->frag_list = ((void *)0);
}

static inline __attribute__((always_inline)) void skb_frag_add_head(struct sk_buff *skb, struct sk_buff *frag)
{
 frag->next = ((struct skb_shared_info *)(skb_end_pointer(skb)))->frag_list;
 ((struct skb_shared_info *)(skb_end_pointer(skb)))->frag_list = frag;
}




extern struct sk_buff *__skb_recv_datagram(struct sock *sk, unsigned flags,
        int *peeked, int *err);
extern struct sk_buff *skb_recv_datagram(struct sock *sk, unsigned flags,
      int noblock, int *err);
extern unsigned int datagram_poll(struct file *file, struct socket *sock,
         struct poll_table_struct *wait);
extern int skb_copy_datagram_iovec(const struct sk_buff *from,
            int offset, struct iovec *to,
            int size);
extern int skb_copy_and_csum_datagram_iovec(struct sk_buff *skb,
       int hlen,
       struct iovec *iov);
extern int skb_copy_datagram_from_iovec(struct sk_buff *skb,
          int offset,
          const struct iovec *from,
          int from_offset,
          int len);
extern int skb_copy_datagram_const_iovec(const struct sk_buff *from,
           int offset,
           const struct iovec *to,
           int to_offset,
           int size);
extern void skb_free_datagram(struct sock *sk, struct sk_buff *skb);
extern void skb_free_datagram_locked(struct sock *sk,
      struct sk_buff *skb);
extern int skb_kill_datagram(struct sock *sk, struct sk_buff *skb,
      unsigned int flags);
extern __wsum skb_checksum(const struct sk_buff *skb, int offset,
        int len, __wsum csum);
extern int skb_copy_bits(const struct sk_buff *skb, int offset,
         void *to, int len);
extern int skb_store_bits(struct sk_buff *skb, int offset,
          const void *from, int len);
extern __wsum skb_copy_and_csum_bits(const struct sk_buff *skb,
           int offset, u8 *to, int len,
           __wsum csum);
extern int skb_splice_bits(struct sk_buff *skb,
      unsigned int offset,
      struct pipe_inode_info *pipe,
      unsigned int len,
      unsigned int flags);
extern void skb_copy_and_csum_dev(const struct sk_buff *skb, u8 *to);
extern void skb_split(struct sk_buff *skb,
     struct sk_buff *skb1, const u32 len);
extern int skb_shift(struct sk_buff *tgt, struct sk_buff *skb,
     int shiftlen);

extern struct sk_buff *skb_segment(struct sk_buff *skb, int features);

static inline __attribute__((always_inline)) void *skb_header_pointer(const struct sk_buff *skb, int offset,
           int len, void *buffer)
{
 int hlen = skb_headlen(skb);

 if (hlen - offset >= len)
  return skb->data + offset;

 if (skb_copy_bits(skb, offset, buffer, len) < 0)
  return ((void *)0);

 return buffer;
}

static inline __attribute__((always_inline)) void skb_copy_from_linear_data(const struct sk_buff *skb,
          void *to,
          const unsigned int len)
{
 memcpy(to, skb->data, len);
}

static inline __attribute__((always_inline)) void skb_copy_from_linear_data_offset(const struct sk_buff *skb,
          const int offset, void *to,
          const unsigned int len)
{
 memcpy(to, skb->data + offset, len);
}

static inline __attribute__((always_inline)) void skb_copy_to_linear_data(struct sk_buff *skb,
        const void *from,
        const unsigned int len)
{
 memcpy(skb->data, from, len);
}

static inline __attribute__((always_inline)) void skb_copy_to_linear_data_offset(struct sk_buff *skb,
        const int offset,
        const void *from,
        const unsigned int len)
{
 memcpy(skb->data + offset, from, len);
}

extern void skb_init(void);

static inline __attribute__((always_inline)) ktime_t skb_get_ktime(const struct sk_buff *skb)
{
 return skb->tstamp;
}
# 2061 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) void skb_get_timestamp(const struct sk_buff *skb,
         struct timeval *stamp)
{
 *stamp = ktime_to_timeval(skb->tstamp);
}

static inline __attribute__((always_inline)) void skb_get_timestampns(const struct sk_buff *skb,
           struct timespec *stamp)
{
 *stamp = ktime_to_timespec(skb->tstamp);
}

static inline __attribute__((always_inline)) void __net_timestamp(struct sk_buff *skb)
{
 skb->tstamp = ktime_get_real();
}

static inline __attribute__((always_inline)) ktime_t net_timedelta(ktime_t t)
{
 return ktime_sub(ktime_get_real(), t);
}

static inline __attribute__((always_inline)) ktime_t net_invalid_timestamp(void)
{
 return ktime_set(0, 0);
}

extern void skb_timestamping_init(void);
# 2097 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) void skb_clone_tx_timestamp(struct sk_buff *skb)
{
}

static inline __attribute__((always_inline)) int skb_defer_rx_timestamp(struct sk_buff *skb)
{
 return false;
}
# 2115 "include/linux/skbuff.h"
void skb_complete_tx_timestamp(struct sk_buff *skb,
          struct skb_shared_hwtstamps *hwtstamps);
# 2129 "include/linux/skbuff.h"
extern void skb_tstamp_tx(struct sk_buff *orig_skb,
   struct skb_shared_hwtstamps *hwtstamps);

static inline __attribute__((always_inline)) void sw_tx_timestamp(struct sk_buff *skb)
{
 union skb_shared_tx *shtx = skb_tx(skb);
 if (shtx->software && !shtx->in_progress)
  skb_tstamp_tx(skb, ((void *)0));
}
# 2148 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) void skb_tx_timestamp(struct sk_buff *skb)
{
 skb_clone_tx_timestamp(skb);
 sw_tx_timestamp(skb);
}

extern __sum16 __skb_checksum_complete_head(struct sk_buff *skb, int len);
extern __sum16 __skb_checksum_complete(struct sk_buff *skb);

static inline __attribute__((always_inline)) int skb_csum_unnecessary(const struct sk_buff *skb)
{
 return skb->ip_summed & 1;
}
# 2178 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) __sum16 skb_checksum_complete(struct sk_buff *skb)
{
 return skb_csum_unnecessary(skb) ?
        0 : __skb_checksum_complete(skb);
}


extern void nf_conntrack_destroy(struct nf_conntrack *nfct);
static inline __attribute__((always_inline)) void nf_conntrack_put(struct nf_conntrack *nfct)
{
 if (nfct && (atomic_sub_return(1, (&nfct->use)) == 0))
  nf_conntrack_destroy(nfct);
}
static inline __attribute__((always_inline)) void nf_conntrack_get(struct nf_conntrack *nfct)
{
 if (nfct)
  atomic_add(1, (&nfct->use));
}
static inline __attribute__((always_inline)) void nf_conntrack_get_reasm(struct sk_buff *skb)
{
 if (skb)
  atomic_add(1, (&skb->users));
}
static inline __attribute__((always_inline)) void nf_conntrack_put_reasm(struct sk_buff *skb)
{
 if (skb)
  kfree_skb(skb);
}
# 2219 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) void nf_reset(struct sk_buff *skb)
{

 nf_conntrack_put(skb->nfct);
 skb->nfct = ((void *)0);
 nf_conntrack_put_reasm(skb->nfct_reasm);
 skb->nfct_reasm = ((void *)0);





}


static inline __attribute__((always_inline)) void __nf_copy(struct sk_buff *dst, const struct sk_buff *src)
{

 dst->nfct = src->nfct;
 nf_conntrack_get(src->nfct);
 dst->nfctinfo = src->nfctinfo;
 dst->nfct_reasm = src->nfct_reasm;
 nf_conntrack_get_reasm(src->nfct_reasm);
# 2253 "include/linux/skbuff.h"
 dst->portbind_mark = src->portbind_mark;
 memcpy(dst->orig_dev_name, src->orig_dev_name, 16);



 dst->vlan_tags[0] = src->vlan_tags[0];
 dst->vlan_tags[1] = src->vlan_tags[1];
 dst->vlan_tag_flag = src->vlan_tag_flag;
# 2291 "include/linux/skbuff.h"
}

static inline __attribute__((always_inline)) void nf_copy(struct sk_buff *dst, const struct sk_buff *src)
{

 nf_conntrack_put(dst->nfct);
 nf_conntrack_put_reasm(dst->nfct_reasm);




 __nf_copy(dst, src);
}
# 2316 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) void skb_copy_secmark(struct sk_buff *to, const struct sk_buff *from)
{ }

static inline __attribute__((always_inline)) void skb_init_secmark(struct sk_buff *skb)
{ }


static inline __attribute__((always_inline)) void skb_set_queue_mapping(struct sk_buff *skb, u16 queue_mapping)
{
 skb->queue_mapping = queue_mapping;
}

static inline __attribute__((always_inline)) u16 skb_get_queue_mapping(const struct sk_buff *skb)
{
 return skb->queue_mapping;
}

static inline __attribute__((always_inline)) void skb_copy_queue_mapping(struct sk_buff *to, const struct sk_buff *from)
{
 to->queue_mapping = from->queue_mapping;
}

static inline __attribute__((always_inline)) void skb_record_rx_queue(struct sk_buff *skb, u16 rx_queue)
{
 skb->queue_mapping = rx_queue + 1;
}

static inline __attribute__((always_inline)) u16 skb_get_rx_queue(const struct sk_buff *skb)
{
 return skb->queue_mapping - 1;
}

static inline __attribute__((always_inline)) int skb_rx_queue_recorded(const struct sk_buff *skb)
{
 return (skb->queue_mapping != 0);
}

extern u16 skb_tx_hash(const struct net_device *dev,
         const struct sk_buff *skb);


static inline __attribute__((always_inline)) struct sec_path *skb_sec_path(struct sk_buff *skb)
{
 return skb->sp;
}







static inline __attribute__((always_inline)) int skb_is_gso(const struct sk_buff *skb)
{
 return ((struct skb_shared_info *)(skb_end_pointer(skb)))->gso_size;
}

static inline __attribute__((always_inline)) int skb_is_gso_v6(const struct sk_buff *skb)
{
 return ((struct skb_shared_info *)(skb_end_pointer(skb)))->gso_type & SKB_GSO_TCPV6;
}

extern void __skb_warn_lro_forwarding(const struct sk_buff *skb);

static inline __attribute__((always_inline)) int skb_warn_if_lro(const struct sk_buff *skb)
{


 struct skb_shared_info *shinfo = ((struct skb_shared_info *)(skb_end_pointer(skb)));
 if (skb_is_nonlinear(skb) && shinfo->gso_size != 0 &&
     __builtin_expect(!!(shinfo->gso_type == 0), 0)) {
  __skb_warn_lro_forwarding(skb);
  return true;
 }
 return false;
}

static inline __attribute__((always_inline)) void skb_forward_csum(struct sk_buff *skb)
{

 if (skb->ip_summed == 2)
  skb->ip_summed = 0;
}

int skb_partial_csum_set(struct sk_buff *skb, u16 start, u16 off);



struct sk_buff *skbmgr_alloc_skb2k(void);
int skbmgr_recycling_callback(struct sk_buff *skb);

static inline __attribute__((always_inline)) struct sk_buff *skbmgr_dev_alloc_skb2k(void)
{
 struct sk_buff *skb = skbmgr_alloc_skb2k();
 if (__builtin_expect(!!(skb), 1))
  skb_reserve(skb, 32);
 return skb;
}
struct sk_buff *skbmgr_alloc_skb4k(void);
int skbmgr_4k_recycling_callback(struct sk_buff *skb);

static inline __attribute__((always_inline)) struct sk_buff *skbmgr_dev_alloc_skb4k(void)
{
 struct sk_buff *skb = skbmgr_alloc_skb4k();
 if (__builtin_expect(!!(skb), 1))
  skb_reserve(skb, 32);
 return skb;
}
# 130 "include/linux/if_ether.h" 2

static inline __attribute__((always_inline)) struct ethhdr *eth_hdr(const struct sk_buff *skb)
{
 return (struct ethhdr *)skb_mac_header(skb);
}

int eth_header_parse(const struct sk_buff *skb, unsigned char *haddr);


extern struct ctl_table ether_table[];


extern ssize_t sysfs_format_mac(char *buf, const unsigned char *addr, int len);
# 30 "include/linux/netdevice.h" 2
# 1 "include/linux/if_packet.h" 1





struct sockaddr_pkt {
 unsigned short spkt_family;
 unsigned char spkt_device[14];
 __be16 spkt_protocol;
};

struct sockaddr_ll {
 unsigned short sll_family;
 __be16 sll_protocol;
 int sll_ifindex;
 unsigned short sll_hatype;
 unsigned char sll_pkttype;
 unsigned char sll_halen;
 unsigned char sll_addr[8];
};
# 53 "include/linux/if_packet.h"
struct tpacket_stats {
 unsigned int tp_packets;
 unsigned int tp_drops;
};

struct tpacket_auxdata {
 __u32 tp_status;
 __u32 tp_len;
 __u32 tp_snaplen;
 __u16 tp_mac;
 __u16 tp_net;
 __u16 tp_vlan_tci;
};
# 80 "include/linux/if_packet.h"
struct tpacket_hdr {
 unsigned long tp_status;
 unsigned int tp_len;
 unsigned int tp_snaplen;
 unsigned short tp_mac;
 unsigned short tp_net;
 unsigned int tp_sec;
 unsigned int tp_usec;
};





struct tpacket2_hdr {
 __u32 tp_status;
 __u32 tp_len;
 __u32 tp_snaplen;
 __u16 tp_mac;
 __u16 tp_net;
 __u32 tp_sec;
 __u32 tp_nsec;
 __u16 tp_vlan_tci;
};



enum tpacket_versions {
 TPACKET_V1,
 TPACKET_V2,
};
# 125 "include/linux/if_packet.h"
struct tpacket_req {
 unsigned int tp_block_size;
 unsigned int tp_block_nr;
 unsigned int tp_frame_size;
 unsigned int tp_frame_nr;
};

struct packet_mreq {
 int mr_ifindex;
 unsigned short mr_type;
 unsigned short mr_alen;
 unsigned char mr_address[8];
};
# 31 "include/linux/netdevice.h" 2
# 1 "include/linux/if_link.h" 1




# 1 "include/linux/netlink.h" 1
# 30 "include/linux/netlink.h"
struct sockaddr_nl {
 sa_family_t nl_family;
 unsigned short nl_pad;
 __u32 nl_pid;
        __u32 nl_groups;
};

struct nlmsghdr {
 __u32 nlmsg_len;
 __u16 nlmsg_type;
 __u16 nlmsg_flags;
 __u32 nlmsg_seq;
 __u32 nlmsg_pid;
};
# 93 "include/linux/netlink.h"
struct nlmsgerr {
 int error;
 struct nlmsghdr msg;
};







struct nl_pktinfo {
 __u32 group;
};



enum {
 NETLINK_UNCONNECTED = 0,
 NETLINK_CONNECTED,
};
# 124 "include/linux/netlink.h"
struct nlattr {
 __u16 nla_len;
 __u16 nla_type;
};
# 152 "include/linux/netlink.h"
struct net;

static inline __attribute__((always_inline)) struct nlmsghdr *nlmsg_hdr(const struct sk_buff *skb)
{
 return (struct nlmsghdr *)skb->data;
}

struct netlink_skb_parms {
 struct ucred creds;
 __u32 pid;
 __u32 dst_group;
 kernel_cap_t eff_cap;
 __u32 loginuid;
 __u32 sessionid;
 __u32 sid;
};





extern void netlink_table_grab(void);
extern void netlink_table_ungrab(void);

extern struct sock *netlink_kernel_create(struct net *net,
       int unit,unsigned int groups,
       void (*input)(struct sk_buff *skb),
       struct mutex *cb_mutex,
       struct module *module);
extern void netlink_kernel_release(struct sock *sk);
extern int __netlink_change_ngroups(struct sock *sk, unsigned int groups);
extern int netlink_change_ngroups(struct sock *sk, unsigned int groups);
extern void __netlink_clear_multicast_users(struct sock *sk, unsigned int group);
extern void netlink_clear_multicast_users(struct sock *sk, unsigned int group);
extern void netlink_ack(struct sk_buff *in_skb, struct nlmsghdr *nlh, int err);
extern int netlink_has_listeners(struct sock *sk, unsigned int group);
extern int netlink_unicast(struct sock *ssk, struct sk_buff *skb, __u32 pid, int nonblock);
extern int netlink_broadcast(struct sock *ssk, struct sk_buff *skb, __u32 pid,
        __u32 group, gfp_t allocation);
extern int netlink_broadcast_filtered(struct sock *ssk, struct sk_buff *skb,
 __u32 pid, __u32 group, gfp_t allocation,
 int (*filter)(struct sock *dsk, struct sk_buff *skb, void *data),
 void *filter_data);
extern int netlink_set_err(struct sock *ssk, __u32 pid, __u32 group, int code);
extern int netlink_register_notifier(struct notifier_block *nb);
extern int netlink_unregister_notifier(struct notifier_block *nb);


struct sock *netlink_getsockbyfilp(struct file *filp);
int netlink_attachskb(struct sock *sk, struct sk_buff *skb,
        long *timeo, struct sock *ssk);
void netlink_detachskb(struct sock *sk, struct sk_buff *skb);
int netlink_sendskb(struct sock *sk, struct sk_buff *skb);
# 221 "include/linux/netlink.h"
struct netlink_callback {
 struct sk_buff *skb;
 const struct nlmsghdr *nlh;
 int (*dump)(struct sk_buff * skb,
     struct netlink_callback *cb);
 int (*done)(struct netlink_callback *cb);
 int family;
 long args[6];
};

struct netlink_notify {
 struct net *net;
 int pid;
 int protocol;
};

static __inline__ __attribute__((always_inline)) struct nlmsghdr *
__nlmsg_put(struct sk_buff *skb, u32 pid, u32 seq, int type, int len, int flags)
{
 struct nlmsghdr *nlh;
 int size = ((len)+( ((((int) ( ((sizeof(struct nlmsghdr))+4 -1) & ~(4 -1) )))+4 -1) & ~(4 -1) ));

 nlh = (struct nlmsghdr*)skb_put(skb, ( ((size)+4 -1) & ~(4 -1) ));
 nlh->nlmsg_type = type;
 nlh->nlmsg_len = size;
 nlh->nlmsg_flags = flags;
 nlh->nlmsg_pid = pid;
 nlh->nlmsg_seq = seq;
 if (!__builtin_constant_p(size) || ( ((size)+4 -1) & ~(4 -1) ) - size != 0)
  memset(((void*)(((char*)nlh) + ((0)+( ((((int) ( ((sizeof(struct nlmsghdr))+4 -1) & ~(4 -1) )))+4 -1) & ~(4 -1) )))) + len, 0, ( ((size)+4 -1) & ~(4 -1) ) - size);
 return nlh;
}
# 262 "include/linux/netlink.h"
extern int netlink_dump_start(struct sock *ssk, struct sk_buff *skb,
         const struct nlmsghdr *nlh,
         int (*dump)(struct sk_buff *skb, struct netlink_callback*),
         int (*done)(struct netlink_callback*));




extern void netlink_set_nonroot(int protocol, unsigned flag);
# 6 "include/linux/if_link.h" 2


struct rtnl_link_stats {
 __u32 rx_packets;
 __u32 tx_packets;
 __u32 rx_bytes;
 __u32 tx_bytes;
 __u32 rx_errors;
 __u32 tx_errors;
 __u32 rx_dropped;
 __u32 tx_dropped;
 __u32 multicast;
 __u32 collisions;


 __u32 rx_length_errors;
 __u32 rx_over_errors;
 __u32 rx_crc_errors;
 __u32 rx_frame_errors;
 __u32 rx_fifo_errors;
 __u32 rx_missed_errors;


 __u32 tx_aborted_errors;
 __u32 tx_carrier_errors;
 __u32 tx_fifo_errors;
 __u32 tx_heartbeat_errors;
 __u32 tx_window_errors;


 __u32 rx_compressed;
 __u32 tx_compressed;
};


struct rtnl_link_stats64 {
 __u64 rx_packets;
 __u64 tx_packets;
 __u64 rx_bytes;
 __u64 tx_bytes;
 __u64 rx_errors;
 __u64 tx_errors;
 __u64 rx_dropped;
 __u64 tx_dropped;
 __u64 multicast;
 __u64 collisions;


 __u64 rx_length_errors;
 __u64 rx_over_errors;
 __u64 rx_crc_errors;
 __u64 rx_frame_errors;
 __u64 rx_fifo_errors;
 __u64 rx_missed_errors;


 __u64 tx_aborted_errors;
 __u64 tx_carrier_errors;
 __u64 tx_fifo_errors;
 __u64 tx_heartbeat_errors;
 __u64 tx_window_errors;


 __u64 rx_compressed;
 __u64 tx_compressed;
};


struct rtnl_link_ifmap {
 __u64 mem_start;
 __u64 mem_end;
 __u64 base_addr;
 __u16 irq;
 __u8 dma;
 __u8 port;
};

enum {
 IFLA_UNSPEC,
 IFLA_ADDRESS,
 IFLA_BROADCAST,
 IFLA_IFNAME,
 IFLA_MTU,
 IFLA_LINK,
 IFLA_QDISC,
 IFLA_STATS,
 IFLA_COST,

 IFLA_PRIORITY,

 IFLA_MASTER,

 IFLA_WIRELESS,

 IFLA_PROTINFO,

 IFLA_TXQLEN,

 IFLA_MAP,

 IFLA_WEIGHT,

 IFLA_OPERSTATE,
 IFLA_LINKMODE,
 IFLA_LINKINFO,

 IFLA_NET_NS_PID,
 IFLA_IFALIAS,
 IFLA_NUM_VF,
 IFLA_VFINFO_LIST,
 IFLA_STATS64,
 IFLA_VF_PORTS,
 IFLA_PORT_SELF,
 __IFLA_MAX
};
# 161 "include/linux/if_link.h"
enum {
 IFLA_INET6_UNSPEC,
 IFLA_INET6_FLAGS,
 IFLA_INET6_CONF,
 IFLA_INET6_STATS,
 IFLA_INET6_MCAST,
 IFLA_INET6_CACHEINFO,
 IFLA_INET6_ICMP6STATS,
 __IFLA_INET6_MAX
};



struct ifla_cacheinfo {
 __u32 max_reasm_len;
 __u32 tstamp;
 __u32 reachable_time;
 __u32 retrans_time;
};

enum {
 IFLA_INFO_UNSPEC,
 IFLA_INFO_KIND,
 IFLA_INFO_DATA,
 IFLA_INFO_XSTATS,
 __IFLA_INFO_MAX,
};





enum {
 IFLA_VLAN_UNSPEC,
 IFLA_VLAN_ID,
 IFLA_VLAN_FLAGS,
 IFLA_VLAN_EGRESS_QOS,
 IFLA_VLAN_INGRESS_QOS,
 __IFLA_VLAN_MAX,
};



struct ifla_vlan_flags {
 __u32 flags;
 __u32 mask;
};

enum {
 IFLA_VLAN_QOS_UNSPEC,
 IFLA_VLAN_QOS_MAPPING,
 __IFLA_VLAN_QOS_MAX
};



struct ifla_vlan_qos_mapping {
 __u32 from;
 __u32 to;
};


enum {
 IFLA_MACVLAN_UNSPEC,
 IFLA_MACVLAN_MODE,
 __IFLA_MACVLAN_MAX,
};



enum macvlan_mode {
 MACVLAN_MODE_PRIVATE = 1,
 MACVLAN_MODE_VEPA = 2,
 MACVLAN_MODE_BRIDGE = 4,
};



enum {
 IFLA_VF_INFO_UNSPEC,
 IFLA_VF_INFO,
 __IFLA_VF_INFO_MAX,
};



enum {
 IFLA_VF_UNSPEC,
 IFLA_VF_MAC,
 IFLA_VF_VLAN,
 IFLA_VF_TX_RATE,
 __IFLA_VF_MAX,
};



struct ifla_vf_mac {
 __u32 vf;
 __u8 mac[32];
};

struct ifla_vf_vlan {
 __u32 vf;
 __u32 vlan;
 __u32 qos;
};

struct ifla_vf_tx_rate {
 __u32 vf;
 __u32 rate;
};

struct ifla_vf_info {
 __u32 vf;
 __u8 mac[32];
 __u32 vlan;
 __u32 qos;
 __u32 tx_rate;
};
# 296 "include/linux/if_link.h"
enum {
 IFLA_VF_PORT_UNSPEC,
 IFLA_VF_PORT,
 __IFLA_VF_PORT_MAX,
};



enum {
 IFLA_PORT_UNSPEC,
 IFLA_PORT_VF,
 IFLA_PORT_PROFILE,
 IFLA_PORT_VSI_TYPE,
 IFLA_PORT_INSTANCE_UUID,
 IFLA_PORT_HOST_UUID,
 IFLA_PORT_REQUEST,
 IFLA_PORT_RESPONSE,
 __IFLA_PORT_MAX,
};







enum {
 PORT_REQUEST_PREASSOCIATE = 0,
 PORT_REQUEST_PREASSOCIATE_RR,
 PORT_REQUEST_ASSOCIATE,
 PORT_REQUEST_DISASSOCIATE,
};

enum {
 PORT_VDP_RESPONSE_SUCCESS = 0,
 PORT_VDP_RESPONSE_INVALID_FORMAT,
 PORT_VDP_RESPONSE_INSUFFICIENT_RESOURCES,
 PORT_VDP_RESPONSE_UNUSED_VTID,
 PORT_VDP_RESPONSE_VTID_VIOLATION,
 PORT_VDP_RESPONSE_VTID_VERSION_VIOALTION,
 PORT_VDP_RESPONSE_OUT_OF_SYNC,

 PORT_PROFILE_RESPONSE_SUCCESS = 0x100,
 PORT_PROFILE_RESPONSE_INPROGRESS,
 PORT_PROFILE_RESPONSE_INVALID,
 PORT_PROFILE_RESPONSE_BADSTATE,
 PORT_PROFILE_RESPONSE_INSUFFICIENT_RESOURCES,
 PORT_PROFILE_RESPONSE_ERROR,
};

struct ifla_port_vsi {
 __u8 vsi_mgr_id;
 __u8 vsi_type_id[3];
 __u8 vsi_type_version;
 __u8 pad[3];
};
# 32 "include/linux/netdevice.h" 2


# 1 "include/linux/pm_qos_params.h" 1






# 1 "include/linux/plist.h" 1
# 80 "include/linux/plist.h"
struct plist_head {
 struct list_head prio_list;
 struct list_head node_list;




};

struct plist_node {
 int prio;
 struct plist_head plist;
};
# 144 "include/linux/plist.h"
static inline __attribute__((always_inline)) void
plist_head_init(struct plist_head *head, spinlock_t *lock)
{
 INIT_LIST_HEAD(&head->prio_list);
 INIT_LIST_HEAD(&head->node_list);




}






static inline __attribute__((always_inline)) void
plist_head_init_raw(struct plist_head *head, raw_spinlock_t *lock)
{
 INIT_LIST_HEAD(&head->prio_list);
 INIT_LIST_HEAD(&head->node_list);




}






static inline __attribute__((always_inline)) void plist_node_init(struct plist_node *node, int prio)
{
 node->prio = prio;
 plist_head_init(&node->plist, ((void *)0));
}

extern void plist_add(struct plist_node *node, struct plist_head *head);
extern void plist_del(struct plist_node *node, struct plist_head *head);
# 229 "include/linux/plist.h"
static inline __attribute__((always_inline)) int plist_head_empty(const struct plist_head *head)
{
 return list_empty(&head->node_list);
}





static inline __attribute__((always_inline)) int plist_node_empty(const struct plist_node *node)
{
 return plist_head_empty(&node->plist);
}
# 285 "include/linux/plist.h"
static inline __attribute__((always_inline)) struct plist_node *plist_first(const struct plist_head *head)
{
 return ({ const typeof( ((struct plist_node *)0)->plist.node_list ) *__mptr = (head->node_list.next); (struct plist_node *)( (char *)__mptr - __builtin_offsetof(struct plist_node,plist.node_list) );});

}







static inline __attribute__((always_inline)) struct plist_node *plist_last(const struct plist_head *head)
{
 return ({ const typeof( ((struct plist_node *)0)->plist.node_list ) *__mptr = (head->node_list.prev); (struct plist_node *)( (char *)__mptr - __builtin_offsetof(struct plist_node,plist.node_list) );});

}
# 8 "include/linux/pm_qos_params.h" 2

# 1 "include/linux/miscdevice.h" 1



# 1 "include/linux/major.h" 1
# 5 "include/linux/miscdevice.h" 2
# 45 "include/linux/miscdevice.h"
struct device;

struct miscdevice {
 int minor;
 const char *name;
 const struct file_operations *fops;
 struct list_head list;
 struct device *parent;
 struct device *this_device;
 const char *nodename;
 mode_t mode;
};

extern int misc_register(struct miscdevice * misc);
extern int misc_deregister(struct miscdevice *misc);
# 10 "include/linux/pm_qos_params.h" 2
# 19 "include/linux/pm_qos_params.h"
struct pm_qos_request_list {
 struct plist_node list;
 int pm_qos_class;
};

void pm_qos_add_request(struct pm_qos_request_list *l, int pm_qos_class, s32 value);
void pm_qos_update_request(struct pm_qos_request_list *pm_qos_req,
  s32 new_value);
void pm_qos_remove_request(struct pm_qos_request_list *pm_qos_req);

int pm_qos_request(int pm_qos_class);
int pm_qos_add_notifier(int pm_qos_class, struct notifier_block *notifier);
int pm_qos_remove_notifier(int pm_qos_class, struct notifier_block *notifier);
int pm_qos_request_active(struct pm_qos_request_list *req);
# 35 "include/linux/netdevice.h" 2
# 48 "include/linux/netdevice.h"
# 1 "include/linux/ethtool.h" 1
# 19 "include/linux/ethtool.h"
struct ethtool_cmd {
 __u32 cmd;
 __u32 supported;
 __u32 advertising;
 __u16 speed;
 __u8 duplex;
 __u8 port;
 __u8 phy_address;
 __u8 transceiver;
 __u8 autoneg;
 __u8 mdio_support;
 __u32 maxtxpkt;
 __u32 maxrxpkt;
 __u16 speed_hi;
 __u8 eth_tp_mdix;
 __u8 reserved2;
 __u32 lp_advertising;
 __u32 reserved[2];
};

static inline __attribute__((always_inline)) void ethtool_cmd_speed_set(struct ethtool_cmd *ep,
      __u32 speed)
{

 ep->speed = (__u16)speed;
 ep->speed_hi = (__u16)(speed >> 16);
}

static inline __attribute__((always_inline)) __u32 ethtool_cmd_speed(struct ethtool_cmd *ep)
{
 return (ep->speed_hi << 16) | ep->speed;
}




struct ethtool_drvinfo {
 __u32 cmd;
 char driver[32];
 char version[32];
 char fw_version[32];
 char bus_info[32];

 char reserved1[32];
 char reserved2[12];







 __u32 n_priv_flags;
 __u32 n_stats;
 __u32 testinfo_len;
 __u32 eedump_len;
 __u32 regdump_len;
};



struct ethtool_wolinfo {
 __u32 cmd;
 __u32 supported;
 __u32 wolopts;
 __u8 sopass[6];
};


struct ethtool_value {
 __u32 cmd;
 __u32 data;
};


struct ethtool_regs {
 __u32 cmd;
 __u32 version;
 __u32 len;
 __u8 data[0];
};


struct ethtool_eeprom {
 __u32 cmd;
 __u32 magic;
 __u32 offset;
 __u32 len;
 __u8 data[0];
};


struct ethtool_coalesce {
 __u32 cmd;





 __u32 rx_coalesce_usecs;







 __u32 rx_max_coalesced_frames;






 __u32 rx_coalesce_usecs_irq;
 __u32 rx_max_coalesced_frames_irq;





 __u32 tx_coalesce_usecs;







 __u32 tx_max_coalesced_frames;






 __u32 tx_coalesce_usecs_irq;
 __u32 tx_max_coalesced_frames_irq;






 __u32 stats_block_coalesce_usecs;
# 172 "include/linux/ethtool.h"
 __u32 use_adaptive_rx_coalesce;
 __u32 use_adaptive_tx_coalesce;





 __u32 pkt_rate_low;
 __u32 rx_coalesce_usecs_low;
 __u32 rx_max_coalesced_frames_low;
 __u32 tx_coalesce_usecs_low;
 __u32 tx_max_coalesced_frames_low;
# 194 "include/linux/ethtool.h"
 __u32 pkt_rate_high;
 __u32 rx_coalesce_usecs_high;
 __u32 rx_max_coalesced_frames_high;
 __u32 tx_coalesce_usecs_high;
 __u32 tx_max_coalesced_frames_high;




 __u32 rate_sample_interval;
};


struct ethtool_ringparam {
 __u32 cmd;





 __u32 rx_max_pending;
 __u32 rx_mini_max_pending;
 __u32 rx_jumbo_max_pending;
 __u32 tx_max_pending;




 __u32 rx_pending;
 __u32 rx_mini_pending;
 __u32 rx_jumbo_pending;
 __u32 tx_pending;
};


struct ethtool_pauseparam {
 __u32 cmd;
# 242 "include/linux/ethtool.h"
 __u32 autoneg;
 __u32 rx_pause;
 __u32 tx_pause;
};


enum ethtool_stringset {
 ETH_SS_TEST = 0,
 ETH_SS_STATS,
 ETH_SS_PRIV_FLAGS,
 ETH_SS_NTUPLE_FILTERS,
};


struct ethtool_gstrings {
 __u32 cmd;
 __u32 string_set;
 __u32 len;
 __u8 data[0];
};

struct ethtool_sset_info {
 __u32 cmd;
 __u32 reserved;
 __u64 sset_mask;

 __u32 data[0];



};

enum ethtool_test_flags {
 ETH_TEST_FL_OFFLINE = (1 << 0),
 ETH_TEST_FL_FAILED = (1 << 1),
};


struct ethtool_test {
 __u32 cmd;
 __u32 flags;
 __u32 reserved;
 __u32 len;
 __u64 data[0];
};


struct ethtool_stats {
 __u32 cmd;
 __u32 n_stats;
 __u64 data[0];
};

struct ethtool_perm_addr {
 __u32 cmd;
 __u32 size;
 __u8 data[0];
};
# 310 "include/linux/ethtool.h"
enum ethtool_flags {
 ETH_FLAG_LRO = (1 << 15),
 ETH_FLAG_NTUPLE = (1 << 27),
 ETH_FLAG_RXHASH = (1 << 28),
};






struct ethtool_tcpip4_spec {
 __be32 ip4src;
 __be32 ip4dst;
 __be16 psrc;
 __be16 pdst;
 __u8 tos;
};

struct ethtool_ah_espip4_spec {
 __be32 ip4src;
 __be32 ip4dst;
 __be32 spi;
 __u8 tos;
};

struct ethtool_rawip4_spec {
 __be32 ip4src;
 __be32 ip4dst;
 __u8 hdata[64];
};

struct ethtool_ether_spec {
 __be16 ether_type;
 __u8 frame_size;
 __u8 eframe[16];
};




struct ethtool_usrip4_spec {
 __be32 ip4src;
 __be32 ip4dst;
 __be32 l4_4_bytes;
 __u8 tos;
 __u8 ip_ver;
 __u8 proto;
};

struct ethtool_rx_flow_spec {
 __u32 flow_type;
 union {
  struct ethtool_tcpip4_spec tcp_ip4_spec;
  struct ethtool_tcpip4_spec udp_ip4_spec;
  struct ethtool_tcpip4_spec sctp_ip4_spec;
  struct ethtool_ah_espip4_spec ah_ip4_spec;
  struct ethtool_ah_espip4_spec esp_ip4_spec;
  struct ethtool_rawip4_spec raw_ip4_spec;
  struct ethtool_ether_spec ether_spec;
  struct ethtool_usrip4_spec usr_ip4_spec;
  __u8 hdata[64];
 } h_u, m_u;
 __u64 ring_cookie;
 __u32 location;
};

struct ethtool_rxnfc {
 __u32 cmd;
 __u32 flow_type;

 __u64 data;


 struct ethtool_rx_flow_spec fs;
 __u32 rule_cnt;
 __u32 rule_locs[0];
};

struct ethtool_rxfh_indir {
 __u32 cmd;



 __u32 size;
 __u32 ring_index[0];
};

struct ethtool_rx_ntuple_flow_spec {
 __u32 flow_type;
 union {
  struct ethtool_tcpip4_spec tcp_ip4_spec;
  struct ethtool_tcpip4_spec udp_ip4_spec;
  struct ethtool_tcpip4_spec sctp_ip4_spec;
  struct ethtool_ah_espip4_spec ah_ip4_spec;
  struct ethtool_ah_espip4_spec esp_ip4_spec;
  struct ethtool_rawip4_spec raw_ip4_spec;
  struct ethtool_ether_spec ether_spec;
  struct ethtool_usrip4_spec usr_ip4_spec;
  __u8 hdata[64];
 } h_u, m_u;

 __u16 vlan_tag;
 __u16 vlan_tag_mask;
 __u64 data;
 __u64 data_mask;


 __s32 action;

};

struct ethtool_rx_ntuple {
 __u32 cmd;
 struct ethtool_rx_ntuple_flow_spec fs;
};


enum ethtool_flash_op_type {
 ETHTOOL_FLASH_ALL_REGIONS = 0,
};


struct ethtool_flash {
 __u32 cmd;
 __u32 region;
 char data[128];
};





struct ethtool_rx_ntuple_flow_spec_container {
 struct ethtool_rx_ntuple_flow_spec fs;
 struct list_head list;
};

struct ethtool_rx_ntuple_list {


 struct list_head list;
 unsigned int count;
};

struct net_device;


u32 ethtool_op_get_link(struct net_device *dev);
u32 ethtool_op_get_rx_csum(struct net_device *dev);
u32 ethtool_op_get_tx_csum(struct net_device *dev);
int ethtool_op_set_tx_csum(struct net_device *dev, u32 data);
int ethtool_op_set_tx_hw_csum(struct net_device *dev, u32 data);
int ethtool_op_set_tx_ipv6_csum(struct net_device *dev, u32 data);
u32 ethtool_op_get_sg(struct net_device *dev);
int ethtool_op_set_sg(struct net_device *dev, u32 data);
u32 ethtool_op_get_tso(struct net_device *dev);
int ethtool_op_set_tso(struct net_device *dev, u32 data);
u32 ethtool_op_get_ufo(struct net_device *dev);
int ethtool_op_set_ufo(struct net_device *dev, u32 data);
u32 ethtool_op_get_flags(struct net_device *dev);
int ethtool_op_set_flags(struct net_device *dev, u32 data, u32 supported);
void ethtool_ntuple_flush(struct net_device *dev);
# 533 "include/linux/ethtool.h"
struct ethtool_ops {
 int (*get_settings)(struct net_device *, struct ethtool_cmd *);
 int (*set_settings)(struct net_device *, struct ethtool_cmd *);
 void (*get_drvinfo)(struct net_device *, struct ethtool_drvinfo *);
 int (*get_regs_len)(struct net_device *);
 void (*get_regs)(struct net_device *, struct ethtool_regs *, void *);
 void (*get_wol)(struct net_device *, struct ethtool_wolinfo *);
 int (*set_wol)(struct net_device *, struct ethtool_wolinfo *);
 u32 (*get_msglevel)(struct net_device *);
 void (*set_msglevel)(struct net_device *, u32);
 int (*nway_reset)(struct net_device *);
 u32 (*get_link)(struct net_device *);
 int (*get_eeprom_len)(struct net_device *);
 int (*get_eeprom)(struct net_device *,
         struct ethtool_eeprom *, u8 *);
 int (*set_eeprom)(struct net_device *,
         struct ethtool_eeprom *, u8 *);
 int (*get_coalesce)(struct net_device *, struct ethtool_coalesce *);
 int (*set_coalesce)(struct net_device *, struct ethtool_coalesce *);
 void (*get_ringparam)(struct net_device *,
     struct ethtool_ringparam *);
 int (*set_ringparam)(struct net_device *,
     struct ethtool_ringparam *);
 void (*get_pauseparam)(struct net_device *,
      struct ethtool_pauseparam*);
 int (*set_pauseparam)(struct net_device *,
      struct ethtool_pauseparam*);
 u32 (*get_rx_csum)(struct net_device *);
 int (*set_rx_csum)(struct net_device *, u32);
 u32 (*get_tx_csum)(struct net_device *);
 int (*set_tx_csum)(struct net_device *, u32);
 u32 (*get_sg)(struct net_device *);
 int (*set_sg)(struct net_device *, u32);
 u32 (*get_tso)(struct net_device *);
 int (*set_tso)(struct net_device *, u32);
 void (*self_test)(struct net_device *, struct ethtool_test *, u64 *);
 void (*get_strings)(struct net_device *, u32 stringset, u8 *);
 int (*phys_id)(struct net_device *, u32);
 void (*get_ethtool_stats)(struct net_device *,
         struct ethtool_stats *, u64 *);
 int (*begin)(struct net_device *);
 void (*complete)(struct net_device *);
 u32 (*get_ufo)(struct net_device *);
 int (*set_ufo)(struct net_device *, u32);
 u32 (*get_flags)(struct net_device *);
 int (*set_flags)(struct net_device *, u32);
 u32 (*get_priv_flags)(struct net_device *);
 int (*set_priv_flags)(struct net_device *, u32);
 int (*get_sset_count)(struct net_device *, int);
 int (*get_rxnfc)(struct net_device *,
        struct ethtool_rxnfc *, void *);
 int (*set_rxnfc)(struct net_device *, struct ethtool_rxnfc *);
 int (*flash_device)(struct net_device *, struct ethtool_flash *);
 int (*reset)(struct net_device *, u32 *);
 int (*set_rx_ntuple)(struct net_device *,
     struct ethtool_rx_ntuple *);
 int (*get_rx_ntuple)(struct net_device *, u32 stringset, void *);
 int (*get_rxfh_indir)(struct net_device *,
      struct ethtool_rxfh_indir *);
 int (*set_rxfh_indir)(struct net_device *,
      const struct ethtool_rxfh_indir *);
};
# 798 "include/linux/ethtool.h"
enum ethtool_reset_flags {





 ETH_RESET_MGMT = 1 << 0,
 ETH_RESET_IRQ = 1 << 1,
 ETH_RESET_DMA = 1 << 2,
 ETH_RESET_FILTER = 1 << 3,
 ETH_RESET_OFFLOAD = 1 << 4,
 ETH_RESET_MAC = 1 << 5,
 ETH_RESET_PHY = 1 << 6,
 ETH_RESET_RAM = 1 << 7,


 ETH_RESET_DEDICATED = 0x0000ffff,

 ETH_RESET_ALL = 0xffffffff,

};
# 49 "include/linux/netdevice.h" 2
# 1 "include/net/net_namespace.h" 1
# 11 "include/net/net_namespace.h"
# 1 "include/net/netns/core.h" 1



struct ctl_table_header;
struct prot_inuse;

struct netns_core {

 struct ctl_table_header *sysctl_hdr;

 int sysctl_somaxconn;

 struct prot_inuse *inuse;
};
# 12 "include/net/net_namespace.h" 2
# 1 "include/net/netns/mib.h" 1



# 1 "include/net/snmp.h" 1
# 23 "include/net/snmp.h"
# 1 "include/linux/snmp.h" 1
# 18 "include/linux/snmp.h"
enum
{
 IPSTATS_MIB_NUM = 0,
 IPSTATS_MIB_INPKTS,
 IPSTATS_MIB_INHDRERRORS,
 IPSTATS_MIB_INTOOBIGERRORS,
 IPSTATS_MIB_INNOROUTES,
 IPSTATS_MIB_INADDRERRORS,
 IPSTATS_MIB_INUNKNOWNPROTOS,
 IPSTATS_MIB_INTRUNCATEDPKTS,
 IPSTATS_MIB_INDISCARDS,
 IPSTATS_MIB_INDELIVERS,
 IPSTATS_MIB_OUTFORWDATAGRAMS,
 IPSTATS_MIB_OUTPKTS,
 IPSTATS_MIB_OUTDISCARDS,
 IPSTATS_MIB_OUTNOROUTES,
 IPSTATS_MIB_REASMTIMEOUT,
 IPSTATS_MIB_REASMREQDS,
 IPSTATS_MIB_REASMOKS,
 IPSTATS_MIB_REASMFAILS,
 IPSTATS_MIB_FRAGOKS,
 IPSTATS_MIB_FRAGFAILS,
 IPSTATS_MIB_FRAGCREATES,
 IPSTATS_MIB_INMCASTPKTS,
 IPSTATS_MIB_OUTMCASTPKTS,
 IPSTATS_MIB_INBCASTPKTS,
 IPSTATS_MIB_OUTBCASTPKTS,
 IPSTATS_MIB_INOCTETS,
 IPSTATS_MIB_OUTOCTETS,
 IPSTATS_MIB_INMCASTOCTETS,
 IPSTATS_MIB_OUTMCASTOCTETS,
 IPSTATS_MIB_INBCASTOCTETS,
 IPSTATS_MIB_OUTBCASTOCTETS,
 __IPSTATS_MIB_MAX
};






enum
{
 ICMP_MIB_NUM = 0,
 ICMP_MIB_INMSGS,
 ICMP_MIB_INERRORS,
 ICMP_MIB_INDESTUNREACHS,
 ICMP_MIB_INTIMEEXCDS,
 ICMP_MIB_INPARMPROBS,
 ICMP_MIB_INSRCQUENCHS,
 ICMP_MIB_INREDIRECTS,
 ICMP_MIB_INECHOS,
 ICMP_MIB_INECHOREPS,
 ICMP_MIB_INTIMESTAMPS,
 ICMP_MIB_INTIMESTAMPREPS,
 ICMP_MIB_INADDRMASKS,
 ICMP_MIB_INADDRMASKREPS,
 ICMP_MIB_OUTMSGS,
 ICMP_MIB_OUTERRORS,
 ICMP_MIB_OUTDESTUNREACHS,
 ICMP_MIB_OUTTIMEEXCDS,
 ICMP_MIB_OUTPARMPROBS,
 ICMP_MIB_OUTSRCQUENCHS,
 ICMP_MIB_OUTREDIRECTS,
 ICMP_MIB_OUTECHOS,
 ICMP_MIB_OUTECHOREPS,
 ICMP_MIB_OUTTIMESTAMPS,
 ICMP_MIB_OUTTIMESTAMPREPS,
 ICMP_MIB_OUTADDRMASKS,
 ICMP_MIB_OUTADDRMASKREPS,
 __ICMP_MIB_MAX
};







enum
{
 ICMP6_MIB_NUM = 0,
 ICMP6_MIB_INMSGS,
 ICMP6_MIB_INERRORS,
 ICMP6_MIB_OUTMSGS,
 ICMP6_MIB_OUTERRORS,
 __ICMP6_MIB_MAX
};
# 114 "include/linux/snmp.h"
enum
{
 TCP_MIB_NUM = 0,
 TCP_MIB_RTOALGORITHM,
 TCP_MIB_RTOMIN,
 TCP_MIB_RTOMAX,
 TCP_MIB_MAXCONN,
 TCP_MIB_ACTIVEOPENS,
 TCP_MIB_PASSIVEOPENS,
 TCP_MIB_ATTEMPTFAILS,
 TCP_MIB_ESTABRESETS,
 TCP_MIB_CURRESTAB,
 TCP_MIB_INSEGS,
 TCP_MIB_OUTSEGS,
 TCP_MIB_RETRANSSEGS,
 TCP_MIB_INERRS,
 TCP_MIB_OUTRSTS,
 __TCP_MIB_MAX
};






enum
{
 UDP_MIB_NUM = 0,
 UDP_MIB_INDATAGRAMS,
 UDP_MIB_NOPORTS,
 UDP_MIB_INERRORS,
 UDP_MIB_OUTDATAGRAMS,
 UDP_MIB_RCVBUFERRORS,
 UDP_MIB_SNDBUFERRORS,
 __UDP_MIB_MAX
};


enum
{
 LINUX_MIB_NUM = 0,
 LINUX_MIB_SYNCOOKIESSENT,
 LINUX_MIB_SYNCOOKIESRECV,
 LINUX_MIB_SYNCOOKIESFAILED,
 LINUX_MIB_EMBRYONICRSTS,
 LINUX_MIB_PRUNECALLED,
 LINUX_MIB_RCVPRUNED,
 LINUX_MIB_OFOPRUNED,
 LINUX_MIB_OUTOFWINDOWICMPS,
 LINUX_MIB_LOCKDROPPEDICMPS,
 LINUX_MIB_ARPFILTER,
 LINUX_MIB_TIMEWAITED,
 LINUX_MIB_TIMEWAITRECYCLED,
 LINUX_MIB_TIMEWAITKILLED,
 LINUX_MIB_PAWSPASSIVEREJECTED,
 LINUX_MIB_PAWSACTIVEREJECTED,
 LINUX_MIB_PAWSESTABREJECTED,
 LINUX_MIB_DELAYEDACKS,
 LINUX_MIB_DELAYEDACKLOCKED,
 LINUX_MIB_DELAYEDACKLOST,
 LINUX_MIB_LISTENOVERFLOWS,
 LINUX_MIB_LISTENDROPS,
 LINUX_MIB_TCPPREQUEUED,
 LINUX_MIB_TCPDIRECTCOPYFROMBACKLOG,
 LINUX_MIB_TCPDIRECTCOPYFROMPREQUEUE,
 LINUX_MIB_TCPPREQUEUEDROPPED,
 LINUX_MIB_TCPHPHITS,
 LINUX_MIB_TCPHPHITSTOUSER,
 LINUX_MIB_TCPPUREACKS,
 LINUX_MIB_TCPHPACKS,
 LINUX_MIB_TCPRENORECOVERY,
 LINUX_MIB_TCPSACKRECOVERY,
 LINUX_MIB_TCPSACKRENEGING,
 LINUX_MIB_TCPFACKREORDER,
 LINUX_MIB_TCPSACKREORDER,
 LINUX_MIB_TCPRENOREORDER,
 LINUX_MIB_TCPTSREORDER,
 LINUX_MIB_TCPFULLUNDO,
 LINUX_MIB_TCPPARTIALUNDO,
 LINUX_MIB_TCPDSACKUNDO,
 LINUX_MIB_TCPLOSSUNDO,
 LINUX_MIB_TCPLOSS,
 LINUX_MIB_TCPLOSTRETRANSMIT,
 LINUX_MIB_TCPRENOFAILURES,
 LINUX_MIB_TCPSACKFAILURES,
 LINUX_MIB_TCPLOSSFAILURES,
 LINUX_MIB_TCPFASTRETRANS,
 LINUX_MIB_TCPFORWARDRETRANS,
 LINUX_MIB_TCPSLOWSTARTRETRANS,
 LINUX_MIB_TCPTIMEOUTS,
 LINUX_MIB_TCPRENORECOVERYFAIL,
 LINUX_MIB_TCPSACKRECOVERYFAIL,
 LINUX_MIB_TCPSCHEDULERFAILED,
 LINUX_MIB_TCPRCVCOLLAPSED,
 LINUX_MIB_TCPDSACKOLDSENT,
 LINUX_MIB_TCPDSACKOFOSENT,
 LINUX_MIB_TCPDSACKRECV,
 LINUX_MIB_TCPDSACKOFORECV,
 LINUX_MIB_TCPABORTONSYN,
 LINUX_MIB_TCPABORTONDATA,
 LINUX_MIB_TCPABORTONCLOSE,
 LINUX_MIB_TCPABORTONMEMORY,
 LINUX_MIB_TCPABORTONTIMEOUT,
 LINUX_MIB_TCPABORTONLINGER,
 LINUX_MIB_TCPABORTFAILED,
 LINUX_MIB_TCPMEMORYPRESSURES,
 LINUX_MIB_TCPSACKDISCARD,
 LINUX_MIB_TCPDSACKIGNOREDOLD,
 LINUX_MIB_TCPDSACKIGNOREDNOUNDO,
 LINUX_MIB_TCPSPURIOUSRTOS,
 LINUX_MIB_TCPMD5NOTFOUND,
 LINUX_MIB_TCPMD5UNEXPECTED,
 LINUX_MIB_SACKSHIFTED,
 LINUX_MIB_SACKMERGED,
 LINUX_MIB_SACKSHIFTFALLBACK,
 LINUX_MIB_TCPBACKLOGDROP,
 LINUX_MIB_TCPMINTTLDROP,
 LINUX_MIB_TCPDEFERACCEPTDROP,
 LINUX_MIB_IPRPFILTER,
 __LINUX_MIB_MAX
};


enum
{
 LINUX_MIB_XFRMNUM = 0,
 LINUX_MIB_XFRMINERROR,
 LINUX_MIB_XFRMINBUFFERERROR,
 LINUX_MIB_XFRMINHDRERROR,
 LINUX_MIB_XFRMINNOSTATES,
 LINUX_MIB_XFRMINSTATEPROTOERROR,
 LINUX_MIB_XFRMINSTATEMODEERROR,
 LINUX_MIB_XFRMINSTATESEQERROR,
 LINUX_MIB_XFRMINSTATEEXPIRED,
 LINUX_MIB_XFRMINSTATEMISMATCH,
 LINUX_MIB_XFRMINSTATEINVALID,
 LINUX_MIB_XFRMINTMPLMISMATCH,
 LINUX_MIB_XFRMINNOPOLS,
 LINUX_MIB_XFRMINPOLBLOCK,
 LINUX_MIB_XFRMINPOLERROR,
 LINUX_MIB_XFRMOUTERROR,
 LINUX_MIB_XFRMOUTBUNDLEGENERROR,
 LINUX_MIB_XFRMOUTBUNDLECHECKERROR,
 LINUX_MIB_XFRMOUTNOSTATES,
 LINUX_MIB_XFRMOUTSTATEPROTOERROR,
 LINUX_MIB_XFRMOUTSTATEMODEERROR,
 LINUX_MIB_XFRMOUTSTATESEQERROR,
 LINUX_MIB_XFRMOUTSTATEEXPIRED,
 LINUX_MIB_XFRMOUTPOLBLOCK,
 LINUX_MIB_XFRMOUTPOLDEAD,
 LINUX_MIB_XFRMOUTPOLERROR,
 LINUX_MIB_XFRMFWDHDRERROR,
 __LINUX_MIB_XFRMMAX
};
# 24 "include/net/snmp.h" 2
# 34 "include/net/snmp.h"
struct snmp_mib {
 const char *name;
 int entry;
};
# 52 "include/net/snmp.h"
# 1 "include/linux/u64_stats_sync.h" 1
# 64 "include/linux/u64_stats_sync.h"
struct u64_stats_sync {

 seqcount_t seq;

};

static void inline __attribute__((always_inline)) u64_stats_update_begin(struct u64_stats_sync *syncp)
{

 write_seqcount_begin(&syncp->seq);

}

static void inline __attribute__((always_inline)) u64_stats_update_end(struct u64_stats_sync *syncp)
{

 write_seqcount_end(&syncp->seq);

}

static unsigned int inline __attribute__((always_inline)) u64_stats_fetch_begin(const struct u64_stats_sync *syncp)
{

 return read_seqcount_begin(&syncp->seq);






}

static int inline __attribute__((always_inline)) u64_stats_fetch_retry(const struct u64_stats_sync *syncp,
      unsigned int start)
{

 return read_seqcount_retry(&syncp->seq, start);






}







static unsigned int inline __attribute__((always_inline)) u64_stats_fetch_begin_bh(const struct u64_stats_sync *syncp)
{

 return read_seqcount_begin(&syncp->seq);






}

static int inline __attribute__((always_inline)) u64_stats_fetch_retry_bh(const struct u64_stats_sync *syncp,
      unsigned int start)
{

 return read_seqcount_retry(&syncp->seq, start);






}
# 53 "include/net/snmp.h" 2



struct ipstats_mib {

 u64 mibs[__IPSTATS_MIB_MAX];
 struct u64_stats_sync syncp;
};





struct icmp_mib {
 unsigned long mibs[(__ICMP_MIB_MAX + 1)];
};


struct icmpmsg_mib {
 unsigned long mibs[512];
};



struct icmpv6_mib {
 unsigned long mibs[__ICMP6_MIB_MAX];
};


struct icmpv6msg_mib {
 unsigned long mibs[512];
};




struct tcp_mib {
 unsigned long mibs[__TCP_MIB_MAX];
};



struct udp_mib {
 unsigned long mibs[__UDP_MIB_MAX];
};



struct linux_mib {
 unsigned long mibs[__LINUX_MIB_MAX];
};



struct linux_xfrm_mib {
 unsigned long mibs[__LINUX_MIB_XFRMMAX];
};
# 5 "include/net/netns/mib.h" 2

struct netns_mib {
 __typeof__(struct tcp_mib) *tcp_statistics[2];
 __typeof__(struct ipstats_mib) *ip_statistics[2];
 __typeof__(struct linux_mib) *net_statistics[2];
 __typeof__(struct udp_mib) *udp_statistics[2];
 __typeof__(struct udp_mib) *udplite_statistics[2];
 __typeof__(struct icmp_mib) *icmp_statistics[2];
 __typeof__(struct icmpmsg_mib) *icmpmsg_statistics[2];


 struct proc_dir_entry *proc_net_devsnmp6;
 __typeof__(struct udp_mib) *udp_stats_in6[2];
 __typeof__(struct udp_mib) *udplite_stats_in6[2];
 __typeof__(struct ipstats_mib) *ipv6_statistics[2];
 __typeof__(struct icmpv6_mib) *icmpv6_statistics[2];
 __typeof__(struct icmpv6msg_mib) *icmpv6msg_statistics[2];




};
# 13 "include/net/net_namespace.h" 2
# 1 "include/net/netns/unix.h" 1






struct ctl_table_header;
struct netns_unix {
 int sysctl_max_dgram_qlen;
 struct ctl_table_header *ctl;
};
# 14 "include/net/net_namespace.h" 2
# 1 "include/net/netns/packet.h" 1
# 10 "include/net/netns/packet.h"
struct netns_packet {
 spinlock_t sklist_lock;
 struct hlist_head sklist;
};
# 15 "include/net/net_namespace.h" 2
# 1 "include/net/netns/ipv4.h" 1







# 1 "include/net/inet_frag.h" 1



struct netns_frags {
 int nqueues;
 atomic_t mem;
 struct list_head lru_list;


 int timeout;
 int high_thresh;
 int low_thresh;
};

struct inet_frag_queue {
 struct hlist_node list;
 struct netns_frags *net;
 struct list_head lru_list;
 spinlock_t lock;
 atomic_t refcnt;
 struct timer_list timer;
 struct sk_buff *fragments;
 struct sk_buff *fragments_tail;
 ktime_t stamp;
 int len;
 int meat;
 __u8 last_in;




};



struct inet_frags {
 struct hlist_head hash[64];
 rwlock_t lock;
 u32 rnd;
 int qsize;
 int secret_interval;
 struct timer_list secret_timer;

 unsigned int (*hashfn)(struct inet_frag_queue *);
 void (*constructor)(struct inet_frag_queue *q,
      void *arg);
 void (*destructor)(struct inet_frag_queue *);
 void (*skb_free)(struct sk_buff *);
 int (*match)(struct inet_frag_queue *q,
      void *arg);
 void (*frag_expire)(unsigned long data);
};

void inet_frags_init(struct inet_frags *);
void inet_frags_fini(struct inet_frags *);

void inet_frags_init_net(struct netns_frags *nf);
void inet_frags_exit_net(struct netns_frags *nf, struct inet_frags *f);

void inet_frag_kill(struct inet_frag_queue *q, struct inet_frags *f);
void inet_frag_destroy(struct inet_frag_queue *q,
    struct inet_frags *f, int *work);
int inet_frag_evictor(struct netns_frags *nf, struct inet_frags *f);
struct inet_frag_queue *inet_frag_find(struct netns_frags *nf,
  struct inet_frags *f, void *key, unsigned int hash)
 ;

static inline __attribute__((always_inline)) void inet_frag_put(struct inet_frag_queue *q, struct inet_frags *f)
{
 if ((atomic_sub_return(1, (&q->refcnt)) == 0))
  inet_frag_destroy(q, f, ((void *)0));
}
# 9 "include/net/netns/ipv4.h" 2

struct ctl_table_header;
struct ipv4_devconf;
struct fib_rules_ops;
struct hlist_head;
struct sock;

struct netns_ipv4 {

 struct ctl_table_header *forw_hdr;
 struct ctl_table_header *frags_hdr;
 struct ctl_table_header *ipv4_hdr;
 struct ctl_table_header *route_hdr;

 struct ipv4_devconf *devconf_all;
 struct ipv4_devconf *devconf_dflt;

 struct fib_rules_ops *rules_ops;

 struct hlist_head *fib_table_hash;
 struct sock *fibnl;

 struct sock **icmp_sk;
 struct sock *tcp_sock;

 struct netns_frags frags;

 struct xt_table *iptable_filter;
 struct xt_table *iptable_mangle;
 struct xt_table *iptable_raw;
 struct xt_table *arptable_filter;



 struct xt_table *nat_table;
 struct hlist_head *nat_bysource;
 unsigned int nat_htable_size;
 int nat_vmalloced;


 int sysctl_icmp_echo_ignore_all;
 int sysctl_icmp_echo_ignore_broadcasts;
 int sysctl_icmp_ignore_bogus_error_responses;
 int sysctl_icmp_ratelimit;
 int sysctl_icmp_ratemask;
 int sysctl_icmp_errors_use_inbound_ifaddr;
 int sysctl_rt_cache_rebuild_count;
 int current_rt_cache_rebuild_count;

 atomic_t rt_genid;



 struct mr_table *mrt;





};
# 16 "include/net/net_namespace.h" 2
# 1 "include/net/netns/ipv6.h" 1
# 9 "include/net/netns/ipv6.h"
# 1 "include/net/dst_ops.h" 1




struct dst_entry;
struct kmem_cachep;
struct net_device;
struct sk_buff;

struct dst_ops {
 unsigned short family;
 __be16 protocol;
 unsigned gc_thresh;

 int (*gc)(struct dst_ops *ops);
 struct dst_entry * (*check)(struct dst_entry *, __u32 cookie);
 void (*destroy)(struct dst_entry *);
 void (*ifdown)(struct dst_entry *,
       struct net_device *dev, int how);
 struct dst_entry * (*negative_advice)(struct dst_entry *);
 void (*link_failure)(struct sk_buff *);
 void (*update_pmtu)(struct dst_entry *dst, u32 mtu);
 int (*local_out)(struct sk_buff *skb);

 atomic_t entries;
 struct kmem_cache *kmem_cachep;
};
# 10 "include/net/netns/ipv6.h" 2

struct ctl_table_header;

struct netns_sysctl_ipv6 {

 struct ctl_table_header *table;
 struct ctl_table_header *frags_hdr;

 int bindv6only;
 int flush_delay;
 int ip6_rt_max_size;
 int ip6_rt_gc_min_interval;
 int ip6_rt_gc_timeout;
 int ip6_rt_gc_interval;
 int ip6_rt_gc_elasticity;
 int ip6_rt_mtu_expires;
 int ip6_rt_min_advmss;
 int icmpv6_time;
};

struct netns_ipv6 {
 struct netns_sysctl_ipv6 sysctl;
 struct ipv6_devconf *devconf_all;
 struct ipv6_devconf *devconf_dflt;
 struct netns_frags frags;

 struct xt_table *ip6table_filter;
 struct xt_table *ip6table_mangle;
 struct xt_table *ip6table_raw;




 struct rt6_info *ip6_null_entry;
 struct rt6_statistics *rt6_stats;
 struct timer_list ip6_fib_timer;
 struct hlist_head *fib_table_hash;
 struct fib6_table *fib6_main_tbl;
 struct dst_ops ip6_dst_ops;
 unsigned int ip6_rt_gc_expire;
 unsigned long ip6_rt_last_gc;






 struct sock **icmp_sk;
 struct sock *ndisc_sk;
 struct sock *tcp_sk;
 struct sock *igmp_sk;
# 69 "include/net/netns/ipv6.h"
};
# 17 "include/net/net_namespace.h" 2
# 1 "include/net/netns/dccp.h" 1



struct sock;

struct netns_dccp {
 struct sock *v4_ctl_sk;
 struct sock *v6_ctl_sk;
};
# 18 "include/net/net_namespace.h" 2
# 1 "include/net/netns/x_tables.h" 1




# 1 "include/linux/netfilter.h" 1
# 9 "include/linux/netfilter.h"
# 1 "include/linux/in.h" 1
# 25 "include/linux/in.h"
enum {
  IPPROTO_IP = 0,
  IPPROTO_ICMP = 1,
  IPPROTO_IGMP = 2,
  IPPROTO_IPIP = 4,
  IPPROTO_TCP = 6,
  IPPROTO_EGP = 8,
  IPPROTO_PUP = 12,
  IPPROTO_UDP = 17,
  IPPROTO_IDP = 22,
  IPPROTO_DCCP = 33,
  IPPROTO_RSVP = 46,
  IPPROTO_GRE = 47,

  IPPROTO_IPV6 = 41,

  IPPROTO_ESP = 50,
  IPPROTO_AH = 51,
  IPPROTO_BEETPH = 94,
  IPPROTO_PIM = 103,

  IPPROTO_COMP = 108,
  IPPROTO_SCTP = 132,
  IPPROTO_UDPLITE = 136,

  IPPROTO_RAW = 255,
  IPPROTO_MAX
};



struct in_addr {
 __be32 s_addr;
};
# 131 "include/linux/in.h"
struct ip_mreq {
 struct in_addr imr_multiaddr;
 struct in_addr imr_interface;
};

struct ip_mreqn {
 struct in_addr imr_multiaddr;
 struct in_addr imr_address;
 int imr_ifindex;
};

struct ip_mreq_source {
 __be32 imr_multiaddr;
 __be32 imr_interface;
 __be32 imr_sourceaddr;
};

struct ip_msfilter {
 __be32 imsf_multiaddr;
 __be32 imsf_interface;
 __u32 imsf_fmode;
 __u32 imsf_numsrc;
 __be32 imsf_slist[1];
};





struct group_req {
 __u32 gr_interface;
 struct __kernel_sockaddr_storage gr_group;
};

struct group_source_req {
 __u32 gsr_interface;
 struct __kernel_sockaddr_storage gsr_group;
 struct __kernel_sockaddr_storage gsr_source;
};

struct group_filter {
 __u32 gf_interface;
 struct __kernel_sockaddr_storage gf_group;
 __u32 gf_fmode;
 __u32 gf_numsrc;
 struct __kernel_sockaddr_storage gf_slist[1];
};





struct in_pktinfo {
 int ipi_ifindex;
 struct in_addr ipi_spec_dst;
 struct in_addr ipi_addr;
};



struct sockaddr_in {
  sa_family_t sin_family;
  __be16 sin_port;
  struct in_addr sin_addr;


  unsigned char __pad[16 - sizeof(short int) -
   sizeof(unsigned short int) - sizeof(struct in_addr)];
};
# 260 "include/linux/in.h"
static inline __attribute__((always_inline)) int ipv4_is_loopback(__be32 addr)
{
 return (addr & (( __be32)(__u32)(0xff000000))) == (( __be32)(__u32)(0x7f000000));
}

static inline __attribute__((always_inline)) int ipv4_is_multicast(__be32 addr)
{
 return (addr & (( __be32)(__u32)(0xf0000000))) == (( __be32)(__u32)(0xe0000000));
}

static inline __attribute__((always_inline)) int ipv4_is_local_multicast(__be32 addr)
{
 return (addr & (( __be32)(__u32)(0xffffff00))) == (( __be32)(__u32)(0xe0000000));
}

static inline __attribute__((always_inline)) int ipv4_is_lbcast(__be32 addr)
{

 return addr == (( __be32)(__u32)(((unsigned long int) 0xffffffff)));
}

static inline __attribute__((always_inline)) int ipv4_is_zeronet(__be32 addr)
{
 return (addr & (( __be32)(__u32)(0xff000000))) == (( __be32)(__u32)(0x00000000));
}



static inline __attribute__((always_inline)) int ipv4_is_private_10(__be32 addr)
{
 return (addr & (( __be32)(__u32)(0xff000000))) == (( __be32)(__u32)(0x0a000000));
}

static inline __attribute__((always_inline)) int ipv4_is_private_172(__be32 addr)
{
 return (addr & (( __be32)(__u32)(0xfff00000))) == (( __be32)(__u32)(0xac100000));
}

static inline __attribute__((always_inline)) int ipv4_is_private_192(__be32 addr)
{
 return (addr & (( __be32)(__u32)(0xffff0000))) == (( __be32)(__u32)(0xc0a80000));
}

static inline __attribute__((always_inline)) int ipv4_is_linklocal_169(__be32 addr)
{
 return (addr & (( __be32)(__u32)(0xffff0000))) == (( __be32)(__u32)(0xa9fe0000));
}

static inline __attribute__((always_inline)) int ipv4_is_anycast_6to4(__be32 addr)
{
 return (addr & (( __be32)(__u32)(0xffffff00))) == (( __be32)(__u32)(0xc0586300));
}

static inline __attribute__((always_inline)) int ipv4_is_test_192(__be32 addr)
{
 return (addr & (( __be32)(__u32)(0xffffff00))) == (( __be32)(__u32)(0xc0000200));
}

static inline __attribute__((always_inline)) int ipv4_is_test_198(__be32 addr)
{
 return (addr & (( __be32)(__u32)(0xfffe0000))) == (( __be32)(__u32)(0xc6120000));
}
# 10 "include/linux/netfilter.h" 2
# 44 "include/linux/netfilter.h"
enum nf_inet_hooks {
 NF_INET_PRE_ROUTING,
 NF_INET_LOCAL_IN,
 NF_INET_FORWARD,
 NF_INET_LOCAL_OUT,
 NF_INET_POST_ROUTING,
 NF_INET_NUMHOOKS
};

enum {
 NFPROTO_UNSPEC = 0,
 NFPROTO_IPV4 = 2,
 NFPROTO_ARP = 3,
 NFPROTO_BRIDGE = 7,
 NFPROTO_IPV6 = 10,
 NFPROTO_DECNET = 12,
 NFPROTO_NUMPROTO,
};

union nf_inet_addr {
 __u32 all[4];
 __be32 ip;
 __be32 ip6[4];
 struct in_addr in;
 struct in6_addr in6;
};




static inline __attribute__((always_inline)) int nf_inet_addr_cmp(const union nf_inet_addr *a1,
       const union nf_inet_addr *a2)
{
 return a1->all[0] == a2->all[0] &&
        a1->all[1] == a2->all[1] &&
        a1->all[2] == a2->all[2] &&
        a1->all[3] == a2->all[3];
}

extern void netfilter_init(void);




struct sk_buff;

typedef unsigned int nf_hookfn(unsigned int hooknum,
          struct sk_buff *skb,
          const struct net_device *in,
          const struct net_device *out,
          int (*okfn)(struct sk_buff *));

struct nf_hook_ops {
 struct list_head list;


 nf_hookfn *hook;
 struct module *owner;
 u_int8_t pf;
 unsigned int hooknum;

 int priority;
};

struct nf_sockopt_ops {
 struct list_head list;

 u_int8_t pf;


 int set_optmin;
 int set_optmax;
 int (*set)(struct sock *sk, int optval, void *user, unsigned int len);




 int get_optmin;
 int get_optmax;
 int (*get)(struct sock *sk, int optval, void *user, int *len);





 struct module *owner;
};


int nf_register_hook(struct nf_hook_ops *reg);
void nf_unregister_hook(struct nf_hook_ops *reg);
int nf_register_hooks(struct nf_hook_ops *reg, unsigned int n);
void nf_unregister_hooks(struct nf_hook_ops *reg, unsigned int n);



int nf_register_sockopt(struct nf_sockopt_ops *reg);
void nf_unregister_sockopt(struct nf_sockopt_ops *reg);



extern struct ctl_path nf_net_netfilter_sysctl_path[];
extern struct ctl_path nf_net_ipv4_netfilter_sysctl_path[];


extern struct list_head nf_hooks[NFPROTO_NUMPROTO][8];

int nf_hook_slow(u_int8_t pf, unsigned int hook, struct sk_buff *skb,
   struct net_device *indev, struct net_device *outdev,
   int (*okfn)(struct sk_buff *), int thresh);
# 162 "include/linux/netfilter.h"
static inline __attribute__((always_inline)) int nf_hook_thresh(u_int8_t pf, unsigned int hook,
     struct sk_buff *skb,
     struct net_device *indev,
     struct net_device *outdev,
     int (*okfn)(struct sk_buff *), int thresh)
{

 if (list_empty(&nf_hooks[pf][hook]))
  return 1;

 return nf_hook_slow(pf, hook, skb, indev, outdev, okfn, thresh);
}

static inline __attribute__((always_inline)) int nf_hook(u_int8_t pf, unsigned int hook, struct sk_buff *skb,
     struct net_device *indev, struct net_device *outdev,
     int (*okfn)(struct sk_buff *))
{
 return nf_hook_thresh(pf, hook, skb, indev, outdev, okfn, (-((int)(~0U>>1)) - 1));
}
# 199 "include/linux/netfilter.h"
static inline __attribute__((always_inline)) int
NF_HOOK_THRESH(uint8_t pf, unsigned int hook, struct sk_buff *skb,
        struct net_device *in, struct net_device *out,
        int (*okfn)(struct sk_buff *), int thresh)
{
 int ret = nf_hook_thresh(pf, hook, skb, in, out, okfn, thresh);
 if (ret == 1)
  ret = okfn(skb);
 return ret;
}

static inline __attribute__((always_inline)) int
NF_HOOK_COND(uint8_t pf, unsigned int hook, struct sk_buff *skb,
      struct net_device *in, struct net_device *out,
      int (*okfn)(struct sk_buff *), int cond)
{
 int ret;

 if (!cond ||
     (ret = nf_hook_thresh(pf, hook, skb, in, out, okfn, (-((int)(~0U>>1)) - 1)) == 1))
  ret = okfn(skb);
 return ret;
}

static inline __attribute__((always_inline)) int
NF_HOOK(uint8_t pf, unsigned int hook, struct sk_buff *skb,
 struct net_device *in, struct net_device *out,
 int (*okfn)(struct sk_buff *))
{
 return NF_HOOK_THRESH(pf, hook, skb, in, out, okfn, (-((int)(~0U>>1)) - 1));
}


int nf_setsockopt(struct sock *sk, u_int8_t pf, int optval, char *opt,
    unsigned int len);
int nf_getsockopt(struct sock *sk, u_int8_t pf, int optval, char *opt,
    int *len);
# 246 "include/linux/netfilter.h"
extern int skb_make_writable(struct sk_buff *skb, unsigned int writable_len);

struct flowi;
struct nf_queue_entry;

struct nf_afinfo {
 unsigned short family;
 __sum16 (*checksum)(struct sk_buff *skb, unsigned int hook,
        unsigned int dataoff, u_int8_t protocol);
 __sum16 (*checksum_partial)(struct sk_buff *skb,
         unsigned int hook,
         unsigned int dataoff,
         unsigned int len,
         u_int8_t protocol);
 int (*route)(struct dst_entry **dst, struct flowi *fl);
 void (*saveroute)(const struct sk_buff *skb,
         struct nf_queue_entry *entry);
 int (*reroute)(struct sk_buff *skb,
       const struct nf_queue_entry *entry);
 int route_key_size;
};

extern const struct nf_afinfo *nf_afinfo[NFPROTO_NUMPROTO];
static inline __attribute__((always_inline)) const struct nf_afinfo *nf_get_afinfo(unsigned short family)
{
 return ({ typeof(nf_afinfo[family]) _________p1 = (*(volatile typeof(nf_afinfo[family]) *)&(nf_afinfo[family])); do { } while(0); (_________p1); });
}

static inline __attribute__((always_inline)) __sum16
nf_checksum(struct sk_buff *skb, unsigned int hook, unsigned int dataoff,
     u_int8_t protocol, unsigned short family)
{
 const struct nf_afinfo *afinfo;
 __sum16 csum = 0;

 rcu_read_lock();
 afinfo = nf_get_afinfo(family);
 if (afinfo)
  csum = afinfo->checksum(skb, hook, dataoff, protocol);
 rcu_read_unlock();
 return csum;
}

static inline __attribute__((always_inline)) __sum16
nf_checksum_partial(struct sk_buff *skb, unsigned int hook,
      unsigned int dataoff, unsigned int len,
      u_int8_t protocol, unsigned short family)
{
 const struct nf_afinfo *afinfo;
 __sum16 csum = 0;

 rcu_read_lock();
 afinfo = nf_get_afinfo(family);
 if (afinfo)
  csum = afinfo->checksum_partial(skb, hook, dataoff, len,
      protocol);
 rcu_read_unlock();
 return csum;
}

extern int nf_register_afinfo(const struct nf_afinfo *afinfo);
extern void nf_unregister_afinfo(const struct nf_afinfo *afinfo);

# 1 "include/net/flow.h" 1
# 13 "include/net/flow.h"
struct flowi {
 int oif;
 int iif;
 __u32 mark;

 union {
  struct {
   __be32 daddr;
   __be32 saddr;
   __u8 tos;
   __u8 scope;
  } ip4_u;

  struct {
   struct in6_addr daddr;
   struct in6_addr saddr;
   __be32 flowlabel;
  } ip6_u;

  struct {
   __le16 daddr;
   __le16 saddr;
   __u8 scope;
  } dn_u;
 } nl_u;
# 49 "include/net/flow.h"
 __u8 proto;
 __u8 flags;

 union {
  struct {
   __be16 sport;
   __be16 dport;
  } ports;

  struct {
   __u8 type;
   __u8 code;
  } icmpt;

  struct {
   __le16 sport;
   __le16 dport;
  } dnports;

  __be32 spi;

  struct {
   __u8 type;
  } mht;
 } uli_u;






 __u32 secid;
} __attribute__((__aligned__(32/8)));





struct net;
struct sock;
struct flow_cache_ops;

struct flow_cache_object {
 const struct flow_cache_ops *ops;
};

struct flow_cache_ops {
 struct flow_cache_object *(*get)(struct flow_cache_object *);
 int (*check)(struct flow_cache_object *);
 void (*delete)(struct flow_cache_object *);
};

typedef struct flow_cache_object *(*flow_resolve_t)(
  struct net *net, struct flowi *key, u16 family,
  u8 dir, struct flow_cache_object *oldobj, void *ctx);

extern struct flow_cache_object *flow_cache_lookup(
  struct net *net, struct flowi *key, u16 family,
  u8 dir, flow_resolve_t resolver, void *ctx);

extern void flow_cache_flush(void);
extern atomic_t flow_cache_genid;

static inline __attribute__((always_inline)) int flow_cache_uli_match(struct flowi *fl1, struct flowi *fl2)
{
 return (fl1->proto == fl2->proto &&
  !memcmp(&fl1->uli_u, &fl2->uli_u, sizeof(fl1->uli_u)));
}
# 310 "include/linux/netfilter.h" 2
extern void (*ip_nat_decode_session)(struct sk_buff *, struct flowi *);

static inline __attribute__((always_inline)) void
nf_nat_decode_session(struct sk_buff *skb, struct flowi *fl, u_int8_t family)
{

 void (*decodefn)(struct sk_buff *, struct flowi *);

 if (family == 2) {
  rcu_read_lock();
  decodefn = ({ typeof(ip_nat_decode_session) _________p1 = (*(volatile typeof(ip_nat_decode_session) *)&(ip_nat_decode_session)); do { } while(0); (_________p1); });
  if (decodefn)
   decodefn(skb, fl);
  rcu_read_unlock();
 }

}



extern struct proc_dir_entry *proc_net_netfilter;
# 358 "include/linux/netfilter.h"
extern void (*ip_ct_attach)(struct sk_buff *, struct sk_buff *);
extern void nf_ct_attach(struct sk_buff *, struct sk_buff *);
extern void (*nf_ct_destroy)(struct nf_conntrack *);
# 6 "include/net/netns/x_tables.h" 2

struct ebt_table;

struct netns_xt {
 struct list_head tables[NFPROTO_NUMPROTO];


 struct ebt_table *broute_table;
 struct ebt_table *frame_filter;
 struct ebt_table *frame_nat;

};
# 19 "include/net/net_namespace.h" 2

# 1 "include/net/netns/conntrack.h" 1




# 1 "include/linux/list_nulls.h" 1
# 17 "include/linux/list_nulls.h"
struct hlist_nulls_head {
 struct hlist_nulls_node *first;
};

struct hlist_nulls_node {
 struct hlist_nulls_node *next, **pprev;
};
# 33 "include/linux/list_nulls.h"
static inline __attribute__((always_inline)) int is_a_nulls(const struct hlist_nulls_node *ptr)
{
 return ((unsigned long)ptr & 1);
}







static inline __attribute__((always_inline)) unsigned long get_nulls_value(const struct hlist_nulls_node *ptr)
{
 return ((unsigned long)ptr) >> 1;
}

static inline __attribute__((always_inline)) int hlist_nulls_unhashed(const struct hlist_nulls_node *h)
{
 return !h->pprev;
}

static inline __attribute__((always_inline)) int hlist_nulls_empty(const struct hlist_nulls_head *h)
{
 return is_a_nulls(h->first);
}

static inline __attribute__((always_inline)) void hlist_nulls_add_head(struct hlist_nulls_node *n,
     struct hlist_nulls_head *h)
{
 struct hlist_nulls_node *first = h->first;

 n->next = first;
 n->pprev = &h->first;
 h->first = n;
 if (!is_a_nulls(first))
  first->pprev = &n->next;
}

static inline __attribute__((always_inline)) void __hlist_nulls_del(struct hlist_nulls_node *n)
{
 struct hlist_nulls_node *next = n->next;
 struct hlist_nulls_node **pprev = n->pprev;
 *pprev = next;
 if (!is_a_nulls(next))
  next->pprev = pprev;
}

static inline __attribute__((always_inline)) void hlist_nulls_del(struct hlist_nulls_node *n)
{
 __hlist_nulls_del(n);
 n->pprev = ((void *) 0x00200200 + 0);
}
# 6 "include/net/netns/conntrack.h" 2


struct ctl_table_header;
struct nf_conntrack_ecache;

struct netns_ct {
 atomic_t count;
 unsigned int expect_count;
 unsigned int htable_size;
 struct kmem_cache *nf_conntrack_cachep;
 struct hlist_nulls_head *hash;
 struct hlist_head *expect_hash;
 struct hlist_nulls_head unconfirmed;
 struct hlist_nulls_head dying;
 struct ip_conntrack_stat *stat;
 int sysctl_events;
 unsigned int sysctl_events_retry_timeout;
 int sysctl_acct;
 int sysctl_checksum;
 unsigned int sysctl_log_invalid;

 struct ctl_table_header *sysctl_header;
 struct ctl_table_header *acct_sysctl_header;
 struct ctl_table_header *event_sysctl_header;

 int hash_vmalloc;
 int expect_vmalloc;
 char *slabname;
};
# 21 "include/net/net_namespace.h" 2

# 1 "include/net/netns/xfrm.h" 1






# 1 "include/linux/xfrm.h" 1
# 13 "include/linux/xfrm.h"
typedef union {
 __be32 a4;
 __be32 a6[4];
} xfrm_address_t;





struct xfrm_id {
 xfrm_address_t daddr;
 __be32 spi;
 __u8 proto;
};

struct xfrm_sec_ctx {
 __u8 ctx_doi;
 __u8 ctx_alg;
 __u16 ctx_len;
 __u32 ctx_sid;
 char ctx_str[0];
};
# 46 "include/linux/xfrm.h"
struct xfrm_selector {
 xfrm_address_t daddr;
 xfrm_address_t saddr;
 __be16 dport;
 __be16 dport_mask;
 __be16 sport;
 __be16 sport_mask;
 __u16 family;
 __u8 prefixlen_d;
 __u8 prefixlen_s;
 __u8 proto;
 int ifindex;
 __kernel_uid32_t user;
};



struct xfrm_lifetime_cfg {
 __u64 soft_byte_limit;
 __u64 hard_byte_limit;
 __u64 soft_packet_limit;
 __u64 hard_packet_limit;
 __u64 soft_add_expires_seconds;
 __u64 hard_add_expires_seconds;
 __u64 soft_use_expires_seconds;
 __u64 hard_use_expires_seconds;
};

struct xfrm_lifetime_cur {
 __u64 bytes;
 __u64 packets;
 __u64 add_time;
 __u64 use_time;
};

struct xfrm_replay_state {
 __u32 oseq;
 __u32 seq;
 __u32 bitmap;
};

struct xfrm_algo {
 char alg_name[64];
 unsigned int alg_key_len;
 char alg_key[0];
};

struct xfrm_algo_auth {
 char alg_name[64];
 unsigned int alg_key_len;
 unsigned int alg_trunc_len;
 char alg_key[0];
};

struct xfrm_algo_aead {
 char alg_name[64];
 unsigned int alg_key_len;
 unsigned int alg_icv_len;
 char alg_key[0];
};

struct xfrm_stats {
 __u32 replay_window;
 __u32 replay;
 __u32 integrity_failed;
};

enum {
 XFRM_POLICY_TYPE_MAIN = 0,
 XFRM_POLICY_TYPE_SUB = 1,
 XFRM_POLICY_TYPE_MAX = 2,
 XFRM_POLICY_TYPE_ANY = 255
};

enum {
 XFRM_POLICY_IN = 0,
 XFRM_POLICY_OUT = 1,
 XFRM_POLICY_FWD = 2,
 XFRM_POLICY_MASK = 3,
 XFRM_POLICY_MAX = 3
};

enum {
 XFRM_SHARE_ANY,
 XFRM_SHARE_SESSION,
 XFRM_SHARE_USER,
 XFRM_SHARE_UNIQUE
};
# 143 "include/linux/xfrm.h"
enum {
 XFRM_MSG_BASE = 0x10,

 XFRM_MSG_NEWSA = 0x10,

 XFRM_MSG_DELSA,

 XFRM_MSG_GETSA,


 XFRM_MSG_NEWPOLICY,

 XFRM_MSG_DELPOLICY,

 XFRM_MSG_GETPOLICY,


 XFRM_MSG_ALLOCSPI,

 XFRM_MSG_ACQUIRE,

 XFRM_MSG_EXPIRE,


 XFRM_MSG_UPDPOLICY,

 XFRM_MSG_UPDSA,


 XFRM_MSG_POLEXPIRE,


 XFRM_MSG_FLUSHSA,

 XFRM_MSG_FLUSHPOLICY,


 XFRM_MSG_NEWAE,

 XFRM_MSG_GETAE,


 XFRM_MSG_REPORT,


 XFRM_MSG_MIGRATE,


 XFRM_MSG_NEWSADINFO,

 XFRM_MSG_GETSADINFO,


 XFRM_MSG_NEWSPDINFO,

 XFRM_MSG_GETSPDINFO,


 XFRM_MSG_MAPPING,

 __XFRM_MSG_MAX
};
# 213 "include/linux/xfrm.h"
struct xfrm_user_sec_ctx {
 __u16 len;
 __u16 exttype;
 __u8 ctx_alg;
 __u8 ctx_doi;
 __u16 ctx_len;
};

struct xfrm_user_tmpl {
 struct xfrm_id id;
 __u16 family;
 xfrm_address_t saddr;
 __u32 reqid;
 __u8 mode;
 __u8 share;
 __u8 optional;
 __u32 aalgos;
 __u32 ealgos;
 __u32 calgos;
};

struct xfrm_encap_tmpl {
 __u16 encap_type;
 __be16 encap_sport;
 __be16 encap_dport;
 xfrm_address_t encap_oa;
};


enum xfrm_ae_ftype_t {
 XFRM_AE_UNSPEC,
 XFRM_AE_RTHR=1,
 XFRM_AE_RVAL=2,
 XFRM_AE_LVAL=4,
 XFRM_AE_ETHR=8,
 XFRM_AE_CR=16,
 XFRM_AE_CE=32,
 XFRM_AE_CU=64,
 __XFRM_AE_MAX


};

struct xfrm_userpolicy_type {
 __u8 type;
 __u16 reserved1;
 __u8 reserved2;
};


enum xfrm_attr_type_t {
 XFRMA_UNSPEC,
 XFRMA_ALG_AUTH,
 XFRMA_ALG_CRYPT,
 XFRMA_ALG_COMP,
 XFRMA_ENCAP,
 XFRMA_TMPL,
 XFRMA_SA,
 XFRMA_POLICY,
 XFRMA_SEC_CTX,
 XFRMA_LTIME_VAL,
 XFRMA_REPLAY_VAL,
 XFRMA_REPLAY_THRESH,
 XFRMA_ETIMER_THRESH,
 XFRMA_SRCADDR,
 XFRMA_COADDR,
 XFRMA_LASTUSED,
 XFRMA_POLICY_TYPE,
 XFRMA_MIGRATE,
 XFRMA_ALG_AEAD,
 XFRMA_KMADDRESS,
 XFRMA_ALG_AUTH_TRUNC,
 XFRMA_MARK,
 __XFRMA_MAX


};

struct xfrm_mark {
 __u32 v;
 __u32 m;
};

enum xfrm_sadattr_type_t {
 XFRMA_SAD_UNSPEC,
 XFRMA_SAD_CNT,
 XFRMA_SAD_HINFO,
 __XFRMA_SAD_MAX


};

struct xfrmu_sadhinfo {
 __u32 sadhcnt;
 __u32 sadhmcnt;
};

enum xfrm_spdattr_type_t {
 XFRMA_SPD_UNSPEC,
 XFRMA_SPD_INFO,
 XFRMA_SPD_HINFO,
 __XFRMA_SPD_MAX


};

struct xfrmu_spdinfo {
 __u32 incnt;
 __u32 outcnt;
 __u32 fwdcnt;
 __u32 inscnt;
 __u32 outscnt;
 __u32 fwdscnt;
};

struct xfrmu_spdhinfo {
 __u32 spdhcnt;
 __u32 spdhmcnt;
};

struct xfrm_usersa_info {
 struct xfrm_selector sel;
 struct xfrm_id id;
 xfrm_address_t saddr;
 struct xfrm_lifetime_cfg lft;
 struct xfrm_lifetime_cur curlft;
 struct xfrm_stats stats;
 __u32 seq;
 __u32 reqid;
 __u16 family;
 __u8 mode;
 __u8 replay_window;
 __u8 flags;






};

struct xfrm_usersa_id {
 xfrm_address_t daddr;
 __be32 spi;
 __u16 family;
 __u8 proto;
};

struct xfrm_aevent_id {
 struct xfrm_usersa_id sa_id;
 xfrm_address_t saddr;
 __u32 flags;
 __u32 reqid;
};

struct xfrm_userspi_info {
 struct xfrm_usersa_info info;
 __u32 min;
 __u32 max;
};

struct xfrm_userpolicy_info {
 struct xfrm_selector sel;
 struct xfrm_lifetime_cfg lft;
 struct xfrm_lifetime_cur curlft;
 __u32 priority;
 __u32 index;
 __u8 dir;
 __u8 action;


 __u8 flags;



 __u8 share;
};

struct xfrm_userpolicy_id {
 struct xfrm_selector sel;
 __u32 index;
 __u8 dir;
};

struct xfrm_user_acquire {
 struct xfrm_id id;
 xfrm_address_t saddr;
 struct xfrm_selector sel;
 struct xfrm_userpolicy_info policy;
 __u32 aalgos;
 __u32 ealgos;
 __u32 calgos;
 __u32 seq;
};

struct xfrm_user_expire {
 struct xfrm_usersa_info state;
 __u8 hard;
};

struct xfrm_user_polexpire {
 struct xfrm_userpolicy_info pol;
 __u8 hard;
};

struct xfrm_usersa_flush {
 __u8 proto;
};

struct xfrm_user_report {
 __u8 proto;
 struct xfrm_selector sel;
};



struct xfrm_user_kmaddress {
 xfrm_address_t local;
 xfrm_address_t remote;
 __u32 reserved;
 __u16 family;
};

struct xfrm_user_migrate {
 xfrm_address_t old_daddr;
 xfrm_address_t old_saddr;
 xfrm_address_t new_daddr;
 xfrm_address_t new_saddr;
 __u8 proto;
 __u8 mode;
 __u16 reserved;
 __u32 reqid;
 __u16 old_family;
 __u16 new_family;
};

struct xfrm_user_mapping {
 struct xfrm_usersa_id id;
 __u32 reqid;
 xfrm_address_t old_saddr;
 xfrm_address_t new_saddr;
 __be16 old_sport;
 __be16 new_sport;
};
# 467 "include/linux/xfrm.h"
enum xfrm_nlgroups {
 XFRMNLGRP_NONE,

 XFRMNLGRP_ACQUIRE,

 XFRMNLGRP_EXPIRE,

 XFRMNLGRP_SA,

 XFRMNLGRP_POLICY,

 XFRMNLGRP_AEVENTS,

 XFRMNLGRP_REPORT,

 XFRMNLGRP_MIGRATE,

 XFRMNLGRP_MAPPING,

 __XFRMNLGRP_MAX
};
# 8 "include/net/netns/xfrm.h" 2


struct ctl_table_header;

struct xfrm_policy_hash {
 struct hlist_head *table;
 unsigned int hmask;
};

struct netns_xfrm {
 struct list_head state_all;
# 27 "include/net/netns/xfrm.h"
 struct hlist_head *state_bydst;
 struct hlist_head *state_bysrc;
 struct hlist_head *state_byspi;
 unsigned int state_hmask;
 unsigned int state_num;
 struct work_struct state_hash_work;
 struct hlist_head state_gc_list;
 struct work_struct state_gc_work;

 wait_queue_head_t km_waitq;

 struct list_head policy_all;
 struct hlist_head *policy_byidx;
 unsigned int policy_idx_hmask;
 struct hlist_head policy_inexact[XFRM_POLICY_MAX * 2];
 struct xfrm_policy_hash policy_bydst[XFRM_POLICY_MAX * 2];
 unsigned int policy_count[XFRM_POLICY_MAX * 2];
 struct work_struct policy_hash_work;

 struct dst_ops xfrm4_dst_ops;

 struct dst_ops xfrm6_dst_ops;


 struct sock *nlsk;
 struct sock *nlsk_stash;

 u32 sysctl_aevent_etime;
 u32 sysctl_aevent_rseqth;
 int sysctl_larval_drop;
 u32 sysctl_acq_expires;

 struct ctl_table_header *sysctl_hdr;

};
# 23 "include/net/net_namespace.h" 2

struct proc_dir_entry;
struct net_device;
struct sock;
struct ctl_table_header;
struct net_generic;
struct sock;





struct net {
 atomic_t count;







 struct list_head list;
 struct list_head cleanup_list;
 struct list_head exit_list;

 struct proc_dir_entry *proc_net;
 struct proc_dir_entry *proc_net_stat;


 struct ctl_table_set sysctls;


 struct net_device *loopback_dev;

 struct list_head dev_base_head;
 struct hlist_head *dev_name_head;
 struct hlist_head *dev_index_head;


 struct list_head rules_ops;
 spinlock_t rules_mod_lock;

 struct sock *rtnl;
 struct sock *genl_sock;

 struct netns_core core;
 struct netns_mib mib;
 struct netns_packet packet;
 struct netns_unix unx;
 struct netns_ipv4 ipv4;

 struct netns_ipv6 ipv6;





 struct netns_xt xt;

 struct netns_ct ct;

 struct sock *nfnl;
 struct sock *nfnl_stash;


 struct netns_xfrm xfrm;


 struct sk_buff_head wext_nlevents;

 struct net_generic *gen;
};


# 1 "include/linux/seq_file_net.h" 1



# 1 "include/linux/seq_file.h" 1
# 10 "include/linux/seq_file.h"
struct seq_operations;
struct file;
struct path;
struct inode;
struct dentry;

struct seq_file {
 char *buf;
 size_t size;
 size_t from;
 size_t count;
 loff_t index;
 loff_t read_pos;
 u64 version;
 struct mutex lock;
 const struct seq_operations *op;
 void *private;
};

struct seq_operations {
 void * (*start) (struct seq_file *m, loff_t *pos);
 void (*stop) (struct seq_file *m, void *v);
 void * (*next) (struct seq_file *m, void *v, loff_t *pos);
 int (*show) (struct seq_file *m, void *v);
};
# 46 "include/linux/seq_file.h"
static inline __attribute__((always_inline)) size_t seq_get_buf(struct seq_file *m, char **bufp)
{
 __BUG_ON((unsigned long)(m->count > m->size));
 if (m->count < m->size)
  *bufp = m->buf + m->count;
 else
  *bufp = ((void *)0);

 return m->size - m->count;
}
# 66 "include/linux/seq_file.h"
static inline __attribute__((always_inline)) void seq_commit(struct seq_file *m, int num)
{
 if (num < 0) {
  m->count = m->size;
 } else {
  __BUG_ON((unsigned long)(m->count + num > m->size));
  m->count += num;
 }
}

char *mangle_path(char *s, char *p, char *esc);
int seq_open(struct file *, const struct seq_operations *);
ssize_t seq_read(struct file *, char *, size_t, loff_t *);
loff_t seq_lseek(struct file *, loff_t, int);
int seq_release(struct inode *, struct file *);
int seq_escape(struct seq_file *, const char *, const char *);
int seq_putc(struct seq_file *m, char c);
int seq_puts(struct seq_file *m, const char *s);
int seq_write(struct seq_file *seq, const void *data, size_t len);

int seq_printf(struct seq_file *, const char *, ...)
 __attribute__ ((format (printf,2,3)));

int seq_path(struct seq_file *, struct path *, char *);
int seq_dentry(struct seq_file *, struct dentry *, char *);
int seq_path_root(struct seq_file *m, struct path *path, struct path *root,
    char *esc);
int seq_bitmap(struct seq_file *m, const unsigned long *bits,
       unsigned int nr_bits);
static inline __attribute__((always_inline)) int seq_cpumask(struct seq_file *m, const struct cpumask *mask)
{
 return seq_bitmap(m, ((mask)->bits), nr_cpu_ids);
}

static inline __attribute__((always_inline)) int seq_nodemask(struct seq_file *m, nodemask_t *mask)
{
 return seq_bitmap(m, mask->bits, (1 << 0));
}

int seq_bitmap_list(struct seq_file *m, const unsigned long *bits,
  unsigned int nr_bits);

static inline __attribute__((always_inline)) int seq_cpumask_list(struct seq_file *m,
       const struct cpumask *mask)
{
 return seq_bitmap_list(m, ((mask)->bits), nr_cpu_ids);
}

static inline __attribute__((always_inline)) int seq_nodemask_list(struct seq_file *m, nodemask_t *mask)
{
 return seq_bitmap_list(m, mask->bits, (1 << 0));
}

int single_open(struct file *, int (*)(struct seq_file *, void *), void *);
int single_release(struct inode *, struct file *);
void *__seq_open_private(struct file *, const struct seq_operations *, int);
int seq_open_private(struct file *, const struct seq_operations *, int);
int seq_release_private(struct inode *, struct file *);







extern struct list_head *seq_list_start(struct list_head *head,
  loff_t pos);
extern struct list_head *seq_list_start_head(struct list_head *head,
  loff_t pos);
extern struct list_head *seq_list_next(void *v, struct list_head *head,
  loff_t *ppos);





extern struct hlist_node *seq_hlist_start(struct hlist_head *head,
       loff_t pos);
extern struct hlist_node *seq_hlist_start_head(struct hlist_head *head,
            loff_t pos);
extern struct hlist_node *seq_hlist_next(void *v, struct hlist_head *head,
      loff_t *ppos);

extern struct hlist_node *seq_hlist_start_rcu(struct hlist_head *head,
           loff_t pos);
extern struct hlist_node *seq_hlist_start_head_rcu(struct hlist_head *head,
         loff_t pos);
extern struct hlist_node *seq_hlist_next_rcu(void *v,
         struct hlist_head *head,
         loff_t *ppos);
# 5 "include/linux/seq_file_net.h" 2

struct net;
extern struct net init_net;

struct seq_net_private {



};

int seq_open_net(struct inode *, struct file *,
   const struct seq_operations *, int);
int single_open_net(struct inode *, struct file *file,
  int (*show)(struct seq_file *, void *));
int seq_release_net(struct inode *, struct file *);
int single_release_net(struct inode *, struct file *);
static inline __attribute__((always_inline)) struct net *seq_file_net(struct seq_file *seq)
{



 return &init_net;

}
# 98 "include/net/net_namespace.h" 2


extern struct net init_net;


extern struct net *copy_net_ns(unsigned long flags, struct net *net_ns);
# 114 "include/net/net_namespace.h"
extern struct list_head net_namespace_list;

extern struct net *get_net_ns_by_pid(pid_t pid);
# 152 "include/net/net_namespace.h"
static inline __attribute__((always_inline)) struct net *get_net(struct net *net)
{
 return net;
}

static inline __attribute__((always_inline)) void put_net(struct net *net)
{
}

static inline __attribute__((always_inline)) struct net *maybe_get_net(struct net *net)
{
 return net;
}

static inline __attribute__((always_inline))
int net_eq(const struct net *net1, const struct net *net2)
{
 return 1;
}
# 188 "include/net/net_namespace.h"
static inline __attribute__((always_inline)) struct net *hold_net(struct net *net)
{
 return net;
}

static inline __attribute__((always_inline)) void release_net(struct net *net)
{
}
# 233 "include/net/net_namespace.h"
struct pernet_operations {
 struct list_head list;
 int (*init)(struct net *net);
 void (*exit)(struct net *net);
 void (*exit_batch)(struct list_head *net_exit_list);
 int *id;
 size_t size;
};
# 261 "include/net/net_namespace.h"
extern int register_pernet_subsys(struct pernet_operations *);
extern void unregister_pernet_subsys(struct pernet_operations *);
extern int register_pernet_device(struct pernet_operations *);
extern void unregister_pernet_device(struct pernet_operations *);

struct ctl_path;
struct ctl_table;
struct ctl_table_header;

extern struct ctl_table_header *register_net_sysctl_table(struct net *net,
 const struct ctl_path *path, struct ctl_table *table);
extern struct ctl_table_header *register_net_sysctl_rotable(
 const struct ctl_path *path, struct ctl_table *table);
extern void unregister_net_sysctl_table(struct ctl_table_header *header);
# 50 "include/linux/netdevice.h" 2
# 1 "include/net/dsa.h" 1
# 17 "include/net/dsa.h"
struct dsa_chip_data {



 struct device *mii_bus;
 int sw_addr;
# 31 "include/net/dsa.h"
 char *port_names[12];







 s8 *rtable;
};

struct dsa_platform_data {




 struct device *netdev;





 int nr_chips;
 struct dsa_chip_data *chip;
};

extern int dsa_uses_dsa_tags(void *dsa_ptr);
extern int dsa_uses_trailer_tags(void *dsa_ptr);
# 51 "include/linux/netdevice.h" 2




struct vlan_group;
struct netpoll_info;
struct phy_device;

struct wireless_dev;
# 111 "include/linux/netdevice.h"
enum netdev_tx {
 __NETDEV_TX_MIN = (-((int)(~0U>>1)) - 1),
 NETDEV_TX_OK = 0x00,
 NETDEV_TX_BUSY = 0x10,
 NETDEV_TX_LOCKED = 0x20,
};
typedef enum netdev_tx netdev_tx_t;





static inline __attribute__((always_inline)) int dev_xmit_complete(int rc)
{






 if (__builtin_expect(!!(rc < 0x0f), 1))
  return true;

 return false;
}
# 173 "include/linux/netdevice.h"
struct net_device_stats {
 unsigned long rx_packets;
 unsigned long tx_packets;
 unsigned long rx_bytes;
 unsigned long tx_bytes;
 unsigned long rx_errors;
 unsigned long tx_errors;
 unsigned long rx_dropped;
 unsigned long tx_dropped;
 unsigned long multicast;
 unsigned long collisions;
 unsigned long rx_length_errors;
 unsigned long rx_over_errors;
 unsigned long rx_crc_errors;
 unsigned long rx_frame_errors;
 unsigned long rx_fifo_errors;
 unsigned long rx_missed_errors;
 unsigned long tx_aborted_errors;
 unsigned long tx_carrier_errors;
 unsigned long tx_fifo_errors;
 unsigned long tx_heartbeat_errors;
 unsigned long tx_window_errors;
 unsigned long rx_compressed;
 unsigned long tx_compressed;
};
# 208 "include/linux/netdevice.h"
enum {
        IF_PORT_UNKNOWN = 0,
        IF_PORT_10BASE2,
        IF_PORT_10BASET,
        IF_PORT_AUI,
        IF_PORT_100BASET,
        IF_PORT_100BASETX,
        IF_PORT_100BASEFX
};






struct neighbour;
struct neigh_parms;
struct sk_buff;

struct netdev_hw_addr {
 struct list_head list;
 unsigned char addr[32];
 unsigned char type;





 int refcount;
 int synced;
 int global_use;
 struct rcu_head rcu_head;
};

struct netdev_hw_addr_list {
 struct list_head list;
 int count;
};
# 262 "include/linux/netdevice.h"
struct hh_cache {
 struct hh_cache *hh_next;
 atomic_t hh_refcnt;






 __be16 hh_type __attribute__((__aligned__((1 << 5))));




 u16 hh_len;
 int (*hh_output)(struct sk_buff *skb);
 seqlock_t hh_lock;







 unsigned long hh_data[(((96)+(16 -1))&~(16 - 1)) / sizeof(long)];
};
# 307 "include/linux/netdevice.h"
struct header_ops {
 int (*create) (struct sk_buff *skb, struct net_device *dev,
      unsigned short type, const void *daddr,
      const void *saddr, unsigned len);
 int (*parse)(const struct sk_buff *skb, unsigned char *haddr);
 int (*rebuild)(struct sk_buff *skb);

 int (*cache)(const struct neighbour *neigh, struct hh_cache *hh);
 void (*cache_update)(struct hh_cache *hh,
    const struct net_device *dev,
    const unsigned char *haddr);
};






enum netdev_state_t {
 __LINK_STATE_START,
 __LINK_STATE_PRESENT,
 __LINK_STATE_NOCARRIER,
 __LINK_STATE_LINKWATCH_PENDING,
 __LINK_STATE_DORMANT,
};






struct netdev_boot_setup {
 char name[16];
 struct ifmap map;
};


extern int __attribute__ ((__section__(".init.text"))) __attribute__((__cold__)) __attribute__((no_instrument_function)) netdev_boot_setup(char *str);




struct napi_struct {






 struct list_head poll_list;

 unsigned long state;
 int weight;
 int (*poll)(struct napi_struct *, int);





 unsigned int gro_count;

 struct net_device *dev;
 struct list_head dev_list;
 struct sk_buff *gro_list;
 struct sk_buff *skb;
};

enum {
 NAPI_STATE_SCHED,
 NAPI_STATE_DISABLE,
 NAPI_STATE_NPSVC,
};

enum gro_result {
 GRO_MERGED,
 GRO_MERGED_FREE,
 GRO_HELD,
 GRO_NORMAL,
 GRO_DROP,
};
typedef enum gro_result gro_result_t;

typedef struct sk_buff *rx_handler_func_t(struct sk_buff *skb);

extern void __napi_schedule(struct napi_struct *n);

static inline __attribute__((always_inline)) int napi_disable_pending(struct napi_struct *n)
{
 return test_bit(NAPI_STATE_DISABLE, &n->state);
}
# 407 "include/linux/netdevice.h"
static inline __attribute__((always_inline)) int napi_schedule_prep(struct napi_struct *n)
{
 return !napi_disable_pending(n) &&
  !test_and_set_bit(NAPI_STATE_SCHED, &n->state);
}
# 420 "include/linux/netdevice.h"
static inline __attribute__((always_inline)) void napi_schedule(struct napi_struct *n)
{
 if (napi_schedule_prep(n))
  __napi_schedule(n);
}


static inline __attribute__((always_inline)) int napi_reschedule(struct napi_struct *napi)
{
 if (napi_schedule_prep(napi)) {
  __napi_schedule(napi);
  return 1;
 }
 return 0;
}







extern void __napi_complete(struct napi_struct *n);
extern void napi_complete(struct napi_struct *n);
# 452 "include/linux/netdevice.h"
static inline __attribute__((always_inline)) void napi_disable(struct napi_struct *n)
{
 set_bit(NAPI_STATE_DISABLE, &n->state);
 while (test_and_set_bit(NAPI_STATE_SCHED, &n->state))
  msleep(1);
 clear_bit(NAPI_STATE_DISABLE, &n->state);
}
# 467 "include/linux/netdevice.h"
static inline __attribute__((always_inline)) void napi_enable(struct napi_struct *n)
{
 __BUG_ON((unsigned long)(!test_bit(NAPI_STATE_SCHED, &n->state)));
 __asm__ __volatile__("		\n" : : :"memory");
 clear_bit(NAPI_STATE_SCHED, &n->state);
}
# 483 "include/linux/netdevice.h"
static inline __attribute__((always_inline)) void napi_synchronize(const struct napi_struct *n)
{
 while (test_bit(NAPI_STATE_SCHED, &n->state))
  msleep(1);
}




enum netdev_queue_state_t {
 __QUEUE_STATE_XOFF,
 __QUEUE_STATE_FROZEN,
};

struct netdev_queue {



 struct net_device *dev;
 struct Qdisc *qdisc;
 unsigned long state;
 struct Qdisc *qdisc_sleeping;



 spinlock_t _xmit_lock __attribute__((__aligned__((1 << 5))));
 int xmit_lock_owner;



 unsigned long trans_start;
 u64 tx_bytes;
 u64 tx_packets;
 u64 tx_dropped;
} __attribute__((__aligned__((1 << 5))));
# 711 "include/linux/netdevice.h"
struct net_device_ops {
 int (*ndo_init)(struct net_device *dev);
 void (*ndo_uninit)(struct net_device *dev);
 int (*ndo_open)(struct net_device *dev);
 int (*ndo_stop)(struct net_device *dev);
 netdev_tx_t (*ndo_start_xmit) (struct sk_buff *skb,
         struct net_device *dev);
 u16 (*ndo_select_queue)(struct net_device *dev,
          struct sk_buff *skb);
 void (*ndo_change_rx_flags)(struct net_device *dev,
             int flags);
 void (*ndo_set_rx_mode)(struct net_device *dev);
 void (*ndo_set_multicast_list)(struct net_device *dev);
 int (*ndo_set_mac_address)(struct net_device *dev,
             void *addr);
 int (*ndo_validate_addr)(struct net_device *dev);
 int (*ndo_do_ioctl)(struct net_device *dev,
             struct ifreq *ifr, int cmd);
 int (*ndo_set_config)(struct net_device *dev,
               struct ifmap *map);
 int (*ndo_change_mtu)(struct net_device *dev,
        int new_mtu);
 int (*ndo_neigh_setup)(struct net_device *dev,
         struct neigh_parms *);
 void (*ndo_tx_timeout) (struct net_device *dev);

 struct rtnl_link_stats64* (*ndo_get_stats64)(struct net_device *dev,
           struct rtnl_link_stats64 *storage);
 struct net_device_stats* (*ndo_get_stats)(struct net_device *dev);

 void (*ndo_vlan_rx_register)(struct net_device *dev,
              struct vlan_group *grp);
 void (*ndo_vlan_rx_add_vid)(struct net_device *dev,
             unsigned short vid);
 void (*ndo_vlan_rx_kill_vid)(struct net_device *dev,
              unsigned short vid);






 int (*ndo_set_vf_mac)(struct net_device *dev,
        int queue, u8 *mac);
 int (*ndo_set_vf_vlan)(struct net_device *dev,
         int queue, u16 vlan, u8 qos);
 int (*ndo_set_vf_tx_rate)(struct net_device *dev,
            int vf, int rate);
 int (*ndo_get_vf_config)(struct net_device *dev,
           int vf,
           struct ifla_vf_info *ivf);
 int (*ndo_set_vf_port)(struct net_device *dev,
         int vf,
         struct nlattr *port[]);
 int (*ndo_get_vf_port)(struct net_device *dev,
         int vf, struct sk_buff *skb);
# 781 "include/linux/netdevice.h"
};
# 793 "include/linux/netdevice.h"
struct net_device {






 char name[16];

 struct pm_qos_request_list pm_qos_req;


 struct hlist_node name_hlist;

 char *ifalias;





 unsigned long mem_end;
 unsigned long mem_start;
 unsigned long base_addr;
 unsigned int irq;






 unsigned char if_port;
 unsigned char dma;

 unsigned long state;

 struct list_head dev_list;
 struct list_head napi_list;
 struct list_head unreg_list;


 unsigned long features;
# 888 "include/linux/netdevice.h"
 int ifindex;
 int iflink;

 struct net_device_stats stats;




 const struct iw_handler_def * wireless_handlers;

 struct iw_public_data * wireless_data;


 const struct net_device_ops *netdev_ops;
 const struct ethtool_ops *ethtool_ops;


 const struct header_ops *header_ops;

 unsigned int flags;
 unsigned short gflags;

 unsigned int priv_flags;



 unsigned short padded;

 unsigned char operstate;
 unsigned char link_mode;

 unsigned int mtu;
 unsigned short type;
 unsigned short hard_header_len;





 unsigned short needed_headroom;
 unsigned short needed_tailroom;

 struct net_device *master;




 unsigned char perm_addr[32];
 unsigned char addr_assign_type;
 unsigned char addr_len;
 unsigned short dev_id;

 spinlock_t addr_list_lock;
 struct netdev_hw_addr_list uc;
 struct netdev_hw_addr_list mc;
 int uc_promisc;
 unsigned int promiscuity;
 unsigned int allmulti;







 void *atalk_ptr;
 void *ip_ptr;
 void *dn_ptr;
 void *ip6_ptr;
 void *ec_ptr;
 void *ax25_ptr;
 struct wireless_dev *ieee80211_ptr;





 unsigned long last_rx;

 unsigned char *dev_addr;



 struct netdev_hw_addr_list dev_addrs;


 unsigned char broadcast[32];
# 985 "include/linux/netdevice.h"
 struct netdev_queue rx_queue;
 rx_handler_func_t *rx_handler;
 void *rx_handler_data;

 struct netdev_queue *_tx __attribute__((__aligned__((1 << 5))));


 unsigned int num_tx_queues;


 unsigned int real_num_tx_queues;


 struct Qdisc *qdisc;

 unsigned long tx_queue_len;
 spinlock_t tx_global_lock;
# 1011 "include/linux/netdevice.h"
 unsigned long trans_start;

 int watchdog_timeo;
 struct timer_list watchdog_timer;


 atomic_t refcnt __attribute__((__aligned__((1 << 5))));


 struct list_head todo_list;

 struct hlist_node index_hlist;

 struct list_head link_watch_list;


 enum { NETREG_UNINITIALIZED=0,
        NETREG_REGISTERED,
        NETREG_UNREGISTERING,
        NETREG_UNREGISTERED,
        NETREG_RELEASED,
        NETREG_DUMMY,
 } reg_state:16;

 enum {
  RTNL_LINK_INITIALIZED,
  RTNL_LINK_INITIALIZING,
 } rtnl_link_state:16;


 void (*destructor)(struct net_device *dev);
# 1053 "include/linux/netdevice.h"
 void *ml_priv;


 struct garp_port *garp_port;


 struct device dev;

 const struct attribute_group *sysfs_groups[4];


 const struct rtnl_link_ops *rtnl_link_ops;


 unsigned long vlan_features;



 unsigned int gso_max_size;
# 1083 "include/linux/netdevice.h"
 struct ethtool_rx_ntuple_list ethtool_ntuple_list;


 struct phy_device *phydev;
};




static inline __attribute__((always_inline))
struct netdev_queue *netdev_get_tx_queue(const struct net_device *dev,
      unsigned int index)
{
 return &dev->_tx[index];
}

static inline __attribute__((always_inline)) void netdev_for_each_tx_queue(struct net_device *dev,
         void (*f)(struct net_device *,
            struct netdev_queue *,
            void *),
         void *arg)
{
 unsigned int i;

 for (i = 0; i < dev->num_tx_queues; i++)
  f(dev, &dev->_tx[i], arg);
}




static inline __attribute__((always_inline))
struct net *dev_net(const struct net_device *dev)
{
 return (&init_net);
}

static inline __attribute__((always_inline))
void dev_net_set(struct net_device *dev, struct net *net)
{




}

static inline __attribute__((always_inline)) int netdev_uses_dsa_tags(struct net_device *dev)
{





 return 0;
}


static inline __attribute__((always_inline)) void skb_set_dev(struct sk_buff *skb, struct net_device *dev)
{
 skb->dev = dev;
}




static inline __attribute__((always_inline)) int netdev_uses_trailer_tags(struct net_device *dev)
{





 return 0;
}







static inline __attribute__((always_inline)) void *netdev_priv(const struct net_device *dev)
{
 return (char *)dev + ((((sizeof(struct net_device))) + ((typeof((sizeof(struct net_device))))((32)) - 1)) & ~((typeof((sizeof(struct net_device))))((32)) - 1));
}
# 1191 "include/linux/netdevice.h"
void netif_napi_add(struct net_device *dev, struct napi_struct *napi,
      int (*poll)(struct napi_struct *, int), int weight);







void netif_napi_del(struct napi_struct *napi);

struct napi_gro_cb {

 void *frag0;


 unsigned int frag0_len;


 int data_offset;


 int same_flow;


 int flush;


 int count;


 int free;
};



struct packet_type {
 __be16 type;
 struct net_device *dev;
 int (*func) (struct sk_buff *,
      struct net_device *,
      struct packet_type *,
      struct net_device *);
 struct sk_buff *(*gso_segment)(struct sk_buff *skb,
      int features);
 int (*gso_send_check)(struct sk_buff *skb);
 struct sk_buff **(*gro_receive)(struct sk_buff **head,
            struct sk_buff *skb);
 int (*gro_complete)(struct sk_buff *skb);
 void *af_packet_priv;
 struct list_head list;
};

# 1 "include/linux/interrupt.h" 1
# 10 "include/linux/interrupt.h"
# 1 "include/linux/irqreturn.h" 1
# 10 "include/linux/irqreturn.h"
enum irqreturn {
 IRQ_NONE,
 IRQ_HANDLED,
 IRQ_WAKE_THREAD,
};

typedef enum irqreturn irqreturn_t;
# 11 "include/linux/interrupt.h" 2

# 1 "include/linux/hardirq.h" 1
# 9 "include/linux/hardirq.h"
# 1 "include/linux/ftrace_irq.h" 1
# 9 "include/linux/ftrace_irq.h"
static inline __attribute__((always_inline)) void ftrace_nmi_enter(void) { }
static inline __attribute__((always_inline)) void ftrace_nmi_exit(void) { }
# 10 "include/linux/hardirq.h" 2
# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/hardirq.h" 1
# 13 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/hardirq.h"
extern void ack_bad_irq(unsigned int irq);


# 1 "include/asm-generic/hardirq.h" 1





# 1 "include/linux/irq.h" 1
# 27 "include/linux/irq.h"
# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/irq.h" 1
# 15 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/irq.h"
# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/mipsmtregs.h" 1
# 168 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/mipsmtregs.h"
static inline __attribute__((always_inline)) unsigned int dvpe(void)
{
 int res = 0;

 __asm__ __volatile__(
 "	.set	push						\n"
 "	.set	noreorder					\n"
 "	.set	noat						\n"
 "	.set	mips32r2					\n"
 "	.word	0x41610001		# dvpe $1		\n"
 "	move	%0, $1						\n"
 "	ehb							\n"
 "	.set	pop						\n"
 : "=r" (res));

 do { unsigned long tmp; __asm__ __volatile__( "	.set	mips64r2				\n" "	dla	%0, 1f					\n" "	jr.hb	%0					\n" "	.set	mips0					\n" "1:							\n" : "=r" (tmp)); } while (0);

 return res;
}

static inline __attribute__((always_inline)) void __raw_evpe(void)
{
 __asm__ __volatile__(
 "	.set	push						\n"
 "	.set	noreorder					\n"
 "	.set	noat						\n"
 "	.set	mips32r2					\n"
 "	.word	0x41600021		# evpe			\n"
 "	ehb							\n"
 "	.set	pop						\n");
}






static inline __attribute__((always_inline)) void evpe(int previous)
{
 if ((previous & ((unsigned long)(1))))
  __raw_evpe();
}

static inline __attribute__((always_inline)) unsigned int dmt(void)
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

static inline __attribute__((always_inline)) void __raw_emt(void)
{
 __asm__ __volatile__(
 "	.set	noreorder					\n"
 "	.set	mips32r2					\n"
 "	.word	0x41600be1			# emt		\n"
 "	ehb							\n"
 "	.set	mips0						\n"
 "	.set	reorder");
}






static inline __attribute__((always_inline)) void emt(int previous)
{
 if ((previous & ((unsigned long)(1) << 15)))
  __raw_emt();
}

static inline __attribute__((always_inline)) void ehb(void)
{
 __asm__ __volatile__(
 "	.set	mips32r2				\n"
 "	ehb						\n"
 "	.set	mips0					\n");
}
# 391 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/mipsmtregs.h"
static inline __attribute__((always_inline)) unsigned int set_c0_mvpcontrol(unsigned int set) { unsigned int res; unsigned int new; unsigned int omt; unsigned long flags; do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); __asm__ __volatile__( "raw_local_irq_save\t%0" : "=r" (flags) : : "memory"); do { } while (0); } while (0); omt = __dmt(); res = ({ int __res; if (1 == 0) __asm__ __volatile__( "mfc0\t%0, " "$0" "\n\t" : "=r" (__res)); else __asm__ __volatile__( ".set\tmips32\n\t" "mfc0\t%0, " "$0" ", " "1" "\n\t" ".set\tmips0\n\t" : "=r" (__res)); __res; }); new = res | set; do { if (1 == 0) __asm__ __volatile__( "mtc0\t%z0, " "$0" "\n\t" : : "Jr" ((unsigned int)(new))); else __asm__ __volatile__( ".set\tmips32\n\t" "mtc0\t%z0, " "$0" ", " "1" "\n\t" ".set\tmips0" : : "Jr" ((unsigned int)(new))); } while (0); __emt(omt); do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); if (raw_irqs_disabled_flags(flags)) { raw_local_irq_restore(flags); do { } while (0); } else { do { } while (0); raw_local_irq_restore(flags); } } while (0); return res; } static inline __attribute__((always_inline)) unsigned int clear_c0_mvpcontrol(unsigned int clear) { unsigned int res; unsigned int new; unsigned int omt; unsigned long flags; do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); __asm__ __volatile__( "raw_local_irq_save\t%0" : "=r" (flags) : : "memory"); do { } while (0); } while (0); omt = __dmt(); res = ({ int __res; if (1 == 0) __asm__ __volatile__( "mfc0\t%0, " "$0" "\n\t" : "=r" (__res)); else __asm__ __volatile__( ".set\tmips32\n\t" "mfc0\t%0, " "$0" ", " "1" "\n\t" ".set\tmips0\n\t" : "=r" (__res)); __res; }); new = res & ~clear; do { if (1 == 0) __asm__ __volatile__( "mtc0\t%z0, " "$0" "\n\t" : : "Jr" ((unsigned int)(new))); else __asm__ __volatile__( ".set\tmips32\n\t" "mtc0\t%z0, " "$0" ", " "1" "\n\t" ".set\tmips0" : : "Jr" ((unsigned int)(new))); } while (0); __emt(omt); do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); if (raw_irqs_disabled_flags(flags)) { raw_local_irq_restore(flags); do { } while (0); } else { do { } while (0); raw_local_irq_restore(flags); } } while (0); return res; } static inline __attribute__((always_inline)) unsigned int change_c0_mvpcontrol(unsigned int change, unsigned int newbits) { unsigned int res; unsigned int new; unsigned int omt; unsigned long flags; do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); __asm__ __volatile__( "raw_local_irq_save\t%0" : "=r" (flags) : : "memory"); do { } while (0); } while (0); omt = __dmt(); res = ({ int __res; if (1 == 0) __asm__ __volatile__( "mfc0\t%0, " "$0" "\n\t" : "=r" (__res)); else __asm__ __volatile__( ".set\tmips32\n\t" "mfc0\t%0, " "$0" ", " "1" "\n\t" ".set\tmips0\n\t" : "=r" (__res)); __res; }); new = res & ~change; new |= (newbits & change); do { if (1 == 0) __asm__ __volatile__( "mtc0\t%z0, " "$0" "\n\t" : : "Jr" ((unsigned int)(new))); else __asm__ __volatile__( ".set\tmips32\n\t" "mtc0\t%z0, " "$0" ", " "1" "\n\t" ".set\tmips0" : : "Jr" ((unsigned int)(new))); } while (0); __emt(omt); do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); if (raw_irqs_disabled_flags(flags)) { raw_local_irq_restore(flags); do { } while (0); } else { do { } while (0); raw_local_irq_restore(flags); } } while (0); return res; }
# 16 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/irq.h" 2

# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/tc3162/irq.h" 1
# 11 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/tc3162/irq.h"
# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/mach-generic/irq.h" 1
# 12 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/tc3162/irq.h" 2
# 18 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/irq.h" 2
# 30 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/irq.h"
struct irqaction;

extern unsigned long irq_hwmask[];
extern int setup_irq_smtc(unsigned int irq, struct irqaction * new,
                          unsigned long hwmask);

static inline __attribute__((always_inline)) void smtc_im_ack_irq(unsigned int irq)
{
 if (irq_hwmask[irq] & 0x0000ff00)
  set_c0_status(irq_hwmask[irq] & 0x0000ff00);
}
# 53 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/irq.h"
extern int plat_set_irq_affinity(unsigned int irq,
      const struct cpumask *affinity);
extern void smtc_forward_irq(unsigned int irq);
# 116 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/irq.h"
extern void do_IRQ(int irq);



extern void do_IRQ_no_affinity(unsigned int irq);



extern void arch_init_irq(void);
extern void spurious_interrupt(void);

extern int allocate_irqno(void);
extern void alloc_legacy_irqno(void);
extern void free_irqno(unsigned int irq);







extern int cp0_compare_irq;
extern int cp0_compare_irq_shift;
extern int cp0_perfcount_irq;
# 28 "include/linux/irq.h" 2
# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/ptrace.h" 1
# 29 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/ptrace.h"
struct pt_regs {


 unsigned long pad0[6];



 unsigned long regs[32];


 unsigned long cp0_status;
 unsigned long hi;
 unsigned long lo;



 unsigned long cp0_badvaddr;
 unsigned long cp0_cause;
 unsigned long cp0_epc;

 unsigned long cp0_tcstatus;





} __attribute__ ((aligned (8)));
# 78 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/ptrace.h"
enum pt_watch_style {
 pt_watch_style_mips32,
 pt_watch_style_mips64
};
struct mips32_watch_regs {
 unsigned int watchlo[8];

 unsigned short watchhi[8];






 unsigned short watch_masks[8];

 unsigned int num_valid;
} __attribute__((aligned(8)));

struct mips64_watch_regs {
 unsigned long long watchlo[8];
 unsigned short watchhi[8];
 unsigned short watch_masks[8];
 unsigned int num_valid;
} __attribute__((aligned(8)));

struct pt_watch_regs {
 enum pt_watch_style style;
 union {
  struct mips32_watch_regs mips32;
  struct mips64_watch_regs mips64;
 };
};
# 120 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/ptrace.h"
# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/isadep.h" 1
# 121 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/ptrace.h" 2

struct task_struct;

extern int ptrace_getregs(struct task_struct *child, __s64 *data);
extern int ptrace_setregs(struct task_struct *child, __s64 *data);

extern int ptrace_getfpregs(struct task_struct *child, __u32 *data);
extern int ptrace_setfpregs(struct task_struct *child, __u32 *data);

extern int ptrace_get_watch_regs(struct task_struct *child,
 struct pt_watch_regs *addr);
extern int ptrace_set_watch_regs(struct task_struct *child,
 struct pt_watch_regs *addr);
# 144 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/ptrace.h"
extern void do_syscall_trace(struct pt_regs *regs, int entryexit);

extern void die(const char *, struct pt_regs *) __attribute__((noreturn));

static inline __attribute__((always_inline)) void die_if_kernel(const char *str, struct pt_regs *regs)
{
 if (__builtin_expect(!!(!(((regs)->cp0_status & 0x18) == 0x10)), 0))
  die(str, regs);
}
# 29 "include/linux/irq.h" 2
# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/irq_regs.h" 1
# 16 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/irq_regs.h"
static inline __attribute__((always_inline)) struct pt_regs *get_irq_regs(void)
{
 return __current_thread_info->regs;
}
# 30 "include/linux/irq.h" 2

struct irq_desc;
typedef void (*irq_flow_handler_t)(unsigned int irq,
         struct irq_desc *desc);
# 83 "include/linux/irq.h"
struct proc_dir_entry;
struct msi_desc;
# 111 "include/linux/irq.h"
struct irq_chip {
 const char *name;
 unsigned int (*startup)(unsigned int irq);
 void (*shutdown)(unsigned int irq);
 void (*enable)(unsigned int irq);
 void (*disable)(unsigned int irq);

 void (*ack)(unsigned int irq);
 void (*mask)(unsigned int irq);
 void (*mask_ack)(unsigned int irq);
 void (*unmask)(unsigned int irq);
 void (*eoi)(unsigned int irq);

 void (*end)(unsigned int irq);
 int (*set_affinity)(unsigned int irq,
     const struct cpumask *dest);
 int (*retrigger)(unsigned int irq);
 int (*set_type)(unsigned int irq, unsigned int flow_type);
 int (*set_wake)(unsigned int irq, unsigned int on);

 void (*bus_lock)(unsigned int irq);
 void (*bus_sync_unlock)(unsigned int irq);
# 142 "include/linux/irq.h"
 const char *typename;
};

struct timer_rand_state;
struct irq_2_iommu;
# 175 "include/linux/irq.h"
struct irq_desc {
 unsigned int irq;
 struct timer_rand_state *timer_rand_state;
 unsigned int *kstat_irqs;



 irq_flow_handler_t handle_irq;
 struct irq_chip *chip;
 struct msi_desc *msi_desc;
 void *handler_data;
 void *chip_data;
 struct irqaction *action;
 unsigned int status;

 unsigned int depth;
 unsigned int wake_depth;
 unsigned int irq_count;
 unsigned long last_unhandled;
 unsigned int irqs_unhandled;
 raw_spinlock_t lock;

 cpumask_var_t affinity;
 const struct cpumask *affinity_hint;
 unsigned int node;




 atomic_t threads_active;
 wait_queue_head_t wait_for_threads;

 struct proc_dir_entry *dir;

 const char *name;
} __attribute__((__aligned__(1 << (5))));

extern void arch_init_copy_chip_data(struct irq_desc *old_desc,
     struct irq_desc *desc, int node);
extern void arch_free_chip_data(struct irq_desc *old_desc, struct irq_desc *desc);


extern struct irq_desc irq_desc[64];





static inline __attribute__((always_inline)) struct irq_desc *move_irq_desc(struct irq_desc *desc, int node)
{
 return desc;
}


extern struct irq_desc *irq_to_desc_alloc_node(unsigned int irq, int node);




# 1 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/hw_irq.h" 1
# 13 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/hw_irq.h"
extern atomic_t irq_err_count;
# 235 "include/linux/irq.h" 2

extern int setup_irq(unsigned int irq, struct irqaction *new);
extern void remove_irq(unsigned int irq, struct irqaction *act);
# 250 "include/linux/irq.h"
static inline __attribute__((always_inline)) void move_irq(int irq)
{
}

static inline __attribute__((always_inline)) void move_native_irq(int irq)
{
}

static inline __attribute__((always_inline)) void move_masked_irq(int irq)
{
}
# 271 "include/linux/irq.h"
extern int no_irq_affinity;

static inline __attribute__((always_inline)) int irq_balancing_disabled(unsigned int irq)
{
 struct irq_desc *desc;

 desc = irq_to_desc(irq);
 return desc->status & (0x00010000 | 0x00400000);
}


extern irqreturn_t handle_IRQ_event(unsigned int irq, struct irqaction *action);





extern void handle_level_irq(unsigned int irq, struct irq_desc *desc);
extern void handle_fasteoi_irq(unsigned int irq, struct irq_desc *desc);
extern void handle_edge_irq(unsigned int irq, struct irq_desc *desc);
extern void handle_simple_irq(unsigned int irq, struct irq_desc *desc);
extern void handle_percpu_irq(unsigned int irq, struct irq_desc *desc);
extern void handle_bad_irq(unsigned int irq, struct irq_desc *desc);
extern void handle_nested_irq(unsigned int irq);
# 309 "include/linux/irq.h"
static inline __attribute__((always_inline)) void generic_handle_irq_desc(unsigned int irq, struct irq_desc *desc)
{

 desc->handle_irq(irq, desc);






}

static inline __attribute__((always_inline)) void generic_handle_irq(unsigned int irq)
{
 generic_handle_irq_desc(irq, irq_to_desc(irq));
}


extern void note_interrupt(unsigned int irq, struct irq_desc *desc,
      irqreturn_t action_ret);


void check_irq_resend(struct irq_desc *desc, unsigned int irq);


extern int noirqdebug_setup(char *str);


extern int can_request_irq(unsigned int irq, unsigned long irqflags);


extern struct irq_chip no_irq_chip;
extern struct irq_chip dummy_irq_chip;

extern void
set_irq_chip_and_handler(unsigned int irq, struct irq_chip *chip,
    irq_flow_handler_t handle);
extern void
set_irq_chip_and_handler_name(unsigned int irq, struct irq_chip *chip,
         irq_flow_handler_t handle, const char *name);

extern void
__set_irq_handler(unsigned int irq, irq_flow_handler_t handle, int is_chained,
    const char *name);


static inline __attribute__((always_inline)) void __set_irq_handler_unlocked(int irq,
           irq_flow_handler_t handler)
{
 struct irq_desc *desc;

 desc = irq_to_desc(irq);
 desc->handle_irq = handler;
}




static inline __attribute__((always_inline)) void
set_irq_handler(unsigned int irq, irq_flow_handler_t handle)
{
 __set_irq_handler(irq, handle, 0, ((void *)0));
}






static inline __attribute__((always_inline)) void
set_irq_chained_handler(unsigned int irq,
   irq_flow_handler_t handle)
{
 __set_irq_handler(irq, handle, 1, ((void *)0));
}

extern void set_irq_nested_thread(unsigned int irq, int nest);

extern void set_irq_noprobe(unsigned int irq);
extern void set_irq_probe(unsigned int irq);


extern unsigned int create_irq_nr(unsigned int irq_want, int node);
extern int create_irq(void);
extern void destroy_irq(unsigned int irq);


static inline __attribute__((always_inline)) int irq_has_action(unsigned int irq)
{
 struct irq_desc *desc = irq_to_desc(irq);
 return desc->action != ((void *)0);
}


extern void dynamic_irq_init(unsigned int irq);
void dynamic_irq_init_keep_chip_data(unsigned int irq);
extern void dynamic_irq_cleanup(unsigned int irq);
void dynamic_irq_cleanup_keep_chip_data(unsigned int irq);


extern int set_irq_chip(unsigned int irq, struct irq_chip *chip);
extern int set_irq_data(unsigned int irq, void *data);
extern int set_irq_chip_data(unsigned int irq, void *data);
extern int set_irq_type(unsigned int irq, unsigned int type);
extern int set_irq_msi(unsigned int irq, struct msi_desc *entry);
# 439 "include/linux/irq.h"
static inline __attribute__((always_inline)) int alloc_desc_masks(struct irq_desc *desc, int node,
       int boot)
{
 gfp_t gfp = ((( gfp_t)0x20u));

 if (boot)
  gfp = (((( gfp_t)0x20u)) & ~(( gfp_t)0x20u));
# 458 "include/linux/irq.h"
 return true;
}

static inline __attribute__((always_inline)) void init_desc_masks(struct irq_desc *desc)
{
 cpumask_setall(desc->affinity);



}
# 479 "include/linux/irq.h"
static inline __attribute__((always_inline)) void init_copy_desc_masks(struct irq_desc *old_desc,
     struct irq_desc *new_desc)
{







}

static inline __attribute__((always_inline)) void free_desc_masks(struct irq_desc *old_desc,
       struct irq_desc *new_desc)
{
 free_cpumask_var(old_desc->affinity);




}
# 7 "include/asm-generic/hardirq.h" 2

typedef struct {
 unsigned int __softirq_pending;
} __attribute__((__aligned__((1 << 5)))) irq_cpustat_t;

# 1 "include/linux/irq_cpustat.h" 1
# 20 "include/linux/irq_cpustat.h"
extern irq_cpustat_t irq_stat[];
# 13 "include/asm-generic/hardirq.h" 2
# 17 "/proj/mtk04880/tclinux_phoenix/linux-2.6.36/arch/mips/include/asm/hardirq.h" 2
# 11 "include/linux/hardirq.h" 2
# 128 "include/linux/hardirq.h"
extern void synchronize_irq(unsigned int irq);




struct task_struct;


static inline __attribute__((always_inline)) void account_system_vtime(struct task_struct *tsk)
{
}
# 193 "include/linux/hardirq.h"
extern void irq_enter(void);
# 208 "include/linux/hardirq.h"
extern void irq_exit(void);
# 13 "include/linux/interrupt.h" 2
# 79 "include/linux/interrupt.h"
enum {
 IRQTF_RUNTHREAD,
 IRQTF_DIED,
 IRQTF_WARNED,
 IRQTF_AFFINITY,
};
# 93 "include/linux/interrupt.h"
enum {
 IRQC_IS_HARDIRQ = 0,
 IRQC_IS_NESTED,
};

typedef irqreturn_t (*irq_handler_t)(int, void *);
# 113 "include/linux/interrupt.h"
struct irqaction {
 irq_handler_t handler;
 unsigned long flags;
 const char *name;
 void *dev_id;
 struct irqaction *next;
 int irq;
 struct proc_dir_entry *dir;
 irq_handler_t thread_fn;
 struct task_struct *thread;
 unsigned long thread_flags;
};

extern irqreturn_t no_action(int cpl, void *dev_id);


extern int
request_threaded_irq(unsigned int irq, irq_handler_t handler,
       irq_handler_t thread_fn,
       unsigned long flags, const char *name, void *dev);
static inline __attribute__((always_inline)) int
request_irq(unsigned int irq, irq_handler_t handler, unsigned long flags,
     const char *name, void *dev)
{
 return request_threaded_irq(irq, handler, ((void *)0), flags, name, dev);
}

extern int
request_any_context_irq(unsigned int irq, irq_handler_t handler,
   unsigned long flags, const char *name, void *dev_id);

extern void exit_irq_thread(void);
# 175 "include/linux/interrupt.h"
extern void free_irq(unsigned int, void *);

struct device;

extern int
devm_request_threaded_irq(struct device *dev, unsigned int irq,
     irq_handler_t handler, irq_handler_t thread_fn,
     unsigned long irqflags, const char *devname,
     void *dev_id);

static inline __attribute__((always_inline)) int
devm_request_irq(struct device *dev, unsigned int irq, irq_handler_t handler,
   unsigned long irqflags, const char *devname, void *dev_id)
{
 return devm_request_threaded_irq(dev, irq, handler, ((void *)0), irqflags,
      devname, dev_id);
}

extern void devm_free_irq(struct device *dev, unsigned int irq, void *dev_id);
# 213 "include/linux/interrupt.h"
extern void disable_irq_nosync(unsigned int irq);
extern void disable_irq(unsigned int irq);
extern void enable_irq(unsigned int irq);



extern void suspend_device_irqs(void);
extern void resume_device_irqs(void);



static inline __attribute__((always_inline)) int check_wakeup_irqs(void) { return 0; }
# 234 "include/linux/interrupt.h"
extern cpumask_var_t irq_default_affinity;

extern int irq_set_affinity(unsigned int irq, const struct cpumask *cpumask);
extern int irq_can_set_affinity(unsigned int irq);
extern int irq_select_affinity(unsigned int irq);

extern int irq_set_affinity_hint(unsigned int irq, const struct cpumask *m);
# 274 "include/linux/interrupt.h"
static inline __attribute__((always_inline)) void disable_irq_nosync_lockdep(unsigned int irq)
{
 disable_irq_nosync(irq);



}

static inline __attribute__((always_inline)) void disable_irq_nosync_lockdep_irqsave(unsigned int irq, unsigned long *flags)
{
 disable_irq_nosync(irq);



}

static inline __attribute__((always_inline)) void disable_irq_lockdep(unsigned int irq)
{
 disable_irq(irq);



}

static inline __attribute__((always_inline)) void enable_irq_lockdep(unsigned int irq)
{



 enable_irq(irq);
}

static inline __attribute__((always_inline)) void enable_irq_lockdep_irqrestore(unsigned int irq, unsigned long *flags)
{



 enable_irq(irq);
}


extern int set_irq_wake(unsigned int irq, unsigned int on);

static inline __attribute__((always_inline)) int enable_irq_wake(unsigned int irq)
{
 return set_irq_wake(irq, 1);
}

static inline __attribute__((always_inline)) int disable_irq_wake(unsigned int irq)
{
 return set_irq_wake(irq, 0);
}
# 375 "include/linux/interrupt.h"
enum
{
 HI_SOFTIRQ=0,
 TIMER_SOFTIRQ,
 NET_TX_SOFTIRQ,
 NET_RX_SOFTIRQ,
 BLOCK_SOFTIRQ,
 BLOCK_IOPOLL_SOFTIRQ,
 TASKLET_SOFTIRQ,
 SCHED_SOFTIRQ,
 HRTIMER_SOFTIRQ,
 RCU_SOFTIRQ,

 NR_SOFTIRQS
};




extern char *softirq_to_name[NR_SOFTIRQS];





struct softirq_action
{
 void (*action)(struct softirq_action *);
};

 void do_softirq(void);
 void __do_softirq(void);
extern void open_softirq(int nr, void (*action)(struct softirq_action *));
extern void softirq_init(void);

extern void raise_softirq_irqoff(unsigned int nr);
extern void raise_softirq(unsigned int nr);
extern void wakeup_softirqd(void);
# 421 "include/linux/interrupt.h"
extern __attribute__((section(".data..percpu" ""))) __typeof__(struct list_head [NR_SOFTIRQS]) softirq_work_list;




extern void send_remote_softirq(struct call_single_data *cp, int cpu, int softirq);




extern void __send_remote_softirq(struct call_single_data *cp, int cpu,
      int this_cpu, int softirq);
# 454 "include/linux/interrupt.h"
struct tasklet_struct
{
 struct tasklet_struct *next;
 unsigned long state;
 atomic_t count;
 void (*func)(unsigned long);
 unsigned long data;
};
# 470 "include/linux/interrupt.h"
enum
{
 TASKLET_STATE_SCHED,
 TASKLET_STATE_RUN
};


static inline __attribute__((always_inline)) int tasklet_trylock(struct tasklet_struct *t)
{
 return !test_and_set_bit(TASKLET_STATE_RUN, &(t)->state);
}

static inline __attribute__((always_inline)) void tasklet_unlock(struct tasklet_struct *t)
{
 __asm__ __volatile__("		\n" : : :"memory");
 clear_bit(TASKLET_STATE_RUN, &(t)->state);
}

static inline __attribute__((always_inline)) void tasklet_unlock_wait(struct tasklet_struct *t)
{
 while (test_bit(TASKLET_STATE_RUN, &(t)->state)) { __asm__ __volatile__("": : :"memory"); }
}






extern void __tasklet_schedule(struct tasklet_struct *t);

static inline __attribute__((always_inline)) void tasklet_schedule(struct tasklet_struct *t)
{
 if (!test_and_set_bit(TASKLET_STATE_SCHED, &t->state))
  __tasklet_schedule(t);
}

extern void __tasklet_hi_schedule(struct tasklet_struct *t);

static inline __attribute__((always_inline)) void tasklet_hi_schedule(struct tasklet_struct *t)
{
 if (!test_and_set_bit(TASKLET_STATE_SCHED, &t->state))
  __tasklet_hi_schedule(t);
}

extern void __tasklet_hi_schedule_first(struct tasklet_struct *t);







static inline __attribute__((always_inline)) void tasklet_hi_schedule_first(struct tasklet_struct *t)
{
 if (!test_and_set_bit(TASKLET_STATE_SCHED, &t->state))
  __tasklet_hi_schedule_first(t);
}


static inline __attribute__((always_inline)) void tasklet_disable_nosync(struct tasklet_struct *t)
{
 atomic_add(1, (&t->count));
 __asm__ __volatile__("		\n" : : :"memory");
}

static inline __attribute__((always_inline)) void tasklet_disable(struct tasklet_struct *t)
{
 tasklet_disable_nosync(t);
 tasklet_unlock_wait(t);
 __asm__ __volatile__("": : :"memory");
}

static inline __attribute__((always_inline)) void tasklet_enable(struct tasklet_struct *t)
{
 __asm__ __volatile__("		\n" : : :"memory");
 atomic_sub(1, (&t->count));
}

static inline __attribute__((always_inline)) void tasklet_hi_enable(struct tasklet_struct *t)
{
 __asm__ __volatile__("		\n" : : :"memory");
 atomic_sub(1, (&t->count));
}

extern void tasklet_kill(struct tasklet_struct *t);
extern void tasklet_kill_immediate(struct tasklet_struct *t, unsigned int cpu);
extern void tasklet_init(struct tasklet_struct *t,
    void (*func)(unsigned long), unsigned long data);

struct tasklet_hrtimer {
 struct hrtimer timer;
 struct tasklet_struct tasklet;
 enum hrtimer_restart (*function)(struct hrtimer *);
};

extern void
tasklet_hrtimer_init(struct tasklet_hrtimer *ttimer,
       enum hrtimer_restart (*function)(struct hrtimer *),
       clockid_t which_clock, enum hrtimer_mode mode);

static inline __attribute__((always_inline))
int tasklet_hrtimer_start(struct tasklet_hrtimer *ttimer, ktime_t time,
     const enum hrtimer_mode mode)
{
 return hrtimer_start(&ttimer->timer, time, mode);
}

static inline __attribute__((always_inline))
void tasklet_hrtimer_cancel(struct tasklet_hrtimer *ttimer)
{
 hrtimer_cancel(&ttimer->timer);
 tasklet_kill(&ttimer->tasklet);
}
# 626 "include/linux/interrupt.h"
extern unsigned long probe_irq_on(void);
extern int probe_irq_off(unsigned long);
extern unsigned int probe_irq_mask(unsigned long);




extern void init_irq_proc(void);






struct seq_file;
int show_interrupts(struct seq_file *p, void *v);

struct irq_desc;

extern int early_irq_init(void);
extern int arch_probe_nr_irqs(void);
extern int arch_early_irq_init(void);
extern int arch_init_chip_data(struct irq_desc *desc, int node);
# 1245 "include/linux/netdevice.h" 2


extern rwlock_t dev_base_lock;
# 1264 "include/linux/netdevice.h"
static inline __attribute__((always_inline)) struct net_device *next_net_device(struct net_device *dev)
{
 struct list_head *lh;
 struct net *net;

 net = dev_net(dev);
 lh = dev->dev_list.next;
 return lh == &net->dev_base_head ? ((void *)0) : ({ const typeof( ((struct net_device *)0)->dev_list ) *__mptr = (lh); (struct net_device *)( (char *)__mptr - __builtin_offsetof(struct net_device,dev_list) );});
}

static inline __attribute__((always_inline)) struct net_device *next_net_device_rcu(struct net_device *dev)
{
 struct list_head *lh;
 struct net *net;

 net = dev_net(dev);
 lh = ({ typeof(dev->dev_list.next) _________p1 = (*(volatile typeof(dev->dev_list.next) *)&(dev->dev_list.next)); do { } while(0); (_________p1); });
 return lh == &net->dev_base_head ? ((void *)0) : ({ const typeof( ((struct net_device *)0)->dev_list ) *__mptr = (lh); (struct net_device *)( (char *)__mptr - __builtin_offsetof(struct net_device,dev_list) );});
}

static inline __attribute__((always_inline)) struct net_device *first_net_device(struct net *net)
{
 return list_empty(&net->dev_base_head) ? ((void *)0) :
  ({ const typeof( ((struct net_device *)0)->dev_list ) *__mptr = (net->dev_base_head.next); (struct net_device *)( (char *)__mptr - __builtin_offsetof(struct net_device,dev_list) );});
}

extern int netdev_boot_setup_check(struct net_device *dev);
extern unsigned long netdev_boot_base(const char *prefix, int unit);
extern struct net_device *dev_getbyhwaddr(struct net *net, unsigned short type, char *hwaddr);
extern struct net_device *dev_getfirstbyhwtype(struct net *net, unsigned short type);
extern struct net_device *__dev_getfirstbyhwtype(struct net *net, unsigned short type);
extern void dev_add_pack(struct packet_type *pt);



extern void dev_remove_pack(struct packet_type *pt);
extern void __dev_remove_pack(struct packet_type *pt);

extern struct net_device *dev_get_by_flags_rcu(struct net *net, unsigned short flags,
            unsigned short mask);
extern struct net_device *dev_get_by_name(struct net *net, const char *name);
extern struct net_device *dev_get_by_name_rcu(struct net *net, const char *name);
extern struct net_device *__dev_get_by_name(struct net *net, const char *name);
extern int dev_alloc_name(struct net_device *dev, const char *name);
extern int dev_open(struct net_device *dev);
extern int dev_close(struct net_device *dev);
extern void dev_disable_lro(struct net_device *dev);
extern struct netdev_queue *dev_pick_tx(struct net_device *dev, struct sk_buff *skb);
extern int dev_queue_xmit(struct sk_buff *skb);
extern int register_netdevice(struct net_device *dev);
extern void unregister_netdevice_queue(struct net_device *dev,
         struct list_head *head);
extern void unregister_netdevice_many(struct list_head *head);
static inline __attribute__((always_inline)) void unregister_netdevice(struct net_device *dev)
{
 unregister_netdevice_queue(dev, ((void *)0));
}

extern void free_netdev(struct net_device *dev);
extern void synchronize_net(void);
extern int register_netdevice_notifier(struct notifier_block *nb);
extern int unregister_netdevice_notifier(struct notifier_block *nb);
extern int init_dummy_netdev(struct net_device *dev);
extern void netdev_resync_ops(struct net_device *dev);

extern int call_netdevice_notifiers(unsigned long val, struct net_device *dev);
extern struct net_device *dev_get_by_index(struct net *net, int ifindex);
extern struct net_device *__dev_get_by_index(struct net *net, int ifindex);
extern struct net_device *dev_get_by_index_rcu(struct net *net, int ifindex);
extern int dev_restart(struct net_device *dev);



extern int skb_gro_receive(struct sk_buff **head,
           struct sk_buff *skb);
extern void skb_gro_reset_offset(struct sk_buff *skb);

static inline __attribute__((always_inline)) unsigned int skb_gro_offset(const struct sk_buff *skb)
{
 return ((struct napi_gro_cb *)(skb)->cb)->data_offset;
}

static inline __attribute__((always_inline)) unsigned int skb_gro_len(const struct sk_buff *skb)
{
 return skb->len - ((struct napi_gro_cb *)(skb)->cb)->data_offset;
}

static inline __attribute__((always_inline)) void skb_gro_pull(struct sk_buff *skb, unsigned int len)
{
 ((struct napi_gro_cb *)(skb)->cb)->data_offset += len;
}

static inline __attribute__((always_inline)) void *skb_gro_header_fast(struct sk_buff *skb,
     unsigned int offset)
{
 return ((struct napi_gro_cb *)(skb)->cb)->frag0 + offset;
}

static inline __attribute__((always_inline)) int skb_gro_header_hard(struct sk_buff *skb, unsigned int hlen)
{
 return ((struct napi_gro_cb *)(skb)->cb)->frag0_len < hlen;
}

static inline __attribute__((always_inline)) void *skb_gro_header_slow(struct sk_buff *skb, unsigned int hlen,
     unsigned int offset)
{
 ((struct napi_gro_cb *)(skb)->cb)->frag0 = ((void *)0);
 ((struct napi_gro_cb *)(skb)->cb)->frag0_len = 0;
 return pskb_may_pull(skb, hlen) ? skb->data + offset : ((void *)0);
}

static inline __attribute__((always_inline)) void *skb_gro_mac_header(struct sk_buff *skb)
{
 return ((struct napi_gro_cb *)(skb)->cb)->frag0 ?: skb_mac_header(skb);
}

static inline __attribute__((always_inline)) void *skb_gro_network_header(struct sk_buff *skb)
{
 return (((struct napi_gro_cb *)(skb)->cb)->frag0 ?: skb->data) +
        skb_network_offset(skb);
}

static inline __attribute__((always_inline)) int dev_hard_header(struct sk_buff *skb, struct net_device *dev,
      unsigned short type,
      const void *daddr, const void *saddr,
      unsigned len)
{
 if (!dev->header_ops || !dev->header_ops->create)
  return 0;

 return dev->header_ops->create(skb, dev, type, daddr, saddr, len);
}

static inline __attribute__((always_inline)) int dev_parse_header(const struct sk_buff *skb,
       unsigned char *haddr)
{
 const struct net_device *dev = skb->dev;

 if (!dev->header_ops || !dev->header_ops->parse)
  return 0;
 return dev->header_ops->parse(skb, haddr);
}

typedef int gifconf_func_t(struct net_device * dev, char * bufptr, int len);
extern int register_gifconf(unsigned int family, gifconf_func_t * gifconf);
static inline __attribute__((always_inline)) int unregister_gifconf(unsigned int family)
{
 return register_gifconf(family, ((void *)0));
}




struct softnet_data {
 struct Qdisc *output_queue;
 struct Qdisc **output_queue_tailp;
 struct list_head poll_list;
 struct sk_buff *completion_queue;
 struct sk_buff_head process_queue;


 unsigned int processed;
 unsigned int time_squeeze;
 unsigned int cpu_collision;
 unsigned int received_rps;
# 1440 "include/linux/netdevice.h"
 unsigned dropped;
 struct sk_buff_head input_pkt_queue;
 struct napi_struct backlog;

 struct sk_buff_head pri_queue[3];

};

static inline __attribute__((always_inline)) void input_queue_head_incr(struct softnet_data *sd)
{



}

static inline __attribute__((always_inline)) void input_queue_tail_incr_save(struct softnet_data *sd,
           unsigned int *qtail)
{



}

extern __attribute__((section(".data..percpu" ""))) __typeof__(struct softnet_data) softnet_data __attribute__((__aligned__((1 << 5))));



extern void __netif_schedule(struct Qdisc *q);

static inline __attribute__((always_inline)) void netif_schedule_queue(struct netdev_queue *txq)
{
 if (!test_bit(__QUEUE_STATE_XOFF, &txq->state))
  __netif_schedule(txq->qdisc);
}

static inline __attribute__((always_inline)) void netif_tx_schedule_all(struct net_device *dev)
{
 unsigned int i;

 for (i = 0; i < dev->num_tx_queues; i++)
  netif_schedule_queue(netdev_get_tx_queue(dev, i));
}

static inline __attribute__((always_inline)) void netif_tx_start_queue(struct netdev_queue *dev_queue)
{
 clear_bit(__QUEUE_STATE_XOFF, &dev_queue->state);
}







static inline __attribute__((always_inline)) void netif_start_queue(struct net_device *dev)
{
 netif_tx_start_queue(netdev_get_tx_queue(dev, 0));
}

static inline __attribute__((always_inline)) void netif_tx_start_all_queues(struct net_device *dev)
{
 unsigned int i;

 for (i = 0; i < dev->num_tx_queues; i++) {
  struct netdev_queue *txq = netdev_get_tx_queue(dev, i);
  netif_tx_start_queue(txq);
 }
}

static inline __attribute__((always_inline)) void netif_tx_wake_queue(struct netdev_queue *dev_queue)
{






 if (test_and_clear_bit(__QUEUE_STATE_XOFF, &dev_queue->state))
  __netif_schedule(dev_queue->qdisc);
}
# 1528 "include/linux/netdevice.h"
static inline __attribute__((always_inline)) void netif_wake_queue(struct net_device *dev)
{
 netif_tx_wake_queue(netdev_get_tx_queue(dev, 0));
}

static inline __attribute__((always_inline)) void netif_tx_wake_all_queues(struct net_device *dev)
{
 unsigned int i;

 for (i = 0; i < dev->num_tx_queues; i++) {
  struct netdev_queue *txq = netdev_get_tx_queue(dev, i);
  netif_tx_wake_queue(txq);
 }
}

static inline __attribute__((always_inline)) void netif_tx_stop_queue(struct netdev_queue *dev_queue)
{
 set_bit(__QUEUE_STATE_XOFF, &dev_queue->state);
}
# 1555 "include/linux/netdevice.h"
static inline __attribute__((always_inline)) void netif_stop_queue(struct net_device *dev)
{
 netif_tx_stop_queue(netdev_get_tx_queue(dev, 0));
}

static inline __attribute__((always_inline)) void netif_tx_stop_all_queues(struct net_device *dev)
{
 unsigned int i;

 for (i = 0; i < dev->num_tx_queues; i++) {
  struct netdev_queue *txq = netdev_get_tx_queue(dev, i);
  netif_tx_stop_queue(txq);
 }
}

static inline __attribute__((always_inline)) int netif_tx_queue_stopped(const struct netdev_queue *dev_queue)
{
 return test_bit(__QUEUE_STATE_XOFF, &dev_queue->state);
}







static inline __attribute__((always_inline)) int netif_queue_stopped(const struct net_device *dev)
{
 return netif_tx_queue_stopped(netdev_get_tx_queue(dev, 0));
}

static inline __attribute__((always_inline)) int netif_tx_queue_frozen(const struct netdev_queue *dev_queue)
{
 return test_bit(__QUEUE_STATE_FROZEN, &dev_queue->state);
}







static inline __attribute__((always_inline)) int netif_running(const struct net_device *dev)
{
 return test_bit(__LINK_STATE_START, &dev->state);
}
# 1616 "include/linux/netdevice.h"
static inline __attribute__((always_inline)) void netif_start_subqueue(struct net_device *dev, u16 queue_index)
{
 struct netdev_queue *txq = netdev_get_tx_queue(dev, queue_index);

 netif_tx_start_queue(txq);
}
# 1630 "include/linux/netdevice.h"
static inline __attribute__((always_inline)) void netif_stop_subqueue(struct net_device *dev, u16 queue_index)
{
 struct netdev_queue *txq = netdev_get_tx_queue(dev, queue_index);




 netif_tx_stop_queue(txq);
}
# 1647 "include/linux/netdevice.h"
static inline __attribute__((always_inline)) int __netif_subqueue_stopped(const struct net_device *dev,
      u16 queue_index)
{
 struct netdev_queue *txq = netdev_get_tx_queue(dev, queue_index);

 return netif_tx_queue_stopped(txq);
}

static inline __attribute__((always_inline)) int netif_subqueue_stopped(const struct net_device *dev,
      struct sk_buff *skb)
{
 return __netif_subqueue_stopped(dev, skb_get_queue_mapping(skb));
}
# 1668 "include/linux/netdevice.h"
static inline __attribute__((always_inline)) void netif_wake_subqueue(struct net_device *dev, u16 queue_index)
{
 struct netdev_queue *txq = netdev_get_tx_queue(dev, queue_index);




 if (test_and_clear_bit(__QUEUE_STATE_XOFF, &txq->state))
  __netif_schedule(txq->qdisc);
}







static inline __attribute__((always_inline)) int netif_is_multiqueue(const struct net_device *dev)
{
 return (dev->num_tx_queues > 1);
}

extern void netif_set_real_num_tx_queues(struct net_device *dev,
      unsigned int txq);





extern void dev_kfree_skb_irq(struct sk_buff *skb);





extern void dev_kfree_skb_any(struct sk_buff *skb);


extern int netif_rx(struct sk_buff *skb);
extern int netif_rx_ni(struct sk_buff *skb);

extern int netif_receive_skb(struct sk_buff *skb);
extern gro_result_t dev_gro_receive(struct napi_struct *napi,
     struct sk_buff *skb);
extern gro_result_t napi_skb_finish(gro_result_t ret, struct sk_buff *skb);
extern gro_result_t napi_gro_receive(struct napi_struct *napi,
      struct sk_buff *skb);
extern void napi_reuse_skb(struct napi_struct *napi,
           struct sk_buff *skb);
extern struct sk_buff * napi_get_frags(struct napi_struct *napi);
extern gro_result_t napi_frags_finish(struct napi_struct *napi,
       struct sk_buff *skb,
       gro_result_t ret);
extern struct sk_buff * napi_frags_skb(struct napi_struct *napi);
extern gro_result_t napi_gro_frags(struct napi_struct *napi);

static inline __attribute__((always_inline)) void napi_free_frags(struct napi_struct *napi)
{
 kfree_skb(napi->skb);
 napi->skb = ((void *)0);
}

extern int netdev_rx_handler_register(struct net_device *dev,
          rx_handler_func_t *rx_handler,
          void *rx_handler_data);
extern void netdev_rx_handler_unregister(struct net_device *dev);

extern void netif_nit_deliver(struct sk_buff *skb);
extern int dev_valid_name(const char *name);
extern int dev_ioctl(struct net *net, unsigned int cmd, void *);
extern int dev_ethtool(struct net *net, struct ifreq *);
extern unsigned dev_get_flags(const struct net_device *);
extern int __dev_change_flags(struct net_device *, unsigned int flags);
extern int dev_change_flags(struct net_device *, unsigned);
extern void __dev_notify_flags(struct net_device *, unsigned int old_flags);
extern int dev_change_name(struct net_device *, const char *);
extern int dev_set_alias(struct net_device *, const char *, size_t);
extern int dev_change_net_namespace(struct net_device *,
       struct net *, const char *);
extern int dev_set_mtu(struct net_device *, int);
extern int dev_set_mac_address(struct net_device *,
         struct sockaddr *);
extern int dev_hard_start_xmit(struct sk_buff *skb,
         struct net_device *dev,
         struct netdev_queue *txq);
extern int dev_forward_skb(struct net_device *dev,
     struct sk_buff *skb);

extern int netdev_budget;


extern void netdev_run_todo(void);







static inline __attribute__((always_inline)) void dev_put(struct net_device *dev)
{
 atomic_sub(1, (&dev->refcnt));
}







static inline __attribute__((always_inline)) void dev_hold(struct net_device *dev)
{
 atomic_add(1, (&dev->refcnt));
}
# 1792 "include/linux/netdevice.h"
extern void linkwatch_fire_event(struct net_device *dev);
extern void linkwatch_forget_dev(struct net_device *dev);







static inline __attribute__((always_inline)) int netif_carrier_ok(const struct net_device *dev)
{
 return !test_bit(__LINK_STATE_NOCARRIER, &dev->state);
}

extern unsigned long dev_trans_start(struct net_device *dev);

extern void __netdev_watchdog_up(struct net_device *dev);

extern void netif_carrier_on(struct net_device *dev);

extern void netif_carrier_off(struct net_device *dev);

extern void netif_notify_peers(struct net_device *dev);
# 1829 "include/linux/netdevice.h"
static inline __attribute__((always_inline)) void netif_dormant_on(struct net_device *dev)
{
 if (!test_and_set_bit(__LINK_STATE_DORMANT, &dev->state))
  linkwatch_fire_event(dev);
}







static inline __attribute__((always_inline)) void netif_dormant_off(struct net_device *dev)
{
 if (test_and_clear_bit(__LINK_STATE_DORMANT, &dev->state))
  linkwatch_fire_event(dev);
}







static inline __attribute__((always_inline)) int netif_dormant(const struct net_device *dev)
{
 return test_bit(__LINK_STATE_DORMANT, &dev->state);
}
# 1865 "include/linux/netdevice.h"
static inline __attribute__((always_inline)) int netif_oper_up(const struct net_device *dev)
{
 return (dev->operstate == IF_OPER_UP ||
  dev->operstate == IF_OPER_UNKNOWN );
}







static inline __attribute__((always_inline)) int netif_device_present(struct net_device *dev)
{
 return test_bit(__LINK_STATE_PRESENT, &dev->state);
}

extern void netif_device_detach(struct net_device *dev);

extern void netif_device_attach(struct net_device *dev);






enum {
 NETIF_MSG_DRV = 0x0001,
 NETIF_MSG_PROBE = 0x0002,
 NETIF_MSG_LINK = 0x0004,
 NETIF_MSG_TIMER = 0x0008,
 NETIF_MSG_IFDOWN = 0x0010,
 NETIF_MSG_IFUP = 0x0020,
 NETIF_MSG_RX_ERR = 0x0040,
 NETIF_MSG_TX_ERR = 0x0080,
 NETIF_MSG_TX_QUEUED = 0x0100,
 NETIF_MSG_INTR = 0x0200,
 NETIF_MSG_TX_DONE = 0x0400,
 NETIF_MSG_RX_STATUS = 0x0800,
 NETIF_MSG_PKTDATA = 0x1000,
 NETIF_MSG_HW = 0x2000,
 NETIF_MSG_WOL = 0x4000,
};
# 1925 "include/linux/netdevice.h"
static inline __attribute__((always_inline)) u32 netif_msg_init(int debug_value, int default_msg_enable_bits)
{

 if (debug_value < 0 || debug_value >= (sizeof(u32) * 8))
  return default_msg_enable_bits;
 if (debug_value == 0)
  return 0;

 return (1 << debug_value) - 1;
}

static inline __attribute__((always_inline)) void __netif_tx_lock(struct netdev_queue *txq, int cpu)
{
 spin_lock(&txq->_xmit_lock);
 txq->xmit_lock_owner = cpu;
}

static inline __attribute__((always_inline)) void __netif_tx_lock_bh(struct netdev_queue *txq)
{
 spin_lock_bh(&txq->_xmit_lock);
 txq->xmit_lock_owner = (__current_thread_info->cpu);
}

static inline __attribute__((always_inline)) int __netif_tx_trylock(struct netdev_queue *txq)
{
 int ok = spin_trylock(&txq->_xmit_lock);
 if (__builtin_expect(!!(ok), 1))
  txq->xmit_lock_owner = (__current_thread_info->cpu);
 return ok;
}

static inline __attribute__((always_inline)) void __netif_tx_unlock(struct netdev_queue *txq)
{
 txq->xmit_lock_owner = -1;
 spin_unlock(&txq->_xmit_lock);
}

static inline __attribute__((always_inline)) void __netif_tx_unlock_bh(struct netdev_queue *txq)
{
 txq->xmit_lock_owner = -1;
 spin_unlock_bh(&txq->_xmit_lock);
}

static inline __attribute__((always_inline)) void txq_trans_update(struct netdev_queue *txq)
{
 if (txq->xmit_lock_owner != -1)
  txq->trans_start = jiffies;
}







static inline __attribute__((always_inline)) void netif_tx_lock(struct net_device *dev)
{
 unsigned int i;
 int cpu;

 spin_lock(&dev->tx_global_lock);
 cpu = (__current_thread_info->cpu);
 for (i = 0; i < dev->num_tx_queues; i++) {
  struct netdev_queue *txq = netdev_get_tx_queue(dev, i);







  __netif_tx_lock(txq, cpu);
  set_bit(__QUEUE_STATE_FROZEN, &txq->state);
  __netif_tx_unlock(txq);
 }
}

static inline __attribute__((always_inline)) void netif_tx_lock_bh(struct net_device *dev)
{
 local_bh_disable();
 netif_tx_lock(dev);
}

static inline __attribute__((always_inline)) void netif_tx_unlock(struct net_device *dev)
{
 unsigned int i;

 for (i = 0; i < dev->num_tx_queues; i++) {
  struct netdev_queue *txq = netdev_get_tx_queue(dev, i);





  clear_bit(__QUEUE_STATE_FROZEN, &txq->state);
  netif_schedule_queue(txq);
 }
 spin_unlock(&dev->tx_global_lock);
}

static inline __attribute__((always_inline)) void netif_tx_unlock_bh(struct net_device *dev)
{
 netif_tx_unlock(dev);
 local_bh_enable();
}
# 2043 "include/linux/netdevice.h"
static inline __attribute__((always_inline)) void netif_tx_disable(struct net_device *dev)
{
 unsigned int i;
 int cpu;

 local_bh_disable();
 cpu = (__current_thread_info->cpu);
 for (i = 0; i < dev->num_tx_queues; i++) {
  struct netdev_queue *txq = netdev_get_tx_queue(dev, i);

  __netif_tx_lock(txq, cpu);
  netif_tx_stop_queue(txq);
  __netif_tx_unlock(txq);
 }
 local_bh_enable();
}

static inline __attribute__((always_inline)) void netif_addr_lock(struct net_device *dev)
{
 spin_lock(&dev->addr_list_lock);
}

static inline __attribute__((always_inline)) void netif_addr_lock_bh(struct net_device *dev)
{
 spin_lock_bh(&dev->addr_list_lock);
}

static inline __attribute__((always_inline)) void netif_addr_unlock(struct net_device *dev)
{
 spin_unlock(&dev->addr_list_lock);
}

static inline __attribute__((always_inline)) void netif_addr_unlock_bh(struct net_device *dev)
{
 spin_unlock_bh(&dev->addr_list_lock);
}
# 2089 "include/linux/netdevice.h"
extern void ether_setup(struct net_device *dev);


extern struct net_device *alloc_netdev_mq(int sizeof_priv, const char *name,
           void (*setup)(struct net_device *),
           unsigned int queue_count);


extern int register_netdev(struct net_device *dev);
extern void unregister_netdev(struct net_device *dev);


extern int __hw_addr_add_multiple(struct netdev_hw_addr_list *to_list,
      struct netdev_hw_addr_list *from_list,
      int addr_len, unsigned char addr_type);
extern void __hw_addr_del_multiple(struct netdev_hw_addr_list *to_list,
       struct netdev_hw_addr_list *from_list,
       int addr_len, unsigned char addr_type);
extern int __hw_addr_sync(struct netdev_hw_addr_list *to_list,
     struct netdev_hw_addr_list *from_list,
     int addr_len);
extern void __hw_addr_unsync(struct netdev_hw_addr_list *to_list,
        struct netdev_hw_addr_list *from_list,
        int addr_len);
extern void __hw_addr_flush(struct netdev_hw_addr_list *list);
extern void __hw_addr_init(struct netdev_hw_addr_list *list);


extern int dev_addr_add(struct net_device *dev, unsigned char *addr,
   unsigned char addr_type);
extern int dev_addr_del(struct net_device *dev, unsigned char *addr,
   unsigned char addr_type);
extern int dev_addr_add_multiple(struct net_device *to_dev,
     struct net_device *from_dev,
     unsigned char addr_type);
extern int dev_addr_del_multiple(struct net_device *to_dev,
     struct net_device *from_dev,
     unsigned char addr_type);
extern void dev_addr_flush(struct net_device *dev);
extern int dev_addr_init(struct net_device *dev);


extern int dev_uc_add(struct net_device *dev, unsigned char *addr);
extern int dev_uc_del(struct net_device *dev, unsigned char *addr);
extern int dev_uc_sync(struct net_device *to, struct net_device *from);
extern void dev_uc_unsync(struct net_device *to, struct net_device *from);
extern void dev_uc_flush(struct net_device *dev);
extern void dev_uc_init(struct net_device *dev);


extern int dev_mc_add(struct net_device *dev, unsigned char *addr);
extern int dev_mc_add_global(struct net_device *dev, unsigned char *addr);
extern int dev_mc_del(struct net_device *dev, unsigned char *addr);
extern int dev_mc_del_global(struct net_device *dev, unsigned char *addr);
extern int dev_mc_sync(struct net_device *to, struct net_device *from);
extern void dev_mc_unsync(struct net_device *to, struct net_device *from);
extern void dev_mc_flush(struct net_device *dev);
extern void dev_mc_init(struct net_device *dev);


extern void dev_set_rx_mode(struct net_device *dev);
extern void __dev_set_rx_mode(struct net_device *dev);
extern int dev_set_promiscuity(struct net_device *dev, int inc);
extern int dev_set_allmulti(struct net_device *dev, int inc);
extern void netdev_state_change(struct net_device *dev);
extern int netdev_bonding_change(struct net_device *dev,
           unsigned long event);
extern void netdev_features_change(struct net_device *dev);

extern void dev_load(struct net *net, const char *name);
extern void dev_mcast_init(void);
extern struct rtnl_link_stats64 *dev_get_stats(struct net_device *dev,
            struct rtnl_link_stats64 *storage);
extern void dev_txq_stats_fold(const struct net_device *dev,
        struct rtnl_link_stats64 *stats);

extern int netdev_max_backlog;
extern int netdev_tstamp_prequeue;
extern int weight_p;
extern int netdev_set_master(struct net_device *dev, struct net_device *master);
extern int skb_checksum_help(struct sk_buff *skb);
extern struct sk_buff *skb_gso_segment(struct sk_buff *skb, int features);

extern void netdev_rx_csum_fault(struct net_device *dev);






extern void net_enable_timestamp(void);
extern void net_disable_timestamp(void);


extern void *dev_seq_start(struct seq_file *seq, loff_t *pos);
extern void *dev_seq_next(struct seq_file *seq, void *v, loff_t *pos);
extern void dev_seq_stop(struct seq_file *seq, void *v);


extern int netdev_class_create_file(struct class_attribute *class_attr);
extern void netdev_class_remove_file(struct class_attribute *class_attr);

extern char *netdev_drivername(const struct net_device *dev, char *buffer, int len);

extern void linkwatch_run_queue(void);

unsigned long netdev_increment_features(unsigned long all, unsigned long one,
     unsigned long mask);
unsigned long netdev_fix_features(unsigned long features, const char *name);

void netif_stacked_transfer_operstate(const struct net_device *rootdev,
     struct net_device *dev);

static inline __attribute__((always_inline)) int net_gso_ok(int features, int gso_type)
{
 int feature = gso_type << 16;
 return (features & feature) == feature;
}

static inline __attribute__((always_inline)) int skb_gso_ok(struct sk_buff *skb, int features)
{
 return net_gso_ok(features, ((struct skb_shared_info *)(skb_end_pointer(skb)))->gso_type) &&
        (!skb_has_frags(skb) || (features & 64));
}

static inline __attribute__((always_inline)) int netif_needs_gso(struct net_device *dev, struct sk_buff *skb)
{
 return skb_is_gso(skb) &&
        (!skb_gso_ok(skb, dev->features) ||
  __builtin_expect(!!(skb->ip_summed != 3), 0));
}

static inline __attribute__((always_inline)) void netif_set_gso_max_size(struct net_device *dev,
       unsigned int size)
{
 dev->gso_max_size = size;
}

extern int __skb_bond_should_drop(struct sk_buff *skb,
      struct net_device *master);

static inline __attribute__((always_inline)) int skb_bond_should_drop(struct sk_buff *skb,
           struct net_device *master)
{
 if (master)
  return __skb_bond_should_drop(skb, master);
 return 0;
}

extern struct pernet_operations __attribute__ ((__section__(".init.data"))) loopback_net_ops;

static inline __attribute__((always_inline)) int dev_ethtool_get_settings(struct net_device *dev,
        struct ethtool_cmd *cmd)
{
 if (!dev->ethtool_ops || !dev->ethtool_ops->get_settings)
  return -122;
 return dev->ethtool_ops->get_settings(dev, cmd);
}

static inline __attribute__((always_inline)) u32 dev_ethtool_get_rx_csum(struct net_device *dev)
{
 if (!dev->ethtool_ops || !dev->ethtool_ops->get_rx_csum)
  return 0;
 return dev->ethtool_ops->get_rx_csum(dev);
}

static inline __attribute__((always_inline)) u32 dev_ethtool_get_flags(struct net_device *dev)
{
 if (!dev->ethtool_ops || !dev->ethtool_ops->get_flags)
  return 0;
 return dev->ethtool_ops->get_flags(dev);
}





static inline __attribute__((always_inline)) const char *netdev_name(const struct net_device *dev)
{
 if (dev->reg_state != NETREG_REGISTERED)
  return "(unregistered net_device)";
 return dev->name;
}

extern int netdev_printk(const char *level, const struct net_device *dev,
    const char *format, ...)
 __attribute__ ((format (printf, 3, 4)));
extern int netdev_emerg(const struct net_device *dev, const char *format, ...)
 __attribute__ ((format (printf, 2, 3)));
extern int netdev_alert(const struct net_device *dev, const char *format, ...)
 __attribute__ ((format (printf, 2, 3)));
extern int netdev_crit(const struct net_device *dev, const char *format, ...)
 __attribute__ ((format (printf, 2, 3)));
extern int netdev_err(const struct net_device *dev, const char *format, ...)
 __attribute__ ((format (printf, 2, 3)));
extern int netdev_warn(const struct net_device *dev, const char *format, ...)
 __attribute__ ((format (printf, 2, 3)));
extern int netdev_notice(const struct net_device *dev, const char *format, ...)
 __attribute__ ((format (printf, 2, 3)));
extern int netdev_info(const struct net_device *dev, const char *format, ...)
 __attribute__ ((format (printf, 2, 3)));
# 5 "/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_bmgr.h" 2


# 1 "/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_dev.h" 1



# 1 "/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_reg.h" 1
# 5 "/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_dev.h" 2
# 1 "/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_glb.h" 1
# 6 "/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_dev.h" 2





typedef struct {
 uint msg_addr ;
 struct {

  uint done : 1 ;
  uint drop_pkt : 1 ;
  uint resv1 : 5 ;
  uint no_drop : 1 ;
  uint msg_len : 8 ;
  uint pkt_len : 16 ;
# 29 "/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_dev.h"
 } ctrl ;
 uint pkt_addr ;

 uint resv2 : 20 ;
 uint next_idx : 12 ;
# 45 "/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_dev.h"
} QDMA_DMA_DSCP_T ;
# 214 "/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_dev.h"
 int __inline__ __attribute__((always_inline)) pseSetWanPcpConfig(unchar type, unchar mode) ;
 int __inline__ __attribute__((always_inline)) pseGetWanPcpConfig(unchar type) ;
 int __inline__ __attribute__((always_inline)) qdmaSetChannelRetire(unchar channel) ;

int __inline__ __attribute__((always_inline)) qdmaSetTxQosScheduler(unchar channel, unchar mode, unchar weight[8]) ;
int __inline__ __attribute__((always_inline)) qdmaGetTxQosScheduler(unchar channel, unchar *pMode, unchar weight[8]) ;





 int __inline__ __attribute__((always_inline)) qdmaSetTxQueueCngsScale(unchar maxScale, unchar minScale) ;
 int __inline__ __attribute__((always_inline)) qdmaGetTxQueueCngsScale(unchar *pMaxScale, unchar *pMinScale) ;
 int __inline__ __attribute__((always_inline)) qdmaSetTxQueueDropProbability(unchar grnDrop, unchar ylwDrop) ;
 int __inline__ __attribute__((always_inline)) qdmaGetTxQueueDropProbability(unchar *pGrnDrop, unchar *pYlwDrop) ;
 int __inline__ __attribute__((always_inline)) qdmaSetTxQueueGreenMaxThreshold(unchar txqIdx[8]) ;
 int __inline__ __attribute__((always_inline)) qdmaGetTxQueueGreenMaxThreshold(unchar txqIdx[8]) ;
 int __inline__ __attribute__((always_inline)) qdmaSetTxQueueGreenMinThreshold(unchar txqIdx[8]) ;
 int __inline__ __attribute__((always_inline)) qdmaGetTxQueueGreenMinThreshold(unchar txqIdx[8]) ;
 int __inline__ __attribute__((always_inline)) qdmaSetTxQueueYellowMaxThreshold(unchar txqIdx[8]) ;
 int __inline__ __attribute__((always_inline)) qdmaGetTxQueueYellowMaxThreshold(unchar txqIdx[8]) ;
 int __inline__ __attribute__((always_inline)) qdmaSetTxQueueYellowMinThreshold(unchar txqIdx[8]) ;
 int __inline__ __attribute__((always_inline)) qdmaGetTxQueueYellowMinThreshold(unchar txqIdx[8]) ;
 int __inline__ __attribute__((always_inline)) qdmaSetTxQueueTrtcmConfig(unchar idx, unchar type, unchar scale, ushort value) ;
 int __inline__ __attribute__((always_inline)) qdmaGetTxQueueTrtcmConfig(unchar idx, unchar scale, unchar type) ;
 int __inline__ __attribute__((always_inline)) qdmaSetGponTrtcmConfig(unchar channel, unchar type, unchar scale, ushort value) ;
 int __inline__ __attribute__((always_inline)) qdmaGetGponTrtcmConfig(unchar channel, unchar type) ;


int __inline__ __attribute__((always_inline)) qdmaSetEponReportConfig(unchar channel, unchar mode) ;
int __inline__ __attribute__((always_inline)) qdmaGetEponReportConfig(unchar channel, unchar *pMode) ;
int __inline__ __attribute__((always_inline)) qdmaSetEponThreshold(unchar channel, unchar queue, unchar type, ushort value) ;
int __inline__ __attribute__((always_inline)) qdmaGetEponThreshold(unchar channel, unchar queue, unchar type) ;

int qdmaEnableInt(uint base, uint bit) ;
int qdmaDisableInt(uint base, uint bit) ;
int qdmaSetIntMask(uint base, uint value) ;
int qdmaGetIntMask(uint base) ;

int qdma_dev_init(void) ;
# 8 "/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_bmgr.h" 2
# 1 "/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_api.h" 1
# 9 "/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_api.h"
typedef enum {
 QDMA_CALLBACK_TX_FINISHED,
 QDMA_CALLBACK_RX_PACKET,
 QDMA_CALLBACK_EVENT_HANDLER,
 QDMA_CALLBACK_TX_MSG,
 QDMA_CALLBACK_PTM_HANDLER,
 QDMA_CALLBACK_SAR_HANDLER,
 QDMA_CALLBACK_GPON_MAC_HANDLER,
 QDMA_CALLBACK_EPON_MAC_HANDLER,
 QDMA_CALLBACK_XPON_PHY_HANDLER,
} QDMA_CbType_t ;

typedef enum {
 QDMA_EVENT_RECV_PKTS = 0 ,
 QDMA_EVENT_NO_RX_BUFFER ,
 QDMA_EVENT_TX_CROWDED
} QDMA_EventType_t ;

typedef enum {
 QDMA_LOOPBACK_DISABLE = 0 ,
 QDMA_LOOPBACK_QDMA ,
 QDMA_LOOPBACK_UMAC
} QDMA_LoopbackMode_t ;

typedef enum {
 QDMA_TX_POLLING = 0 ,
 QDMA_TX_INTERRUPT ,
} QDMA_RecycleMode_t ;

typedef enum {
 QDMA_RX_POLLING = 0 ,
 QDMA_RX_INTERRUPT ,
 QDMA_RX_NAPI
} QDMA_RecvMode_t ;

typedef enum {
 QDMA_DISABLE = 0 ,
 QDMA_ENABLE
} QDMA_Mode_t ;

typedef enum {
 QDMA_WAN_TYPE_GPON = 0,
 QDMA_WAN_TYPE_EPON,
 QDMA_WAN_TYPE_PTM,
 QDMA_WAN_TYPE_SAR
} QDMA_WanType_t ;

typedef enum {
 QDMA_TXQOS_WEIGHT_BY_PACKET = 0,
 QDMA_TXQOS_WEIGHT_BY_BYTE,
} QDMA_TxQosWeightType_t ;

typedef enum {
 QDMA_TXQOS_WEIGHT_SCALE_64B = 0,
 QDMA_TXQOS_WEIGHT_SCALE_16B
} QDMA_TxQosWeightScale_t ;

typedef enum {
 QDMA_TXQOS_TYPE_WRR = 0,
 QDMA_TXQOS_TYPE_SP,
 QDMA_TXQOS_TYPE_SPWRR7,
 QDMA_TXQOS_TYPE_SPWRR6,
 QDMA_TXQOS_TYPE_SPWRR5,
 QDMA_TXQOS_TYPE_SPWRR4,
 QDMA_TXQOS_TYPE_SPWRR3,
 QDMA_TXQOS_TYPE_SPWRR2,
 QDMA_TXQOS_TYPE_NUMS
} QDMA_TxQosType_t ;

typedef enum {
 QDMA_TRTCM_SCALE_1BYTE = 0,
 QDMA_TRTCM_SCALE_2BYTE,
 QDMA_TRTCM_SCALE_4BYTE,
 QDMA_TRTCM_SCALE_8BYTE,
 QDMA_TRTCM_SCALE_16BYTE,
 QDMA_TRTCM_SCALE_32BYTE,
 QDMA_TRTCM_SCALE_64BYTE,
 QDMA_TRTCM_SCALE_128BYTE,
 QDMA_TRTCM_SCALE_256BYTE,
 QDMA_TRTCM_SCALE_512BYTE,
 QDMA_TRTCM_SCALE_1KBYTE,
 QDMA_TRTCM_SCALE_2KBYTE,
 QDMA_TRTCM_SCALE_4KBYTE,
 QDMA_TRTCM_SCALE_8KBYTE,
 QDMA_TRTCM_SCALE_16KBYTE,
 QDMA_TRTCM_SCALE_32KBYTE,
 QDMA_TRTCM_SCALE_MAX_ITEMS
} QDMA_TrtcmScale_t ;

typedef enum {
 QDMA_TRTCM_PARAM_CIR = 0,
 QDMA_TRTCM_PARAM_CBS,
 QDMA_TRTCM_PARAM_PIR,
 QDMA_TRTCM_PARAM_PBS
} QDMA_TrtcmParamType_t ;

typedef enum {
 QDMA_EPON_REPORT_WO_THRESHOLD = 0,
 QDMA_EPON_REPORT_ONE_THRESHOLD,
 QDMA_EPON_REPORT_TWO_THRESHOLD,
 QDMA_EPON_REPORT_THREE_THRESHOLD
} QDMA_EponReportMode_t ;

typedef enum {
 QDMA_TXQUEUE_SCALE_2_DSCP = 0,
 QDMA_TXQUEUE_SCALE_4_DSCP,
 QDMA_TXQUEUE_SCALE_8_DSCP,
 QDMA_TXQUEUE_SCALE_16_DSCP,
 QDMA_TXQUEUE_SCALE_ITEMS
} QDMA_TxQueueThresholdScale_t ;

typedef enum {
 PSE_PCP_TYPE_CDM_TX = 0,
 PSE_PCP_TYPE_CDM_RX,
 PSE_PCP_TYPE_GDM_RX
} PSE_PcpType_t ;

typedef enum {
 PSE_PCP_MODE_DISABLE = 0,
 PSE_PCP_MODE_8B0D = 1,
 PSE_PCP_MODE_7B1D = 2,
 PSE_PCP_MODE_6B2D = 4,
 PSE_PCP_MODE_5B3D = 8
} PSE_PcpMode_t ;




typedef int (*qdma_callback_xmit_finish_t)(void *, struct sk_buff *) ;
typedef int (*qdma_callback_recv_packet_t)(void *, uint, struct sk_buff *, uint) ;
typedef int (*qdma_callback_event_handler_t)(QDMA_EventType_t) ;
typedef void (*qdma_callback_int_handler_t)(void) ;




typedef struct {
 QDMA_RecvMode_t rxRecvMode ;
 QDMA_RecycleMode_t txRecycleMode ;
 unchar txRecycleThreshold ;
 unchar txIrqThreshold ;
 ushort txIrqPTime ;
 unchar rxDelayInt ;
 unchar rxDelayPTime ;
 qdma_callback_xmit_finish_t cbXmitFinish ;
 qdma_callback_recv_packet_t cbRecvPkts ;
 qdma_callback_event_handler_t cbEventHandler ;



 qdma_callback_int_handler_t cbPtmHandler ;
 qdma_callback_int_handler_t cbSarHandler ;
 qdma_callback_int_handler_t cbGponMacHandler ;
 qdma_callback_int_handler_t cbEponMacHandler ;
 qdma_callback_int_handler_t cbXponPhyHandler ;
} QDMA_InitCfg_t ;


typedef struct {
 QDMA_Mode_t mode ;
 unchar chnThreshold ;
 unchar totalThreshold ;
} QDMA_TxBufCtrl_T ;

typedef struct {
 unchar channel ;
 QDMA_TxQosType_t qosType ;
 struct {
  unchar weight ;
 } queue[8] ;
} QDMA_TxQosScheduler_T ;

typedef struct {
 unchar channel ;
 unchar queue ;
 unchar thrIdx ;
 ushort value ;
} QDMA_EponQueueThreshold_T ;

typedef struct {
 unchar channel ;
 ushort cir ;
 ushort cbs ;
 ushort pir ;
 ushort pbs ;
} QDMA_TrtcmParam_T ;

typedef struct {
 QDMA_TxQueueThresholdScale_t maxScale ;
 QDMA_TxQueueThresholdScale_t minScale ;
} QDMA_TxQueueCongestScale_T ;

typedef struct {
 unchar green ;
 unchar yellow ;
} QDMA_TxQueueDropProbability_T ;

typedef struct {
 unchar queueIdx ;
 unchar grnMaxThreshold ;
 unchar grnMinThreshold ;
 unchar ylwMaxThreshold ;
 unchar ylwMinThreshold ;
} QDMA_TxQueueCongestThreshold_T ;

typedef struct {
 QDMA_TxQueueThresholdScale_t maxScale ;
 QDMA_TxQueueThresholdScale_t minScale ;
 unchar grnDropProb ;
 unchar ylwDropProb ;
 struct {
  unchar grnMaxThreshold ;
  unchar grnMinThreshold ;
  unchar ylwMaxThreshold ;
  unchar ylwMinThreshold ;
 } queue[8] ;
} QDMA_TxQueueCongestCfg_T ;

typedef struct {
 unchar tsid ;
 ushort cirParamValue ;
 ushort cbsParamValue ;
 ushort pirParamValue ;
 ushort pbsParamValue ;
} QDMA_TxQueueTrtcm_T ;

typedef struct {
 unchar channel ;
 ushort cirParamValue ;
 ushort cbsParamValue ;
 ushort pirParamValue ;
 ushort pbsParamValue ;
} QDMA_TcontTrtcm_T ;
# 250 "/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_api.h"
int qdma_init(QDMA_InitCfg_t *pInitCfg) ;
# 259 "/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_api.h"
int qdma_deinit(void) ;
# 268 "/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_api.h"
void qdma_dma_mode(QDMA_Mode_t txMode, QDMA_Mode_t rxMode, QDMA_Mode_t hwFwdMode) ;






void qdma_loopback_mode(QDMA_LoopbackMode_t lbMode) ;
# 286 "/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_api.h"
int qdma_set_tx_delay(unchar txIrqThreshold, ushort txIrqPtime) ;
# 300 "/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_api.h"
int qdma_set_rx_delay(unchar rxMaxInt, unchar rxMaxPtime) ;
# 310 "/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_api.h"
int qdma_register_callback_function(QDMA_CbType_t type, void *pCbFun) ;






int qdma_unregister_callback_function(QDMA_CbType_t type) ;






int qdma_has_free_rxdscp(void) ;







int qdma_hook_receive_buffer(void *pMsg, uint msgLen, struct sk_buff *skb) ;






int qdma_recycle_receive_buffer(void) ;






void qdma_enable_rxpkt_int(void) ;






void qdma_disable_rxpkt_int(void) ;






int qdma_receive_packet_mode(QDMA_RecvMode_t rxMode) ;






int qdma_receive_packets(uint maxPkts) ;






int qdma_transmit_packet(void *pMsg, uint msgLen, struct sk_buff *skb) ;
# 386 "/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_api.h"
 int qdma_txdscp_recycle_mode(QDMA_RecycleMode_t txMode) ;
# 397 "/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_api.h"
 int qdma_txdscp_recycle(uint count) ;







int qdma_recycle_transmit_buffer(void) ;
# 416 "/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_api.h"
int qdma_set_tx_qos_weight(QDMA_TxQosWeightType_t weightBase, QDMA_TxQosWeightScale_t weightScale) ;
# 426 "/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_api.h"
int qdma_get_tx_qos_weight(QDMA_TxQosWeightType_t *pWeightBase, QDMA_TxQosWeightScale_t *pWeightScale) ;
# 437 "/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_api.h"
int qdma_set_tx_qos(QDMA_TxQosScheduler_T *pTxQos) ;
# 448 "/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_api.h"
int qdma_get_tx_qos(QDMA_TxQosScheduler_T *pTxQos) ;
# 462 "/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_api.h"
int qdma_set_txbuf_threshold(QDMA_TxBufCtrl_T *pTxBufCtrl) ;
# 471 "/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_api.h"
int qdma_set_epon_report_mode(unchar channel, QDMA_EponReportMode_t mode) ;







int qdma_get_epon_report_mode(unchar channel) ;
# 488 "/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_api.h"
int qdma_set_epon_queue_threshold(QDMA_EponQueueThreshold_T *pEponQThr) ;
# 497 "/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_api.h"
int qdma_get_epon_queue_threshold(QDMA_EponQueueThreshold_T *pEponQThr) ;







int qdma_set_channel_retire(uint channel) ;







int qdma_set_tx_channel_retire_mask(uint channel, QDMA_Mode_t maskMode) ;
# 523 "/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_api.h"
void qdma_set_prefetch_mode(QDMA_Mode_t prefecthMode) ;






void qdma_set_txqueue_trtcm_mode(QDMA_Mode_t trtcmMode) ;






QDMA_Mode_t qdma_get_txqueue_trtcm_mode(void) ;






void qdma_set_txqueue_dei_mode(QDMA_Mode_t deiDropMode) ;






QDMA_Mode_t qdma_get_txqueue_dei_mode(void) ;






void qdma_set_txqueue_threshold_mode(QDMA_Mode_t thrsldDropMode) ;






QDMA_Mode_t qdma_get_txqueue_threshold_mode(void) ;
# 575 "/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_api.h"
int qdma_set_congestion_scale(QDMA_TxQueueCongestScale_T *pScale) ;
# 586 "/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_api.h"
int qdma_set_congest_drop_probability(QDMA_TxQueueDropProbability_T *pProbability) ;
# 599 "/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_api.h"
int qdma_set_congest_threshold(QDMA_TxQueueCongestThreshold_T *pThreshold) ;






int qdma_get_congest_config(QDMA_TxQueueCongestCfg_T *pCongest) ;
# 617 "/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_api.h"
int qdma_set_txqueue_trtcm_scale(QDMA_TrtcmScale_t trtcmScale) ;






QDMA_TrtcmScale_t qdma_get_txqueue_trtcm_scale(void) ;
# 635 "/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_api.h"
int qdma_set_txqueue_trtcm_params(QDMA_TxQueueTrtcm_T *pTxQueueTrtcm) ;
# 644 "/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_api.h"
int qdma_get_txqueue_trtcm_params(QDMA_TxQueueTrtcm_T *pTxQueueTrtcm) ;







void qdma_set_gpon_trtcm_mode(QDMA_Mode_t trtcmMode) ;
# 662 "/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_api.h"
int qdma_set_gpon_trtcm_scale(QDMA_TrtcmScale_t trtcmScale) ;
# 674 "/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_api.h"
int qdma_set_gpon_trtcm_params(QDMA_TcontTrtcm_T *pTcontTrtcm) ;
# 683 "/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_api.h"
int qdma_get_gpon_trtcm_params(QDMA_TcontTrtcm_T *pTcontTrtcm) ;
# 692 "/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_api.h"
int qdma_pse_set_pcp_config(PSE_PcpType_t pcpType, PSE_PcpMode_t pcpMode) ;






PSE_PcpMode_t qdma_pse_get_pcp_config(PSE_PcpType_t pcpType) ;
# 9 "/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_bmgr.h" 2
# 18 "/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_bmgr.h"
typedef enum {
 DBG_ERR ,
 DBG_ST ,
 DBG_WARN ,
 DEG_MSG
} QDMA_DebugLevel_t ;
# 63 "/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_bmgr.h"
struct QDMA_DscpInfo_S {
 QDMA_DMA_DSCP_T *dscpPtr ;
 uint dscpIdx ;
 void *msgPtr ;
 struct sk_buff *skb ;
 struct QDMA_DscpInfo_S *next ;
} ;

typedef struct {
 struct {
  unchar isTxPolling :1 ;
  unchar isRxPolling :1 ;
  unchar isRxNapi :1 ;
  unchar isIsrRequest :1 ;
  unchar resv1 :4 ;
 } flags ;
 unchar txRecycleThreshold ;

 unchar txQueueTrtcmScale ;
 unchar gponTrtcmScale ;


 unchar dbgLevel ;


 unchar txDscpDoneBit ;
 unchar rxDscpDoneBit ;
 ushort waitTxMaxNums ;
 ushort countDown ;
 unchar rxMsgLens ;

 int (*bmXmitCallbackFunction)(void *, struct sk_buff *) ;
 int (*bmRecvCallbackFunction)(void *, uint, struct sk_buff *, uint) ;
 int (*bmEventCallbackFunction)(QDMA_EventType_t) ;



 void (*bmPtmIntHandler)(void) ;
 void (*bmSarIntHandler)(void) ;
 void (*bmGponMacIntHandler)(void) ;
 void (*bmEponMacIntHandler)(void) ;
 void (*bmXponPhyIntHandler)(void) ;
} BM_DevConfig_T ;


typedef struct {
 uint txCounts ;
 uint txRecycleCounts ;
 uint txQdmaDropCounts ;
 uint rxCounts ;
 ushort IrqQueueAsynchronous ;
 ushort txIrqQueueIdxErrs ;
 ushort txDscpIncorrect ;
 ushort txRecycleErrs ;
 ushort txDscpDoneErrs ;
 ushort rxDscpIncorrect ;
 ushort rxPktErrs ;
 ushort noTxCbErrs ;
 ushort noTxDscps ;
 ushort noRxCbErrs ;
 ushort noRxDscps ;
 ushort intRxCoherent ;
 ushort intTxCoherent ;
 ushort intIrqFull ;
 ushort intNoLinkDscp ;
 ushort intRxBuffOverrun ;
 ushort intTxBuffUnderrun ;
 ushort intNoRxBuff ;
 ushort intNoTxBuff ;
 ushort intNoRxDscp ;
 ushort intNoTxDscp ;
 uint intRxDone ;
 uint intTxDone ;
} BM_Counters_T ;


typedef struct {
 uint csrBaseAddr ;
 ushort txDscpNum ;
 ushort rxDscpNum ;
 ushort hwFwdDscpNum ;
 ushort irqDepth ;
 uint dscpInfoAddr ;
 uint irqQueueAddr ;
 uint hwFwdBaseAddr ;
 struct QDMA_DscpInfo_S *txHeadPtr ;
 struct QDMA_DscpInfo_S *txTailPtr ;
 struct QDMA_DscpInfo_S *txUsingPtr ;
 struct QDMA_DscpInfo_S *rxStartPtr ;
 struct QDMA_DscpInfo_S *rxEndPtr ;
 struct QDMA_DscpInfo_S *rxUsingPtr ;
 spinlock_t txLock ;
 spinlock_t rxLock ;
 spinlock_t irqLock ;
 struct tasklet_struct task ;
 BM_DevConfig_T devCfg ;
 BM_Counters_T counters ;
} QDMA_Private_T ;




int qdma_bm_receive_packets(uint maxPkts) ;
int qdma_bm_hook_receive_buffer(void *pMsg, uint msgLen, struct sk_buff *skb) ;
int qdma_bm_recycle_receive_buffer(void) ;
int qdma_bm_transmit_packet(void *pMsg, uint msgLen, struct sk_buff *skb) ;
int qdma_bm_transmit_done(int amount) ;
int qdma_bm_recycle_transmit_buffer(void) ;
int qdma_bm_tx_polling_mode(QDMA_Mode_t txMode, unchar txThreshold) ;



extern QDMA_Private_T *gpQdmaPriv ;
# 10 "/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_bmgr.c" 2

# 1 "/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_dvt.h" 1






typedef struct {

 uint resv1 : 24 ;
 uint channel : 4 ;
 uint queue : 4 ;







 uint resv2 : 10 ;
 uint fport : 3 ;
 uint resv3 : 19 ;





} QDMA_TxMsg_T ;

typedef struct {

 uint resv1 : 28 ;
 uint channel : 4 ;




 uint resv2 ;
 uint resv3 ;
 uint resv4 ;
} QDMA_RxMsg_T ;

typedef struct {
 uint tx_frames ;
 uint rx_frames ;
 uint rx_err_frames ;
} QDMA_DbgCounters_T ;






int qdma_dvt_init(void) ;
int qdma_dvt_deinit(void) ;
# 12 "/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_bmgr.c" 2
# 22 "/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_bmgr.c"
QDMA_Private_T *gpQdmaPriv = ((void *)0) ;







static inline __attribute__((always_inline)) void qdma_bm_add_rx_dscp(struct QDMA_DscpInfo_S *diPtr)
{
 if(!gpQdmaPriv->rxStartPtr) {
  gpQdmaPriv->rxStartPtr = diPtr ;
  diPtr->next = gpQdmaPriv->rxStartPtr ;
 } else {
  diPtr->next = gpQdmaPriv->rxStartPtr->next ;
  gpQdmaPriv->rxStartPtr->next = diPtr ;
  gpQdmaPriv->rxStartPtr = diPtr ;
 }
}



static inline __attribute__((always_inline)) struct QDMA_DscpInfo_S *qdma_bm_remove_rx_dscp(void)
{
 struct QDMA_DscpInfo_S *diPtr = ((void *)0) ;

 if(gpQdmaPriv->rxStartPtr) {
  diPtr = gpQdmaPriv->rxStartPtr->next ;

  if(gpQdmaPriv->rxStartPtr == diPtr) {
   gpQdmaPriv->rxStartPtr = ((void *)0) ;
  } else {
   gpQdmaPriv->rxStartPtr->next = diPtr->next ;
  }
 }

 return diPtr ;
}



static inline __attribute__((always_inline)) struct QDMA_DscpInfo_S *qdma_bm_get_unused_rx_dscp(void)
{
 struct QDMA_DscpInfo_S *diPtr = ((void *)0) ;
 ulong flags ;

 do { do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); flags = _raw_spin_lock_irqsave(spinlock_check(&gpQdmaPriv->rxLock)); } while (0); } while (0) ;
 if(gpQdmaPriv->rxStartPtr) {
  if(!gpQdmaPriv->rxEndPtr) {
   diPtr = gpQdmaPriv->rxStartPtr ;
   gpQdmaPriv->rxEndPtr = diPtr ;
  } else if(gpQdmaPriv->rxEndPtr->next != gpQdmaPriv->rxStartPtr) {
   diPtr = gpQdmaPriv->rxEndPtr->next ;
   gpQdmaPriv->rxEndPtr = diPtr ; ;
  }
 }
 spin_unlock_irqrestore(&gpQdmaPriv->rxLock, flags) ;

 return diPtr ;
}



int qdma_bm_receive_packets(uint maxPkts)
{



 QDMA_DMA_DSCP_T rxDscp ;

 struct QDMA_DscpInfo_S dscpInfo ;
 ulong flags ;
 uint cnt = maxPkts ;
 uint pktCount = 0 ;

 do {
# 143 "/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_bmgr.c"
  do { do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); flags = _raw_spin_lock_irqsave(spinlock_check(&gpQdmaPriv->rxLock)); } while (0); } while (0) ;
  if(!gpQdmaPriv->rxStartPtr || gpQdmaPriv->rxStartPtr==gpQdmaPriv->rxEndPtr || !gpQdmaPriv->rxStartPtr->dscpPtr->ctrl.done) {
   goto ret ;
  }
  memcpy(&rxDscp, gpQdmaPriv->rxStartPtr->dscpPtr, sizeof(QDMA_DMA_DSCP_T)) ;
  memcpy(&dscpInfo, gpQdmaPriv->rxStartPtr, sizeof(struct QDMA_DscpInfo_S)) ;

  gpQdmaPriv->rxStartPtr = gpQdmaPriv->rxStartPtr->next ;
  spin_unlock_irqrestore(&gpQdmaPriv->rxLock, flags) ;

  pktCount++ ;


  if(!rxDscp.msg_addr || !rxDscp.ctrl.msg_len || !rxDscp.pkt_addr || !rxDscp.ctrl.pkt_len) {
   printk("%s [%d]: " "The content of the RX DSCP is incorrect.\n", strrchr("/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_bmgr.c", '/')+1, 157) ;
   gpQdmaPriv->counters.rxDscpIncorrect++ ;
   break ;
  }
# 169 "/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_bmgr.c"
  dma_unmap_single(((void *)0), rxDscp.msg_addr, rxDscp.ctrl.msg_len, DMA_FROM_DEVICE) ;

  dma_unmap_single(((void *)0), rxDscp.pkt_addr, skb_tailroom(dscpInfo.skb), DMA_FROM_DEVICE) ;

  if(gpQdmaPriv->devCfg.bmRecvCallbackFunction) {
   if(gpQdmaPriv->devCfg.bmRecvCallbackFunction(dscpInfo.msgPtr, rxDscp.ctrl.msg_len, dscpInfo.skb, rxDscp.ctrl.pkt_len)) {
    gpQdmaPriv->counters.rxPktErrs++ ;
   } else {
    gpQdmaPriv->counters.rxCounts++ ;
   }
  } else {
   gpQdmaPriv->counters.noRxCbErrs++ ;
  }

 } while((!maxPkts) || (--cnt)) ;

 return pktCount ;

ret:
 spin_unlock_irqrestore(&gpQdmaPriv->rxLock, flags);
 return pktCount ;
}



int qdma_bm_hook_receive_buffer(void *pMsg, uint msgLen, struct sk_buff *skb)
{
 struct QDMA_DscpInfo_S *pNewDscpInfo ;
 QDMA_DMA_DSCP_T *pRxDscp ;
 dma_addr_t dmaPktAddr ;
 uint base = gpQdmaPriv->csrBaseAddr ;
 ulong flags ;
 int ret = 0 ;




 if(!pMsg || msgLen<=0 || !skb) {

  printk("%s [%d]: " "The input arguments are wrong, pMsg:%.8x, msgLen:%d, skb:%.8x, skbLen:%d.\n", strrchr("/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_bmgr.c", '/')+1, 208, (uint)pMsg, msgLen, (uint)skb, skb_tailroom(skb)) ;
  return -14 ;
 }

 pNewDscpInfo = qdma_bm_get_unused_rx_dscp() ;
 if(pNewDscpInfo == ((void *)0)) {
  printk("%s [%d]: " "There is not any free RX DSCP.\n", strrchr("/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_bmgr.c", '/')+1, 214) ;
  gpQdmaPriv->counters.noRxDscps++ ;
  return -12 ;
 }


 { if(gpQdmaPriv->devCfg.dbgLevel >= DEG_MSG) printk("%s [%d]: " "Adjust the skb->tail location for net IP alignment\n", strrchr("/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_bmgr.c", '/')+1, 220) ; } ;
 if(((uint)skb->tail & 3) == 0) {
  skb_reserve(skb, 2) ;
 }
 dmaPktAddr = dma_map_single(((void *)0), (void *)((uint)skb->tail-2), (size_t)skb_tailroom(skb), DMA_FROM_DEVICE) ;




 do { do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); flags = _raw_spin_lock_irqsave(spinlock_check(&gpQdmaPriv->rxLock)); } while (0); } while (0) ;
 pRxDscp = gpQdmaPriv->rxUsingPtr->dscpPtr ;



 pRxDscp->msg_addr = dma_map_single(((void *)0), pMsg, (size_t)msgLen, DMA_FROM_DEVICE) ;

 pRxDscp->pkt_addr = dmaPktAddr ;
 pRxDscp->next_idx = pNewDscpInfo->dscpIdx ;
 pRxDscp->ctrl.msg_len = msgLen ;
 pRxDscp->ctrl.pkt_len = skb_tailroom(skb) ;

 pRxDscp->ctrl.done = gpQdmaPriv->devCfg.rxDscpDoneBit ;
# 251 "/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_bmgr.c"
 { if(gpQdmaPriv->devCfg.dbgLevel >= DEG_MSG) printk("%s [%d]: " "Hook RX DSCP to RXDMA. RX_CPU_IDX:%.8x, RX_NULL_IDX:%.8x\n", strrchr("/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_bmgr.c", '/')+1, 251, gpQdmaPriv->rxUsingPtr->dscpIdx, pNewDscpInfo->dscpIdx) ; } ;
 { if(gpQdmaPriv->devCfg.dbgLevel >= DEG_MSG) printk("%s [%d]: " "RXDSCP: DONE:%d, MSG:%.8x, MSGLEN:%d, PKT:%.8x, PKTLEN:%d, NEXT_IDX:%d\n", strrchr("/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_bmgr.c", '/')+1, 258, (uint)pRxDscp->ctrl.done, (uint)pRxDscp->msg_addr, (uint)pRxDscp->ctrl.msg_len, (uint)pRxDscp->pkt_addr, (uint)pRxDscp->ctrl.pkt_len, (uint)pRxDscp->next_idx) ; } ;







 gpQdmaPriv->rxUsingPtr->msgPtr = (void *)pMsg ;
 gpQdmaPriv->rxUsingPtr->skb = skb ;
 gpQdmaPriv->rxUsingPtr = pNewDscpInfo ;

 __asm__ __volatile__( ".set	push\n\t" ".set	noreorder\n\t" ".set	mips2\n\t" "sync\n\t" ".set	pop" : : : "memory") ;


 { uint t = ioread32((void *)((base+0x0018))); iowrite32(((t&~((0xFFF<<(0))))|((pNewDscpInfo->dscpIdx<<(0))&(0xFFF<<(0)))), (void *)((base+0x0018))); } ;
 spin_unlock_irqrestore(&gpQdmaPriv->rxLock, flags) ;

 return ret ;
}



int qdma_bm_recycle_receive_buffer(void)
{
 QDMA_DMA_DSCP_T *pRxDscp ;
 struct QDMA_DscpInfo_S *diPtr ;
 uint base = gpQdmaPriv->csrBaseAddr ;
 ulong flags ;

 if(!gpQdmaPriv->rxStartPtr || !gpQdmaPriv->rxEndPtr) {
  return -14 ;
 }

 do { do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); flags = _raw_spin_lock_irqsave(spinlock_check(&gpQdmaPriv->rxLock)); } while (0); } while (0) ;

 while(gpQdmaPriv->rxStartPtr != gpQdmaPriv->rxEndPtr) {
  diPtr = gpQdmaPriv->rxStartPtr ;
  pRxDscp = gpQdmaPriv->rxStartPtr->dscpPtr ;

  if( diPtr->skb && pRxDscp->pkt_addr) {

   dma_unmap_single(((void *)0), pRxDscp->msg_addr, pRxDscp->ctrl.msg_len, DMA_FROM_DEVICE) ;

   dma_unmap_single(((void *)0), pRxDscp->pkt_addr, skb_tailroom(diPtr->skb), DMA_FROM_DEVICE) ;

   if(gpQdmaPriv->devCfg.bmRecvCallbackFunction) {
    gpQdmaPriv->devCfg.bmRecvCallbackFunction(diPtr->msgPtr, pRxDscp->ctrl.msg_len, diPtr->skb, pRxDscp->ctrl.pkt_len) ;
   }
  }

  gpQdmaPriv->rxStartPtr = diPtr->next ;
 }

 diPtr = gpQdmaPriv->rxStartPtr ;
 gpQdmaPriv->rxUsingPtr = diPtr ;
 { uint t = ioread32((void *)((base+0x0018))); iowrite32(((t&~((0xFFF<<(0))))|((diPtr->dscpIdx<<(0))&(0xFFF<<(0)))), (void *)((base+0x0018))); } ;
 { uint t = ioread32((void *)((base+0x001C))); iowrite32(((t&~((0xFFF<<(0))))|((diPtr->dscpIdx<<(0))&(0xFFF<<(0)))), (void *)((base+0x001C))); } ;

 spin_unlock_irqrestore(&gpQdmaPriv->rxLock, flags) ;

 return 0 ;
}






static inline __attribute__((always_inline)) int qdma_bm_push_tx_dscp(struct QDMA_DscpInfo_S *diPtr)
{
 if(diPtr->next != ((void *)0)) {
  printk("%s [%d]: " "The TX DSCP is not return from tx used pool\n", strrchr("/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_bmgr.c", '/')+1, 324) ;
  return -1 ;
 }

 diPtr->msgPtr = ((void *)0) ;
 diPtr->skb = ((void *)0) ;

 if(!gpQdmaPriv->txHeadPtr) {
  gpQdmaPriv->txHeadPtr = diPtr ;
  gpQdmaPriv->txTailPtr = diPtr ;
 } else {
  gpQdmaPriv->txTailPtr->next = diPtr ;
  gpQdmaPriv->txTailPtr = gpQdmaPriv->txTailPtr->next ;
 }

 return 0 ;
}




static inline __attribute__((always_inline)) struct QDMA_DscpInfo_S *qdma_bm_pop_tx_dscp(void)
{
 struct QDMA_DscpInfo_S *diPtr ;
 ulong flags ;

 do { do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); flags = _raw_spin_lock_irqsave(spinlock_check(&gpQdmaPriv->txLock)); } while (0); } while (0);
 diPtr = gpQdmaPriv->txHeadPtr ;
 if(gpQdmaPriv->txHeadPtr == gpQdmaPriv->txTailPtr) {
  gpQdmaPriv->txHeadPtr = ((void *)0) ;
  gpQdmaPriv->txTailPtr = ((void *)0) ;
 } else {
  gpQdmaPriv->txHeadPtr = gpQdmaPriv->txHeadPtr->next ;
 }
 spin_unlock_irqrestore(&gpQdmaPriv->txLock, flags);

 if(diPtr) {
  diPtr->next = ((void *)0) ;
 }

 return diPtr ;
}



int qdma_bm_transmit_done(int amount)
{



 QDMA_DMA_DSCP_T txDscp ;

 int ret = 0 ;
 struct QDMA_DscpInfo_S *diPtr ;
 uint base = gpQdmaPriv->csrBaseAddr ;
 uint entryLen, headIdx, irqValue=0, irqDepth=(512) ;
 uint *irqPtr ;
 int i=0, j, idx = 0 ;
 uint RETRY=3 ;
 ulong flags ;
 uint irqStatus ;

 do { do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); flags = _raw_spin_lock_irqsave(spinlock_check(&gpQdmaPriv->txLock)); } while (0); } while (0) ;

 irqStatus = ioread32((void *)((base+0x006C))) ;
 headIdx = (irqStatus & (0xFFF<<(0))) >> (0) ;
 entryLen = (irqStatus & (0xFFF<<(16))) >> (16) ;
 if(entryLen == 0) {
  goto out2 ;
 }

 entryLen = (amount && amount<entryLen) ? amount : entryLen ;
 for(i=0 ; i<entryLen ; i++) {
  irqPtr = (uint *)gpQdmaPriv->irqQueueAddr + ((headIdx+i)%irqDepth) ;

  RETRY = 3 ;
  while(RETRY--) {
   irqValue = *irqPtr ;
   if(irqValue == (0xFFFFFFFF)) {
    printk("%s [%d]: " "There is no data available in IRQ queue. irq value:%.8x, irq ptr:%.8x TIMEs:%d\n", strrchr("/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_bmgr.c", '/')+1, 403, (uint)irqValue, (uint)irqPtr, RETRY) ;
    if(RETRY <= 0) {
     gpQdmaPriv->counters.IrqQueueAsynchronous++ ;
     ret = -61 ;
     goto out1 ;
    }
   } else {
    *irqPtr = (0xFFFFFFFF) ;
    break ;
   }
  }

  idx = (irqValue & 0xFFF) ;
  if(idx<0 || idx>=gpQdmaPriv->txDscpNum) {
   printk("%s [%d]: " "The TX DSCP index %d is invalid.\n", strrchr("/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_bmgr.c", '/')+1, 417, idx) ;
   gpQdmaPriv->counters.txIrqQueueIdxErrs++ ;
   ret = -14 ;
   continue ;
  }

  diPtr = (struct QDMA_DscpInfo_S *)gpQdmaPriv->dscpInfoAddr + idx ;
  if(diPtr->dscpIdx!=idx || diPtr->next!=((void *)0)) {
   printk("%s [%d]: " "The content of the TX DSCP_INFO(%.8x) is incorrect. ENTRY_LEN:%d, HEAD_IDX:%d, IRQ_VALUE:%.8x.\n", strrchr("/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_bmgr.c", '/')+1, 425, (uint)diPtr, entryLen, headIdx, irqValue) ;
   gpQdmaPriv->counters.txDscpIncorrect++ ;
   ret = -14 ;
   continue ;
  }
# 462 "/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_bmgr.c"
  memcpy(&txDscp, diPtr->dscpPtr, sizeof(QDMA_DMA_DSCP_T)) ;


  if(txDscp.ctrl.drop_pkt) {
   gpQdmaPriv->counters.txQdmaDropCounts++ ;
  } else

  {

   if(!txDscp.ctrl.done) {
    printk("%s [%d]: " "The done bit of TX DSCP is incorrect. ADDR:%.8x, IDX:%d.\n", strrchr("/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_bmgr.c", '/')+1, 472, (uint)diPtr->dscpPtr, diPtr->dscpIdx) ;
    gpQdmaPriv->counters.txDscpDoneErrs++ ;
    ret = -14 ;
    continue ;
   }

  }


  if(txDscp.msg_addr) {
   dma_unmap_single(((void *)0), txDscp.msg_addr, txDscp.ctrl.msg_len, DMA_TO_DEVICE) ;
  }

  if(txDscp.pkt_addr) {
   dma_unmap_single(((void *)0), txDscp.pkt_addr, txDscp.ctrl.pkt_len, DMA_TO_DEVICE) ;
  }


  if(gpQdmaPriv->devCfg.bmXmitCallbackFunction) {
   if(gpQdmaPriv->devCfg.bmXmitCallbackFunction(diPtr->msgPtr, diPtr->skb) != 0) {
    gpQdmaPriv->counters.txRecycleErrs++ ;
   } else {
    gpQdmaPriv->counters.txRecycleCounts++ ;
   }
  } else {
   gpQdmaPriv->counters.noTxCbErrs++ ;
  }

  qdma_bm_push_tx_dscp(diPtr) ;
 }

out1:
 for(j=0 ; j<(i>>7) ; j++) {
  { uint t = ioread32((void *)((base+0x0068))); iowrite32(((t&~((0xFF<<(0))))|((0x80<<(0))&(0xFF<<(0)))), (void *)((base+0x0068))); } ;
 }
 { uint t = ioread32((void *)((base+0x0068))); iowrite32(((t&~((0xFF<<(0))))|(((i&0x7F)<<(0))&(0xFF<<(0)))), (void *)((base+0x0068))); } ;

out2:
 spin_unlock_irqrestore(&gpQdmaPriv->txLock, flags) ;
 return ret ;
}



int qdma_bm_transmit_packet(void *pMsg, uint msgLen, struct sk_buff *skb)
{
 struct QDMA_DscpInfo_S *pNewDscpInfo ;
 QDMA_DMA_DSCP_T *pTxDscp ;
 uint base = gpQdmaPriv->csrBaseAddr ;
 ulong flags ;
 int ret = 0 ;
 int a ;




 if(!pMsg || msgLen<=0 || msgLen>16 || !skb || skb->len<=0 || skb->len>(2000))

 {
  printk("%s [%d]: " "The input arguments are wrong, pMsg:%.8x, msgLen:%d, skb:%.8x, skbLen:%d.\n", strrchr("/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_bmgr.c", '/')+1, 531, (uint)pMsg, msgLen, (uint)skb, skb->len) ;
  return -14 ;
 }
# 545 "/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_bmgr.c"
 pNewDscpInfo = qdma_bm_pop_tx_dscp() ;
 if(pNewDscpInfo == ((void *)0)) {
  gpQdmaPriv->counters.noTxDscps++ ;
  return -63 ;
 }

 do { do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); flags = _raw_spin_lock_irqsave(spinlock_check(&gpQdmaPriv->txLock)); } while (0); } while (0);
 pTxDscp = gpQdmaPriv->txUsingPtr->dscpPtr ;
# 565 "/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_bmgr.c"
 pTxDscp->msg_addr = dma_map_single(((void *)0), pMsg, (size_t)msgLen, DMA_TO_DEVICE) ;

 pTxDscp->next_idx = pNewDscpInfo->dscpIdx ;
 pTxDscp->pkt_addr = dma_map_single(((void *)0), skb->data, skb->len , DMA_TO_DEVICE) ;
 pTxDscp->ctrl.msg_len = msgLen ;
 pTxDscp->ctrl.pkt_len = skb->len ;

 pTxDscp->ctrl.done = gpQdmaPriv->devCfg.txDscpDoneBit ;



 pTxDscp->ctrl.no_drop = (skb->mark&0x00000001) ? 1 : 0 ;






 { if(gpQdmaPriv->devCfg.dbgLevel >= DEG_MSG) printk("%s [%d]: " "Hook TX DSCP to TXDMA. TX_CPU_IDX:%d, TX_NULL_IDX:%d\n", strrchr("/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_bmgr.c", '/')+1, 583, gpQdmaPriv->txUsingPtr->dscpIdx, pNewDscpInfo->dscpIdx) ; } ;
 { if(gpQdmaPriv->devCfg.dbgLevel >= DEG_MSG) printk("%s [%d]: " "TXDSCP: DONE:%d, MSG:%.8x, MSGLEN:%d, PKT:%.8x, PKTLEN:%d, NEXT_IDX:%d\n", strrchr("/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_bmgr.c", '/')+1, 590, (uint)pTxDscp->ctrl.done, (uint)pTxDscp->msg_addr, (uint)pTxDscp->ctrl.msg_len, (uint)pTxDscp->pkt_addr, (uint)pTxDscp->ctrl.pkt_len, (uint)pTxDscp->next_idx) ; } ;







 gpQdmaPriv->txUsingPtr->msgPtr = (void *)pMsg ;
 gpQdmaPriv->txUsingPtr->skb = skb ;
 gpQdmaPriv->txUsingPtr = pNewDscpInfo ;

 __asm__ __volatile__( ".set	push\n\t" ".set	noreorder\n\t" ".set	mips2\n\t" "sync\n\t" ".set	pop" : : : "memory") ;


 gpQdmaPriv->devCfg.countDown-- ;
 if(!gpQdmaPriv->devCfg.countDown) {
  { uint t = ioread32((void *)((base+0x0010))); iowrite32(((t&~((0xFFF<<(0))))|((pNewDscpInfo->dscpIdx<<(0))&(0xFFF<<(0)))), (void *)((base+0x0010))); } ;
  gpQdmaPriv->devCfg.countDown = (gpQdmaPriv->devCfg.waitTxMaxNums) ? (gpQdmaPriv->devCfg.waitTxMaxNums) : ((random32()%(gpQdmaPriv->txDscpNum-1))+1) ;
 }




 gpQdmaPriv->counters.txCounts++ ;
 spin_unlock_irqrestore(&gpQdmaPriv->txLock, flags);

 { if(gpQdmaPriv->devCfg.dbgLevel >= DEG_MSG) printk("%s [%d]: " "GLG:%.8x, IRQStatus:%.8x, CSR info: RX_CPU_IDX:%d, RX_DMA_IDX:%d, TX_CPU_IDX:%d, TX_DMA_IDX:%d\n", strrchr("/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_bmgr.c", '/')+1, 617, ioread32((void *)((base+0x0004))), ioread32((void *)((base+0x006C))), ((ioread32((void *)((base+0x0018))) & (0xFFF<<(0))) >> (0)), ((ioread32((void *)((base+0x001C))) & (0xFFF<<(0))) >> (0)), ((ioread32((void *)((base+0x0010))) & (0xFFF<<(0))) >> (0)), ((ioread32((void *)((base+0x0014))) & (0xFFF<<(0))) >> (0))) ; } ;






 return ret ;
}



int qdma_bm_recycle_transmit_buffer(void)
{
 struct QDMA_DscpInfo_S *diPtr ;
 QDMA_DMA_DSCP_T *pTxDscp ;
 uint base = gpQdmaPriv->csrBaseAddr ;
 ulong flags ;
 int i ;

 do { do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); flags = _raw_spin_lock_irqsave(spinlock_check(&gpQdmaPriv->txLock)); } while (0); } while (0) ;

 for(i=0 ; i<gpQdmaPriv->txDscpNum ; i++) {
  diPtr = (struct QDMA_DscpInfo_S *)gpQdmaPriv->dscpInfoAddr + i ;
  if(diPtr->next==((void *)0) && diPtr!=gpQdmaPriv->txTailPtr && diPtr!=gpQdmaPriv->txUsingPtr) {
   pTxDscp = diPtr->dscpPtr ;

   if( diPtr->skb && pTxDscp->pkt_addr) {

    dma_unmap_single(((void *)0), pTxDscp->msg_addr, pTxDscp->ctrl.msg_len, DMA_TO_DEVICE) ;

    dma_unmap_single(((void *)0), pTxDscp->pkt_addr, pTxDscp->ctrl.pkt_len, DMA_TO_DEVICE) ;

    if(gpQdmaPriv->devCfg.bmXmitCallbackFunction) {
     gpQdmaPriv->devCfg.bmXmitCallbackFunction(diPtr->msgPtr, diPtr->skb) ;
    }
   }

   qdma_bm_push_tx_dscp(diPtr) ;
  }
 }

 spin_unlock_irqrestore(&gpQdmaPriv->txLock, flags) ;

 diPtr = gpQdmaPriv->txUsingPtr ;
 { uint t = ioread32((void *)((base+0x0010))); iowrite32(((t&~((0xFFF<<(0))))|((diPtr->dscpIdx<<(0))&(0xFFF<<(0)))), (void *)((base+0x0010))); } ;
 { uint t = ioread32((void *)((base+0x0014))); iowrite32(((t&~((0xFFF<<(0))))|((diPtr->dscpIdx<<(0))&(0xFFF<<(0)))), (void *)((base+0x0014))); } ;

 return 0 ;
}






static void __dump_csr(void)
{
 uint base = gpQdmaPriv->csrBaseAddr ;
# 709 "/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_bmgr.c"
 printk("0x0000: QDMA_CSR_INFO                           :%.8x\n", ioread32((void *)((base+0x0000)))) ;
 printk("0x0004: QDMA_CSR_GLB_CFG                        :%.8x\n", ioread32((void *)((base+0x0004)))) ;
 printk("0x0008: QDMA_CSR_TX_DSCP_BASE	                :%.8x\n", ioread32((void *)((base+0x0008)))) ;
 printk("0x000C: QDMA_CSR_RX_DSCP_BASE	                :%.8x\n", ioread32((void *)((base+0x000C)))) ;
 printk("0x0010: QDMA_CSR_TX_CPU_IDX                     :%.8x\n", ioread32((void *)((base+0x0010)))) ;
 printk("0x0014: QDMA_CSR_TX_DMA_IDX                     :%.8x\n", ioread32((void *)((base+0x0014)))) ;
 printk("0x0018: QDMA_CSR_RX_CPU_IDX                     :%.8x\n", ioread32((void *)((base+0x0018)))) ;
 printk("0x001C: QDMA_CSR_RX_DMA_IDX                     :%.8x\n", ioread32((void *)((base+0x001C)))) ;
 printk("0x0020: QDMA_CSR_HWFWD_DSCP_BASE                :%.8x\n", ioread32((void *)((base+0x0020)))) ;
 printk("0x0024: QDMA_CSR_HWFWD_TX_IDX                   :%.8x\n", ioread32((void *)((base+0x0024)))) ;
 printk("0x0028: QDMA_CSR_HWFWD_RX_IDX                   :%.8x\n", ioread32((void *)((base+0x0028)))) ;
 printk("0x002C: QDMA_CSR_HWFWD_FREE_IDX                 :%.8x\n", ioread32((void *)((base+0x002C)))) ;
 printk("0x0030: QDMA_CSR_HWFWD_AVAIL_DSCP_NUM           :%.8x\n", ioread32((void *)((base+0x0030)))) ;
 printk("0x0034: QDMA_CSR_HWFWD_USED_DSCP_NUM	        :%.8x\n", ioread32((void *)((base+0x0034)))) ;
 printk("0x0040: QDMA_CSR_LMGR_CHNL_RETIRE               :%.8x\n", ioread32((void *)((base+0x0040)))) ;
 printk("0x0044: QDMA_CSR_LMGR_CHNL_RETIRE_MASK          :%.8x\n", ioread32((void *)((base+0x0044)))) ;
 printk("0x0050: QDMA_CSR_INT_STATUS                     :%.8x\n", ioread32((void *)((base+0x0050)))) ;
 printk("0x0054: QDMA_CSR_INT_ENABLE                     :%.8x\n", ioread32((void *)((base+0x0054)))) ;
 printk("0x0058: QDMA_CSR_DELAY_INT_CFG                  :%.8x\n", ioread32((void *)((base+0x0058)))) ;
 printk("0x0060: QDMA_CSR_IRQ_BASE    	                :%.8x\n", ioread32((void *)((base+0x0060)))) ;
 printk("0x0064: QDMA_CSR_IRQ_CFG    	                :%.8x\n", ioread32((void *)((base+0x0064)))) ;
 printk("0x0068: QDMA_CSR_IRQ_CLEAR_LEN                  :%.8x\n", ioread32((void *)((base+0x0068)))) ;
 printk("0x006C: QDMA_CSR_IRQ_STATUS	                    :%.8x\n", ioread32((void *)((base+0x006C)))) ;
 printk("0x0070: QDMA_CSR_IRQ_PTIME		                :%.8x\n", ioread32((void *)((base+0x0070)))) ;
 printk("0x0080: QDMA_CSR_TXQOS_CHN07_CFG		        :%.8x\n", ioread32((void *)((base+0x0080)))) ;
 printk("0x0084: QDMA_CSR_TXQOS_CHN815_CFG	            :%.8x\n", ioread32((void *)((base+0x0084)))) ;
 printk("0x0088: QDMA_CSR_TXQOS_WRR_CFG		            :%.8x\n", ioread32((void *)((base+0x0088)))) ;
 printk("0x008C: QDMA_CSR_TXDMA_PREFETCH_CFG	            :%.8x\n", ioread32((void *)((base+0x008C)))) ;
 printk("0x0090: QDMA_CSR_TXBUF_THR_CFG		            :%.8x\n", ioread32((void *)((base+0x0090)))) ;
 printk("0x00A0: QDMA_CSR_TXQ_CNGST_CFG		            :%.8x\n", ioread32((void *)((base+0x00A0)))) ;
 printk("0x00A4: QDMA_CSR_TXQ_GRN_MAX_THRSHLD            :%.8x\n", ioread32((void *)((base+0x00A4)))) ;
 printk("0x00A8: QDMA_CSR_TXQ_GRN_MIN_THRSHLD            :%.8x\n", ioread32((void *)((base+0x00A8)))) ;
 printk("0x00AC: QDMA_CSR_TXQ_YLW_MAX_THRSHLD            :%.8x\n", ioread32((void *)((base+0x00AC)))) ;
 printk("0x00B0: QDMA_CSR_TXQ_YLW_MIN_THRSHLD            :%.8x\n", ioread32((void *)((base+0x00B0)))) ;
 printk("0x00B4: QDMA_CSR_TRTCM_CFG	                    :%.8x\n", ioread32((void *)((base+0x00B4)))) ;
 printk("0x00C0: QDMA_CSR_GPON_TCONT_COLOR_CFG           :%.8x\n", ioread32((void *)((base+0x00C0)))) ;
 printk("0x00C4: QDMA_CSR_GPON_TCONT_TRTCM_CFG           :%.8x\n", ioread32((void *)((base+0x00C4)))) ;
 printk("0x00D0: QDMA_CSR_EPON_RPT_CFG                   :%.8x\n", ioread32((void *)((base+0x00D0)))) ;
 printk("0x00D4: QDMA_CSR_EPON_QTHRESHLD_CFG             :%.8x\n", ioread32((void *)((base+0x00D4)))) ;
 printk("0x0100: QDMA_CSR_DBG_TX_CPU_DSCP_STAT           :%.8x\n", ioread32((void *)((base+0x0100)))) ;
 printk("0x0104: QDMA_CSR_DBG_TX_CPU_PKT_STAT            :%.8x\n", ioread32((void *)((base+0x0104)))) ;
 printk("0x0108: QDMA_CSR_DBG_TX_FWD_DSCP_STAT           :%.8x\n", ioread32((void *)((base+0x0108)))) ;
 printk("0x010C: QDMA_CSR_DBG_TX_FWD_PKT_STAT            :%.8x\n", ioread32((void *)((base+0x010C)))) ;
 printk("0x0110: QDMA_CSR_DBG_RX_CPU_PKT_STAT            :%.8x\n", ioread32((void *)((base+0x0110)))) ;
 printk("0x0114: QDMA_CSR_DBG_RX_FWD_PKT_STAT            :%.8x\n", ioread32((void *)((base+0x0114)))) ;
 printk("0x0118: QDMA_CSR_DBG_LMGR_STA      	            :%.8x\n", ioread32((void *)((base+0x0118)))) ;
 printk("0x011C: QDMA_CSR_DBG_QDMA_STATUS                :%.8x\n", ioread32((void *)((base+0x011C)))) ;
 printk("0x0120: QDMA_CSR_DBG_RCDROP_FWD_GREEN_STAT	    :%.8x\n", ioread32((void *)((base+0x0120)))) ;
 printk("0x0124: QDMA_CSR_DBG_RCDROP_FWD_YELLOW_STAT     :%.8x\n", ioread32((void *)((base+0x0124)))) ;
 printk("0x0128: QDMA_CSR_DBG_RCDROP_FWD_RED_STAT        :%.8x\n", ioread32((void *)((base+0x0128)))) ;
 printk("0x012C: QDMA_CSR_DBG_RCDROP_CPU_GREEN_STAT	    :%.8x\n", ioread32((void *)((base+0x012C)))) ;
 printk("0x0130: QDMA_CSR_DBG_RCDROP_CPU_YELLOW_STAT     :%.8x\n", ioread32((void *)((base+0x0130)))) ;
 printk("0x0134: QDMA_CSR_DBG_RCDROP_CPU_RED_STAT        :%.8x\n", ioread32((void *)((base+0x0134)))) ;
 printk("0x0138: QDMA_CSR_DBG_RETDROP_STAT               :%.8x\n", ioread32((void *)((base+0x0138)))) ;

}



static void __dump_dscp(void)
{
 struct QDMA_DscpInfo_S *diPtr ;
 int i, idx=1 ;

 idx = 1 ;
 diPtr = gpQdmaPriv->txHeadPtr ;
 printk("Unused Tx DSCP Link List:\n") ;





 while(diPtr) {
  printk("%d: DSCP Idx:%d, DSCP Ptr:%.8x, Done Bit:%d\n", idx, diPtr->dscpIdx,
                (uint)diPtr->dscpPtr,
                diPtr->dscpPtr->ctrl.done) ;
  diPtr = diPtr->next ;
  idx++ ;
 }

 idx = 1 ;
 printk("\nUsing Tx DSCP Set:\n") ;
 for(i=0 ; i<gpQdmaPriv->txDscpNum ; i++) {
  diPtr = (struct QDMA_DscpInfo_S *)gpQdmaPriv->dscpInfoAddr + i ;
  if(diPtr->next == ((void *)0) && diPtr!=gpQdmaPriv->txTailPtr) {
   printk("%d: DSCP Idx:%d, DSCP Ptr:%.8x, Done Bit:%d, MsgLen:%d, MsgAddr:%.8x(%.8x), PktLen:%d, PktAddr:%.8x(%.8x), Next Idx:%d\n",
                idx, diPtr->dscpIdx,
                (uint)diPtr->dscpPtr,
                diPtr->dscpPtr->ctrl.done,
                diPtr->dscpPtr->ctrl.msg_len,
                (uint)diPtr->msgPtr,
                (uint)diPtr->dscpPtr->msg_addr,
                diPtr->dscpPtr->ctrl.pkt_len,
                (uint)diPtr->skb,
                (uint)diPtr->dscpPtr->pkt_addr,
                diPtr->dscpPtr->next_idx) ;
   idx++ ;
  }

  if((i&0xFF) == 0xFF) {
   msleep(0) ;
  }
 }

 idx = 1 ;
 diPtr = gpQdmaPriv->rxStartPtr ;
 printk("\nRx DSCP Ring: RxStartIdx:%d, RxEndIdx:%d\n", gpQdmaPriv->rxStartPtr->dscpIdx, gpQdmaPriv->rxEndPtr->dscpIdx) ;
 do {
  if(diPtr) {
   printk("%d: DSCP Idx:%d, DSCP Ptr:%.8x, Done Bit:%d, MsgLen:%d, MsgAddr:%.8x(%.8x), PktLen:%d, PktAddr:%.8x(%.8x), Next Idx:%d\n",
                idx, diPtr->dscpIdx,
                (uint)diPtr->dscpPtr,
                diPtr->dscpPtr->ctrl.done,
                diPtr->dscpPtr->ctrl.msg_len,
                (uint)diPtr->msgPtr,
                (uint)diPtr->dscpPtr->msg_addr,
                diPtr->dscpPtr->ctrl.pkt_len,
                (uint)diPtr->skb,
                (uint)diPtr->dscpPtr->pkt_addr,
                diPtr->dscpPtr->next_idx) ;
   diPtr = diPtr->next ;
   idx++ ;
  }
 } while(diPtr!=((void *)0) && diPtr!=gpQdmaPriv->rxStartPtr) ;
}



static void __dump_irq_queue(void)
{
 int i ;
 uint *irqPtr, irqValue ;

 for(i=0 ; i<gpQdmaPriv->irqDepth ; i++) {
  irqPtr = (uint *)gpQdmaPriv->irqQueueAddr + i ;
  irqValue = *irqPtr ;
  printk("IRQ Queue:%.4x,     Content:%.8x\n", i, irqValue) ;

  if((i&0xFF) == 0xFF) {
   msleep(0) ;
  }
 }
}



static void __dump_hwfwd(void)
{
 int i ;
 uint base = gpQdmaPriv->csrBaseAddr ;
 QDMA_DMA_DSCP_T *pHwDscp ;
 uint hwTotalDscpSize = sizeof(QDMA_DMA_DSCP_T) * gpQdmaPriv->hwFwdDscpNum ;
 uint hwTotalMsgSize = (8) * gpQdmaPriv->hwFwdDscpNum ;
 uint *pHwMsg, *pHwPkt ;

 printk("Hardware Forwarding DSCP Link List:\n") ;
 for(i=0 ; i<gpQdmaPriv->hwFwdDscpNum ; i++) {





  pHwDscp = (QDMA_DMA_DSCP_T *)(gpQdmaPriv->hwFwdBaseAddr) + i ;
  pHwMsg = (uint *)(gpQdmaPriv->hwFwdBaseAddr + hwTotalDscpSize) + ((8)/sizeof(uint))*i ;
  pHwPkt = (uint *)(gpQdmaPriv->hwFwdBaseAddr + hwTotalDscpSize + hwTotalMsgSize) + ((2000)/sizeof(uint))*i ;


  printk("%.4d: DSCP:%.8x(%.8x), Done:%d, MsgLen:%d, MsgAddr:%.8x(%.8x), PktLen:%d, PktAddr:%.8x(%.8x), Next:%d\n",
               i, (uint)pHwDscp,
               ioread32((void *)((base+0x0020)))+i*sizeof(QDMA_DMA_DSCP_T),
               pHwDscp->ctrl.done,
               pHwDscp->ctrl.msg_len,
               (uint)pHwMsg,
               (uint)pHwDscp->msg_addr,
               pHwDscp->ctrl.pkt_len,
               (uint)pHwPkt,
               (uint)pHwDscp->pkt_addr,
               pHwDscp->next_idx) ;
  printk("      Msg Content:%.8x, %.8x\n", (uint)(*pHwMsg), (uint)(*(pHwMsg+1))) ;

  if((i&0xFF) == 0xFF) {
   msleep(0) ;
  }
 }
}



static int qdma_bm_counters_read_proc(char *buf, char **start, off_t off, int count, int *eof, void *data)
{
 uint base = gpQdmaPriv->csrBaseAddr ;
 int index=0 ;
 off_t pos=0, begin=0 ;

 index += sprintf(buf+ index, "Tx DSCP Counts:                    %u\n", gpQdmaPriv->counters.txCounts) ;
 pos = begin + index ; if(pos < off) { index = 0 ; begin = pos ; } if(pos > off + count) goto done ; ;
 index += sprintf(buf+ index, "Tx Recycle DSCP Counts:            %u\n", gpQdmaPriv->counters.txRecycleCounts) ;
 pos = begin + index ; if(pos < off) { index = 0 ; begin = pos ; } if(pos > off + count) goto done ; ;
 index += sprintf(buf+ index, "Tx QDMA Dropped Counts:            %u\n", gpQdmaPriv->counters.txQdmaDropCounts) ;
 pos = begin + index ; if(pos < off) { index = 0 ; begin = pos ; } if(pos > off + count) goto done ; ;
 index += sprintf(buf+ index, "Rx DSCP Counts:                    %u\n", gpQdmaPriv->counters.rxCounts) ;
 pos = begin + index ; if(pos < off) { index = 0 ; begin = pos ; } if(pos > off + count) goto done ; ;
 index += sprintf(buf+ index, "IRQ Queue Asynchronous             %u\n", gpQdmaPriv->counters.IrqQueueAsynchronous) ;
 pos = begin + index ; if(pos < off) { index = 0 ; begin = pos ; } if(pos > off + count) goto done ; ;
 index += sprintf(buf+ index, "IRQ Queue Index Errors:            %u\n", gpQdmaPriv->counters.txIrqQueueIdxErrs) ;
 pos = begin + index ; if(pos < off) { index = 0 ; begin = pos ; } if(pos > off + count) goto done ; ;
 index += sprintf(buf+ index, "Tx DSCP Content Incorrect:         %u\n", gpQdmaPriv->counters.txDscpIncorrect) ;
 pos = begin + index ; if(pos < off) { index = 0 ; begin = pos ; } if(pos > off + count) goto done ; ;
 index += sprintf(buf+ index, "Tx Recycle Errors:                 %u\n", gpQdmaPriv->counters.txRecycleErrs) ;
 pos = begin + index ; if(pos < off) { index = 0 ; begin = pos ; } if(pos > off + count) goto done ; ;
 index += sprintf(buf+ index, "Tx Done Bit Errors:                %u\n", gpQdmaPriv->counters.txDscpDoneErrs) ;
 pos = begin + index ; if(pos < off) { index = 0 ; begin = pos ; } if(pos > off + count) goto done ; ;
 index += sprintf(buf+ index, "Rx DSCP Content Incorrect:         %u\n", gpQdmaPriv->counters.rxDscpIncorrect) ;
 pos = begin + index ; if(pos < off) { index = 0 ; begin = pos ; } if(pos > off + count) goto done ; ;
 index += sprintf(buf+ index, "Rx Packet Errors:                  %u\n", gpQdmaPriv->counters.rxPktErrs) ;
 pos = begin + index ; if(pos < off) { index = 0 ; begin = pos ; } if(pos > off + count) goto done ; ;
 index += sprintf(buf+ index, "No Tx Callback Errors:             %u\n", gpQdmaPriv->counters.noTxCbErrs) ;
 pos = begin + index ; if(pos < off) { index = 0 ; begin = pos ; } if(pos > off + count) goto done ; ;
 index += sprintf(buf+ index, "No Tx DSCP Errors:                 %u\n", gpQdmaPriv->counters.noTxDscps) ;
 pos = begin + index ; if(pos < off) { index = 0 ; begin = pos ; } if(pos > off + count) goto done ; ;
 index += sprintf(buf+ index, "No Rx Callback Errors:             %u\n", gpQdmaPriv->counters.noRxCbErrs) ;
 pos = begin + index ; if(pos < off) { index = 0 ; begin = pos ; } if(pos > off + count) goto done ; ;
 index += sprintf(buf+ index, "No Rx DSCP Errors:                 %u\n", gpQdmaPriv->counters.noRxDscps) ;
 pos = begin + index ; if(pos < off) { index = 0 ; begin = pos ; } if(pos > off + count) goto done ; ;
 index += sprintf(buf+ index, "Rx Chorent Interrupt:              %u\n", gpQdmaPriv->counters.intRxCoherent) ;
 pos = begin + index ; if(pos < off) { index = 0 ; begin = pos ; } if(pos > off + count) goto done ; ;
 index += sprintf(buf+ index, "Tx Chorent Interrupt:              %u\n", gpQdmaPriv->counters.intTxCoherent) ;
 pos = begin + index ; if(pos < off) { index = 0 ; begin = pos ; } if(pos > off + count) goto done ; ;
 index += sprintf(buf+ index, "IRQ Queue Full Interrupt:          %u\n", gpQdmaPriv->counters.intIrqFull) ;
 pos = begin + index ; if(pos < off) { index = 0 ; begin = pos ; } if(pos > off + count) goto done ; ;
 index += sprintf(buf+ index, "No Link DSCP Interrupt:            %u\n", gpQdmaPriv->counters.intNoLinkDscp) ;
 pos = begin + index ; if(pos < off) { index = 0 ; begin = pos ; } if(pos > off + count) goto done ; ;
 index += sprintf(buf+ index, "Rx Buffer Overrun Interrupt:       %u\n", gpQdmaPriv->counters.intRxBuffOverrun) ;
 pos = begin + index ; if(pos < off) { index = 0 ; begin = pos ; } if(pos > off + count) goto done ; ;
 index += sprintf(buf+ index, "Tx Buffer Underrun Interrupt:      %u\n", gpQdmaPriv->counters.intTxBuffUnderrun) ;
 pos = begin + index ; if(pos < off) { index = 0 ; begin = pos ; } if(pos > off + count) goto done ; ;
 index += sprintf(buf+ index, "No Rx Buffer Interrupt:            %u\n", gpQdmaPriv->counters.intNoRxBuff) ;
 pos = begin + index ; if(pos < off) { index = 0 ; begin = pos ; } if(pos > off + count) goto done ; ;
 index += sprintf(buf+ index, "No Tx Buffer Interrupt:            %u\n", gpQdmaPriv->counters.intNoTxBuff) ;
 pos = begin + index ; if(pos < off) { index = 0 ; begin = pos ; } if(pos > off + count) goto done ; ;
 index += sprintf(buf+ index, "No Rx DSCP Interrupt:              %u\n", gpQdmaPriv->counters.intNoRxDscp) ;
 pos = begin + index ; if(pos < off) { index = 0 ; begin = pos ; } if(pos > off + count) goto done ; ;
 index += sprintf(buf+ index, "No Tx DSCP Interrupt:              %u\n", gpQdmaPriv->counters.intNoTxDscp) ;
 pos = begin + index ; if(pos < off) { index = 0 ; begin = pos ; } if(pos > off + count) goto done ; ;
 index += sprintf(buf+ index, "Rx Done Interrupt:                 %u\n", gpQdmaPriv->counters.intRxDone) ;
 pos = begin + index ; if(pos < off) { index = 0 ; begin = pos ; } if(pos > off + count) goto done ; ;
 index += sprintf(buf+ index, "Tx Done Interrupt:                 %u\n", gpQdmaPriv->counters.intTxDone) ;
 pos = begin + index ; if(pos < off) { index = 0 ; begin = pos ; } if(pos > off + count) goto done ; ;
# 965 "/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_bmgr.c"
 index += sprintf(buf+ index, "QDMA HW Tx CPU DSCPs               %u\n", ioread32((void *)((base+0x0100)))) ;
 pos = begin + index ; if(pos < off) { index = 0 ; begin = pos ; } if(pos > off + count) goto done ; ;
 index += sprintf(buf+ index, "QDMA HW Tx CPU Packets             %u\n", ioread32((void *)((base+0x0104)))) ;
 pos = begin + index ; if(pos < off) { index = 0 ; begin = pos ; } if(pos > off + count) goto done ; ;
 index += sprintf(buf+ index, "QDMA HW Tx FWD DSCPs               %u\n", ioread32((void *)((base+0x0108)))) ;
 pos = begin + index ; if(pos < off) { index = 0 ; begin = pos ; } if(pos > off + count) goto done ; ;
 index += sprintf(buf+ index, "QDMA HW Tx FWD Packets             %u\n", ioread32((void *)((base+0x010C)))) ;
 pos = begin + index ; if(pos < off) { index = 0 ; begin = pos ; } if(pos > off + count) goto done ; ;
 index += sprintf(buf+ index, "QDMA HW Rx CPU Packets             %u\n", ioread32((void *)((base+0x0110)))) ;
 pos = begin + index ; if(pos < off) { index = 0 ; begin = pos ; } if(pos > off + count) goto done ; ;
 index += sprintf(buf+ index, "QDMA HW Rx FWD Packets             %u\n", ioread32((void *)((base+0x0114)))) ;
 pos = begin + index ; if(pos < off) { index = 0 ; begin = pos ; } if(pos > off + count) goto done ; ;
 index += sprintf(buf+ index, "QDMA HW Drop CPU Green Packets     %u\n", ioread32((void *)((base+0x012C)))) ;
 pos = begin + index ; if(pos < off) { index = 0 ; begin = pos ; } if(pos > off + count) goto done ; ;
 index += sprintf(buf+ index, "QDMA HW Drop CPU Yellow Packets    %u\n", ioread32((void *)((base+0x0130)))) ;
 pos = begin + index ; if(pos < off) { index = 0 ; begin = pos ; } if(pos > off + count) goto done ; ;
 index += sprintf(buf+ index, "QDMA HW Drop CPU Red Packets       %u\n", ioread32((void *)((base+0x0134)))) ;
 pos = begin + index ; if(pos < off) { index = 0 ; begin = pos ; } if(pos > off + count) goto done ; ;
 index += sprintf(buf+ index, "QDMA HW Drop FWD Green Packets     %u\n", ioread32((void *)((base+0x0120)))) ;
 pos = begin + index ; if(pos < off) { index = 0 ; begin = pos ; } if(pos > off + count) goto done ; ;
 index += sprintf(buf+ index, "QDMA HW Drop FWD Yellow Packets    %u\n", ioread32((void *)((base+0x0124)))) ;
 pos = begin + index ; if(pos < off) { index = 0 ; begin = pos ; } if(pos > off + count) goto done ; ;
 index += sprintf(buf+ index, "QDMA HW Drop FWD Red Packets       %u\n", ioread32((void *)((base+0x0128)))) ;
 pos = begin + index ; if(pos < off) { index = 0 ; begin = pos ; } if(pos > off + count) goto done ; ;
 index += sprintf(buf+ index, "QDMA HW Retire Drop Packets        %u\n", ioread32((void *)((base+0x0138)))) ;
 pos = begin + index ; if(pos < off) { index = 0 ; begin = pos ; } if(pos > off + count) goto done ; ;
 index += sprintf(buf+ index, "QDMA HW Status:                    0x%.8x\n", ioread32((void *)((base+0x011C)))) ;
 pos = begin + index ; if(pos < off) { index = 0 ; begin = pos ; } if(pos > off + count) goto done ; ;

 index += sprintf(buf+ index, "QDMA Is LinkMgr Busy:              %u\n", ((ioread32((void *)((base+0x0118))) & (1<<31)))?1:0) ;
 pos = begin + index ; if(pos < off) { index = 0 ; begin = pos ; } if(pos > off + count) goto done ; ;
 index += sprintf(buf+ index, "QDMA LinkMgr Free Counts:          %u\n", ((ioread32((void *)((base+0x0118))) & (0xFFF<<(0))) >> (0))) ;
 pos = begin + index ; if(pos < off) { index = 0 ; begin = pos ; } if(pos > off + count) goto done ; ;

 *eof = 1 ;

done:
 *start = buf + (off - begin) ;
 index -= (off - begin) ;
 if(index<0) index = 0 ;
 if(index>count) index = count ;
 return index ;
}



static int qdma_bm_counters_write_proc(struct file *file, const char *buffer, unsigned long count, void *data)
{
 char val_string[64] ;
 uint cmd ;

 if (count > sizeof(val_string) - 1)
  return -22 ;

 if (({ void *__cu_to; const void *__cu_from; long __cu_len; __cu_to = (val_string); __cu_from = (buffer); __cu_len = (count); if (__builtin_expect(!!(({ unsigned long __addr = (unsigned long) ((__cu_from)); unsigned long __size = (__cu_len); unsigned long __mask = (__current_thread_info->addr_limit).seg; unsigned long __ok; (void)0; __ok = (signed long)(__mask & (__addr | (__addr + __size) | ((__builtin_constant_p(__size) && (signed long) (__size) > 0) ? 0 : (__size)))); __ok == 0; })), 1)) { might_fault(); __cu_len = ({ register void *__cu_to_r __asm__("$4"); register const void *__cu_from_r __asm__("$5"); register long __cu_len_r __asm__("$6"); __cu_to_r = (__cu_to); __cu_from_r = (__cu_from); __cu_len_r = (__cu_len); __asm__ __volatile__( ".set\tnoreorder\n\t" ".set\tnoat\n\t" "la" "\t$1, " "__copy_user" "\n\t" "jalr\t$1\n\t" ".set\tat\n\t" ".set\tnoat\n\t" "addu" "\t$1, %1, %2\n\t" ".set\tat\n\t" ".set\treorder" : "+r" (__cu_to_r), "+r" (__cu_from_r), "+r" (__cu_len_r) : : "$8", "$9", "$10", "$11", "$12", "$15", "$24", "$31", "$0", "memory"); __cu_len_r; }); } __cu_len; }))
  return -14 ;

 sscanf(val_string, "%d", &cmd) ;

 if(cmd == 1) {
  memset(&gpQdmaPriv->counters, 0, sizeof(BM_Counters_T)) ;






  iowrite32(0, (void *)((gpQdmaPriv->csrBaseAddr+0x0100))) ;
  iowrite32(0, (void *)((gpQdmaPriv->csrBaseAddr+0x0104))) ;
  iowrite32(0, (void *)((gpQdmaPriv->csrBaseAddr+0x0108))) ;
  iowrite32(0, (void *)((gpQdmaPriv->csrBaseAddr+0x010C))) ;
  iowrite32(0, (void *)((gpQdmaPriv->csrBaseAddr+0x0110))) ;
  iowrite32(0, (void *)((gpQdmaPriv->csrBaseAddr+0x0114))) ;
  iowrite32(0, (void *)((gpQdmaPriv->csrBaseAddr+0x0120))) ;
  iowrite32(0, (void *)((gpQdmaPriv->csrBaseAddr+0x0124))) ;
  iowrite32(0, (void *)((gpQdmaPriv->csrBaseAddr+0x0128))) ;
  iowrite32(0, (void *)((gpQdmaPriv->csrBaseAddr+0x012C))) ;
  iowrite32(0, (void *)((gpQdmaPriv->csrBaseAddr+0x0130))) ;
  iowrite32(0, (void *)((gpQdmaPriv->csrBaseAddr+0x0134))) ;
  iowrite32(0, (void *)((gpQdmaPriv->csrBaseAddr+0x0138))) ;

 }

 return count ;
}



static int qdma_bm_debug_read_proc(char *buf, char **start, off_t off, int count, int *eof, void *data)
{

 return 0 ;
}



static int qdma_bm_debug_write_proc(struct file *file, const char *buffer, unsigned long count, void *data)
{
 char val_string[64], cmd[32], subcmd[32] ;
 uint value ;

 if (count > sizeof(val_string) - 1)
  return -22 ;

 if (({ void *__cu_to; const void *__cu_from; long __cu_len; __cu_to = (val_string); __cu_from = (buffer); __cu_len = (count); if (__builtin_expect(!!(({ unsigned long __addr = (unsigned long) ((__cu_from)); unsigned long __size = (__cu_len); unsigned long __mask = (__current_thread_info->addr_limit).seg; unsigned long __ok; (void)0; __ok = (signed long)(__mask & (__addr | (__addr + __size) | ((__builtin_constant_p(__size) && (signed long) (__size) > 0) ? 0 : (__size)))); __ok == 0; })), 1)) { might_fault(); __cu_len = ({ register void *__cu_to_r __asm__("$4"); register const void *__cu_from_r __asm__("$5"); register long __cu_len_r __asm__("$6"); __cu_to_r = (__cu_to); __cu_from_r = (__cu_from); __cu_len_r = (__cu_len); __asm__ __volatile__( ".set\tnoreorder\n\t" ".set\tnoat\n\t" "la" "\t$1, " "__copy_user" "\n\t" "jalr\t$1\n\t" ".set\tat\n\t" ".set\tnoat\n\t" "addu" "\t$1, %1, %2\n\t" ".set\tat\n\t" ".set\treorder" : "+r" (__cu_to_r), "+r" (__cu_from_r), "+r" (__cu_len_r) : : "$8", "$9", "$10", "$11", "$12", "$15", "$24", "$31", "$0", "memory"); __cu_len_r; }); } __cu_len; }))
  return -14 ;

 sscanf(val_string, "%s %s", cmd, subcmd) ;


 if(!strcmp(cmd, "level")) {
  value = subcmd[0] - 48 ;
  if(value <= DEG_MSG) {
   gpQdmaPriv->devCfg.dbgLevel = value ;
  }
  printk("Debug Level: %d\n", gpQdmaPriv->devCfg.dbgLevel) ;
 } else if(!strcmp(cmd, "dump")) {
  if(!strcmp(subcmd, "csr")) {
   __dump_csr() ;
  } else if(!strcmp(subcmd, "dscp")) {
   __dump_dscp() ;
  } else if(!strcmp(subcmd, "irq")) {
   __dump_irq_queue() ;
  } else if(!strcmp(subcmd, "hwfwd")) {
   __dump_hwfwd() ;
  }
 } else if(!strcmp(cmd, "test")) {
  if(!strcmp(subcmd, "wrr")) {
   int i, j ;
   QDMA_TxQosScheduler_T txQos ;

   for(i=0 ; i<16 ; i++) {
    txQos.channel = i ;
    txQos.qosType = i%QDMA_TXQOS_TYPE_NUMS ;
    for(j=0 ; j<8 ; j++) {
     txQos.queue[j].weight = i*10+j ;
    }
    qdma_set_tx_qos(&txQos) ;
   }

   for(i=0 ; i<16 ; i++) {
    memset(&txQos, 0, sizeof(QDMA_TxQosScheduler_T)) ;

    txQos.channel = i ;
    qdma_get_tx_qos(&txQos) ;
    printk("Channel:%d, Type:%d, Q0:%d, Q1:%d, Q2:%d, Q3:%d, Q4:%d, Q5:%d, Q6:%d, Q7:%d\n",
         i, txQos.qosType,
         txQos.queue[0].weight,
         txQos.queue[1].weight,
         txQos.queue[2].weight,
         txQos.queue[3].weight,
         txQos.queue[4].weight,
         txQos.queue[5].weight,
         txQos.queue[6].weight,
         txQos.queue[7].weight) ;
   }
  }
 }


 return count ;
}
# 1147 "/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_bmgr.c"
int qdma_bm_tx_polling_mode(QDMA_Mode_t txMode, unchar txThreshold)
{
 uint base = gpQdmaPriv->csrBaseAddr ;

 if(txMode == QDMA_ENABLE) {
  gpQdmaPriv->devCfg.txRecycleThreshold = txThreshold ;

  if(gpQdmaPriv->devCfg.flags.isTxPolling == QDMA_DISABLE) {
   qdmaDisableInt(base, ((1<<0)|(1<<9))) ;

   gpQdmaPriv->devCfg.flags.isTxPolling = txMode ;



  }
 } else {
  if(gpQdmaPriv->devCfg.flags.isTxPolling == QDMA_ENABLE) {
   gpQdmaPriv->devCfg.flags.isTxPolling = txMode ;
   qdmaEnableInt(base, ((1<<0)|(1<<9))) ;
  }
 }

 return 0 ;
}



static void qdma_bm_task(unsigned long data)
{
 uint quota = 128 ;
 uint base = gpQdmaPriv->csrBaseAddr ;

 if(qdma_bm_receive_packets(quota) < quota) {
  qdmaEnableInt(base, ((1<<3)|(1<<1))) ;
 } else {
  tasklet_schedule(&gpQdmaPriv->task) ;
 }
}



static irqreturn_t qdma_isr(int irq, void *dev_id)
{
 QDMA_DMA_DSCP_T *pTxDscp, *pRxDscp ;
 uint intStatus, intMask ;
 uint base = gpQdmaPriv->csrBaseAddr ;
 uint idx ;

 intMask = qdmaGetIntMask(base) ;
 intStatus = ioread32((void *)((base+0x0050))) & intMask ;
 { if(gpQdmaPriv->devCfg.dbgLevel >= DBG_WARN) printk("%s [%d]: " "QDMA interrupt service routine is return, Status:%.8x, Mask:%.8x\n", strrchr("/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_bmgr.c", '/')+1, 1197, ioread32((void *)((base+0x0050))), qdmaGetIntMask(base)) ; } ;

 if(intStatus & (0x00000003)) {
  if(intStatus & (1<<1)) {
   iowrite32((1<<1), (void *)((base+0x0050))) ;
   if(gpQdmaPriv->devCfg.flags.isRxNapi == QDMA_ENABLE) {
    if(gpQdmaPriv->devCfg.bmEventCallbackFunction) {
     gpQdmaPriv->devCfg.bmEventCallbackFunction(QDMA_EVENT_RECV_PKTS) ;
    }
   } else {
    qdmaDisableInt(base, ((1<<3)|(1<<1))) ;
    tasklet_schedule(&gpQdmaPriv->task) ;
   }
   gpQdmaPriv->counters.intRxDone++ ;
   { if(gpQdmaPriv->devCfg.dbgLevel >= DBG_WARN) printk("%s [%d]: " "IRQ: rx DSCP DONE interrupt.\n", strrchr("/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_bmgr.c", '/')+1, 1211) ; } ;
  }

  if(intStatus & (1<<0)) {
   iowrite32((1<<0), (void *)((base+0x0050))) ;
   qdma_bm_transmit_done(0) ;
   gpQdmaPriv->counters.intTxDone++ ;
   { if(gpQdmaPriv->devCfg.dbgLevel >= DBG_WARN) printk("%s [%d]: " "IRQ: tx DSCP DONE interrupt\n", strrchr("/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_bmgr.c", '/')+1, 1218) ; } ;
  }
 }

 if(intStatus & (0x030F0000)) {
  if((intStatus & (1<<24)) && gpQdmaPriv->devCfg.bmXponPhyIntHandler) {
   { if(gpQdmaPriv->devCfg.dbgLevel >= DBG_WARN) printk("%s [%d]: " "IRQ: External XPON PHY device interrupt\n", strrchr("/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_bmgr.c", '/')+1, 1224) ; } ;
   iowrite32((1<<24), (void *)((base+0x0050))) ;
   gpQdmaPriv->devCfg.bmXponPhyIntHandler() ;
  }
  if((intStatus & (1<<19)) && gpQdmaPriv->devCfg.bmSarIntHandler) {
   { if(gpQdmaPriv->devCfg.dbgLevel >= DBG_WARN) printk("%s [%d]: " "IRQ: External ATM SAR device interrupt\n", strrchr("/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_bmgr.c", '/')+1, 1229) ; } ;
   iowrite32((1<<19), (void *)((base+0x0050))) ;
   gpQdmaPriv->devCfg.bmSarIntHandler() ;
  }
  if((intStatus & (1<<18)) && gpQdmaPriv->devCfg.bmPtmIntHandler) {
   { if(gpQdmaPriv->devCfg.dbgLevel >= DBG_WARN) printk("%s [%d]: " "IRQ: External PTM device interrupt\n", strrchr("/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_bmgr.c", '/')+1, 1234) ; } ;
   iowrite32((1<<18), (void *)((base+0x0050))) ;
   gpQdmaPriv->devCfg.bmPtmIntHandler() ;
  }
  if((intStatus & (1<<17)) && gpQdmaPriv->devCfg.bmEponMacIntHandler) {
   { if(gpQdmaPriv->devCfg.dbgLevel >= DBG_WARN) printk("%s [%d]: " "IRQ: External EPON MAC interrupt\n", strrchr("/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_bmgr.c", '/')+1, 1239) ; } ;
   iowrite32((1<<17), (void *)((base+0x0050))) ;
   gpQdmaPriv->devCfg.bmEponMacIntHandler() ;
  }
  if((intStatus & (1<<16)) && gpQdmaPriv->devCfg.bmGponMacIntHandler) {
   { if(gpQdmaPriv->devCfg.dbgLevel >= DBG_WARN) printk("%s [%d]: " "IRQ: External GPON MAC interrupt\n", strrchr("/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_bmgr.c", '/')+1, 1244) ; } ;
   iowrite32((1<<16), (void *)((base+0x0050))) ;
   gpQdmaPriv->devCfg.bmGponMacIntHandler() ;
  }
 }

 if(intStatus & (0x000033FC)) {
  if(intStatus & (1<<13)) {
   printk("%s [%d]: " "IRQ: RX_DMA finds data coherent event when checking DONE bit, RX_DMA_IDX:%d.\n", strrchr("/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_bmgr.c", '/')+1, 1252, ((ioread32((void *)((base+0x001C))) & (0xFFF<<(0))) >> (0))) ;
   iowrite32((1<<13), (void *)((base+0x0050))) ;

   { uint t = ioread32((void *)((base+0x0004))); iowrite32((t&~((1<<2))), (void *)((base+0x0004))); } ;
   idx = ((ioread32((void *)((base+0x001C))) & (0xFFF<<(0))) >> (0)) ;
   if(idx>=0 && idx<gpQdmaPriv->rxDscpNum) {
    pRxDscp = ((struct QDMA_DscpInfo_S *)gpQdmaPriv->dscpInfoAddr + (idx+gpQdmaPriv->txDscpNum))->dscpPtr ;
    pRxDscp->ctrl.done = 0 ;





   }
   { uint t = ioread32((void *)((base+0x0004))); iowrite32((t|(1<<2)), (void *)((base+0x0004))); } ;

   gpQdmaPriv->counters.intRxCoherent++ ;
  }

  if(intStatus & (1<<12)) {
   printk("%s [%d]: " "IRQ: TX_DMA finds data coherent event when checking DONE bit, TX_DMA_IDX:%d.\n", strrchr("/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_bmgr.c", '/')+1, 1272, ((ioread32((void *)((base+0x0014))) & (0xFFF<<(0))) >> (0))) ;
   iowrite32((1<<12), (void *)((base+0x0050))) ;

   { uint t = ioread32((void *)((base+0x0004))); iowrite32((t&~((1<<0))), (void *)((base+0x0004))); } ;
   idx = ((ioread32((void *)((base+0x0014))) & (0xFFF<<(0))) >> (0)) ;
   if(idx>=0 && idx<gpQdmaPriv->txDscpNum) {
    pTxDscp = ((struct QDMA_DscpInfo_S *)gpQdmaPriv->dscpInfoAddr + idx)->dscpPtr ;
    pTxDscp->ctrl.done = 0 ;





   }
   { uint t = ioread32((void *)((base+0x0004))); iowrite32((t|(1<<0)), (void *)((base+0x0004))); } ;

   gpQdmaPriv->counters.intTxCoherent++ ;
  }

  if(intStatus & (1<<9)) {
   iowrite32((1<<9), (void *)((base+0x0050))) ;

   gpQdmaPriv->counters.intIrqFull++ ;
   printk("%s [%d]: " "IRQ: IRQ full interrupt, entryLen:%d.\n", strrchr("/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_bmgr.c", '/')+1, 1295, ((ioread32((void *)((base+0x006C))) & (0xFFF<<(16))) >> (16))) ;
  }

  if(intStatus & (1<<8)) {

   iowrite32((1<<8), (void *)((base+0x0050))) ;
   if(gpQdmaPriv->devCfg.bmEventCallbackFunction) {
    gpQdmaPriv->devCfg.bmEventCallbackFunction(QDMA_EVENT_TX_CROWDED) ;
   }
   gpQdmaPriv->counters.intNoLinkDscp++ ;
  }

  if(intStatus & (1<<7)) {
   printk("%s [%d]: " "IRQ: Rx Buffer over-run occurred.\n", strrchr("/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_bmgr.c", '/')+1, 1308) ;
   gpQdmaPriv->counters.intRxBuffOverrun++ ;
  }

  if(intStatus & (1<<6)) {
   printk("%s [%d]: " "IRQ: Tx Buffer under-run occurred..\n", strrchr("/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_bmgr.c", '/')+1, 1313) ;
   gpQdmaPriv->counters.intTxBuffUnderrun++ ;
  }

  if(intStatus & (1<<5)) {
   printk("%s [%d]: " "IRQ: No Rx on-chip buffer available.\n", strrchr("/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_bmgr.c", '/')+1, 1318) ;
   gpQdmaPriv->counters.intNoRxBuff++ ;
  }

  if(intStatus & (1<<4)) {
   printk("%s [%d]: " "IRQ: No Tx on-chip buffer available.\n", strrchr("/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_bmgr.c", '/')+1, 1323) ;
   gpQdmaPriv->counters.intNoTxBuff++ ;
  }

  if(intStatus & (1<<3)) {
   { if(gpQdmaPriv->devCfg.dbgLevel >= DBG_WARN) printk("%s [%d]: " "IRQ: NO RX CPU descriptor available interrupt.\n", strrchr("/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_bmgr.c", '/')+1, 1328) ; } ;
   iowrite32((1<<3), (void *)((base+0x0050))) ;
   if(gpQdmaPriv->rxStartPtr == gpQdmaPriv->rxEndPtr) {
                                           ;
    if(gpQdmaPriv->devCfg.bmEventCallbackFunction) {
     gpQdmaPriv->devCfg.bmEventCallbackFunction(QDMA_EVENT_NO_RX_BUFFER) ;
    }
   }
   gpQdmaPriv->counters.intNoRxDscp++ ;
  }

  if(intStatus & (1<<2)) {
   printk("%s [%d]: " "IRQ: NO TX CPU descriptor available interrupt.\n", strrchr("/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_bmgr.c", '/')+1, 1340) ;
   iowrite32((1<<2), (void *)((base+0x0050))) ;
   gpQdmaPriv->counters.intNoTxDscp++ ;
  }
 }

 return IRQ_HANDLED ;
}
# 1407 "/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_bmgr.c"
static int qdma_bm_dscp_init(uint txDscpNum, uint rxDscpNum, uint hwDscpNum, uint irqDepth, uint msgLen, uint pktLen)
{
 struct QDMA_DscpInfo_S *diPtr ;
 QDMA_DMA_DSCP_T *pHwDscp ;
 dma_addr_t dscpDmaAddr, irqDmaAddr, hwFwdDmaAddr ;
 uint dscpBaseAddr, hwTotalDscpSize, hwTotalMsgSize, hwTotalPktSize ;
 uint base ;
 uint i ;

 base = gpQdmaPriv->csrBaseAddr ;

 if((txDscpNum>4095 || txDscpNum<=0) || (rxDscpNum>2048 || rxDscpNum<=0) || hwDscpNum>=4096 || irqDepth>4095 || (pktLen>(2000) || pktLen<64)) {
  printk("%s [%d]: " "The initial parameters are invalid.\n", strrchr("/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_bmgr.c", '/')+1, 1419) ;
  return -14 ;
 }
 if((pktLen & 0x3) != 0) {
  printk("%s [%d]: " "The max packets lens must be a multiple of 4.\n", strrchr("/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_bmgr.c", '/')+1, 1423) ;
  return -14 ;
 }

 gpQdmaPriv->txDscpNum = txDscpNum ;
 gpQdmaPriv->rxDscpNum = rxDscpNum ;
 gpQdmaPriv->hwFwdDscpNum = hwDscpNum ;
 gpQdmaPriv->irqDepth =irqDepth ;
# 1452 "/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_bmgr.c"
 dscpBaseAddr = (uint)dma_alloc_coherent(((void *)0), sizeof(QDMA_DMA_DSCP_T)*(txDscpNum+rxDscpNum), &dscpDmaAddr, ((( gfp_t)0x10u) | (( gfp_t)0x40u) | (( gfp_t)0x80u))) ;
 if(!dscpBaseAddr) {
  printk("%s [%d]: " "Allocate memory for TX/RX DSCP failed.\n", strrchr("/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_bmgr.c", '/')+1, 1454) ;
  return -12 ;
 }


 iowrite32(dscpDmaAddr, (void *)((base+0x0008))) ;
 iowrite32((dscpDmaAddr + txDscpNum*sizeof(QDMA_DMA_DSCP_T)), (void *)((base+0x000C))) ;





 if(irqDepth) {
  gpQdmaPriv->irqQueueAddr = (uint)dma_alloc_coherent(((void *)0), 4*irqDepth, &irqDmaAddr, ((( gfp_t)0x10u) | (( gfp_t)0x40u) | (( gfp_t)0x80u))) ;
  if(!gpQdmaPriv->irqQueueAddr) {
   printk("%s [%d]: " "Allocate memory for IRQ queue failed.\n", strrchr("/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_bmgr.c", '/')+1, 1469) ;
   return -12 ;
  }
  memset((void *)gpQdmaPriv->irqQueueAddr, (0xFFFFFFFF), 4*irqDepth) ;


  iowrite32(irqDmaAddr, (void *)((base+0x0060))) ;
  { uint t = ioread32((void *)((base+0x0064))); iowrite32(((t&~((0xFFF<<(0))))|((irqDepth<<(0))&(0xFFF<<(0)))), (void *)((base+0x0064))); } ;
 }




 gpQdmaPriv->dscpInfoAddr = (uint)kmalloc(sizeof(struct QDMA_DscpInfo_S)*(txDscpNum+rxDscpNum), ((( gfp_t)0x10u) | (( gfp_t)0x40u) | (( gfp_t)0x80u))) ;
 if(!gpQdmaPriv->dscpInfoAddr) {
  printk("%s [%d]: " "Alloc memory for TX/RX DSCP information node failed\n", strrchr("/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_bmgr.c", '/')+1, 1484) ;
  return -12 ;
 }


 for(i=0 ; i<(txDscpNum+rxDscpNum) ; i++) {
  diPtr = (struct QDMA_DscpInfo_S *)gpQdmaPriv->dscpInfoAddr + i ;
  diPtr->dscpPtr = (QDMA_DMA_DSCP_T *)dscpBaseAddr + i ;




  if(i < txDscpNum) {
   diPtr->dscpIdx = i ;
   diPtr->next = ((void *)0) ;
   qdma_bm_push_tx_dscp(diPtr) ;
  } else {
   diPtr->dscpIdx = i - txDscpNum ;
   qdma_bm_add_rx_dscp(diPtr) ;
  }
 }




 diPtr = qdma_bm_pop_tx_dscp() ;
 if(!diPtr) {
  printk("%s [%d]: " "There is not any free TX DSCP.\n", strrchr("/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_bmgr.c", '/')+1, 1511) ;
  return -63 ;
 }
 gpQdmaPriv->txUsingPtr = diPtr ;
 { uint t = ioread32((void *)((base+0x0010))); iowrite32(((t&~((0xFFF<<(0))))|((diPtr->dscpIdx<<(0))&(0xFFF<<(0)))), (void *)((base+0x0010))); } ;
 { uint t = ioread32((void *)((base+0x0014))); iowrite32(((t&~((0xFFF<<(0))))|((diPtr->dscpIdx<<(0))&(0xFFF<<(0)))), (void *)((base+0x0014))); } ;




 diPtr = qdma_bm_get_unused_rx_dscp() ;
 if(diPtr == ((void *)0)) {
  printk("%s [%d]: " "There is not any free RX DSCP.\n", strrchr("/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_bmgr.c", '/')+1, 1523) ;
  return -63 ;
 }
 gpQdmaPriv->rxUsingPtr = diPtr ;
 { uint t = ioread32((void *)((base+0x0018))); iowrite32(((t&~((0xFFF<<(0))))|((diPtr->dscpIdx<<(0))&(0xFFF<<(0)))), (void *)((base+0x0018))); } ;
 { uint t = ioread32((void *)((base+0x001C))); iowrite32(((t&~((0xFFF<<(0))))|((diPtr->dscpIdx<<(0))&(0xFFF<<(0)))), (void *)((base+0x001C))); } ;




 if(hwDscpNum) {
  hwTotalDscpSize = sizeof(QDMA_DMA_DSCP_T) * hwDscpNum ;
  hwTotalMsgSize = msgLen * hwDscpNum ;

  hwTotalPktSize = (pktLen+4) * hwDscpNum ;




  gpQdmaPriv->hwFwdBaseAddr = (uint)dma_alloc_coherent(((void *)0), (hwTotalDscpSize+hwTotalMsgSize+hwTotalPktSize), &hwFwdDmaAddr, ((( gfp_t)0x10u) | (( gfp_t)0x40u) | (( gfp_t)0x80u))) ;
  if(!gpQdmaPriv->hwFwdBaseAddr) {
   printk("%s [%d]: " "Allocate memory for hardware forwarding failed.\n", strrchr("/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_bmgr.c", '/')+1, 1544) ;
   return -12 ;
  }

  for(i=0 ; i<hwDscpNum ; i++) {
   pHwDscp = (QDMA_DMA_DSCP_T *)gpQdmaPriv->hwFwdBaseAddr + i ;




   pHwDscp->msg_addr = (hwFwdDmaAddr + hwTotalDscpSize) + msgLen*i ;
   pHwDscp->ctrl.msg_len = msgLen ;




   pHwDscp->pkt_addr = (hwFwdDmaAddr + hwTotalDscpSize + hwTotalMsgSize) + pktLen*i ;

   pHwDscp->next_idx = (i+1) % hwDscpNum ;
   pHwDscp->ctrl.pkt_len = pktLen ;
   pHwDscp->ctrl.done = 0 ;
  }

  iowrite32(hwFwdDmaAddr, (void *)((base+0x0020))) ;
  { uint t = ioread32((void *)((base+0x0030))); iowrite32(((t&~((0xFFF<<(0))))|((hwDscpNum<<(0))&(0xFFF<<(0)))), (void *)((base+0x0030))); } ;
  { uint t = ioread32((void *)((base+0x0024))); iowrite32(((t&~((0xFFF<<(0))))|((0<<(0))&(0xFFF<<(0)))), (void *)((base+0x0024))); } ;
  { uint t = ioread32((void *)((base+0x0028))); iowrite32(((t&~((0xFFF<<(0))))|((0<<(0))&(0xFFF<<(0)))), (void *)((base+0x0028))); } ;
  { uint t = ioread32((void *)((base+0x002C))); iowrite32(((t&~((0xFFF<<(0))))|(((hwDscpNum-1)<<(0))&(0xFFF<<(0)))), (void *)((base+0x002C))); } ;
 }

 return 0 ;
}



static int qdma_bm_dscp_deinit(void)
{
 struct QDMA_DscpInfo_S *diPtr ;
 uint totalDscpNum, base ;
 int i ;

 base = gpQdmaPriv->csrBaseAddr ;
 totalDscpNum = gpQdmaPriv->txDscpNum + gpQdmaPriv->rxDscpNum ;

 { uint t = ioread32((void *)((base+0x0004))); iowrite32((t&~((1<<0))), (void *)((base+0x0004))); } ;
 { uint t = ioread32((void *)((base+0x0004))); iowrite32((t&~((1<<2))), (void *)((base+0x0004))); } ;
 { uint t = ioread32((void *)((base+0x0004))); iowrite32((t&~((1<<18))), (void *)((base+0x0004))); } ;

 if(gpQdmaPriv->dscpInfoAddr) {
  for(i=0 ; i<totalDscpNum ; i++) {
   diPtr = (struct QDMA_DscpInfo_S *)gpQdmaPriv->dscpInfoAddr + i ;


   if(diPtr->msgPtr && diPtr->dscpPtr->msg_addr) {
    dma_unmap_single(((void *)0), diPtr->dscpPtr->msg_addr, (size_t)diPtr->dscpPtr->ctrl.msg_len, DMA_BIDIRECTIONAL) ;
   }

   if(diPtr->skb && diPtr->dscpPtr->pkt_addr) {
    dma_unmap_single(((void *)0), diPtr->dscpPtr->pkt_addr, (size_t)diPtr->dscpPtr->ctrl.pkt_len, DMA_BIDIRECTIONAL) ;
   }
  }

  diPtr = (struct QDMA_DscpInfo_S *)gpQdmaPriv->dscpInfoAddr ;
  if(diPtr->dscpPtr) {




   dma_free_coherent(((void *)0), sizeof(QDMA_DMA_DSCP_T)*totalDscpNum, (void *)diPtr->dscpPtr, ioread32((void *)((gpQdmaPriv->csrBaseAddr+0x0008)))) ;

   diPtr->dscpPtr = ((void *)0) ;
  }

  kfree(diPtr) ;
  gpQdmaPriv->dscpInfoAddr = 0 ;
 }

 if(gpQdmaPriv->irqQueueAddr) {
  dma_free_coherent(((void *)0), 4*gpQdmaPriv->irqDepth, (void *)gpQdmaPriv->irqQueueAddr, ioread32((void *)((gpQdmaPriv->csrBaseAddr+0x0060)))) ;
  gpQdmaPriv->irqQueueAddr = 0 ;
 }

 if(gpQdmaPriv->hwFwdBaseAddr) {
  uint maxSize = ((8) + (2000) + sizeof(QDMA_DMA_DSCP_T)) * ((ioread32((void *)((gpQdmaPriv->csrBaseAddr+0x0030))) & (0xFFF<<(0))) >> (0)) ;

  dma_free_coherent(((void *)0), maxSize, (void *)gpQdmaPriv->hwFwdBaseAddr, ioread32((void *)((gpQdmaPriv->csrBaseAddr+0x0020)))) ;
  gpQdmaPriv->hwFwdBaseAddr = 0 ;
 }

 return 0 ;
}



static void __attribute__ ((__section__(".exit.text"))) __attribute__((__cold__)) qdma_module_cleanup(void)
{
 qdma_dvt_deinit() ;
 remove_proc_entry("qdma/counters", ((void *)0)) ;
 remove_proc_entry("qdma/debug", ((void *)0)) ;
 remove_proc_entry("qdma", ((void *)0)) ;

 if(gpQdmaPriv != ((void *)0)) {
  if(gpQdmaPriv->devCfg.flags.isTxPolling == QDMA_ENABLE) {
   gpQdmaPriv->devCfg.flags.isTxPolling = QDMA_DISABLE ;
   msleep(100) ;
  }

  qdma_bm_dscp_deinit() ;

  if(gpQdmaPriv->csrBaseAddr) {
   iounmap((uint *)gpQdmaPriv->csrBaseAddr) ;
   gpQdmaPriv->csrBaseAddr = 0 ;
  }

  if(gpQdmaPriv->devCfg.flags.isIsrRequest) {
   free_irq((23), ((void *)0)) ;
  }

  kfree(gpQdmaPriv) ;
  gpQdmaPriv = ((void *)0) ;
 }
}



static int __attribute__ ((__section__(".init.text"))) __attribute__((__cold__)) __attribute__((no_instrument_function)) qdma_module_init(void)
{
 int ret ;
 struct proc_dir_entry *qdma_proc;


 gpQdmaPriv = (QDMA_Private_T *)kmalloc(sizeof(QDMA_Private_T), ((( gfp_t)0x10u) | (( gfp_t)0x40u) | (( gfp_t)0x80u))) ;
 if(gpQdmaPriv == ((void *)0)) {
  printk("%s [%d]: " "Alloc private data memory failed\n", strrchr("/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_bmgr.c", '/')+1, 1677) ;
  return -12 ;
 } else {
  memset(gpQdmaPriv, 0, sizeof(QDMA_Private_T)) ;
  gpQdmaPriv->devCfg.txRecycleThreshold = 32 ;

  gpQdmaPriv->devCfg.txQueueTrtcmScale = QDMA_TRTCM_SCALE_128BYTE ;
  gpQdmaPriv->devCfg.gponTrtcmScale = QDMA_TRTCM_SCALE_128BYTE ;


  gpQdmaPriv->devCfg.dbgLevel = DBG_ERR ;


  gpQdmaPriv->devCfg.waitTxMaxNums = 1 ;
  gpQdmaPriv->devCfg.countDown = 1 ;

  do { spinlock_check(&gpQdmaPriv->txLock); do { *(&(&gpQdmaPriv->txLock)->rlock) = (raw_spinlock_t) { .raw_lock = { .lock = 0 }, }; } while (0); } while (0) ;
  do { spinlock_check(&gpQdmaPriv->rxLock); do { *(&(&gpQdmaPriv->rxLock)->rlock) = (raw_spinlock_t) { .raw_lock = { .lock = 0 }, }; } while (0); } while (0) ;
  do { spinlock_check(&gpQdmaPriv->irqLock); do { *(&(&gpQdmaPriv->irqLock)->rlock) = (raw_spinlock_t) { .raw_lock = { .lock = 0 }, }; } while (0); } while (0) ;
 }


 gpQdmaPriv->csrBaseAddr = (uint)(__ioremap_mode(((0x1FB51800)), (0xFF), (2<<(((((0 ? (0 ? (((((0 ? (0) : (0) + 1) + 1) + 1) + 1)) + 1 : (((((0 ? (0) : (0) + 1) + 1) + 1) + 1))) + 1 : (0 ? (((((0 ? (0) : (0) + 1) + 1) + 1) + 1)) + 1 : (((((0 ? (0) : (0) + 1) + 1) + 1) + 1)))) + 1) + 1) + 1) + 1)))) ;
 if(!gpQdmaPriv->csrBaseAddr) {
  printk("%s [%d]: " "ioremap the QDMA base address failed.\n", strrchr("/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_bmgr.c", '/')+1, 1701) ;
  return -14 ;
 }


 if((ret = qdma_bm_dscp_init((1024), (512), (1024), (512), (8), (2000))) != 0) {
  printk("%s [%d]: " "QDMA DSCP initialization failed.\n", strrchr("/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_bmgr.c", '/')+1, 1707) ;
  return ret ;
 }


 tasklet_init(&gpQdmaPriv->task, qdma_bm_task, 0) ;




 if((ret = qdma_dev_init()) != 0) {
  printk("%s [%d]: " "QDMA hardware device initialization failed.\n", strrchr("/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_bmgr.c", '/')+1, 1718) ;
  return ret ;
 }



 if(request_irq((23), qdma_isr, 0, "qdma", ((void *)0)) != 0) {
  printk("%s [%d]: " "Request the interrupt service routine fail, irq:%d.\n", strrchr("/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_bmgr.c", '/')+1, 1725, (23)) ;
  return -19 ;
 }
 gpQdmaPriv->devCfg.flags.isIsrRequest = 1 ;


 proc_mkdir("qdma", ((void *)0));
 qdma_proc = create_proc_entry("qdma/counters", 0, ((void *)0)) ;
 if(qdma_proc) {
  qdma_proc->read_proc = qdma_bm_counters_read_proc ;
  qdma_proc->write_proc = qdma_bm_counters_write_proc ;
 }
 qdma_proc = create_proc_entry("qdma/debug", 0, ((void *)0)) ;
 if(qdma_proc) {
  qdma_proc->read_proc = qdma_bm_debug_read_proc ;
  qdma_proc->write_proc = qdma_bm_debug_write_proc ;
 }


 if((ret = qdma_dvt_init()) != 0) {
  printk("%s [%d]: " "QDMA verification test initialization failed.\n", strrchr("/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_bmgr.c", '/')+1, 1745) ;
  return ret ;
 }

 { if(gpQdmaPriv->devCfg.dbgLevel >= DEG_MSG) printk("%s [%d]: " "QDMA init done. TX Head:%.8x, TX Tail:%.8x, Tx Num: %d. RX Start:%.8x, Num: %d.\n", strrchr("/proj/mtk04880/tclinux_phoenix/modules/private/bufmgr/qdma_bmgr.c", '/')+1, 1751, (uint)gpQdmaPriv->txHeadPtr->dscpPtr, (uint)gpQdmaPriv->txHeadPtr->dscpPtr, gpQdmaPriv->txDscpNum, (uint)gpQdmaPriv->rxStartPtr->dscpPtr, gpQdmaPriv->rxDscpNum) ; } ;



 return 0 ;
}


static inline __attribute__((always_inline)) initcall_t __inittest(void) { return qdma_module_init; } int init_module(void) __attribute__((alias("qdma_module_init")));
static inline __attribute__((always_inline)) exitcall_t __exittest(void) { return qdma_module_cleanup; } void cleanup_module(void) __attribute__((alias("qdma_module_cleanup")));
