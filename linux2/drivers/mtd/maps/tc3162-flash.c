#include <linux/init.h>
#include <linux/types.h>
#include <linux/root_dev.h>
#include <linux/kernel.h>
#include <linux/mtd/map.h>
#include <linux/mtd/mtd.h>
#include <linux/mtd/partitions.h>
#include <linux/vmalloc.h>
#include <asm/io.h>
#include <asm/tc3162/tc3162.h>
#ifdef TCSUPPORT_DUAL_IMAGE_ENHANCE
#include "../chips/spiflash_tc3162.h"
#endif

#define WINDOW_ADDR 0x1fc00000
#define WINDOW_SIZE 0x400000
#define BUSWIDTH 	2

#define TRX_LEN	256
#define KERNEL_PARTITION(a)	(a + TRX_LEN)  //Include trx header
#define ROOTFS_PARTITION(a)	((a + 0x10000) & ~(0x10000-1))
//#define ROOTFS_PARTITION(a)	(a)

#ifdef CONFIG_DUAL_IMAGE
#ifdef TCSUPPORT_FREE_BOOTBASE
#define FLAG_ADDR		(START_ADDR - 1)
#else
#define	FLAG_ADDR		0x8001ffff
#endif
#endif

/* frankliao added 20101215 */
extern unsigned long flash_base;
extern unsigned int (*ranand_read_byte)(unsigned long long);
extern unsigned int (*ranand_read_dword)(unsigned long long);
extern int __devinit ra_nand_init(void);
extern void __devinit ra_nand_remove(void);
#ifdef TCSUPPORT_MT7510_E1
#define READ_FLASH_BYTE(i)      ( (IS_NANDFLASH) ? \
                                                                ((ranand_read_byte != NULL) ? ranand_read_byte((i)) : -1) \
                                                                : (((*((unsigned char*)i))==0) ? (*((unsigned char*)i)): (*((unsigned char*)i))) )


/* for read flash, frankliao added 20101216 */
#define READ_FLASH_DWORD(i)  ( (IS_NANDFLASH) ? \
                                                                ((ranand_read_dword != NULL) ? ranand_read_dword((i)) : -1) \
                                                                : (((*((unsigned int*)i))==0) ? (*((unsigned int*)i)): (*((unsigned int*)i))) )
#else
/* for read flash, frankliao added 20101216 */
#define READ_FLASH_DWORD(i)  ( (IS_NANDFLASH) ? \
								((ranand_read_dword != NULL) ? ranand_read_dword((i)) : -1) \
								: (*((unsigned int*)i)) )
#endif
 #ifdef TCSUPPORT_MTD_ENCHANCEMENT
 #if 0
 #if defined ( TCSUPPORT_RESERVEAREA_1_BLOCK)
 #define BLOCK_NUM_FOR_RESERVEAREA 1
 #elif defined(TCSUPPORT_RESERVEAREA_2_BLOCK)
  #define BLOCK_NUM_FOR_RESERVEAREA 2
 #elif defined(TCSUPPORT_RESERVEAREA_3_BLOCK)
 #define BLOCK_NUM_FOR_RESERVEAREA 3
#else //TCSUPPORT_RESERVEAREA_4_BLOCK
 #define BLOCK_NUM_FOR_RESERVEAREA 4
#endif
#endif
#if ((TCSUPPORT_RESERVEAREA_BLOCK != 1)&& (TCSUPPORT_RESERVEAREA_BLOCK != 2)&& (TCSUPPORT_RESERVEAREA_BLOCK !=3)&& (TCSUPPORT_RESERVEAREA_BLOCK !=4))
#define BLOCK_NUM_FOR_RESERVEAREA 4
#else
 #define BLOCK_NUM_FOR_RESERVEAREA TCSUPPORT_RESERVEAREA_BLOCK
#endif
#endif

static struct mtd_info *tc3162_mtd_info;

static struct map_info tc3162_map = {
       .name = "tc3162",
       .size = WINDOW_SIZE,
       .bankwidth = BUSWIDTH,
       .phys = WINDOW_ADDR,
};

