/************************************************************************
 *
 *	Copyright (C) 2012 MediaTek Technologies, Corp.
 *	All Rights Reserved.
 *
 * MediaTek Confidential; Need to Know only.
 * Protected as an unpublished work.
 *
 * The computer program listings, specifications and documentation
 * herein are the property of MediaTek Technologies, Co. and shall
 * not be reproduced, copied, disclosed, or used in whole or in part
 * for any reason without the prior express written permission of
 * MediaTek Technologeis, Co.
 *
 *************************************************************************/


#include <linux/err.h>
#include <linux/module.h>
#include <net/ip.h>
#include <net/xfrm.h>
#include <net/esp.h>
#include <asm/scatterlist.h>
#include <linux/crypto.h>
#include <linux/kernel.h>
#include <linux/pfkeyv2.h>
#include <linux/random.h>
#include <net/icmp.h>
#include <net/protocol.h>
#include <net/udp.h>

#include <net/mtk_esp.h>
#include <linux/netfilter_ipv4.h>
#include <linux/foe_hook.h>


/************************************************************************
*                          C O N S T A N T S
*************************************************************************
*/
#define IPESC_EIP93_ADAPTERS	16
#define HASH_MD5_HMAC			"hmac(md5)"
#define HASH_SHA1_HMAC			"hmac(sha1)"
#define HASH_SHA256_HMAC		"hmac(sha256)"
#define HASH_NULL_HMAC 			"hmac(digest_null)"
#define HASH_IPAD				0x36363636
#define HASH_OPAD				0x5c5c5c5c
#define CIPHER_DES_CBC			"cbc(des)"
#define CIPHER_3DES_CBC			"cbc(des3_ede)"
#define CIPHER_AES_CBC			"cbc(aes)"
#define CIPHER_NULL_ECB			"ecb(cipher_null)"
#define SKB_QUEUE_MAX_SIZE		100

//#define RALINK_HWCRYPTO_NAT_T	1
/************************************************************************
*      P R I V A T E    S T R U C T U R E    D E F I N I T I O N
*************************************************************************
*/


/************************************************************************
*              P R I V A T E     D A T A
*************************************************************************
*/
static ipsecEip93Adapter_t 	*ipsecEip93AdapterListOut[IPESC_EIP93_ADAPTERS];
static ipsecEip93Adapter_t 	*ipsecEip93AdapterListIn[IPESC_EIP93_ADAPTERS];
static spinlock_t 			cryptoLock;
static eip93DescpHandler_t 	resDescpHandler;

#ifdef TCSUPPORT_IPSEC_PASSTHROUGH
vpnPassThrough_Global_Para_t gVpnPTPara;
vpnPassThrough_Global_Para_t *gpVpnPTPara = &gVpnPTPara;
#endif
/************************************************************************
*              E X T E R N A L     D A T A
*************************************************************************
*/
int 
(*ipsec_packet_put)(
	eip93DescpHandler_t *descpHandler, 
	struct sk_buff *skb
);
int 
(*ipsec_packet_get)(
	eip93DescpHandler_t *descpHandler
);
bool 
(*ipsec_eip93CmdResCnt_check)(
	void
);
int 
(*ipsec_preComputeIn_cmdDescp_set)(
	ipsecEip93Adapter_t *currAdapterPtr,
	//unsigned int hashAlg, 
	unsigned int direction
);
int 
(*ipsec_preComputeOut_cmdDescp_set)(
	ipsecEip93Adapter_t *currAdapterPtr, 
	//unsigned int hashAlg,
	unsigned int direction
);
int 
(*ipsec_cmdHandler_cmdDescp_set)(
	ipsecEip93Adapter_t *currAdapterPtr, 
	unsigned int direction,
	unsigned int cipherAlg, 
	unsigned int hashAlg, 
	unsigned int cipherMode, 
	unsigned int enHmac, 
	unsigned int aesKeyLen, 
	unsigned int *cipherKey, 
	unsigned int keyLen, 
	unsigned int spi, 
	unsigned int padCrtlStat
);
void 
(*ipsec_espNextHeader_set)(
	eip93DescpHandler_t *cmdHandler, 
	unsigned char protocol	
);
unsigned char 
(*ipsec_espNextHeader_get)(
	eip93DescpHandler_t *resHandler
);
unsigned int 
(*ipsec_pktLength_get)(
	eip93DescpHandler_t *resHandler
);
unsigned int 
(*ipsec_eip93HashFinal_get)(
	eip93DescpHandler_t *resHandler
);
unsigned int 
(*ipsec_eip93UserId_get)(
	eip93DescpHandler_t *resHandler
);

void 
(*ipsec_addrsDigestPreCompute_free)(
	ipsecEip93Adapter_t *currAdapterPtr
);

void 
(*ipsec_cmdHandler_free)(
	eip93DescpHandler_t *cmdHandler
);

void 
(*ipsec_hashDigests_get)(
	ipsecEip93Adapter_t *currAdapterPtr
);

void 
(*ipsec_hashDigests_set)(
	ipsecEip93Adapter_t *currAdapterPtr,
	unsigned int isInOrOut
);

unsigned int 
(*ipsec_espSeqNum_get)(
	eip93DescpHandler_t *resHandler
);

EXPORT_SYMBOL(ipsec_packet_put);
EXPORT_SYMBOL(ipsec_packet_get);
EXPORT_SYMBOL(ipsec_eip93CmdResCnt_check);
EXPORT_SYMBOL(ipsec_preComputeIn_cmdDescp_set);
EXPORT_SYMBOL(ipsec_preComputeOut_cmdDescp_set);
EXPORT_SYMBOL(ipsec_cmdHandler_cmdDescp_set);
EXPORT_SYMBOL(ipsec_espNextHeader_set);
EXPORT_SYMBOL(ipsec_espNextHeader_get);
EXPORT_SYMBOL(ipsec_pktLength_get);
EXPORT_SYMBOL(ipsec_eip93HashFinal_get);
EXPORT_SYMBOL(ipsec_eip93UserId_get);
EXPORT_SYMBOL(ipsec_addrsDigestPreCompute_free);
EXPORT_SYMBOL(ipsec_cmdHandler_free);
EXPORT_SYMBOL(ipsec_hashDigests_get);
EXPORT_SYMBOL(ipsec_hashDigests_set);
EXPORT_SYMBOL(ipsec_espSeqNum_get);


