#ifndef __MTD_RT_FLASH_H__
#define __MTD_RT_FLASH_H__

#include <asm/tc3162/tc3162.h>
#ifndef VPint
#define VPint			*(volatile unsigned long int *)
#endif
#if TCSUPPORT_MT7510_E1
#define READ_FLASH_BYTE(i)  	( (IS_NANDFLASH) ? \
								((ranand_read_byte != NULL) ? ranand_read_byte((i)) : -1) \
								: (((*((unsigned char*)i))==0) ? (*((unsigned char*)i)): (*((unsigned char*)i))) )


/* for read flash, frankliao added 20101216 */
#define READ_FLASH_DWORD(i)  ( (IS_NANDFLASH) ? \
								((ranand_read_dword != NULL) ? ranand_read_dword((i)) : -1) \
								: (((*((unsigned int*)i))==0) ? (*((unsigned int*)i)): (*((unsigned int*)i))) )
#else
#define READ_FLASH_BYTE(i)  	( (IS_NANDFLASH) ? \
								((ranand_read_byte != NULL) ? ranand_read_byte((i)) : -1) \
								: (*((unsigned char*)i)) )


/* for read flash, frankliao added 20101216 */
#define READ_FLASH_DWORD(i)  ( (IS_NANDFLASH) ? \
								((ranand_read_dword != NULL) ? ranand_read_dword((i)) : -1) \
								: (*((unsigned int*)i)) )

#endif
/* frankliao added 20101215 */
extern unsigned long flash_base;
extern unsigned int (*ranand_read_byte)(unsigned long long);
extern unsigned int (*ranand_read_dword)(unsigned long long);

#endif /* __MTD_MTD_RT_FLASH_H__ */