#ifdef TCSUPPORT_ADD_JFFS
	#ifdef TCSUPPORT_NAND_BADBLOCK_CHECK
		#if TCSUPPORT_JFFS_BLOCK > 4
			#define MTDPART_SIZ_JFFS2	TCSUPPORT_JFFS_BLOCK*0x20000
		#else
			#define MTDPART_SIZ_JFFS2	0x3A00000
		#endif
	#elif defined(TCSUPPORT_NAND_FLASH)
		#if TCSUPPORT_JFFS_BLOCK > 4
			#define MTDPART_SIZ_JFFS2	TCSUPPORT_JFFS_BLOCK*0x20000
		#else
			#define MTDPART_SIZ_JFFS2	0xA0000
		#endif
	#else
		#if TCSUPPORT_JFFS_BLOCK > 4
			#define MTDPART_SIZ_JFFS2	TCSUPPORT_JFFS_BLOCK*0x10000
		#else
			#define MTDPART_SIZ_JFFS2	0x50000
		#endif
	#endif
#endif

#ifdef TCSUPPORT_SQUASHFS_ADD_YAFFS
	#ifdef TCSUPPORT_NAND_BADBLOCK_CHECK
		#define	SQUASHFS_ADD_YAFFS_SIZE 0x3A00000	//58M
	#elif TCSUPPORT_YAFFS_BLOCK
		#define	SQUASHFS_ADD_YAFFS_SIZE	TCSUPPORT_YAFFS_BLOCK*0x20000
	#else
		#define	SQUASHFS_ADD_YAFFS_SIZE 0xA00000	//10M
	#endif
#endif

static struct mtd_partition tc3162_parts[] = {
	{									 	/* First partition */
		  name 	     : "bootloader",	 	/* Bootloader section */
#ifdef TCSUPPORT_BOOTROM_LARGE_SIZE
		  size	  	 : 0x00020000, 		 	/* Size =128k */		
#else
		  size	  	 : 0x00010000, 		 	/* Size  */
#endif
		  offset     : 0				 	/* Offset from start of flash- location 0x0*/
//		  mask_flags : MTD_WRITEABLE	 	/* This partition is not writable */
	},
	{									 	/* Second partition */
		  name       : "romfile",			/* config filesystem section */
		  size	     :  0x00010000,		 	/* Size */
		  offset     : MTDPART_OFS_APPEND	/* Append after bootloader section */
	},
	{									 	/* Third partition */
		  name       : "kernel",		 	/* Kernel section */
#ifdef CONFIG_MTD_PURE_BRIDGE
		  size	     :  0x000a0000,		 	/* Size */
#else
		  size		 :	0x000d0000,
#endif
		/* 
		 * frank modify for nand flash support
		 * for nand flash, romfile partition is put in the last block,
		 * so the kernel partition cannot append after romfile section
		 */
		  offset     : 0x20000	/* Append after bootloader section */
//		  offset     : MTDPART_OFS_APPEND	/* Append after bootloader section */
	},
	{									 	/* Fourth partition */
		  name       : "rootfs", 		 	/* Root filesystem section */
		  size	     : MTDPART_SIZ_FULL, 	/* Occupy rest of flash */
		  offset     : MTDPART_OFS_APPEND 	/* Append after kernel section */
	},
	{
		  name       : "tclinux",            /* tclinux partition */	
		  size       : MTDPART_SIZ_FULL,    /* Occupy rest of flash */
		  offset     : 0x00020000   
	}
#ifdef CONFIG_DUAL_IMAGE
	,
	{
		  name       : "kernel_slave",            /* tclinux slave partition */	
#ifdef CONFIG_MTD_PURE_BRIDGE
		  size	     :  0x000a0000,		 	/* Size */
#else
		  size		 :	0x000d0000,
#endif	  
		   offset     : 0x00520000   
	},
	{
		  name       : "rootfs_slave",            /* tclinux slave partition */	
		  size       : MTDPART_SIZ_FULL,    /* Occupy rest of flash */
		  offset     : MTDPART_OFS_APPEND   
	},
	{
		  name       : "tclinux_slave",            /* tclinux slave partition */	
		  size       : MTDPART_SIZ_FULL,    /* Occupy rest of flash */
		  offset     : 0x00520000   
	}
 #endif
#ifdef TCSUPPORT_ADD_JFFS
	,
	{
		name         : "jffs2",
		size         : MTDPART_SIZ_JFFS2,
		offset       : MTDPART_OFS_APPEND
	}
#endif
#if defined(TCSUPPORT_SQUASHFS_ADD_YAFFS)
	,
	 {
		  name       : "yaffs",            /*nand yaffs partition */
		  size       : SQUASHFS_ADD_YAFFS_SIZE,   /* occupy 10M*/
		  offset     : MTDPART_OFS_APPEND
	}
#endif
 #ifdef TCSUPPORT_MTD_ENCHANCEMENT
 	,
	 {
		  name       : "reservearea",            /*test partition */	
		  size       : 0x00040000,   /* occupy the last 4 blocks */
		  offset     : MTDPART_OFS_APPEND   
	}
#endif
#if defined(TCSUPPORT_MULTI_BOOT)
 	,
	 {
		  name       : "romd",            /*test partition */	
		  size       : 0x00010000,   /* occupy one block*/
		  offset     : MTDPART_OFS_APPEND   
	}
#endif
};