#ifdef TCSUPPORT_IPSEC_PASSTHROUGH
#ifdef CONFIG_VPN_PASSTHROUGH_LOG
#ifndef VPN_LOG
#define VPN_LOG(Level,fmt,args...)  		\
		{									\
			if (Level <= gpVpnPTPara->vpndebuglevel)		\
			{								\
				printk("\r\n[%s]"fmt,__func__,##args);\
			}								\
		}
#endif

void skb_dump(struct sk_buff* sk) {  
  	unsigned int i;	
	if(VPN_PASSTHROUGH_LOG_DUMP_DATA == gpVpnPTPara->vpndebuglevel)
		{
	        printk("\nskb_dump: from %s with len %d (%d) headroom=%d tailroom=%d\n",
	                sk->dev?sk->dev->name:"ip stack",sk->len,sk->truesize,
	                skb_headroom(sk),skb_tailroom(sk));

	        for(i=(unsigned int)sk->head;i<(unsigned int)sk->tail;i++) {
	                if((i % 16) == 0)
			    printk("\n");

	                if(i==(unsigned int)sk->head) printk("@h");	
					if(i==(unsigned int)sk->network_header) printk("@n");
					if(i==(unsigned int)sk->mac_header) printk("@*");
	                if(i==(unsigned int)sk->data) printk("@d");
	                printk("%02X-",*((unsigned char*)i));
	        }
	        printk("\n");
		}
}

void dump_data(char *p, int len)
{
	if(VPN_PASSTHROUGH_LOG_DUMP_DATA == gpVpnPTPara->vpndebuglevel)
	{
		char tmp[80];
		char *t = tmp;
		int i, n = 0;

		printk("ERR data=%08x len=%d\n", (unsigned int) p, len);
		for (i = 0; i < len; i++) {
			t += sprintf(t, "%02x ", *p++ & 0xff);
			if ((i & 0x0f) == 0x0f) {
				printk("%04x: %s\n", n, tmp);
				n += 16;
				t = tmp;
			}
		}
		if (i & 0x0f)
			printk("%04x: %s\n", n, tmp);
	}
}
#endif
#endif

/************************************************************************
*              P R I V A T E     F U N C T I O N S
*************************************************************************
*/
/*_______________________________________________________________________
**function name: ipsec_hashDigest_preCompute
**
**description:
*   EIP93 can only use Hash Digests (not Hash keys) to do authentication!
*	This funtion is to use EIP93 to generate Hash Digests from Hash keys!
*	Only the first packet for a IPSec flow need to do this!
**parameters:
*   x -- point to the structure that stores IPSec SA information
*	currAdapterPtr -- point to the structure that stores needed info
*		for Hash Digest Pre-Compute. After Pre-Compute is done,
*		currAdapterPtr->addrsPreCompute is used to free resource.
*	digestPreComputeDir -- indicate direction for encryption or
*		decryption.
**global:
*   none
**return:
*   -EPERM, -ENOMEM -- failed: the pakcet will be dropped!
*	1 -- success
**call:
*   none
**revision:
*   1.Trey 20120209
**_______________________________________________________________________*/
static int 
ipsec_hashDigest_preCompute(
	struct xfrm_state *x, 
	ipsecEip93Adapter_t *currAdapterPtr, 
	unsigned int digestPreComputeDir
)
{
	char hashKeyName[32];
	unsigned int blkSize, blkWord, digestWord, hashKeyLen, hashKeyWord;
	unsigned int *ipad, *opad, *hashKey, *hashKeyTank;
	dma_addr_t	ipadPhyAddr, opadPhyAddr;
	unsigned int *pIDigest, *pODigest;
	unsigned int i, j;
	int errVal;
	
	addrsDigestPreCompute_t* addrsPreCompute;
	
	strcpy(hashKeyName, x->aalg->alg_name);

	hashKeyLen = (x->aalg->alg_key_len+7)/8;
	
	hashKeyWord = hashKeyLen >> 2;

	if (strcmp(hashKeyName, HASH_MD5_HMAC) == 0)
	{
		blkSize = 64; //bytes
		digestWord = 4; //words
	}
	else if (strcmp(hashKeyName, HASH_SHA1_HMAC) == 0)
	{
		blkSize = 64; //bytes
		digestWord = 5; //words	
	}
	else if (strcmp(hashKeyName, HASH_SHA256_HMAC) == 0)
	{
		blkSize = 64; //bytes
		digestWord = 8; //words	
	}
	else
	{
		printk("\n !Unsupported Hash Algorithm by EIP93: %s! \n", hashKeyName);
		return -EPERM;
	}

	
	addrsPreCompute = (addrsDigestPreCompute_t *) kzalloc(sizeof(addrsDigestPreCompute_t), GFP_KERNEL);
	if (unlikely(addrsPreCompute == NULL))
	{
		printk("\n\n !!kmalloc for addrsPreCompute failed!! \n\n");
		return -ENOMEM;
	}
	currAdapterPtr->addrsPreCompute = addrsPreCompute;
	
	hashKeyTank = (unsigned int *) kzalloc(blkSize, GFP_KERNEL);
	if (unlikely(hashKeyTank == NULL))
	{
		printk("\n\n !!kmalloc for hashKeyTank failed!! \n\n");
		errVal = -ENOMEM;
		goto free_addrsPreCompute;
	}
	addrsPreCompute->hashKeyTank = hashKeyTank;
	
	ipad = (unsigned int *) dma_alloc_coherent(NULL, blkSize, &ipadPhyAddr, GFP_KERNEL);
	if (unlikely(ipad == NULL))
	{
		printk("\n\n !!dma_alloc for ipad failed!! \n\n");
		errVal = -ENOMEM;
		goto free_hashKeyTank;
	}
	addrsPreCompute->ipadHandler.addr = (unsigned int)ipad;
	addrsPreCompute->ipadHandler.phyAddr = ipadPhyAddr;
	addrsPreCompute->blkSize = blkSize;
	
	opad = (unsigned int *) dma_alloc_coherent(NULL, blkSize, &opadPhyAddr, GFP_KERNEL);
	if (unlikely(opad == NULL))
	{
		printk("\n\n !!dma_alloc for opad failed!! \n\n");
		errVal = -ENOMEM;
		goto free_ipad;
	}
	addrsPreCompute->opadHandler.addr = (unsigned int)opad;
	addrsPreCompute->opadHandler.phyAddr = opadPhyAddr;	

	blkWord = blkSize >> 2;
	hashKey = (unsigned int *)x->aalg->alg_key;
	                                     
	if(hashKeyLen <= blkSize)
	{
		for(i = 0; i < hashKeyWord; i++)
		{
			hashKeyTank[i] = hashKey[i];
		}
		for(j = i; j < blkWord; j++)
		{
			hashKeyTank[j] = 0x0;
		}
	}
	else
	{
		// EIP93 supports md5, sha1, sha256. Their hash key length and their function output length should be the same, which are 128, 160, and 256 bits respectively! Their block size are 64 bytes which are always larger than all of their hash key length! 
		printk("\n !Unsupported hashKeyLen:%d by EIP93! \n", hashKeyLen);
		errVal = -EPERM;
		goto free_opad;
	}
	
	for(i=0; i<blkWord; i++)
	{
		ipad[i] = HASH_IPAD;
		opad[i] = HASH_OPAD;
		ipad[i] ^= hashKeyTank[i];
		opad[i] ^= hashKeyTank[i];			
	}

	pIDigest = (unsigned int *) kzalloc(sizeof(unsigned int) << 3, GFP_KERNEL);
	if(pIDigest == NULL)
	{
		printk("\n\n !!kmalloc for Hash Inner Digests failed!! \n\n");
		errVal = -ENOMEM;
		goto free_opad;
	}
	addrsPreCompute->pIDigest = pIDigest;
	
	pODigest = (unsigned int *) kzalloc(sizeof(unsigned int) << 3, GFP_KERNEL);
	if(pODigest == NULL)
	{
		printk("\n\n !!kmalloc for Hash Outer Digests failed!! \n\n");
		errVal = -ENOMEM;
		goto free_pIDigest;
	}
	addrsPreCompute->pODigest = pODigest;
		
	addrsPreCompute->digestWord = digestWord;

	currAdapterPtr->isHashPreCompute = 0; //pre-compute init	
	/* start pre-compute for Hash Inner Digests */
	errVal = ipsec_preComputeIn_cmdDescp_set(currAdapterPtr, /*hashAlg,*/ digestPreComputeDir);
	if (errVal < 0)
	{
		goto free_pODigest;
	}

	spin_lock(&cryptoLock);
	ipsec_packet_put(addrsPreCompute->cmdHandler, NULL); //mtk_packet_put()
	
	spin_unlock(&cryptoLock);
	
	
	/* start pre-compute for Hash Outer Digests */	
	errVal = ipsec_preComputeOut_cmdDescp_set(currAdapterPtr, /*hashAlg,*/ digestPreComputeDir);
	if (errVal < 0)
	{
		goto free_pODigest;
	}

	spin_lock(&cryptoLock);
	ipsec_packet_put(addrsPreCompute->cmdHandler, NULL); //mtk_packet_put()
	
	spin_unlock(&cryptoLock);
	
	return 1; //success
	

free_pODigest:
	kfree(pODigest);
free_pIDigest:
	kfree(pIDigest);
free_opad:
	dma_free_coherent(NULL, blkSize, opad, opadPhyAddr);		
free_ipad:
	dma_free_coherent(NULL, blkSize, ipad, ipadPhyAddr);		
free_hashKeyTank:
	kfree(hashKeyTank);
free_addrsPreCompute:
	kfree(addrsPreCompute);
	currAdapterPtr->addrsPreCompute = NULL;	

	return errVal;	
}

/*_______________________________________________________________________
**function name: ipsec_cmdHandler_prepare
**
**description:
*   Prepare a command handler for a IPSec flow. This handler includes 
*	all needed information for EIP93 to do encryption/decryption.
*	Only the first packet for a IPSec flow need to do this!
**parameters:
*   x -- point to the structure that stores IPSec SA information
*	currAdapterPtr -- point to the structure that will stores the
*		command handler
*	cmdHandlerDir -- indicate direction for encryption or decryption.
**global:
*   none
**return:
*   -EPERM, -ENOMEM -- failed: the pakcet will be dropped!
*	1 -- success
**call:
*   none
**revision:
*   1.Trey 20120209
**_______________________________________________________________________*/
static int 
ipsec_cmdHandler_prepare(
	struct xfrm_state *x, 
	ipsecEip93Adapter_t *currAdapterPtr,
	unsigned int cmdHandlerDir
)
{
	int errVal;
	struct esp_data *esp = x->data;
	int padBoundary = ALIGN(crypto_aead_blocksize(esp->aead), 4);
	unsigned int padCrtlStat, keyLen;
	char nameString[32];
	unsigned int cipherAlg, cipherMode, aesKeyLen = 0, hashAlg, enHmac;
	unsigned int *cipherKey;
	unsigned int addedLen = 0;

	addedLen += 8; //for esp header	
	
	/* decide pad boundary */
	switch(padBoundary){
		case 1:
			padCrtlStat = 0x1;
			addedLen += 1;
			break;
		case 4:
			padCrtlStat = 0x1 << 1;
			addedLen += 4;
			break;
		case 8:
			padCrtlStat = 0x1 << 2;
			addedLen += 8;
			break;
		case 16:
			padCrtlStat = 0x1 << 3;
			addedLen += 16;
			break;
		case 32:
			padCrtlStat = 0x1 << 4;
			addedLen += 32;
			break;
		case 64:
			padCrtlStat = 0x1 << 5;
			addedLen += 64;
			break;
		case 128:
			padCrtlStat = 0x1 << 6;
			addedLen += 128;
			break;
		case 256:
			padCrtlStat = 0x1 << 7;
			addedLen += 256;
			break;
		default:
			printk("\n !Unsupported pad boundary (%d) by EIP93! \n", padBoundary);
			errVal = -EPERM;
			goto free_addrsPreComputes;
	}
	
	
	/* decide cipher */
	strcpy(nameString, x->ealg->alg_name);
	printk("cipher algorithm is %s\n", nameString);
	keyLen = (x->ealg->alg_key_len+7)/8;
	if(strcmp(nameString, CIPHER_DES_CBC) == 0)
	{
		cipherAlg = 0x0; //des
		cipherMode = 0x1; //cbc
		addedLen += (8 + (8 + 1)); //iv + (esp trailer + padding)
	}
	else if(strcmp(nameString, CIPHER_3DES_CBC) == 0)
	{
		cipherAlg = 0x1; //3des
		cipherMode = 0x1; //cbc
		addedLen += (8 + (8 + 1)); //iv + (esp trailer + padding)
	}
	else if(strcmp(nameString, CIPHER_AES_CBC) == 0)
	{
		cipherAlg = 0x3; //aes
		cipherMode = 0x1; //cbc
		addedLen += (16 + (16 + 1)); //iv + (esp trailer + padding)

		switch(keyLen << 3) //keyLen*8
		{ 
			case 128:
				aesKeyLen = 0x2;
				break;
			case 192:
				aesKeyLen = 0x3;
				break;
			case 256:
				aesKeyLen = 0x4;
				break;
			default:
				printk("\n !Unsupported AES key length (%d) by EIP93! \n", keyLen << 3);
				errVal = -EPERM;
				goto free_addrsPreComputes;
		}
	}
	else if(strcmp(nameString, CIPHER_NULL_ECB) == 0)
	{
		cipherAlg = 0xf; //null
		cipherMode = 0x0; //ecb
		addedLen += (8 + (16 + 1) + 16); //iv + (esp trailer + padding) + ICV
	}
	else
	{
		printk("\n !Unsupported Cipher Algorithm (%s) by EIP93! \n", nameString);
		errVal = -EPERM;
		goto free_addrsPreComputes;
	}

	
	/* decide hash */
	strcpy(nameString, x->aalg->alg_name);
	if(strcmp(nameString, HASH_MD5_HMAC) == 0)
	{
		hashAlg = 0x0; //md5
		enHmac = 0x1; //hmac
		addedLen += 12; //ICV
	}
	else if(strcmp(nameString, HASH_SHA1_HMAC) == 0)
	{
		hashAlg = 0x1; //sha1
		enHmac = 0x1; //hmac
		addedLen += 12; //ICV
	}
	else if(strcmp(nameString, HASH_SHA256_HMAC) == 0)
	{
		hashAlg = 0x3; //sha256
		enHmac = 0x1; //hmac
		addedLen += 16; //ICV
	}
	else
	{
		printk("\n !Unsupported! Hash Algorithm (%s) by EIP93! \n", nameString);
		errVal = -EPERM;
		goto free_addrsPreComputes;
	}

	cipherKey =	(unsigned int *)x->ealg->alg_key;
	currAdapterPtr->addedLen = addedLen;
	errVal = ipsec_cmdHandler_cmdDescp_set(currAdapterPtr, cmdHandlerDir, cipherAlg, hashAlg, cipherMode, enHmac, aesKeyLen, cipherKey, keyLen, x->id.spi, padCrtlStat);
	if (errVal < 0)
	{
		goto free_addrsPreComputes;
	}

	return 1; //success
	

free_addrsPreComputes:
	ipsec_addrsDigestPreCompute_free(currAdapterPtr);

	return errVal;
}

static int 
ipsec_esp_preProcess(
	struct xfrm_state *x, 
	struct sk_buff *skb,
	unsigned int direction
)
{
	ipsecEip93Adapter_t **ipsecEip93AdapterList;
	unsigned int i, usedEntryNum = 0;
	ipsecEip93Adapter_t *currAdapterPtr;
	unsigned int spi = x->id.spi;
	int currAdapterIdx = -1;
	int err;
	unsigned int *addrCurrAdapter;
	eip93DescpHandler_t *cmd;
	
	if (direction == HASH_DIGEST_OUT)
	{
		ipsecEip93AdapterList = &ipsecEip93AdapterListOut[0];
	}
	else
	{
		ipsecEip93AdapterList = &ipsecEip93AdapterListIn[0];
	}

	//try to find the matched ipsecEip93Adapter for the ipsec flow
	for (i = 0; i < IPESC_EIP93_ADAPTERS; i++)
	{
		if ((currAdapterPtr = ipsecEip93AdapterList[i]) != NULL)
		{
			if (currAdapterPtr->spi == spi)
			{
				currAdapterIdx = i;
				//printk("\nfind adapter\n");
				break;
			}
			usedEntryNum++;
		}
		else
		{	//try to record the first unused entry in ipsecEip93AdapterList
			if (currAdapterIdx == -1)
			{
				currAdapterIdx = i;
			}
		}
	}
	
	if (usedEntryNum == IPESC_EIP93_ADAPTERS)
	{
		printk("\n\n !The ipsecEip93AdapterList table is full! \n\n");
		return -EPERM;
	}

	//no ipsecEip93Adapter matched, so create a new one for the ipsec flow. Only the first packet of a ipsec flow will encounter this.
	if (i == IPESC_EIP93_ADAPTERS)
	{
		printk("\ncreate new connect for hardware !\n");
		if (x->aalg == NULL)
		{
			printk("\n\n !please set a hash algorithm! \n\n");
			return -EPERM;
		}
		else if (x->ealg == NULL)
		{
			printk("\n\n !please set a cipher algorithm! \n\n");
			return -EPERM;
		}
	
		currAdapterPtr = (ipsecEip93Adapter_t *) kzalloc(sizeof(ipsecEip93Adapter_t), GFP_KERNEL);	
		if(currAdapterPtr == NULL)
		{
			printk("\n\n !!kmalloc for new ipsecEip93Adapter failed!! \n\n");
			return -ENOMEM;
		}
		
		spin_lock_init(&currAdapterPtr->lock);
		skb_queue_head_init(&currAdapterPtr->skbQueue);	

		err = ipsec_hashDigest_preCompute(x, currAdapterPtr, direction);
		if (err < 0)
		{
			printk("\n\n !ipsec_hashDigest_preCompute for direction:%d failed! \n\n", direction);
			kfree(currAdapterPtr);
			return err;
		}		
		
		err = ipsec_cmdHandler_prepare(x, currAdapterPtr, direction);
		if (err < 0)
		{
			printk("\n\n !ipsec_cmdHandler_prepare for direction:%d failed! \n\n", direction);
			kfree(currAdapterPtr);
			return err;
		}		
		
		currAdapterPtr->spi = spi;
#ifdef TCSUPPORT_IPSEC_PASSTHROUGH	
		currAdapterPtr->x = x;
		//first set dst refcnt++,and then store dst point(note:this dst must be using ref way)
		currAdapterPtr->xdst = 	dst_clone(skb_dst(skb));//for ipsec_esp_output_pt
		if (direction == HASH_DIGEST_IN)
		{
			currAdapterPtr->sp = skb->sp;
			skb->sp = secpath_get(currAdapterPtr->sp);
		}
#endif
		ipsecEip93AdapterList[currAdapterIdx] = currAdapterPtr;
	}
	
	
	currAdapterPtr = ipsecEip93AdapterList[currAdapterIdx];

#ifdef TCSUPPORT_IPSEC_PASSTHROUGH
		if (ra_sw_nat_hook_foeentry)
		{
			currAdapterPtr->foeentryindex.firstperiod = ra_sw_nat_hook_foeentry(skb,FOE_OPE_GETENTRYNUM);
		}
	
		skb->cb[IPSEC_SKB_CB] = currAdapterIdx;
#endif

	//printk("currAdapterIdx=%d\n",currAdapterIdx);
#ifndef TCSUPPORT_IPSEC_PASSTHROUGH	
	if (direction == HASH_DIGEST_IN)
	{
		currAdapterPtr->x = x;
	}
#endif
	
	spin_lock(&currAdapterPtr->lock);
	//Hash Digests are ready
	if (currAdapterPtr->isHashPreCompute == 2)
	{	 		
		ipsec_hashDigests_get(currAdapterPtr);
		currAdapterPtr->isHashPreCompute = 3; //pre-compute done
		ipsec_addrsDigestPreCompute_free(currAdapterPtr);	
	}
	
	spin_unlock(&currAdapterPtr->lock);	

	//save needed info skb (cryptoDriver will save skb in EIP93's userID), so the needed info can be used by the tasklet which is raised by interrupt.
	addrCurrAdapter = (unsigned int *) &(skb->cb[36]);
	*addrCurrAdapter = (unsigned int)currAdapterPtr;
	cmd =currAdapterPtr->cmdHandler;
	//printk("\nAdapter=%x,%x,%x,%x",cmd->stateAddr.addr,cmd->saAddr.addr,cmd->dstAddr.addr,cmd->peLength.word);
	return 1; //success
}


#ifdef TCSUPPORT_IPSEC_PASSTHROUGH
static int 
ipsec_esp_pktPut(
	struct sk_buff *skb,int flag
)
#else
static int 
ipsec_esp_pktPut(
	struct sk_buff *skb
)
#endif
{
	ipsecEip93Adapter_t *currAdapterPtr;
	eip93DescpHandler_t *cmdHandler;
	struct sk_buff *pSkb;
	unsigned int isQueueFull = 0;
	unsigned int addedLen;
	struct sk_buff *skb2;
		struct dst_entry *dst = skb_dst(skb);
	unsigned int *addrCurrAdapter;
    int isOriSkbFree = 0;
	#ifdef TCSUPPORT_IPSEC_PASSTHROUGH
	unsigned long flags;
	#endif
	addrCurrAdapter = (unsigned int *) &(skb->cb[36]);
	currAdapterPtr = (ipsecEip93Adapter_t *)(*addrCurrAdapter);
	cmdHandler = currAdapterPtr->cmdHandler;
	addedLen = currAdapterPtr->addedLen;


	//resemble paged packets if needed
	if (skb_is_nonlinear(skb)) 
	{
		if (skb_linearize(skb) != 0)
		{
			printk("\n !resembling paged packets failed! \n");
			return -EPERM;
		}
		
		//skb_linearize() may return a new skb, so insert currAdapterPtr back to skb!
		addrCurrAdapter = (unsigned int *) &(skb->cb[36]);
		*addrCurrAdapter = (unsigned int)currAdapterPtr;
	}
	
	
	//make sure that tailroom is enough for the added length due to encryption	
	if (skb_tailroom(skb) < addedLen)
	{
		skb2 = skb_copy_expand(skb, skb_headroom(skb), addedLen, GFP_ATOMIC);

		if (skb2 == NULL)
		{
			printk("\n !skb_copy_expand failed! \n");
			return -EPERM; //old skb will be free.
		}

        kfree_skb(skb); //free original skb
        isOriSkbFree = 1;
		skb = skb2; //the new skb
		skb_dst_set(skb, dst_clone(dst));
		addrCurrAdapter = (unsigned int *) &(skb->cb[36]);
		*addrCurrAdapter = (unsigned int)currAdapterPtr;
	}
#if defined(TCSUPPORT_IPSEC_PASSTHROUGH) && defined(CONFIG_VPN_PASSTHROUGH_INFO)
	if (currAdapterPtr->skbQueue.qlen < gpVpnPTPara->vpnskbqueuemaxnum)
#else
	if (currAdapterPtr->skbQueue.qlen < SKB_QUEUE_MAX_SIZE)
#endif
	{
		skb_queue_tail(&currAdapterPtr->skbQueue, skb);
	}
	else
	{
		isQueueFull = 1;
	}
		
	//ipsec_BH_handler_resultGet has no chance to set isHashPreCompute as 3, so currAdapterPtr->lock is not needed here!
	if (currAdapterPtr->isHashPreCompute == 3) //pre-compute done
	{		
	#ifdef TCSUPPORT_IPSEC_PASSTHROUGH
		spin_lock_irqsave(&cryptoLock,flags);
	#else
		spin_lock(&cryptoLock);
	#endif
		
		while (
			ipsec_eip93CmdResCnt_check() &&
			((pSkb = skb_dequeue(&currAdapterPtr->skbQueue)) != NULL)
		)
		{
			ipsec_packet_put(cmdHandler, pSkb); //mtk_packet_put
		}
	#ifdef TCSUPPORT_IPSEC_PASSTHROUGH
		spin_unlock_irqrestore(&cryptoLock,flags);
	#else
		spin_unlock(&cryptoLock);
	#endif
		
		if (
			isQueueFull && 
		#if defined(TCSUPPORT_IPSEC_PASSTHROUGH) && defined(CONFIG_VPN_PASSTHROUGH_INFO)
			(currAdapterPtr->skbQueue.qlen < gpVpnPTPara->vpnskbqueuemaxnum)
		#else
			(currAdapterPtr->skbQueue.qlen < SKB_QUEUE_MAX_SIZE)
		#endif
		)
		{
			isQueueFull = 0;
			skb_queue_tail(&currAdapterPtr->skbQueue, skb);
		}
	}

	
	if (isQueueFull == 0)
	{
		return 1; //success
	}
	else
	{
	    if (isOriSkbFree)
        {
            kfree_skb(skb); //free the new skb
           	#if defined(TCSUPPORT_IPSEC_PASSTHROUGH) && defined(CONFIG_VPN_PASSTHROUGH_INFO)
           	if(flag)
				gpVpnPTPara->statistics.einfo.e_phase1_drop_counts++;
			else
				gpVpnPTPara->statistics.dinfo.d_phase1_drop_counts++;
			#endif
            return 1;
        }
        else
            return -ENOMEM; //drop the original skb
	}
}

/*_______________________________________________________________________
**function name: ipsec_esp_output_finish
**
**description:
*   Deal with the rest of Linux Kernel's esp_output(). Then,
*	the encrypted packet can do the correct post-routing.
**parameters:
*   resHandler -- point to the result descriptor handler that stores
*		the needed info comming from EIP93's Result Descriptor Ring.
**global:
*   none
**return:
*   none
**call:
*   ip_output()
**revision:
*   1.Trey 20120209
**_______________________________________________________________________*/
static void 
ipsec_esp_output_finish(
	eip93DescpHandler_t *resHandler
)
{
	struct sk_buff *skb = (struct sk_buff *) ipsec_eip93UserId_get(resHandler);
	struct iphdr *top_iph = ip_hdr(skb);
	unsigned int length;
	//struct dst_entry *dst = skb->dst;
	struct dst_entry *dst = skb_dst(skb);
	struct xfrm_state *x = dst->xfrm;
	
	struct net *net = xs_net(x);
	int err;
	struct ip_esp_hdr *esph = ip_esp_hdr(skb);	

	length = ipsec_pktLength_get(resHandler);

	skb_put(skb, length - skb->len); //adjust skb->tail

	length += skb->data - skb_network_header(skb); //IP total length

	__skb_push(skb, -skb_network_offset(skb));
#ifdef RALINK_HWCRYPTO_NAT_T
	if (x->encap)
		skb_push(skb, 8);
#endif			
	esph = ip_esp_hdr(skb);
	*skb_mac_header(skb) = IPPROTO_ESP;	      
#ifdef RALINK_HWCRYPTO_NAT_T
	if (x->encap) {
		struct xfrm_encap_tmpl *encap = x->encap;
		struct udphdr *uh;
		__be32 *udpdata32;
		__be16 sport, dport;
		int encap_type;

		sport = encap->encap_sport;
		dport = encap->encap_dport;
		encap_type = encap->encap_type;

		uh = (struct udphdr *)esph;
		uh->source = sport;
		uh->dest = dport;
		uh->len = htons(skb->len - skb_transport_offset(skb));
		uh->check = 0;
	
		switch (encap_type) {
		default:
		case UDP_ENCAP_ESPINUDP:
			esph = (struct ip_esp_hdr *)(uh + 1);
			break;
		case UDP_ENCAP_ESPINUDP_NON_IKE:
			udpdata32 = (__be32 *)(uh + 1);
			udpdata32[0] = udpdata32[1] = 0;
			esph = (struct ip_esp_hdr *)(udpdata32 + 2);
			break;
		}

		*skb_mac_header(skb) = IPPROTO_UDP;
		//__skb_push(skb, -skb_network_offset(skb));
	}
#endif

	top_iph->tot_len = htons(length);
	ip_send_check(top_iph);

	//skb_dump(skb,__LINE__);
	/* adjust for IPSec post-routing */
	dst = skb_dst_pop(skb);
	if (!dst) {
		XFRM_INC_STATS(net, LINUX_MIB_XFRMOUTERROR);
		err = -EHOSTUNREACH;
		printk("(%d)ipsec_esp_output_finish EHOSTUNREACH\n",__LINE__);
		kfree_skb(skb);
		#if defined(TCSUPPORT_IPSEC_PASSTHROUGH) && defined(CONFIG_VPN_PASSTHROUGH_INFO)
		gpVpnPTPara->statistics.einfo.e_phase2_drop_counts++;	
		#endif
		return;
	}
	
	skb_dst_set(skb, dst_clone(dst));
	nf_reset(skb);
#if defined(TCSUPPORT_IPSEC_PASSTHROUGH) && defined(CONFIG_VPN_PASSTHROUGH_INFO)
	gpVpnPTPara->statistics.einfo.e_phase2_normal_counts++;
#endif	

	if (!skb_dst(skb)->xfrm)
	{
		ip_output(skb);
	}
	else 
	{
		#if defined(TCSUPPORT_IPSEC_PASSTHROUGH) && defined(CONFIG_VPN_PASSTHROUGH_INFO)
		gpVpnPTPara->statistics.einfo.e_phase2_drop_counts++;
		#endif
		kfree_skb(skb);
	}
		      
}


/*_______________________________________________________________________
**function name: ipsec_esp_input_finish
**
**description:
*   Deal with the rest of Linux Kernel's esp_input(). Then,
*	the decrypted packet can do the correct post-routing.
**parameters:
*   resHandler -- point to the result descriptor handler that stores
*		the needed info comming from EIP93's Result Descriptor Ring.
*   x -- point to the structure that stores IPSec SA information
**global:
*   none
**return:
*   none
**call:
*   netif_rx() for tunnel mode, or xfrm4_rcv_encap_finish() for transport
*		mode.
**revision:
*   1.Trey 20120209
**_______________________________________________________________________*/
static void 
ipsec_esp_input_finish(
	eip93DescpHandler_t *resHandler, 
	struct xfrm_state *x
)
{
	struct sk_buff *skb = (struct sk_buff *) ipsec_eip93UserId_get(resHandler);
	struct iphdr *iph;
	unsigned int ihl, pktLen;
	struct esp_data *esp = x->data;
	int decaps = 0;
	__be32 spi, seq;
	int err;
	int net;
	int nexthdr = 0;
	struct xfrm_mode *inner_mode = x->inner_mode;
	int async = 0;
	struct ip_esp_hdr *esph = (struct ip_esp_hdr *)skb->data;
	ipsecEip93Adapter_t *currAdapterPtr;
	unsigned int *addrCurrAdapter;

	
	addrCurrAdapter = (unsigned int *) &(skb->cb[36]);
	currAdapterPtr = (ipsecEip93Adapter_t *)(*addrCurrAdapter);

	esph->seq_no = htonl(ipsec_espSeqNum_get(resHandler));
	esph->spi = currAdapterPtr->spi;

	skb->ip_summed = CHECKSUM_NONE;	
	iph = ip_hdr(skb);
	ihl = iph->ihl << 2; //iph->ihl * 4	
	iph->protocol = ipsec_espNextHeader_get(resHandler);
	nexthdr = iph->protocol;
		
	//adjest skb->tail & skb->len
	pktLen = ipsec_pktLength_get(resHandler);
	
#ifdef RALINK_HWCRYPTO_NAT_T	
	if (x->encap) {
		struct xfrm_encap_tmpl *encap = x->encap;
		struct udphdr *uh = (void *)(skb_network_header(skb) + ihl);

		/*
		 * 1) if the NAT-T peer's IP or port changed then
		 *    advertize the change to the keying daemon.
		 *    This is an inbound SA, so just compare
		 *    SRC ports.
		 */
		if (iph->saddr != x->props.saddr.a4 ||
		    uh->source != encap->encap_sport) {
			xfrm_address_t ipaddr;

			ipaddr.a4 = iph->saddr;
			km_new_mapping(x, &ipaddr, uh->source);

			/* XXX: perhaps add an extra
			 * policy check here, to see
			 * if we should allow or
			 * reject a packet from a
			 * different source
			 * address/port.
			 */
		}

		/*
		 * 2) ignore UDP/TCP checksums in case
		 *    of NAT-T in Transport Mode, or
		 *    perform other post-processing fixes
		 *    as per draft-ietf-ipsec-udp-encaps-06,
		 *    section 3.1.2
		 */
		if (x->props.mode == XFRM_MODE_TRANSPORT)
			skb->ip_summed = CHECKSUM_UNNECESSARY;
	}
#endif	
	skb->len = pktLen;
	skb_set_tail_pointer(skb, pktLen);
	__skb_pull(skb, crypto_aead_ivsize(esp->aead));
	
	skb_set_transport_header(skb, -ihl);
	
	/* adjust for IPSec post-routing */
	spin_lock(&x->lock);
	if (nexthdr <= 0) {
		if (nexthdr == -EBADMSG) {
			xfrm_audit_state_icvfail(x, skb, x->type->proto);
			x->stats.integrity_failed++;
		}
		XFRM_INC_STATS(net, LINUX_MIB_XFRMINSTATEPROTOERROR);
		printk("(%d)ipsec_esp_input_finish LINUX_MIB_XFRMINSTATEPROTOERROR\n",__LINE__);
		spin_unlock(&x->lock);
		goto drop;
	}

	if (x->props.replay_window){
			xfrm_replay_advance(x, htonl(ipsec_espSeqNum_get(resHandler)));
			//printk("input window replay window!!");
	}
	x->curlft.bytes += skb->len;
	x->curlft.packets++;
	spin_unlock(&x->lock);

	XFRM_MODE_SKB_CB(skb)->protocol = nexthdr;

	inner_mode = x->inner_mode;

	if (x->sel.family == AF_UNSPEC) {
		inner_mode = xfrm_ip2inner_mode(x, XFRM_MODE_SKB_CB(skb)->protocol);
		if (inner_mode == NULL)
		{
			printk("(%d)ipsec_esp_input_finish inner_mode NULL\n",__LINE__);	
			goto drop;
		}	
	}

	if (inner_mode->input(x, skb)) {
		printk("(%d)ipsec_esp_input_finish LINUX_MIB_XFRMINSTATEMODEERROR\n",__LINE__);
		XFRM_INC_STATS(net, LINUX_MIB_XFRMINSTATEMODEERROR);
		goto drop;
	}

	if (x->outer_mode->flags & XFRM_MODE_FLAG_TUNNEL) {
		decaps = 1;
	}
	else
	{	
		/*
		 * We need the inner address.  However, we only get here for
		 * transport mode so the outer address is identical.
		 */
	
		err = xfrm_parse_spi(skb, nexthdr, &spi, &seq);
		if (err < 0) {
			printk("(%d)ipsec_esp_input_finish LINUX_MIB_XFRMINHDRERROR\n",__LINE__);
			XFRM_INC_STATS(net, LINUX_MIB_XFRMINHDRERROR);
			goto drop;
		}
	}
	
	nf_reset(skb);

	#if defined(TCSUPPORT_IPSEC_PASSTHROUGH) && defined(CONFIG_VPN_PASSTHROUGH_INFO)
	gpVpnPTPara->statistics.dinfo.d_phase2_normal_counts++;	
	#endif

	if (decaps) {
		skb_dst_drop(skb);
		netif_rx(skb);
		return ;
	} else {
		x->inner_mode->afinfo->transport_finish(skb, async);
		return;
	}	

drop:
	printk("(%d)ipsec_esp_input_finish:drop\n",__LINE__);

#if defined(TCSUPPORT_IPSEC_PASSTHROUGH) && defined(CONFIG_VPN_PASSTHROUGH_INFO)
	gpVpnPTPara->statistics.dinfo.d_phase2_drop_counts++;	
#endif
	kfree_skb(skb);
	return;
}


/************************************************************************
*              P U B L I C     F U N C T I O N S
*************************************************************************
*/
void 
ipsec_eip93Adapter_free(
	unsigned int spi
)
{
	unsigned int i;
	ipsecEip93Adapter_t *currAdapterPtr;
#ifdef TCSUPPORT_IPSEC_PASSTHROUGH
	unsigned int foeentryindex;
	#endif

	
	for (i = 0; i < IPESC_EIP93_ADAPTERS; i++)
	{
		if ((currAdapterPtr = ipsecEip93AdapterListOut[i]) != NULL)
		{
			if (currAdapterPtr->spi == spi)
			{
				ipsecEip93AdapterListOut[i] = NULL;
				
				#ifdef TCSUPPORT_IPSEC_PASSTHROUGH	
				/*when do free adapter ,we also need to free strored parameters and clear hw nat rule and clear hw nat cache*/
				dst_release(currAdapterPtr->dst);
				dst_release(currAdapterPtr->xdst);
				if (ra_sw_nat_hook_foeentry)
				{
					foeentryindex = currAdapterPtr->foeentryindex.firstperiod;
						ra_sw_nat_hook_foeentry(&foeentryindex,FOE_OPE_CLEARENTRY);
						#ifdef CONFIG_VPN_PASSTHROUGH_LOG
						VPN_LOG(VPN_PASSTHROUGH_LOG_TRACE,"encryption phase I:foe entry index=%d",foeentryindex);
						#endif
					
					foeentryindex = currAdapterPtr->foeentryindex.secondperiod;
						ra_sw_nat_hook_foeentry(&foeentryindex,FOE_OPE_CLEARENTRY);
						#ifdef CONFIG_VPN_PASSTHROUGH_LOG
						VPN_LOG(VPN_PASSTHROUGH_LOG_TRACE,"encryption phase II:foe entry index=%d",foeentryindex);
						#endif
					}
				#endif
				ipsec_cmdHandler_free(currAdapterPtr->cmdHandler);
				kfree(currAdapterPtr);
				return;
			}
		}
	}
	
	for (i = 0; i < IPESC_EIP93_ADAPTERS; i++)
	{
		if ((currAdapterPtr = ipsecEip93AdapterListIn[i]) != NULL)
		{
			if (currAdapterPtr->spi == spi)
			{
				ipsecEip93AdapterListIn[i] = NULL;
				
				#ifdef TCSUPPORT_IPSEC_PASSTHROUGH
				/*when do free adapter ,we also need to free strored parameters and clear hw nat rule and clear hw nat cache*/
				secpath_put(currAdapterPtr->sp);
				dst_release(currAdapterPtr->dst);
				if (ra_sw_nat_hook_foeentry)
				{
					foeentryindex = currAdapterPtr->foeentryindex.firstperiod;
					ra_sw_nat_hook_foeentry(&foeentryindex,FOE_OPE_CLEARENTRY);
					#ifdef CONFIG_VPN_PASSTHROUGH_LOG
					VPN_LOG(VPN_PASSTHROUGH_LOG_TRACE,"decryption phase I:foe entry index=%d",foeentryindex);
					#endif
					
					foeentryindex = currAdapterPtr->foeentryindex.secondperiod;
					ra_sw_nat_hook_foeentry(&foeentryindex,FOE_OPE_CLEARENTRY);
					#ifdef CONFIG_VPN_PASSTHROUGH_LOG
					VPN_LOG(VPN_PASSTHROUGH_LOG_TRACE,"decryption phase II:foe entry index=%d",foeentryindex);
					#endif
				}	
				#endif
				ipsec_cmdHandler_free(currAdapterPtr->cmdHandler);
				kfree(currAdapterPtr);
				return;
			}
		}
	}
}

/*_______________________________________________________________________
**function name: ipsec_esp_output
**
**description:
*   Replace Linux Kernel's esp_output(), in order to use EIP93
*	to do encryption for a IPSec ESP flow.
**parameters:
*   x -- point to the structure that stores IPSec SA information
*	skb -- the packet that is going to be encrypted.
**global:
*   none
**return:
*   -EPERM, -ENOMEM -- failed: the pakcet will be dropped!
*	1 -- success: the packet's command decsriptor is put into
*		EIP93's Command Descriptor Ring.
**call:
*   none
**revision:
*   1.Trey 20120209
**_______________________________________________________________________*/
int 
ipsec_esp_output(
	struct xfrm_state *x, 
	struct sk_buff *skb
)
{
	ipsecEip93Adapter_t *currAdapterPtr;
	int err;
	eip93DescpHandler_t *cmdHandler;
	struct iphdr *top_iph = ip_hdr(skb);
	unsigned int *addrCurrAdapter;
	//struct sk_buff *trailer;
	//u8 *tail;
#ifdef TCSUPPORT_IPSEC_PASSTHROUGH		
	int ret;
#endif
	//printk("esp_output\n");
	
	/* Don't let HWNAT has the change to learn ipsec packets!
	 * Once HWNAT learned ipsec packets, it will forward packets
	 * directly from Rx to Tx, which will cause ipsec packets
	 * not being encrypted.
	 *move from xfrm4_rcv_encap()  to here
	 */

	if (ra_sw_nat_hook_free)
		ra_sw_nat_hook_free(skb);
	
	err = ipsec_esp_preProcess(x, skb, HASH_DIGEST_OUT);
	if (err < 0)
	{
		printk("\n\n ipsec_esp_preProcess for HASH_DIGEST_OUT failed! \n\n");
		return err;
	}

	addrCurrAdapter = (unsigned int *) &(skb->cb[36]);
	currAdapterPtr = (ipsecEip93Adapter_t *)(*addrCurrAdapter);
	cmdHandler = currAdapterPtr->cmdHandler;
		
#ifdef RALINK_HWCRYPTO_NAT_T
#else		
	/* this is non-NULL only with UDP Encapsulation for NAT-T */
	if (unlikely(x->encap)) 
	{		
		printk("\n\n NAT-T is not supported yet! \n\n");
		return -EPERM;
	}
#endif	
	/* in case user will change between tunnel and transport mode,
	 * we have to set "padValue" every time before every packet 
	 * goes into EIP93 for esp outbound! */
	ipsec_espNextHeader_set(cmdHandler, top_iph->protocol);
	//let skb->data point to the payload which is going to be encrypted
if (x->encap==0)	
__skb_pull(skb, skb_transport_offset(skb));
#if defined(TCSUPPORT_IPSEC_PASSTHROUGH) && defined(CONFIG_VPN_PASSTHROUGH_INFO)	
	gpVpnPTPara->statistics.einfo.e_phase1_normal_counts++;
#endif
#ifdef TCSUPPORT_IPSEC_PASSTHROUGH	
		if((ret = ipsec_esp_pktPut(skb,DECRIPTION_DIRECTION)) < 0)
		{
			#ifdef CONFIG_VPN_PASSTHROUGH_INFO
			gpVpnPTPara->statistics.einfo.e_phase1_drop_counts++;
			#endif
			#ifdef CONFIG_VPN_PASSTHROUGH_LOG
			VPN_LOG(VPN_PASSTHROUGH_LOG_DBG,"ipsec_esp_pktPut() Something's wrong!");
			#endif
		}
		#ifdef CONFIG_VPN_PASSTHROUGH_INFO
		else
		{
			gpVpnPTPara->statistics.einfo.e_phase1_normal_counts++;
		}
		#endif

		return ret;
#else
	return ipsec_esp_pktPut(skb);
#endif
}

/*_______________________________________________________________________
**function name: ipsec_esp_input
**
**description:
*   Replace Linux Kernel's esp_input(), in order to use EIP93
*	to do decryption for a IPSec ESP flow.
**parameters:
*   x -- point to the structure that stores IPSec SA information
*	skb -- the packet that is going to be decrypted.
**global:
*   none
**return:
*   -EPERM, -ENOMEM -- failed: the pakcet will be dropped!
*	1 -- success: the packet's command decsriptor is put into
*		EIP93's Command Descriptor Ring.
**call:
*   none
**revision:
*   1.Trey 20120209
**_______________________________________________________________________*/
int 
ipsec_esp_input(
	struct xfrm_state *x, 
	struct sk_buff *skb
)
{
	int err;
	struct esp_data *esp = x->data;
	int blksize = ALIGN(crypto_aead_blocksize(esp->aead), 4);
	int alen = crypto_aead_authsize(esp->aead);
	int elen = skb->len - sizeof(struct ip_esp_hdr) - crypto_aead_ivsize(esp->aead) - alen;	
	#ifdef TCSUPPORT_IPSEC_PASSTHROUGH	
	int ret;
	#endif
	//printk("esp input\n");
	//skb_dump(skb);
	/* Don't let HWNAT has the change to learn ipsec packets!
	 * Once HWNAT learned ipsec packets, it will forward packets
	 * directly from Rx to Tx, which will cause ipsec packets
	 * not being encrypted.
	 *move from xfrm4_rcv_encap()  to here
	 */

	if (ra_sw_nat_hook_free)
		ra_sw_nat_hook_free(skb);
	
	err = ipsec_esp_preProcess(x, skb, HASH_DIGEST_IN);
	if (err < 0)
	{
		printk("\n\n ipsec_esp_preProcess for HASH_DIGEST_IN failed! \n\n");
		return err;
	}

	if (!pskb_may_pull(skb, sizeof(struct ip_esp_hdr)))
		goto out;
		
	if (elen <= 0 || (elen & (blksize-1)))
		goto out;

#ifdef RALINK_HWCRYPTO_NAT_T
#else
	if (x->encap) 
	{
		printk("\n !NAT-T is not supported! \n");
		goto out;
	}
#endif
#ifdef TCSUPPORT_IPSEC_PASSTHROUGH	
	if((ret = ipsec_esp_pktPut(skb,DECRIPTION_DIRECTION)) < 0)
	{
		#ifdef CONFIG_VPN_PASSTHROUGH_INFO
		gpVpnPTPara->statistics.dinfo.d_phase1_drop_counts++;
		#endif
		#ifdef CONFIG_VPN_PASSTHROUGH_LOG
		VPN_LOG(VPN_PASSTHROUGH_LOG_DBG,"ipsec_esp_pktPut() Something's wrong!");
		#endif
	}
	#ifdef CONFIG_VPN_PASSTHROUGH_INFO
	else
	{
		gpVpnPTPara->statistics.dinfo.d_phase1_normal_counts++;
	}
	#endif
		
	return ret;
#else
	return ipsec_esp_pktPut(skb);
#endif
out:
	printk("\n Something's wrong! Go out! \n");
	#if defined(TCSUPPORT_IPSEC_PASSTHROUGH) && defined(CONFIG_VPN_PASSTHROUGH_INFO)
	gpVpnPTPara->statistics.dinfo.d_phase1_drop_counts++;
	#endif
	return -EINVAL;
}

#ifdef TCSUPPORT_IPSEC_PASSTHROUGH
#ifdef CONFIG_VPN_PASSTHROUGH_LOG
static int crypto_debug_level_read_proc(char *page, char **start, off_t off,
	int count, int *eof, void *data)
{
	int len = 0;
	len = sprintf(page, "%d\n", gpVpnPTPara->vpndebuglevel);
	
	len -= off;
	*start = page + off;

	if (len > count)
		len = count;
	else
		*eof = 1;

	if (len < 0)
		len = 0;

	return len;
}

static int crypto_debug_level_write_proc(struct file *file, const char *buffer,
	unsigned long count, void *data)
{
	char val_string[32];

	if (count > sizeof(val_string) - 1)
		return -EINVAL;

	if (copy_from_user(val_string, buffer, count))
		return -EFAULT;

	val_string[count] = '\0';

	if (sscanf(val_string, "%lu", &(gpVpnPTPara->vpndebuglevel)) != 1) {
		printk("usage: <debuglevel(0~4)>\n");
	}

	if(VPN_PASSTHROUGH_LOG_MAX_LEVER < gpVpnPTPara->vpndebuglevel)
		gpVpnPTPara->vpndebuglevel = VPN_PASSTHROUGH_LOG_MAX_LEVER;

	return count;
}
#endif
static int crypto_pt_switch_read_proc(char *page, char **start, off_t off,
	int count, int *eof, void *data)
{
	int len = 0;
	len = sprintf(page, "%lu\n",  gpVpnPTPara->vpnpassthroughswitch);
	
	len -= off;
	*start = page + off;

	if (len > count)
		len = count;
	else
		*eof = 1;

	if (len < 0)
		len = 0;

	return len;
}

static int crypto_pt_switch_write_proc(struct file *file, const char *buffer,
	unsigned long count, void *data)
{
	char val_string[32];

	if (count > sizeof(val_string) - 1)
		return -EINVAL;

	if (copy_from_user(val_string, buffer, count))
		return -EFAULT;

	val_string[count] = '\0';

	if (sscanf(val_string, "%lu", &(gpVpnPTPara->vpnpassthroughswitch)) != 1) {
		printk("usage: <crypto_pt_switch [0|1]>\n");
	}

	return count;
}

static int crypto_skb_queue_max_num_read_proc(char *page, char **start, off_t off,
	int count, int *eof, void *data)
{
	int len = 0;
	len = sprintf(page, "%lu\n", gpVpnPTPara->vpnskbqueuemaxnum);
	
	len -= off;
	*start = page + off;

	if (len > count)
		len = count;
	else
		*eof = 1;

	if (len < 0)
		len = 0;

	return len;
}

static int crypto_skb_queue_max_num_write_proc(struct file *file, const char *buffer,
	unsigned long count, void *data)
{
	char val_string[32];

	if (count > sizeof(val_string) - 1)
		return -EINVAL;

	if (copy_from_user(val_string, buffer, count))
		return -EFAULT;

	val_string[count] = '\0';

	if (sscanf(val_string, "%lu", &(gpVpnPTPara->vpnskbqueuemaxnum)) != 1) {
		printk("usage: <pt_switch [0|1]>\n");
	}

	return count;
}

#ifdef CONFIG_VPN_PASSTHROUGH_INFO
static int crypto_info_read_proc(char *page, char **start, off_t off,
	int count, int *eof, void *data)
{
	int len = 0;
	len += sprintf( page+len, "\n[ CRYPTO PASSTHROUTH Counters ]");
	len += sprintf( page+len, "\n[ Decryption Phase 1 Counters ]\n");
	len += sprintf( page+len, "Normal		  = 0x%08lx, Speed 	= 0x%08lx,  Drop 	= 0x%08lx\n",
			gpVpnPTPara->statistics.dinfo.d_phase1_normal_counts,gpVpnPTPara->statistics.dinfo.d_phase1_speed_counts,gpVpnPTPara->statistics.dinfo.d_phase1_drop_counts);
	len += sprintf( page+len, "\n[ Decryption Phase 2 Counters ]\n");
	len += sprintf( page+len, "Normal		  = 0x%08lx, Speed 	= 0x%08lx,  Drop 	= 0x%08lx\n",
			gpVpnPTPara->statistics.dinfo.d_phase2_normal_counts,gpVpnPTPara->statistics.dinfo.d_phase2_speed_counts,gpVpnPTPara->statistics.dinfo.d_phase2_drop_counts);
	len += sprintf( page+len, "\n[ Encryption Phase 1 Counters ]\n");
	len += sprintf( page+len, "Normal		  = 0x%08lx, Speed	= 0x%08lx,	Drop	= 0x%08lx\n",
			gpVpnPTPara->statistics.einfo.e_phase1_normal_counts,gpVpnPTPara->statistics.einfo.e_phase1_speed_counts,gpVpnPTPara->statistics.einfo.e_phase1_drop_counts);
	len += sprintf( page+len, "Drop1		  = 0x%08lx, Drop2	= 0x%08lx",
			gpVpnPTPara->statistics.einfo.e_phase1_drop_counts_1,gpVpnPTPara->statistics.einfo.e_phase1_drop_counts_2);
	len += sprintf( page+len, "\n[ Encryption Phase 2 Counters ]\n");
	len += sprintf( page+len, "Normal		  = 0x%08lx, Speed	= 0x%08lx,	Drop	= 0x%08lx\n",
			gpVpnPTPara->statistics.einfo.e_phase2_normal_counts,gpVpnPTPara->statistics.einfo.e_phase2_speed_counts,gpVpnPTPara->statistics.einfo.e_phase2_drop_counts);

	len -= off;
	*start = page + off;

	if (len > count)
		len = count;
	else
		*eof = 1;

	if (len < 0)
		len = 0;

	return len;
}

static int crypto_info_write_proc(struct file *file, const char *buffer,
	unsigned long count, void *data)
{
	char val_string[32];
	uint32 d_phase = 0,e_phase = 0,all = 0;

	if (count > sizeof(val_string) - 1)
		return -EINVAL;

	if (copy_from_user(val_string, buffer, count))
		return -EFAULT;

	val_string[count] = '\0';

	if (sscanf(val_string, "%lu %lu %lu", &all, &d_phase,  &e_phase) != 3) {
		printk("usage: <allflag> <d_phase_flag> <e_phase_flag>\n");
		return count;
	}

	if(all)
	{
		memset(&(gpVpnPTPara->statistics),0,sizeof(struct vpnPassThrough_Stats_s));
	}
	else
	{
		if(d_phase)
			memset(&(gpVpnPTPara->statistics.dinfo),0,sizeof(struct d_info_s));

		if(e_phase)	
			memset(&(gpVpnPTPara->statistics.einfo),0,sizeof(struct e_info_s));
	}
	
	return count;
}
#endif

void
mtk_ipsec_proc_init(void)
{
	struct proc_dir_entry *crypto_proc;

	//init default value
	memset(gpVpnPTPara,0,sizeof(struct vpnPassThrough_Global_Para));
	#ifdef CONFIG_VPN_PASSTHROUGH_LOG
	gpVpnPTPara->vpndebuglevel = VPN_PASSTHROUGH_LOG_OFF;
	#endif
	gpVpnPTPara->vpnpassthroughswitch = VPN_PASSTHROUGH_SWITCH_ON;
	gpVpnPTPara->vpnskbqueuemaxnum = SKB_QUEUE_MAX_SIZE;
#ifdef CONFIG_VPN_PASSTHROUGH_INFO	
  	/* crypto related info */
	crypto_proc = create_proc_entry("tc3162/crypto_info", 0, NULL);
	crypto_proc->read_proc = crypto_info_read_proc;
	crypto_proc->write_proc = crypto_info_write_proc;
#endif	
#ifdef CONFIG_VPN_PASSTHROUGH_LOG
	/* crypto debug lever */
	crypto_proc = create_proc_entry("tc3162/crypto_debug", 0, NULL);
	crypto_proc->read_proc = crypto_debug_level_read_proc;
	crypto_proc->write_proc = crypto_debug_level_write_proc;
#endif
	/* crypto passthrough switch*/
	crypto_proc = create_proc_entry("tc3162/crypto_pt_switch", 0, NULL);
	crypto_proc->read_proc = crypto_pt_switch_read_proc;
	crypto_proc->write_proc = crypto_pt_switch_write_proc;

	/* crypto skb queue list max num*/
	crypto_proc = create_proc_entry("tc3162/crypto_skb_queue_max_num", 0, NULL);
	crypto_proc->read_proc = crypto_skb_queue_max_num_read_proc;
	crypto_proc->write_proc = crypto_skb_queue_max_num_write_proc;
	return;
}

void
mtk_ipsec_proc_uninit(void)
{
	#ifdef CONFIG_VPN_PASSTHROUGH_INFO
	remove_proc_entry("tc3162/crypto_info", NULL);
	#endif
	#ifdef CONFIG_VPN_PASSTHROUGH_LOG
	remove_proc_entry("tc3162/crypto_debug", NULL);
	#endif
	remove_proc_entry("tc3162/crypto_pt_switch", NULL);
	remove_proc_entry("tc3162/crypto_skb_queue_max_num", NULL);
}

/*_______________________________________________________________________
**function name: xfrm_state_check_space_pt
**
**description:
*   when speed encryption phase I ,need to reserve enough header room for encryption
*   in the coming operation
**parameters:
*   x -- point to the structure that stores IPSec SA information
*	skb -- the packet that is going to be decrypted.
**global:
*   none
**return:
*   -EPERM, -ENOMEM -- failed: the pakcet will be dropped!
*	0 -- success: the header room is enough or realloc ok
**call:
*   none
**revision:
*   1.Brian 20130328
**_______________________________________________________________________*/
static int xfrm_state_check_space_pt(struct xfrm_state *x, struct sk_buff *skb)
{
	struct dst_entry *dst = skb_dst(skb);
	struct esp_data *esp;
    int header_len;
	int nhead,ntail;

    esp = x->data;
	/* 1. Don't need to take care esp header(8 bytes) and iv(8 bytes or 16 bytes)
	 * because EIP93 will cover it !!so here do not need to reserve header room including esp header and iv
 	*/
	header_len = dst->header_len - (sizeof(struct ip_esp_hdr) +  crypto_aead_ivsize(esp->aead));
    if (header_len < 0)
    {
       return -EPERM;
    }
	
	nhead = header_len + LL_RESERVED_SPACE(dst->dev)
		- skb_headroom(skb);
	ntail = dst->dev->needed_tailroom - skb_tailroom(skb);

#ifdef CONFIG_VPN_PASSTHROUGH_LOG
		VPN_LOG(VPN_PASSTHROUGH_LOG_TRACE,"headroom=%d,tailroom=%d,header_len=%d,nhead=%d,ntail=%d",skb_headroom(skb),skb_tailroom(skb),header_len,nhead,ntail);
#endif
	if (nhead <= 0) {
		if (ntail <= 0)
			return 0;
		nhead = 0;
	} else if (ntail < 0)
		ntail = 0;

	return pskb_expand_head(skb, nhead, ntail, GFP_ATOMIC);
}

/*_______________________________________________________________________
**function name: ipsec_set_adatpterlist_para
**
**description:
*   set adapter para 
*	current stored para is dst(used for judging packet whether needed to be fragment)
**parameters:
*  inputpara--can be transfer to any structure
**global:
*   none
**return:
*   none
**call:
*   none
**revision:
*   1.Brian 20130328
**_______________________________________________________________________*/
void ipsec_set_adatpterlist_para(void* inputpara)
{	
	ipsecEip93Adapter_t *currAdapterPtr;
	unsigned int *addrCurrAdapter;
	struct adapterlistpara_s *ptr = (struct adapterlistpara_s *)inputpara;
	addrCurrAdapter = (unsigned int *) &(ptr->skb->cb[36]);
	currAdapterPtr = (ipsecEip93Adapter_t *)(*addrCurrAdapter);

	switch(ptr->para)
	{
		case 0:
			if(currAdapterPtr && !(currAdapterPtr->dst))
				currAdapterPtr->dst = dst_clone(skb_dst(ptr->skb));;
			break;
			
		default:
			#ifdef CONFIG_VPN_PASSTHROUGH_LOG
			VPN_LOG(VPN_PASSTHROUGH_LOG_WARNING,"not support such para (%d)",ptr->para);
			#endif
			break;	
	}

	return;
}

/*_______________________________________________________________________
**function name: ipsec_get_adatpterlist_para
**
**description:
*   get adapter para 
*	current stored para is dst(used for judging packet whether needed to be fragment)
**parameters:
*  inputpara--can be transfer to any structure
**global:
*   none
**return:
*   none
**call:
*   none
**revision:
*   1.Brian 20130328
**_______________________________________________________________________*/
void* ipsec_get_adatpterlist_para(void* inputpara)
{
	ipsecEip93Adapter_t *currAdapterPtr;
	unsigned int *addrCurrAdapter;
	void * ret = NULL;
	struct adapterlistpara_s *ptr = (struct adapterlistpara_s *)inputpara;
	addrCurrAdapter = (unsigned int *) &(ptr->skb->cb[36]);
	currAdapterPtr = (ipsecEip93Adapter_t *)(*addrCurrAdapter);
	switch(ptr->para)
	{
		case 0:
			ret = (void *)(currAdapterPtr->dst);
			break;
			
		default:
			#ifdef CONFIG_VPN_PASSTHROUGH_LOG
			VPN_LOG(VPN_PASSTHROUGH_LOG_WARNING,"not support such para (%d)",ptr->para);
			#endif
			break;	
	}

	return ret;
}

/*_______________________________________________________________________
**function name: inputhookHwNatRxHandler
**
**description:
*  decryption rx callback function,put packet into hw nat rx funtion to learn rule
**parameters:
*  inputpara--can be transfer to any structure
**global:
*   none
**return:
*   none
**call:
*   none
**revision:
*   1.Brian 20130328
**_______________________________________________________________________*/
static int inputhookHwNatRxHandler(struct sk_buff *skb)
{
	if (ra_sw_nat_hook_set_magic)  
		ra_sw_nat_hook_set_magic(skb, FOE_MAGIC_CRYPTO_D_2);
	
	if (ra_sw_nat_hook_rx != NULL) {
		if (ra_sw_nat_hook_rx(skb) == 0) //0 mean inter leraning peroid
		{
			#ifdef CONFIG_VPN_PASSTHROUGH_INFO
			gpVpnPTPara->statistics.dinfo.d_phase2_speed_counts++;
			#endif
			return 0;
		}
	}
	
	#ifdef CONFIG_VPN_PASSTHROUGH_INFO
	gpVpnPTPara->statistics.dinfo.d_phase2_normal_counts++;
	#endif
	#ifdef CONFIG_VPN_PASSTHROUGH_LOG
	VPN_LOG(VPN_PASSTHROUGH_LOG_DBG,"input handler,run normal path!");
	#endif
	
	//hw nat not insmod or not support such packet,run normal path!
	netif_rx(skb);
	return 0;
}

/*_______________________________________________________________________
**function name: inputhookHwNatRxHandler
**
**description:
*  encryption rx callback function,put packet into hw nat rx funtion to learn rule
**parameters:
*  inputpara--can be transfer to any structure
**global:
*   none
**return:
*   none
**call:
*   none
**revision:
*   1.Brian 20130328
**_______________________________________________________________________*/
static int outputhookHwNatRxHandler(struct sk_buff *skb)
{
	if (ra_sw_nat_hook_set_magic)  
		ra_sw_nat_hook_set_magic(skb, FOE_MAGIC_CRYPTO_E_2);
	
	if (ra_sw_nat_hook_rx != NULL) {
		if (ra_sw_nat_hook_rx(skb) == 0) //0 mean inter leraning peroid
		{
			#ifdef CONFIG_VPN_PASSTHROUGH_INFO
			gpVpnPTPara->statistics.einfo.e_phase2_speed_counts++;
			#endif
			return 0;
		}
	}
	
	#ifdef CONFIG_VPN_PASSTHROUGH_INFO
	gpVpnPTPara->statistics.einfo.e_phase2_normal_counts++;
	#endif
	#ifdef CONFIG_VPN_PASSTHROUGH_LOG
	VPN_LOG(VPN_PASSTHROUGH_LOG_DBG,"output handler,run normal path!");
	#endif
	
	//hw nat not insmod or not support such packet,run normal path!
	ip_output(skb);
	return 0;
}

/*_______________________________________________________________________
**function name: ipsec_esp_ouput_finish_pt
**
**description:
*  ENcryption II two phases
*	phase I:put packet into hw nat rx function to learn rule
*	paase II:if no matched rule in bind state,packet will rollback ,so handle it. and if any
*			matched rule in bind state,packet will forward to real interface by hw
**parameters:
*  inputParams--you can reference to the definition of structure
**global:
*   none
**return:
*   none
**call:
*   none
**revision:
*   1.Brian 20130328
**_______________________________________________________________________*/
void
ipsec_esp_ouput_finish_pt(ipsec_finishpara_t* inputParams)
{
	eip93DescpHandler_t *resHandler;
	ipsecEip93Adapter_t *currentAdapter;
	struct sk_buff *skb;
	struct iphdr *top_iph;
	unsigned int length;
	struct dst_entry *dst;
	struct xfrm_state *x;
	ipsecEip93Adapter_t **ipsecEip93AdapterList;
	
	if(HWNAT_IPSEC_LEARING == inputParams->flag)
	{
		resHandler = inputParams->data.learn_push.resHandler;
		currentAdapter = inputParams->data.learn_push.currentAdapter;
		skb = (struct sk_buff *) ipsec_eip93UserId_get(resHandler);
		top_iph = ip_hdr(skb);
		dst = skb_dst(skb);
		x = dst->xfrm;

		length = ipsec_pktLength_get(resHandler);
	
		skb_put(skb, length - skb->len); //adjust skb->tail
	
		length += skb->data - skb_network_header(skb); //IP total length
	
		__skb_push(skb, -skb_network_offset(skb));
	
		top_iph->tot_len = htons(length);
		top_iph->protocol = IPPROTO_ESP;
		
		ip_send_check(top_iph);
	
		/* adjust for IPSec post-routing */
		spin_lock_bh(&x->lock);
		x->curlft.bytes += skb->len;
		x->curlft.packets++;
		spin_unlock_bh(&x->lock);
		
		dst = skb_dst_pop(skb);
		if (!dst) {
			kfree_skb(skb);
			#ifdef CONFIG_VPN_PASSTHROUGH_INFO
			gpVpnPTPara->statistics.einfo.e_phase2_drop_counts++;	
			#endif
	#ifdef CONFIG_VPN_PASSTHROUGH_LOG
			VPN_LOG(VPN_PASSTHROUGH_LOG_DBG,"dst == NULL!need to drop packet!");
	#endif
			return;
		}
		
		skb_dst_set(skb, dst_clone(dst));
	
		nf_reset(skb);
		#ifdef CONFIG_VPN_PASSTHROUGH_LOG
		if(gpVpnPTPara->vpndebuglevel >= VPN_PASSTHROUGH_LOG_DBG)
		{
		VPN_LOG(VPN_PASSTHROUGH_LOG_TRACE,"learn!! encryption phase II");
			VPN_LOG(VPN_PASSTHROUGH_LOG_DBG,"headroom=%d,tailroom=%d",skb_headroom(skb),skb_tailroom(skb));
		skb_dump(skb);
		}
		#endif
		
		if (!skb_dst(skb)->xfrm)
		{
			if(!(currentAdapter->dst))
			{
				currentAdapter->dst = dst_clone(skb_dst(skb));
			}
			#ifdef CONFIG_VPN_PASSTHROUGH_LOG
			VPN_LOG(VPN_PASSTHROUGH_LOG_TRACE,"skb->len=%d,mtu=%d",skb->len,dst_mtu(currentAdapter->dst));
			#endif

			if(skb->len > dst_mtu(currentAdapter->dst))
			{
				ip_fragment(skb, outputhookHwNatRxHandler);
			}
			else
			{
				outputhookHwNatRxHandler(skb);
			}
		}
		else
		{
			#ifdef CONFIG_VPN_PASSTHROUGH_LOG
			VPN_LOG(VPN_PASSTHROUGH_LOG_ERROR,"====multi encryption is not supported =====");
			#endif
			#ifdef CONFIG_VPN_PASSTHROUGH_INFO
			gpVpnPTPara->statistics.einfo.e_phase2_drop_counts++;
			#endif
			kfree_skb(skb);
		}
	}
	else if(HWNAT_IPSEC_ROLLBACK == inputParams->flag)
	{
		skb = inputParams->data.learn_pull.skb;;
		ipsecEip93AdapterList = &ipsecEip93AdapterListOut[0];
		currentAdapter = ipsecEip93AdapterList[inputParams->data.learn_pull.entry_index];
		if(!currentAdapter)
		{
			#ifdef CONFIG_VPN_PASSTHROUGH_INFO
			gpVpnPTPara->statistics.einfo.e_phase2_drop_counts++;
			gpVpnPTPara->statistics.einfo.e_phase2_speed_counts--;
			#endif
			#ifdef CONFIG_VPN_PASSTHROUGH_LOG
			VPN_LOG(VPN_PASSTHROUGH_LOG_DBG,"current adpter ptr is null! need to free skb");
			#endif
			kfree_skb(skb);
			return;
		}
		//we need to store the foe entry index for add or delete operation
		if (ra_sw_nat_hook_foeentry)
		{
			currentAdapter->foeentryindex.secondperiod = ra_sw_nat_hook_foeentry(skb,FOE_OPE_GETENTRYNUM);
		}

		skb_dst_set(skb, dst_clone(currentAdapter->dst));//because this packet is pingpong from ppe,so use dst_clone to increase refcnt
		skb->protocol = htons(ETH_P_IP);
		skb_reset_network_header(skb);
		#ifdef CONFIG_VPN_PASSTHROUGH_INFO
		gpVpnPTPara->statistics.einfo.e_phase2_normal_counts++;
		gpVpnPTPara->statistics.einfo.e_phase2_speed_counts--;
		#endif
		#ifdef CONFIG_VPN_PASSTHROUGH_LOG
		if(gpVpnPTPara->vpndebuglevel >= VPN_PASSTHROUGH_LOG_DBG)
		{
		VPN_LOG(VPN_PASSTHROUGH_LOG_TRACE,"rollback!! encryption phase II");
		skb_dump(skb);
		}
		#endif
		ip_output(skb);
	}

	return;
}

/*_______________________________________________________________________
**function name: ipsec_esp_input_finish_pt
**
**description:
*  decryption II two phases
*	phase I:put packet into hw nat rx function to learn rule
*	paase II:if no matched rule in bind state,packet will rollback ,so handle it. and if any
*			matched rule in bind state,packets will forward to real interface by hw
**parameters:
*  inputParams--you can reference to the definition of structure
**global:
*   none
**return:
*   none
**call:
*   none
**revision:
*   1.Brian 20130328
**_______________________________________________________________________*/
void ipsec_esp_input_finish_pt(ipsec_finishpara_t* inputParams)
{
	eip93DescpHandler_t *resHandler;
	ipsecEip93Adapter_t *currentAdapter;
	struct xfrm_state *x;

	struct sk_buff *skb;
	struct iphdr *iph;
	unsigned int ihl, pktLen;
	struct esp_data *esp;
	int decaps = 0;
	__be32 spi, seq;
	int err;
	int nexthdr = 0;
	struct xfrm_mode *inner_mode;
	int async = 0;
	struct ip_esp_hdr *esph;
	ipsecEip93Adapter_t **ipsecEip93AdapterList;
	unsigned int *addrCurrAdapter;
	
	if(HWNAT_IPSEC_LEARING == inputParams->flag)
	{
		resHandler = inputParams->data.learn_push.resHandler;
		currentAdapter = inputParams->data.learn_push.currentAdapter;
		x = currentAdapter->x;
		skb = (struct sk_buff *) ipsec_eip93UserId_get(resHandler);
		esp = x->data;
		esph = (struct ip_esp_hdr *)skb->data;		
		esph->seq_no = htonl(ipsec_espSeqNum_get(resHandler));
		esph->spi = currentAdapter->spi;
	
		skb->ip_summed = CHECKSUM_NONE; 
		iph = ip_hdr(skb);
		ihl = iph->ihl << 2; //iph->ihl * 4 
		iph->protocol = ipsec_espNextHeader_get(resHandler);
		nexthdr = iph->protocol;
			
		//adjest skb->tail & skb->len
		pktLen = ipsec_pktLength_get(resHandler);

		skb->len = pktLen;
		skb_set_tail_pointer(skb, pktLen);
		__skb_pull(skb, crypto_aead_ivsize(esp->aead));
		
		skb_set_transport_header(skb, -ihl);
		
		/* adjust for IPSec post-routing */
		spin_lock(&x->lock);
		if (nexthdr <= 0) {
			if (nexthdr == -EBADMSG) {
				xfrm_audit_state_icvfail(x, skb, x->type->proto);
				x->stats.integrity_failed++;
			}
			spin_unlock(&x->lock);
			#ifdef CONFIG_VPN_PASSTHROUGH_LOG
			VPN_LOG(VPN_PASSTHROUGH_LOG_DBG,"nexthdr <=0 ! need to drop packet");
			#endif
			goto drop;
		}
	
		if (x->props.replay_window){
				xfrm_replay_advance(x, htonl(ipsec_espSeqNum_get(resHandler)));
		}
		x->curlft.bytes += skb->len;
		x->curlft.packets++;
		spin_unlock(&x->lock);
	
		XFRM_MODE_SKB_CB(skb)->protocol = nexthdr;
	
		inner_mode = x->inner_mode;
	
		if (x->sel.family == AF_UNSPEC) {
			inner_mode = xfrm_ip2inner_mode(x, XFRM_MODE_SKB_CB(skb)->protocol);
			if (inner_mode == NULL)
			{
				#ifdef CONFIG_VPN_PASSTHROUGH_LOG
				VPN_LOG(VPN_PASSTHROUGH_LOG_DBG,"inner_mode == NULL ! need to drop packet");
				#endif
				goto drop;
			}	
		}

		if (inner_mode->input(x, skb)) {
			#ifdef CONFIG_VPN_PASSTHROUGH_LOG
			VPN_LOG(VPN_PASSTHROUGH_LOG_DBG,"input function return error ! need to drop packet");
			#endif
			goto drop;
		}

		//note:only support tunnel mode
		if (x->outer_mode->flags & XFRM_MODE_FLAG_TUNNEL) {
			decaps = 1;
		}
		else
		{	
			/*
			 * We need the inner address.  However, we only get here for
			 * transport mode so the outer address is identical.
			 */
		
			err = xfrm_parse_spi(skb, nexthdr, &spi, &seq);
			if (err < 0) {
				#ifdef CONFIG_VPN_PASSTHROUGH_LOG
				VPN_LOG(VPN_PASSTHROUGH_LOG_DBG,"parse spi error ! need to drop packet");
				#endif
				goto drop;
			}
		}
		
		nf_reset(skb);
		
		#ifdef CONFIG_VPN_PASSTHROUGH_LOG
		if(gpVpnPTPara->vpndebuglevel >= VPN_PASSTHROUGH_LOG_DBG)
		{
		VPN_LOG(VPN_PASSTHROUGH_LOG_TRACE,"learn!! decryption phase II");
			VPN_LOG(VPN_PASSTHROUGH_LOG_DBG,"headroom=%d,tailroom=%d",skb_headroom(skb),skb_tailroom(skb));
		skb_dump(skb);
		}
		#endif
		
		if (decaps) {
			skb_dst_drop(skb);
			//let hw_nat  learn rule(rx)
			/*
				1.store para(skb->dev)
				2.do fragment operation if needed(according to mtu)
				3.let packet into hw nat rx function do learn operation
			*/
			currentAdapter->dev = skb->dev;
			if(currentAdapter->dst && skb->len > dst_mtu(currentAdapter->dst))
			{
				skb_dst_set(skb, dst_clone(currentAdapter->dst));		
				ip_fragment(skb, inputhookHwNatRxHandler);
				return;
			}
			else
			{
				if(skb->len > VPN_DEFAULT_MAX_MTU)
				{
					#ifdef CONFIG_VPN_PASSTHROUGH_INFO
					gpVpnPTPara->statistics.dinfo.d_phase2_normal_counts++;
					#endif
					#ifdef CONFIG_VPN_PASSTHROUGH_LOG
					VPN_LOG(VPN_PASSTHROUGH_LOG_TRACE,"enter normal flow because dst has not been learned");
					#endif
					skb->ipsec_pt_flag = 1;//for store dst para in ip_finish_output
					netif_rx(skb);
					return;
				}
				else
				{
					skb_dst_set(skb, dst_clone(currentAdapter->dst));	
					inputhookHwNatRxHandler(skb);
					return;
				}
			}
		} else {
			x->inner_mode->afinfo->transport_finish(skb, async);
			return;
		}	
	
	drop:
		#ifdef CONFIG_VPN_PASSTHROUGH_LOG
		VPN_LOG(VPN_PASSTHROUGH_LOG_DBG,"drop packet");
		#endif
		#ifdef CONFIG_VPN_PASSTHROUGH_INFO
		gpVpnPTPara->statistics.dinfo.d_phase2_drop_counts++;
		#endif
		kfree_skb(skb);
		return;
	}
	else if(HWNAT_IPSEC_ROLLBACK == inputParams->flag)
	{
		skb = inputParams->data.learn_pull.skb;
		ipsecEip93AdapterList = &ipsecEip93AdapterListIn[0];
		currentAdapter = ipsecEip93AdapterList[inputParams->data.learn_pull.entry_index];
		if(!currentAdapter)
		{
			#ifdef CONFIG_VPN_PASSTHROUGH_INFO
			gpVpnPTPara->statistics.dinfo.d_phase2_drop_counts++;
			gpVpnPTPara->statistics.dinfo.d_phase2_speed_counts--;
			#endif
			#ifdef CONFIG_VPN_PASSTHROUGH_LOG
			VPN_LOG(VPN_PASSTHROUGH_LOG_DBG,"current adpter ptr is null! need to free skb");
			#endif
			kfree_skb(skb);
			return;
		}

		//we need to store the foe entry index for add or delete operation
		if (ra_sw_nat_hook_foeentry)
		{
			currentAdapter->foeentryindex.secondperiod = ra_sw_nat_hook_foeentry(skb,FOE_OPE_GETENTRYNUM);
		}

		//recover para(sp,dev)
		skb->sp = secpath_get(currentAdapter->sp);
		
		if(currentAdapter->dev)
			skb->dev = currentAdapter->dev;

		addrCurrAdapter = (unsigned int *) &(skb->cb[36]);
		*addrCurrAdapter = (unsigned int)currentAdapter;
		#ifdef CONFIG_VPN_PASSTHROUGH_INFO
		gpVpnPTPara->statistics.dinfo.d_phase2_normal_counts++;
		gpVpnPTPara->statistics.dinfo.d_phase2_speed_counts--;
		#endif
		skb->ipsec_pt_flag = 1;//for store dst para in ip_finish_output
		#ifdef CONFIG_VPN_PASSTHROUGH_LOG
		if(gpVpnPTPara->vpndebuglevel >= VPN_PASSTHROUGH_LOG_DBG)
		{
		VPN_LOG(VPN_PASSTHROUGH_LOG_TRACE,"rollback!! decryption phase II");
			skb_dump(skb);
		}
		#endif
		netif_rx(skb);
		return;
	}
}

/*_______________________________________________________________________
**function name: ipsec_esp_output_pt
**
**description:
*  encryption I two phases
*	phase I:put packet into hw nat rx function to learn rule
*	paase II: if any matched rule in bind state,packets will speed to this function from hw nat rx function
**parameters:
*  inputParams--you can reference to the definition of structure
**global:
*   none
**return:
*	1--success
	other value:just return value in phase I ,and in phase II must free packet and then return value
**call:
*   none
**revision:
*   1.Brian 20130328
**_______________________________________________________________________*/

int ipsec_esp_output_pt(ipsec_para_t* ipsecparams)
{
	int err;
	struct port_info crypto_info;
	struct xfrm_state *x;
	struct sk_buff *skb;

	ipsecEip93Adapter_t **ipsecEip93AdapterList;
	ipsecEip93Adapter_t *currAdapterPtr;
	unsigned int *addrCurrAdapter;
	eip93DescpHandler_t *cmdHandler;
	struct iphdr *top_iph = NULL;

	if(HWNAT_IPSEC_LEARING == ipsecparams->flag) // for HWNAT learning
	{
		x = ipsecparams->data.learn.x;
		skb = ipsecparams->data.learn.skb;

		err = ipsec_esp_preProcess(x, skb, HASH_DIGEST_OUT);
		if (err < 0)
		{
			#ifdef CONFIG_VPN_PASSTHROUGH_LOG
			VPN_LOG(VPN_PASSTHROUGH_LOG_ERROR,"ipsec_esp_preProcess for HASH_DIGEST_OUT failed!");
			#endif
			#ifdef CONFIG_VPN_PASSTHROUGH_INFO
			gpVpnPTPara->statistics.einfo.e_phase1_drop_counts++;
			#endif
			return err;
		}
		
		#ifdef CONFIG_VPN_PASSTHROUGH_LOG
		if(gpVpnPTPara->vpndebuglevel >= VPN_PASSTHROUGH_LOG_DBG)
		{
		VPN_LOG(VPN_PASSTHROUGH_LOG_TRACE,"learn!! encryption phase I");
		skb_dump(skb);
		}
		#endif
		
		if (ra_sw_nat_hook_tx != NULL) {
			unsigned int cryptodatap = (unsigned int)skb->data;
			skb->data = skb_mac_header(skb);
			memset(&crypto_info, 0, sizeof(crypto_info));
			if (ra_sw_nat_hook_tx(skb,&crypto_info,FOE_MAGIC_CRYPTO_E_1) == 0) 
			{
				#ifdef CONFIG_VPN_PASSTHROUGH_LOG
				VPN_LOG(VPN_PASSTHROUGH_LOG_TRACE,"duplicate packet,just drop it!");
				#endif
				skb->data = (unsigned char *)cryptodatap;
	return -EINVAL;
}

			skb->data = (unsigned char *)cryptodatap;
		}

		return 0;
	}
	else if(HWNAT_IPSEC_SPEED == ipsecparams->flag)
	{
		skb = ipsecparams->data.speed.skb;
		//save needed info skb (cryptoDriver will save skb in EIP93's userID), so the needed info can be used by the tasklet which is raised by interrupt.
		ipsecEip93AdapterList = &ipsecEip93AdapterListOut[0];
		currAdapterPtr = ipsecEip93AdapterList[ipsecparams->data.speed.entry_idx];

		if(!currAdapterPtr)
		{
			#ifdef CONFIG_VPN_PASSTHROUGH_LOG
			VPN_LOG(VPN_PASSTHROUGH_LOG_DBG,"current adpter ptr is null! need to free skb");
			#endif
			goto speedout;
		}
		
		//handle fragmentation
		skb_reset_network_header(skb); //need network_header point 
		if (ip_hdr(skb)->frag_off & htons(IP_MF | IP_OFFSET)) {
			//int err;
			//local_irq_disable();
			err = ip_defrag(skb, IP_DEFRAG_VPN_SPEED);
			//local_irq_enable();
			if(err)
				return 0;//not free skb here!
			else
			{
				#ifdef CONFIG_VPN_PASSTHROUGH_LOG
				VPN_LOG(VPN_PASSTHROUGH_LOG_TRACE,"reassembly finish!");
				#endif
				ip_send_check(ip_hdr(skb));	//if not recompute checksum,vpn in another side will fail
		}
		}
		
		skb_dst_set(skb,dst_clone(currAdapterPtr->xdst));//for ipsec_esp_output_pt

		err = xfrm_state_check_space_pt(currAdapterPtr->x, skb);
		if(err)
		{
			#ifdef CONFIG_VPN_PASSTHROUGH_LOG
			VPN_LOG(VPN_PASSTHROUGH_LOG_DBG,"check head size error! need to free skb");
			#endif
			goto speedout;
		}
	
		if(currAdapterPtr->x->outer_mode->output(currAdapterPtr->x, skb)) //xfrm4_mode_tunnel_output()
		{
			#ifdef CONFIG_VPN_PASSTHROUGH_LOG
			VPN_LOG(VPN_PASSTHROUGH_LOG_DBG,"something's wrong with x->outer_mode->output");
			#endif
			goto speedout;
		}

		/* in case user will change between tunnel and transport mode,
	 	* we have to set "padValue" every time before every packet 
	 	* goes into EIP93 for esp outbound! */
	 	cmdHandler = currAdapterPtr->cmdHandler;
	 	top_iph = ip_hdr(skb);
		ipsec_espNextHeader_set(cmdHandler, top_iph->protocol);
		addrCurrAdapter = (unsigned int *) &(skb->cb[36]);
		*addrCurrAdapter = (unsigned int)currAdapterPtr;
		
		__skb_pull(skb, skb_transport_offset(skb));

		if(ra_sw_nat_hook_free)
       		ra_sw_nat_hook_free(skb);

		#ifdef CONFIG_VPN_PASSTHROUGH_LOG
		if(gpVpnPTPara->vpndebuglevel >= VPN_PASSTHROUGH_LOG_DBG)
		{
		VPN_LOG(VPN_PASSTHROUGH_LOG_TRACE,"speed!! encryption phase I");
			skb_dump(skb);
		}
		#endif
		
		if(ipsec_esp_pktPut(skb,ENCRIPTION_DIRECTION) < 0)
		{
			#ifdef CONFIG_VPN_PASSTHROUGH_INFO
			gpVpnPTPara->statistics.einfo.e_phase1_drop_counts_2++;
			#endif
			#ifdef CONFIG_VPN_PASSTHROUGH_LOG
			VPN_LOG(VPN_PASSTHROUGH_LOG_DBG,"ipsec_esp_pktPut() Something's wrong! Drop packets");
			#endif
			goto speedout; 
		}

		#ifdef CONFIG_VPN_PASSTHROUGH_INFO
		gpVpnPTPara->statistics.einfo.e_phase1_speed_counts++;
		#endif
		return 1;//success

speedout:
	#ifdef CONFIG_VPN_PASSTHROUGH_INFO
	gpVpnPTPara->statistics.einfo.e_phase1_drop_counts++;
	#endif
	#ifdef CONFIG_VPN_PASSTHROUGH_LOG
	VPN_LOG(VPN_PASSTHROUGH_LOG_TRACE,"drop packet");
	#endif
	kfree_skb(skb); 
	return -EINVAL;	
	}

	return 1;
}

/*_______________________________________________________________________
**function name: ipsec_esp_input_pt
**
**description:
*  decryption I two phases
*	phase I:put packet into hw nat rx function to learn rule
*	paase II: if any matched rule in bind state,packets will speed to this function from hw nat rx function
**parameters:
*  inputParams--you can reference to the definition of structure
**global:
*   none
**return:
*	1--success
	other value:just return value in phase I ,and in phase II must free packet and then return value
**call:
*   none
**revision:
*   1.Brian 20130328
**_______________________________________________________________________*/
int ipsec_esp_input_pt(ipsec_para_t* ipsecparams)
{
	int err;
	int ret = -1;
	struct port_info crypto_info;
	struct xfrm_state *x;
	struct sk_buff *skb;
	struct esp_data *esp;
	int blksize,alen,elen;
	ipsecEip93Adapter_t **ipsecEip93AdapterList;
	ipsecEip93Adapter_t *currAdapterPtr;
	unsigned int *addrCurrAdapter;
			
	if(HWNAT_IPSEC_LEARING == ipsecparams->flag) // for HWNAT learning
	{
		x = ipsecparams->data.learn.x;
		skb = ipsecparams->data.learn.skb;
		esp = x->data;
		blksize = ALIGN(crypto_aead_blocksize(esp->aead), 4);
		alen = crypto_aead_authsize(esp->aead);
		elen = skb->len - sizeof(struct ip_esp_hdr) - crypto_aead_ivsize(esp->aead) - alen; 

		//printk("\r\nenter learn!");
		err = ipsec_esp_preProcess(x, skb, HASH_DIGEST_IN);
		if (err < 0)
		{
			#ifdef CONFIG_VPN_PASSTHROUGH_LOG
			VPN_LOG(VPN_PASSTHROUGH_LOG_ERROR,"ipsec_esp_preProcess for HASH_DIGEST_IN failed!");
			#endif
			#ifdef CONFIG_VPN_PASSTHROUGH_INFO
			gpVpnPTPara->statistics.dinfo.d_phase1_drop_counts++;
			#endif
			return err;
		}

		if (!pskb_may_pull(skb, sizeof(struct ip_esp_hdr)))
		{
			#ifdef CONFIG_VPN_PASSTHROUGH_LOG
			VPN_LOG(VPN_PASSTHROUGH_LOG_DBG,"pull esp header error!");
			#endif
			goto normalout;
		}
			
		if (elen <= 0 || (elen & (blksize-1)))
		{
			#ifdef CONFIG_VPN_PASSTHROUGH_LOG
			VPN_LOG(VPN_PASSTHROUGH_LOG_DBG,"para error");
			#endif
			goto normalout;
		}

		if (x->encap) 
		{
			#ifdef CONFIG_VPN_PASSTHROUGH_LOG
			VPN_LOG(VPN_PASSTHROUGH_LOG_WARNING,"NAT-T is not supported!");
			#endif
			goto normalout;
		}

		#ifdef CONFIG_VPN_PASSTHROUGH_LOG
		if(gpVpnPTPara->vpndebuglevel >= VPN_PASSTHROUGH_LOG_DBG)
		{
		VPN_LOG(VPN_PASSTHROUGH_LOG_TRACE,"learn!! decryption phase I");
		skb_dump(skb);
		}
		#endif
		
		//let hw_nat  learn rule(tx)
		if (ra_sw_nat_hook_tx != NULL) {
			unsigned int cryptodatap = (unsigned int)skb->data;
			skb->data = skb_mac_header(skb);
			memset(&crypto_info, 0, sizeof(crypto_info));
			if (ra_sw_nat_hook_tx(skb,&crypto_info,FOE_MAGIC_CRYPTO_D_1) == 0) 
			{
				#ifdef CONFIG_VPN_PASSTHROUGH_LOG
				VPN_LOG(VPN_PASSTHROUGH_LOG_TRACE,"duplicate packet,just drop it!");
				#endif
				skb->data = (unsigned char *)cryptodatap;
				return -EINVAL;	
			}
			skb->data = (unsigned char *)cryptodatap;
		}
		
		if(ra_sw_nat_hook_free)
			ra_sw_nat_hook_free(skb);

		if((ret = ipsec_esp_pktPut(skb,DECRIPTION_DIRECTION)) < 0)
		{
			#ifdef CONFIG_VPN_PASSTHROUGH_INFO
			gpVpnPTPara->statistics.dinfo.d_phase1_drop_counts++;
			#endif
			#ifdef CONFIG_VPN_PASSTHROUGH_LOG
			VPN_LOG(VPN_PASSTHROUGH_LOG_DBG,"ipsec_esp_pktPut() Something's wrong!");
			#endif
		}
		#ifdef CONFIG_VPN_PASSTHROUGH_INFO
		else
		{
			gpVpnPTPara->statistics.dinfo.d_phase1_normal_counts++;
		}
		#endif
		return ret;
	
normalout:
	#ifdef CONFIG_VPN_PASSTHROUGH_LOG
	VPN_LOG(VPN_PASSTHROUGH_LOG_DBG,"Something's wrong! Go out!");
	#endif
	#ifdef CONFIG_VPN_PASSTHROUGH_INFO
	gpVpnPTPara->statistics.dinfo.d_phase1_drop_counts++;
	#endif
	return -EINVAL;	
	
	}
	else if(HWNAT_IPSEC_SPEED == ipsecparams->flag)
	{
		skb = ipsecparams->data.speed.skb;	
		//something information needed
		skb_reset_network_header(skb); //need network_header point
		skb->mac_len = skb->network_header - skb->mac_header;//skb->mac_len is needed in xfrm4_tunnel_input()
		if (ip_hdr(skb)->frag_off & htons(IP_MF | IP_OFFSET)) {
			int err;
			err = ip_defrag(skb, IP_DEFRAG_VPN_SPEED);
			if(err)
				return 0;//not free skb here!
			else
			{
				#ifdef CONFIG_VPN_PASSTHROUGH_LOG
				VPN_LOG(VPN_PASSTHROUGH_LOG_TRACE,"reassembly finish!");
				#endif
				ip_send_check(ip_hdr(skb));	//if not recompute checksum,vpn in another side will fail
			}
		}
		
		skb_pull(skb,sizeof(struct iphdr));//need to point to esp header for hw crypto decryption

		//save needed info skb (cryptoDriver will save skb in EIP93's userID), so the needed info can be used by the tasklet which is raised by interrupt.
		ipsecEip93AdapterList = &ipsecEip93AdapterListIn[0];
		currAdapterPtr = ipsecEip93AdapterList[ipsecparams->data.speed.entry_idx];

		if(!currAdapterPtr)
		{
			#ifdef CONFIG_VPN_PASSTHROUGH_LOG
			VPN_LOG(VPN_PASSTHROUGH_LOG_DBG,"current adpter ptr is null! need to free skb");
			#endif
			goto speedout;
		}
		
		//recover para(x,sp)
		if(currAdapterPtr->x)
			xfrm_state_hold(currAdapterPtr->x);

		if(currAdapterPtr->sp)
			skb->sp = secpath_get(currAdapterPtr->sp);

		addrCurrAdapter = (unsigned int *) &(skb->cb[36]);
		*addrCurrAdapter = (unsigned int)currAdapterPtr;
			
		//free the hw_nat entry info in current skb to protect the ipsec second period learning
		if (ra_sw_nat_hook_free)
       		ra_sw_nat_hook_free(skb);

		#ifdef CONFIG_VPN_PASSTHROUGH_LOG
		if(gpVpnPTPara->vpndebuglevel >= VPN_PASSTHROUGH_LOG_DBG)
		{
		VPN_LOG(VPN_PASSTHROUGH_LOG_TRACE,"speed!! decryption phase I");
			skb_dump(skb);
		}
		#endif
		
		//let hw crypto do encryption
		if(ipsec_esp_pktPut(skb,DECRIPTION_DIRECTION) < 0)
		{
			#ifdef CONFIG_VPN_PASSTHROUGH_INFO
			gpVpnPTPara->statistics.einfo.e_phase1_drop_counts_1++;
			#endif
			#ifdef CONFIG_VPN_PASSTHROUGH_LOG
			VPN_LOG(VPN_PASSTHROUGH_LOG_DBG,"ipsec_esp_pktPut() Something's wrong! Drop packets");
			#endif
			goto speedout; 
		}
#ifdef CONFIG_VPN_PASSTHROUGH_INFO
		gpVpnPTPara->statistics.dinfo.d_phase1_speed_counts++;
#endif
		return 1;//success
		
speedout:
		#ifdef CONFIG_VPN_PASSTHROUGH_LOG
		VPN_LOG(VPN_PASSTHROUGH_LOG_TRACE,"drop packet");
		#endif
		#ifdef CONFIG_VPN_PASSTHROUGH_INFO
		gpVpnPTPara->statistics.dinfo.d_phase1_drop_counts++;
		#endif
		kfree_skb(skb); 
		return -EINVAL;	
	}
	return 1;
}

/*_______________________________________________________________________
**function name: ipsec_esp_input_handler
**
**description:
*   Replace Linux Kernel's esp_input(), in order to use EIP93
*	to do decryption for a IPSec ESP flow. and we can use switch to turn on passthrough function 
	or turn off it.
**parameters:
*   x -- point to the structure that stores IPSec SA information
*	skb -- the packet that is going to be decrypted.
**global:
*   none
**return:
*   -EPERM, -ENOMEM -- failed: the pakcet will be dropped!
*	1 -- success: the packet's command decsriptor is put into
*		EIP93's Command Descriptor Ring.
**call:
*   none
**revision:
*   1.Brian 20130328
**_______________________________________________________________________*/
int 
ipsec_esp_input_handler(
	struct xfrm_state *x, 
	struct sk_buff *skb
)
{	
	struct ipsec_para_s ipsec_data;
	if(VPN_PASSTHROUGH_SWITCH_ON == gpVpnPTPara->vpnpassthroughswitch)
	{
		ipsec_data.flag = HWNAT_IPSEC_LEARING;
		ipsec_data.data.learn.skb = skb;
		ipsec_data.data.learn.x = x;
		return ipsec_esp_input_pt(&ipsec_data); 
	}
	else
	{
		return ipsec_esp_input(x,skb);
	}
}

/*_______________________________________________________________________
**function name: ipsec_esp_input_handler
**
**description:
*   Deal with the rest of Linux Kernel's esp_input(). Then,
*	the decrypted packet can do the correct post-routing.
*	we can use switch to turn on passthrough function or turn off it.
**parameters:
*   x -- point to the structure that stores IPSec SA information
*	skb -- the packet that is going to be decrypted.
**global:
*   none
**return:
*  none
**call:
*   none
**revision:
*   1.Brian 20130328
**_______________________________________________________________________*/
static void 
ipsec_esp_input_finish_handler(
	eip93DescpHandler_t *resHandler,	
	ipsecEip93Adapter_t *currAdapterPtr
)
{
	struct ipsec_finishpara_s inputdata;
	if(VPN_PASSTHROUGH_SWITCH_ON == gpVpnPTPara->vpnpassthroughswitch)
	{
		inputdata.data.learn_push.resHandler = resHandler;
		inputdata.data.learn_push.currentAdapter = currAdapterPtr;
		inputdata.flag = HWNAT_IPSEC_LEARING;
		ipsec_esp_input_finish_pt(&inputdata);
	}
	else
	{
		ipsec_esp_input_finish(resHandler,currAdapterPtr->x);
	}

}

/*_______________________________________________________________________
**function name: ipsec_esp_output_finish_handler
**
**description:
*   Deal with the rest of Linux Kernel's esp_output(). Then,
*	the decrypted packet can do the correct post-routing.
*	we can use switch to turn on passthrough function or turn off it.
**parameters:
*   x -- point to the structure that stores IPSec SA information
*	skb -- the packet that is going to be decrypted.
**global:
*   none
**return:
*  none
**call:
*   none
**revision:
*   1.Brian 20130328
**_______________________________________________________________________*/

static void 
ipsec_esp_output_finish_handler(
	eip93DescpHandler_t *resHandler,	
	ipsecEip93Adapter_t *currAdapterPtr
)
{
	struct ipsec_finishpara_s inputdata;
	if(VPN_PASSTHROUGH_SWITCH_ON == gpVpnPTPara->vpnpassthroughswitch)
	{
		inputdata.data.learn_push.resHandler = resHandler;
		inputdata.data.learn_push.currentAdapter = currAdapterPtr;
		inputdata.flag = HWNAT_IPSEC_LEARING;
		ipsec_esp_ouput_finish_pt(&inputdata);
	}
	else
	{
		ipsec_esp_output_finish(resHandler);
	}
}

EXPORT_SYMBOL(gpVpnPTPara);
EXPORT_SYMBOL(mtk_ipsec_proc_init);
EXPORT_SYMBOL(mtk_ipsec_proc_uninit);
EXPORT_SYMBOL(ipsec_set_adatpterlist_para);
EXPORT_SYMBOL(ipsec_get_adatpterlist_para);
/* Move to linux-2.6.36/net/nat/foe_hook/hook.c
#else
//when not open vpn passthrough function,below function do nothing
void
ipsec_esp_ouput_finish_pt(ipsec_finishpara_t* inputParams)
{
	return;
}

void ipsec_esp_input_finish_pt(ipsec_finishpara_t* inputParams)
{
	return;
}
int ipsec_esp_output_pt(ipsec_para_t* ipsecparams)
{
	return -1;
}

int ipsec_esp_input_pt(ipsec_para_t* ipsecparams)
{
	return -1;
}
#endif
*/

EXPORT_SYMBOL(ipsec_esp_input_pt);
EXPORT_SYMBOL(ipsec_esp_input_finish_pt);
EXPORT_SYMBOL(ipsec_esp_output_pt);
EXPORT_SYMBOL(ipsec_esp_ouput_finish_pt);
#endif

/************************************************************************
*              E X T E R N E L     F U N C T I O N S
*************************************************************************
*/
/*_______________________________________________________________________
**function name: ipsec_eip93_adapters_init
**
**description:
*   initialize ipsecEip93AdapterListOut[] and ipsecEip93AdapterListIn[]
*	durin EIP93's initialization.
**parameters:
*   none
**global:
*   none
**return:
*   none
**call:
*   none
**revision:
*   1.Trey 20120209
**_______________________________________________________________________*/
void 
ipsec_eip93_adapters_init(
	void
)
{
	unsigned int i;
	
	for (i = 0; i < IPESC_EIP93_ADAPTERS; i++)
	{
		ipsecEip93AdapterListOut[i] = NULL;
		ipsecEip93AdapterListIn[i] = NULL;
	}
}

/*_______________________________________________________________________
**function name: ipsec_cryptoLock_init
**
**description:
*   initialize cryptoLock durin EIP93's initialization. cryptoLock is
*	used to make sure only one process can access EIP93 at a time.
**parameters:
*   none
**global:
*   none
**return:
*   none
**call:
*   none
**revision:
*   1.Trey 20120209
**_______________________________________________________________________*/
void 
ipsec_cryptoLock_init(
	void
)
{
	spin_lock_init(&cryptoLock);
}

EXPORT_SYMBOL(ipsec_eip93_adapters_init);
EXPORT_SYMBOL(ipsec_cryptoLock_init);

/*_______________________________________________________________________
**function name: ipsec_BH_handler_resultGet
**
**description:
*   This tasklet is raised by EIP93's interrupt after EIP93 finishs
*	a command descriptor and puts the result in Result Descriptor Ring.
*	This tasklet gets a result descriptor from EIP93 at a time and do
*	the corresponding atcion until all results from EIP93 are finished.
**parameters:
*   none
**global:
*   none
**return:
*   none
**call:
*   ipsec_esp_output_finish() when the result is for encryption.
*	ipsec_esp_input_finish() when the result is for decryption.
**revision:
*   1.Trey 20120209
**_______________________________________________________________________*/
void 
ipsec_BH_handler_resultGet(
	void
)
{
	int retVal;
	struct sk_buff *skb;
	ipsecEip93Adapter_t *currAdapterPtr;
	unsigned int *addrCurrAdapter;
	
	while (1)
	{
		memset(&resDescpHandler, 0, sizeof(eip93DescpHandler_t));

		retVal = ipsec_packet_get(&resDescpHandler);

		//got the correct result from eip93
		if (likely(retVal == 1))
		{
			//the result is for encrypted or encrypted packet
			if (ipsec_eip93HashFinal_get(&resDescpHandler) == 0x1)
			{
				skb = (struct sk_buff *) ipsec_eip93UserId_get(&resDescpHandler);
				addrCurrAdapter = (unsigned int *) &(skb->cb[36]);
				currAdapterPtr = (ipsecEip93Adapter_t *)(*addrCurrAdapter);

				if (currAdapterPtr->isEncryptOrDecrypt == CRYPTO_ENCRYPTION)
				{
			#ifdef TCSUPPORT_IPSEC_PASSTHROUGH
					ipsec_esp_output_finish_handler(&resDescpHandler,currAdapterPtr);
			#else
					ipsec_esp_output_finish(&resDescpHandler);
			#endif
					
				}
				else if (currAdapterPtr->isEncryptOrDecrypt == CRYPTO_DECRYPTION)
				{			
			#ifdef TCSUPPORT_IPSEC_PASSTHROUGH
					ipsec_esp_input_finish_handler(&resDescpHandler,currAdapterPtr);
			#else
					ipsec_esp_input_finish(&resDescpHandler, currAdapterPtr->x);
			#endif
				}
				else
				{
					printk("\n\n !can't tell encrypt or decrypt! \n\n");
					return;
				}

			}
			//the result is for inner and outer hash digest pre-compute
			else
			{
				currAdapterPtr = (ipsecEip93Adapter_t *) ipsec_eip93UserId_get(&resDescpHandler);
			
				spin_lock(&currAdapterPtr->lock);
				//spin_lock_irqsave(&currAdapterPtr->lock, flags);
				//for the inner digests			
				if (currAdapterPtr->isHashPreCompute == 0)
				{
					//resDescpHandler only has physical addresses, so we have to get saState's virtual address from addrsPreCompute.
					ipsec_hashDigests_set(currAdapterPtr, 1);
					
					//inner digest done
					currAdapterPtr->isHashPreCompute = 1; 
				}
				//for the outer digests	
				else if (currAdapterPtr->isHashPreCompute == 1)
				{				
					ipsec_hashDigests_set(currAdapterPtr, 2);

					//outer digest done
					currAdapterPtr->isHashPreCompute = 2;				
				}
				else
				{
					printk("\n\n !can't tell inner or outer digests! \n\n");
					return;
				}
							
				spin_unlock(&currAdapterPtr->lock);
				//spin_unlock_irqrestore(&currAdapterPtr->lock, flags);
			}
		}
		//if packet is not done, don't wait! (for speeding up)
		else if (retVal == 0)
		{
			//printk("(%d)ipsec_BH_handler_resultGet retVal=0\n",__LINE__);
			break;
		}
	} //end while (1)
	
	return;
}
EXPORT_SYMBOL(ipsec_BH_handler_resultGet);
