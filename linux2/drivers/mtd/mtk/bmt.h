#ifndef __BMT_H__
#define __BMT_H__

// #define __PRELOADER_NAND__
// #define __UBOOT_NAND__
#define __KERNEL_NAND__

#if defined(__PRELOADER_NAND__)

#include "nand.h"

#elif defined(__UBOOT_NAND__)

#include <linux/mtd/nand.h>
#include <asm/arch/mt65xx_typedefs.h>
#include <asm/arch/mt6573_nand.h>

#elif defined(__KERNEL_NAND__)

#include <linux/mtd/mtd.h>
#include <linux/mtd/nand.h>
//#include <mach/mt6573_nand.h>
#include "mt6573_nand.h"

#endif

#define MAX_BMT_SIZE        (0x80)
#define BMT_VERSION         (1)         // initial version

#define MAIN_SIGNATURE_OFFSET   (0)
#define OOB_SIGNATURE_OFFSET    (1)
#define OOB_INDEX_OFFSET        (29)
#define OOB_INDEX_SIZE          (2)
#define FAKE_INDEX              (0xAAAA)
#define OOB_16B_INDEX_OFFSET        (3)

typedef struct _bmt_entry_
{
    u16 bad_index;      // bad block index
    u16 mapped_index;  // mapping block index in the replace pool
} bmt_entry;

typedef enum
{
    UPDATE_ERASE_FAIL,
    UPDATE_WRITE_FAIL,
    UPDATE_UNMAPPED_BLOCK,
    UPDATE_REASON_COUNT,
} update_reason_t;

typedef enum
{
    SET_RESERVE_ADD,
    SET_RESERVE_SET,
    SET_RESERVE_SUB,

    SET_RESERVE_COUNT,
} set_res_flag_t;


typedef struct {
    bmt_entry table[MAX_BMT_SIZE];
    u8 version;
    u8 mapped_count;                // mapped block count in pool
    u8 bad_count;                   // bad block count in pool. Not used in V1
}bmt_struct;


/***************************************************************
*                                                              *
* Interface BMT need to use                                    *
*                                                              *
***************************************************************/
#if defined(__PRELOADER_NAND__)

extern int mt6573_nand_read_page_hw(u32 page, u8 *dat, u8 *oob);
extern bool nand_block_bad_hw(u32 offset);
extern bool mt6573_nand_erase_hw(u32 offset);
extern bool mark_block_bad_hw(u32 offset);
extern int mt6573_nand_write_page_hw(u32 page, u8 *dat, u8 *oob);

#elif defined(__UBOOT_NAND__)

extern bool mt6573_nand_exec_read_page_hw(struct nand_chip *nand, u32 page, u32 page_size, u8 *dat, u8 *oob);
extern bool nand_block_bad_hw(struct nand_chip *nand, u32 offset);

#elif defined(__KERNEL_NAND__)

extern bool mt6573_nand_exec_read_page(struct mtd_info *mtd, u32 row, u32 page_size, u8 *dat, u8 *oob);
extern int mt6573_nand_block_bad_hw(struct mtd_info *mtd, loff_t ofs);
extern int mt6573_nand_erase_hw(struct mtd_info *mtd, int page);
extern int mt6573_nand_block_markbad_hw(struct mtd_info *mtd, loff_t ofs);
extern int mt6573_nand_exec_write_page(struct mtd_info *mtd, u32 row, u32 page_size, u8 *dat, u8 *oob);

#endif



/********************************************
*                                           *
* Interface for preloader/uboot/kernel      *
*                                           *
********************************************/
void set_bad_index_to_oob(u8 *oob, u16 index);
bmt_struct *init_bmt(struct nand_chip* nand, int size);
bool update_bmt(u32 offset, update_reason_t reason, u8 *dat, u8 *oob);
unsigned short get_mapping_block_index(int index);
void set_bmt_reserve_region(set_res_flag_t flag, int size);

#endif // #ifndef __BMT_H__