static int tc3162_parts_size = sizeof(tc3162_parts) / sizeof(tc3162_parts[0]);

static struct mtd_info *get_mtd_named(char *name)
{
	int i;
	struct mtd_info *mtd;

	for (i = 0; i < 32; i++) {
		mtd = get_mtd_device(NULL, i);
		if (mtd) {
			if (strcmp(mtd->name, name) == 0)
				return(mtd);
			put_mtd_device(mtd);
		}
	}
	return(NULL);
}

static int __init tc3162_mtd_init(void)
{
	struct mtd_info *mtd;
	unsigned int *header;
	unsigned int addr;
	#if defined(TCSUPPORT_BOOTROM_LARGE_SIZE)
	u_int32_t tclinux_flash_offset = 0x30000;
	#else
	u_int32_t tclinux_flash_offset = 0x20000;
	#endif

	#ifdef TCSUPPORT_SQUASHFS_ADD_YAFFS
	u_int32_t nand_yaffs_size = SQUASHFS_ADD_YAFFS_SIZE;
	#else
	u_int32_t nand_yaffs_size = 0;
	#endif

	#if defined(CONFIG_DUAL_IMAGE) || defined(TCSUPPORT_MTD_ENCHANCEMENT) || defined(TCSUPPORT_MULTI_BOOT) || defined(TCSUPPORT_NAND_BADBLOCK_CHECK)
	int i = 0;
	#endif
	#ifdef CONFIG_DUAL_IMAGE
	char *bufaddr = (char*)FLAG_ADDR;
	const char flagvalue = 1;//not change!!because we use this flag to judge which image
	char tmp[8] = {0};
	#endif
//#if defined(CONFIG_DUAL_IMAGE) && (defined(TCSUPPORT_MTD_ENCHANCEMENT) ||defined(TCSUPPORT_MULTI_BOOT))
#if defined(CONFIG_DUAL_IMAGE)
#ifdef TCSUPPORT_DUAL_IMAGE_ENHANCE	
	u_int32_t tclinux_slave_offset = offset+tclinux_flash_offset;
#else
	u_int32_t tclinux_slave_offset = 0x00500000+tclinux_flash_offset;	
#endif
	u_int32_t tclinux_slave_size = 0;
#endif
#if defined(TCSUPPORT_MTD_ENCHANCEMENT) || defined(TCSUPPORT_MULTI_BOOT)
	u_int32_t tclinux_size = 0;
#endif

#ifdef TCSUPPORT_ADD_JFFS
	u_int32_t jffs_size = MTDPART_SIZ_JFFS2;
#else
	u_int32_t jffs_size = 0;
#endif

  #ifdef TCSUPPORT_NAND_RT63368
  	header = (unsigned int *)(flash_base + 0x40000);
  #elif defined(TCSUPPORT_NAND_BADBLOCK_CHECK)	
    header = (unsigned int *)(flash_base + 0x280000);
  #else
	/* frankliao added 20101223 */
	header = (unsigned int *)(flash_base + tclinux_flash_offset);
  #endif

#ifdef TCSUPPORT_ADDR_MAPPING
	/*add address mapping on 7510. Pork*/
	if(isMT751020){
		uint32 tmpVal;
		tmpVal = regRead32(0xbfb00038);
		tmpVal &= 0xffe0e0e0;
		tmpVal |= 0x80070f00;
		regWrite32(0xbfb00038,tmpVal);
		//VPint(0xbfb00038) |= 0x80070F00;
		printk("tc3162: flash device 0x%08x at 0x%08x\n", 0x1000000, 0x1c000000);
		tc3162_map.virt = ioremap_nocache(0x1c000000, 0x1000000);
		tc3162_map.phys = 0x1c000000;
		tc3162_map.size = 0x1000000;
		ioremap_nocache(WINDOW_ADDR, WINDOW_SIZE);
	}
	/*add 8M 16M flash support. shnwind*/
	else if (isTC3162U || isTC3182 || isRT65168 || isRT63165 || isRT63365 || isRT63260){
#else
	if (isTC3162U || isTC3182 || isRT65168 || isRT63165 || isRT63365 || isRT63260 || isMT751020){
#endif //TCSUPPORT_ADDR_MAPPING

//		header = (unsigned int *)0xb0020000;
		/*enable addr bigger than 4M support.*/
		VPint(0xbfb00038) |= 0x80000000;
		printk("tc3162: flash device 0x%08x at 0x%08x\n", 0x1000000, 0x10000000);
		tc3162_map.virt = ioremap_nocache(0x10000000, 0x1000000);
		tc3162_map.phys = 0x10000000;
		tc3162_map.size = 0x1000000;
		ioremap_nocache(WINDOW_ADDR, WINDOW_SIZE);
	}else{
	
//		header = (unsigned int *)0xbfc20000;
		printk("tc3162: flash device 0x%08x at 0x%08x\n", WINDOW_SIZE, WINDOW_ADDR);
		tc3162_map.virt = ioremap_nocache(WINDOW_ADDR, WINDOW_SIZE);

	}
	if (!tc3162_map.virt) {
   		printk("tc3162: Failed to ioremap\n");
		return -EIO;
	}

	simple_map_init(&tc3162_map);

	/* check if boot from SPI flash */
	if (IS_NANDFLASH) {
		tc3162_mtd_info = do_map_probe("nandflash_probe", &tc3162_map);
	} else if (IS_SPIFLASH) {
		tc3162_mtd_info = do_map_probe("spiflash_probe", &tc3162_map);
	} else {
		tc3162_mtd_info = do_map_probe("cfi_probe", &tc3162_map);
	}

	if (!tc3162_mtd_info) {
		iounmap(tc3162_map.virt);
		return -ENXIO;
	}

  	tc3162_mtd_info->owner = THIS_MODULE;
	#ifdef TCSUPPORT_BOOTROM_LARGE_SIZE
	if (IS_NANDFLASH) {
		if(tc3162_mtd_info->erasesize >= 0x20000){
			/*tclinux offset is 0x80000 for 128k&256k block size*/
			//tclinux_flash_offset = tc3162_mtd_info->erasesize*2;
			tclinux_flash_offset = 0x40000*2;
			
#if defined(CONFIG_DUAL_IMAGE)
#ifdef TCSUPPORT_DUAL_IMAGE_ENHANCE	
			tclinux_slave_offset = offset+tclinux_flash_offset;
#else
			tclinux_slave_offset = 0x00500000+tclinux_flash_offset;	
#endif
#endif
			header = (unsigned int *)(flash_base + tclinux_flash_offset);
		}
	}
	#endif

    #if defined(TCSUPPORT_NAND_BADBLOCK_CHECK) || defined(TCSUPPORT_NAND_RT63368)
    for(i= 0; i < tc3162_parts_size; i++)
    {
        if(!strcmp(tc3162_parts[i].name, "bootloader"))
        {
            tc3162_parts[i].size = 0x20000;
        }

        if(!strcmp(tc3162_parts[i].name, "romfile"))
        {
            tc3162_parts[i].size = 0x20000;
            #ifdef TCSUPPORT_NAND_BADBLOCK_CHECK
            tc3162_parts[i].offset = 0xe0000;
            #else
            tc3162_parts[i].offset = 0x20000;
            #endif
        }

    }
    #endif

	#ifdef CONFIG_DUAL_IMAGE
	for(i= 0; i < tc3162_parts_size; i++)
	{
		if(!strcmp(tc3162_parts[i].name,"kernel"))
		{
			addr = READ_FLASH_DWORD((unsigned long long)((unsigned int)header + 20 * sizeof(unsigned int)));  
			tc3162_parts[i].size = KERNEL_PARTITION( addr );
//			tc3162_parts[i].size = KERNEL_PARTITION(header[20]);
			addr = READ_FLASH_DWORD((unsigned long long)((unsigned int)header + 21 * sizeof(unsigned int)));   
			tc3162_parts[i+1].size = ROOTFS_PARTITION( addr );
//			tc3162_parts[i+1].size = ROOTFS_PARTITION(header[21]);
			#if defined(TCSUPPORT_MTD_ENCHANCEMENT) || defined(TCSUPPORT_MULTI_BOOT)
			tclinux_size = tc3162_parts[i].size+tc3162_parts[i+1].size;
			#endif

			#ifdef TCSUPPORT_NAND_BADBLOCK_CHECK
            tc3162_parts[i].offset = 0x280000;
            tc3162_parts[i+2].offset = tc3162_parts[i].offset;
            #elif defined(TCSUPPORT_NAND_RT63368)
            tc3162_parts[i].offset = 0x40000;
            tc3162_parts[i+2].offset = tc3162_parts[i].offset;
			#endif
		}
		if(!strcmp(tc3162_parts[i].name,"kernel_slave"))
		{
#ifdef TCSUPPORT_DUAL_IMAGE_ENHANCE  
			unsigned int *header_slave = (unsigned int *)(flash_base + tclinux_flash_offset + offset);
			tc3162_parts[i].offset = offset + tclinux_flash_offset;
			tc3162_parts[i+2].offset = offset + tclinux_flash_offset;
#elif defined(TCSUPPORT_NAND_BADBLOCK_CHECK)
            unsigned int *header_slave = (unsigned int *)(flash_base + 0x2280000);
            tc3162_parts[i].offset = 0x2280000;
            tc3162_parts[i+2].offset = tc3162_parts[i].offset;
#else
			unsigned int *header_slave = (unsigned int *)(flash_base + tclinux_flash_offset + 0x500000);
//			unsigned int *header_slave = (unsigned int *)(0xb0020000+0x500000);
			tc3162_parts[i].offset = 0x500000 + tclinux_flash_offset;
			tc3162_parts[i+2].offset = 0x500000 + tclinux_flash_offset;
#endif
//			tc3162_parts[i].size = KERNEL_PARTITION(header_slave[20]);
//			tc3162_parts[i+1].size = ROOTFS_PARTITION(header_slave[21]);
			addr = READ_FLASH_DWORD((unsigned long long)((unsigned int)header_slave + 20 * sizeof(unsigned int)));
//			tc3162_parts[i].size = KERNEL_PARTITION(header_slave[20]);
			tc3162_parts[i].size = KERNEL_PARTITION( addr );

			addr = READ_FLASH_DWORD((unsigned long long)((unsigned int)header_slave + 21 * sizeof(unsigned int)));		
			tc3162_parts[i+1].size = ROOTFS_PARTITION( addr );
//			tc3162_parts[i+1].size = ROOTFS_PARTITION(header_slave[21]);

		 #if defined(TCSUPPORT_MTD_ENCHANCEMENT) || defined(TCSUPPORT_MULTI_BOOT)
			tclinux_slave_offset = tc3162_parts[i].offset;
		 	tclinux_slave_size = tc3162_parts[i].size + tc3162_parts[i+1].size;
		 #endif
		}
		if (IS_NANDFLASH) {	
			/* frankliao enhance 20110112, for nand flash romfile  */
			if(!strcmp(tc3162_parts[i].name,"tclinux_slave")) {
				/* frankliao add 20110112, for 128K block size nand flash romfile */
				if (tc3162_mtd_info->erasesize >= 0x20000) {
				#ifdef TCSUPPORT_NAND_BADBLOCK_CHECK
                    tc3162_parts[i].size = 0x2000000;
				#else
					tc3162_parts[i].size = tc3162_mtd_info->size - jffs_size - nand_yaffs_size - 6*tc3162_mtd_info->erasesize - tclinux_slave_offset;
				#endif
				} else {
					tc3162_parts[i].size = tc3162_mtd_info->size - tclinux_slave_offset;
				}	
			}	
	
			/* 
			 * frankliao enhance 20110112 
			 * the tclinux partition start from 0x20000, end at tclinux_slave_offset 
			 */
			if(!strcmp(tc3162_parts[i].name,"tclinux")) {
			#ifdef TCSUPPORT_NAND_BADBLOCK_CHECK
			    tc3162_parts[i].size = 0x2000000;
			#else
				tc3162_parts[i].size = tclinux_slave_offset - tclinux_flash_offset;
			#endif
			}	
		}		
	}
	#else 
//	tc3162_parts[2].size = KERNEL_PARTITION(header[20]);
//	tc3162_parts[2].size = KERNEL_PARTITION(header[21]);
	addr = READ_FLASH_DWORD((unsigned long long)((unsigned int)header + 20 * sizeof(unsigned int)));
	tc3162_parts[2].size = KERNEL_PARTITION( addr );
	addr = READ_FLASH_DWORD((unsigned long long)((unsigned int)header + 21 * sizeof(unsigned int)));
	tc3162_parts[3].size = ROOTFS_PARTITION( addr );

	#if defined(TCSUPPORT_NAND_BADBLOCK_CHECK) || defined(TCSUPPORT_NAND_RT63368)
	#ifdef TCSUPPORT_NAND_BADBLOCK_CHECK
        tc3162_parts[2].offset = 0x280000;
        #else
        tc3162_parts[2].offset = 0x40000;
        #endif
        tc3162_parts[4].offset = tc3162_parts[2].offset;
	#endif

	if (IS_NANDFLASH) {
		/* frankliao added 20110112, for 128K block size NAND Flash */
		if (tc3162_mtd_info->erasesize >= 0x20000) {
		#ifdef TCSUPPORT_NAND_BADBLOCK_CHECK
		    tc3162_parts[4].size = 0x4000000;
		#else
			/* the last block store nand flash romfile */
			tc3162_parts[4].size = tc3162_mtd_info->size - jffs_size - nand_yaffs_size - 6*tc3162_mtd_info->erasesize - tclinux_flash_offset;
		#endif
		}
	}

	#if defined(TCSUPPORT_MTD_ENCHANCEMENT) || defined(TCSUPPORT_MULTI_BOOT)
	tclinux_size = tc3162_parts[2].size + tc3162_parts[3].size;
	#endif
	#endif 

//use last 4 block as reserve area for storing data(for example:syslog,backupromfile,and so on)
 #ifdef TCSUPPORT_MTD_ENCHANCEMENT
 	for(i= 0; i < tc3162_parts_size; i++)
	{
		if(!strcmp(tc3162_parts[i].name,"reservearea"))
		{
			/* 
			 * frankliao modify 20110112 
			 * 64K block size SPI Flash & 128K block size NAND Flash 
			 */
			if (tc3162_mtd_info->erasesize >= 0x10000) {
			#ifdef TCSUPPORT_NAND_BADBLOCK_CHECK
                tc3162_parts[i].offset = 0x7c80000;
                tc3162_parts[i].size = 0x380000;
			#else
				tc3162_parts[i].offset = tc3162_mtd_info->size - BLOCK_NUM_FOR_RESERVEAREA*( tc3162_mtd_info->erasesize);
				tc3162_parts[i].size = BLOCK_NUM_FOR_RESERVEAREA*(tc3162_mtd_info->erasesize);
			#endif
			/* 16 block size NAND Flash */
			} else {
				tc3162_parts[i].offset = tc3162_mtd_info->size - BLOCK_NUM_FOR_RESERVEAREA*(0x10000);
				tc3162_parts[i].size = BLOCK_NUM_FOR_RESERVEAREA*(0x10000);
			}
		}

  #ifndef TCSUPPORT_NAND_BADBLOCK_CHECK

		#ifdef CONFIG_DUAL_IMAGE
		memcpy(tmp,(char*)bufaddr,sizeof(char));
		if(flagvalue != tmp[0])//use main image
		{
		#endif
		if(!strcmp(tc3162_parts[i].name,"tclinux"))
		{
			#ifdef CONFIG_DUAL_IMAGE
			tc3162_parts[i].size = tclinux_slave_offset -tclinux_flash_offset ; //reserve the last 4 blocks
			#else
			
			/* 
			 * frankliao modify 201100112 
			 * 64K block size SPI Flash & 128K block size NAND Flash
			 */
			if (tc3162_mtd_info->erasesize == 0x10000) {
				tc3162_parts[i].size = tc3162_mtd_info->size - jffs_size - BLOCK_NUM_FOR_RESERVEAREA*( tc3162_mtd_info->erasesize) - tclinux_flash_offset;
			} else if (tc3162_mtd_info->erasesize >= 0x20000) {
				tc3162_parts[i].size = tc3162_mtd_info->size - jffs_size - nand_yaffs_size - BLOCK_NUM_FOR_RESERVEAREA*( tc3162_mtd_info->erasesize) - tclinux_flash_offset; 
			/* 16K block size NAND Flash */
			} else {
				tc3162_parts[i].size = tc3162_mtd_info->size - jffs_size - BLOCK_NUM_FOR_RESERVEAREA*(0x10000) - tclinux_flash_offset;
			}
			#endif
			if(tclinux_size > tc3162_parts[i].size)
			{
				printk("\r\ntclinux size is beyond the limit!!");
				return -1;
			}
		}
		#ifdef CONFIG_DUAL_IMAGE
		}
		if(!strcmp(tc3162_parts[i].name,"tclinux_slave"))
		{
			/* 
			 * frankliao modify 201100112 
			 * 64K block size SPI Flash & 128K block size NAND Flash
			 */
			if (tc3162_mtd_info->erasesize == 0x10000) {
				tc3162_parts[i].size = tc3162_mtd_info->size - jffs_size - nand_yaffs_size - BLOCK_NUM_FOR_RESERVEAREA*( tc3162_mtd_info->erasesize) -tclinux_slave_offset; //reserve the last 4 blocks
			} else if (tc3162_mtd_info->erasesize >= 0x20000) {
				tc3162_parts[i].size = tc3162_mtd_info->size - jffs_size - nand_yaffs_size - BLOCK_NUM_FOR_RESERVEAREA*( tc3162_mtd_info->erasesize) -tclinux_slave_offset; 
			/* 16K block size NAND Flash */
			} else {
				tc3162_parts[i].size = tc3162_mtd_info->size - jffs_size - BLOCK_NUM_FOR_RESERVEAREA*(0x10000) - tclinux_slave_offset;
			}

			if(tclinux_slave_size > tc3162_parts[i].size)
			{
				printk("\r\ntclinux_slave size is beyond the limit!!");
				return -1;
			}
		}
		#endif
		#endif
		
 	} 	
 #endif

	#if defined(TCSUPPORT_MULTI_BOOT)
 	for(i= 0; i < tc3162_parts_size; i++)
	{
		if(!strcmp(tc3162_parts[i].name,"romd"))
		{
			if (tc3162_mtd_info->erasesize >= 0x10000) {
				tc3162_parts[i].offset = tc3162_mtd_info->size -5*( tc3162_mtd_info->erasesize);
				tc3162_parts[i].size = (tc3162_mtd_info->erasesize);
			} else {
				tc3162_parts[i].offset = tc3162_mtd_info->size -5*(0x10000);
				tc3162_parts[i].size = 0x10000;
			}
		}


		#ifdef CONFIG_DUAL_IMAGE
		memcpy(tmp,(char*)bufaddr,sizeof(char));
		if(flagvalue != tmp[0])//use main image
		{
		#endif
		
			if(!strcmp(tc3162_parts[i].name,"tclinux"))
			{
				#ifdef CONFIG_DUAL_IMAGE
				tc3162_parts[i].size = tclinux_slave_offset -tclinux_flash_offset ; 
				#else				
				if (tc3162_mtd_info->erasesize >= 0x20000) {
					tc3162_parts[i].size = tc3162_mtd_info->size -6*( tc3162_mtd_info->erasesize) -tclinux_flash_offset; 
				} else if (tc3162_mtd_info->erasesize == 0x10000) {
					tc3162_parts[i].size = tc3162_mtd_info->size -5*( tc3162_mtd_info->erasesize) -tclinux_flash_offset; 
				} else {
					tc3162_parts[i].size = tc3162_mtd_info->size -5*(0x10000) -tclinux_flash_offset; 
				}
				#endif
		
				if(tclinux_size > tc3162_parts[i].size)
				{
					printk("tclinux size is beyond the limit!!\r\n");					
					return -1;
				}
			}

		
		#ifdef CONFIG_DUAL_IMAGE
		}
		if(flagvalue == tmp[0])//use slave image
		{
			if(!strcmp(tc3162_parts[i].name,"tclinux_slave"))
			{
				if (tc3162_mtd_info->erasesize >= 0x20000) {
					tc3162_parts[i].size = tc3162_mtd_info->size -6*tc3162_mtd_info->erasesize -tclinux_slave_offset;
				} else if (tc3162_mtd_info->erasesize == 0x10000) {
					tc3162_parts[i].size = tc3162_mtd_info->size -5*tc3162_mtd_info->erasesize -tclinux_slave_offset;
				} else {
					tc3162_parts[i].size = tc3162_mtd_info->size -5*(0x10000) -tclinux_slave_offset;
				}
				if(tclinux_slave_size > tc3162_parts[i].size)
				{
					printk("tclinux_slave size is beyond the limit!!\r\n");
					return -1;
				}
			}
		}
		#endif
 	} 	
#endif

#if !defined(TCSUPPORT_NAND_BADBLOCK_CHECK) && !defined(TCSUPPORT_NAND_RT63368)
	/*Reset the kernel partition offset*/
	tc3162_parts[2].offset = tclinux_flash_offset;
	/*Reset the tclinux partition offset*/
	tc3162_parts[4].offset = tclinux_flash_offset;

	/* frank added 20110111 for 128K block size NAND Flash*/
	if (tc3162_mtd_info->erasesize >= 0x20000) {
		#ifdef TCSUPPORT_BOOTROM_LARGE_SIZE
		/* reset the bootloader partition size to 0x40000 which is a blocksize of 128K&256k NAND Flash */
		tc3162_parts[0].size = 0x40000; 
		/*romfile offset is 0x40000 for 128k&256k block size*/
		//tc3162_parts[1].offset = tc3162_mtd_info->erasesize;
		tc3162_parts[1].offset = 0x40000;

		/* reset the romfile partition size */
		tc3162_parts[1].size = 0x40000;
		#else
		/* reset the bootloader partition size to 0x20000 which is a blocksize of 128K NAND Flash */
		tc3162_parts[0].size = tc3162_mtd_info->erasesize; 
		/* 
		 * reset the romfile partition offset. 
		 * the romfile partition starts from the last block address
		 */
		tc3162_parts[1].offset = tc3162_mtd_info->size - 6*tc3162_mtd_info->erasesize;
		/* reset the romfile partition size */
		tc3162_parts[1].size = tc3162_mtd_info->erasesize;
		#endif
	} 
#endif	

	add_mtd_partitions(tc3162_mtd_info, tc3162_parts, tc3162_parts_size);
	#if 1
	#ifdef TCSUPPORT_NAND_FLASH
	if (IS_SPIFLASH) {
		ra_nand_init();
	}	
	#endif
	#endif
	#ifdef CONFIG_DUAL_IMAGE
	//read the flag from last block to tell kernel use which image(main or slave)
	#if 0
	memcpy(tmp,(char*)(0xb0000000+tc3162_mtd_info->size -sizeof(char)),sizeof(char));	
	#endif
	memcpy(tmp,(char*)bufaddr,sizeof(char));
	if(flagvalue == tmp[0])
	{
		printk("\r\nrootfs_slave");
		mtd = get_mtd_named("rootfs_slave");
	}
	else
	{
		printk("\r\nrootfs");
	#endif
		mtd = get_mtd_named("rootfs");
	#ifdef CONFIG_DUAL_IMAGE
	}
	#endif	
	if (mtd) {
		ROOT_DEV = MKDEV(MTD_BLOCK_MAJOR, mtd->index);
		put_mtd_device(mtd);
	}


	return 0;
}

static void __exit tc3162_mtd_cleanup(void)
{
	if (tc3162_mtd_info) {
    	del_mtd_partitions(tc3162_mtd_info);
       	map_destroy(tc3162_mtd_info);
	}

#if 1
	#ifdef TCSUPPORT_NAND_FLASH
	if (IS_SPIFLASH) {
		ra_nand_remove();
	}	
	#endif
#endif	
   	if (tc3162_map.virt) {
   		iounmap(tc3162_map.virt);
       	tc3162_map.virt = 0;
	}
}

module_init(tc3162_mtd_init);
module_exit(tc3162_mtd_cleanup);

