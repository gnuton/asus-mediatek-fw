#ifndef __FOE_HOOK_H
#define __FOE_HOOK_H

#define FOE_MAGIC_PCI		    0x7273
#define FOE_MAGIC_WLAN		    0x7274
#define FOE_MAGIC_GE		    0x7275
#define FOE_MAGIC_PPE		    0x7276
#define FOE_MAGIC_ATM		    0x7277

#ifdef TCSUPPORT_MT7510_FE
#define FOE_MAGIC_PTM		    0x7278
#define FOE_MAGIC_EPON		    0x7279
#define FOE_MAGIC_GPON		    0x727a
//#define FOE_MAGIC_CRYPTO	    0x727b

#define FOE_MAGIC_CRYPTO_E_1	    0x727b
#define FOE_MAGIC_CRYPTO_D_1	    0x727c
#define FOE_MAGIC_CRYPTO_E_2	    0x727d
#define FOE_MAGIC_CRYPTO_D_2	    0x727e
#define FOE_MAGIC_OFFLOAD	    0x727f
#endif

#define HWNAT_IPSEC_LEARING 0
#define HWNAT_IPSEC_SPEED 1
#define HWNAT_IPSEC_ROLLBACK 2

#define IPSEC_SKB_CB			47

#define FOE_OPE_GETENTRYNUM 0
#define FOE_OPE_CLEARENTRY  1


#define HWNAT_WLAN_IF_MAXNUM	16 //16 is max wifi interface
#define HWNAT_WLAN_IF_BASE		8 //8 is base
#define HWNAT_WLAN_IF_NUM		4 //8 is maximum
#define HWNAT_WLAN_IF_I_NUM		4 //8 is maximum, foe rai

#define MULTICAST_SPEED_STATE_I 		3	//with lan and with wlan
#define MULTICAST_SPEED_STATE_II		1	//with lan and without wlan
#define MULTICAST_SPEED_STATE_III		2	//without lan and with wlan
#define MULTICAST_SPEED_STATE_IV   		0	//without lan and without wlan

#ifdef TCSUPPORT_MT7510_FE
struct qdma_atm{
	unsigned long int txq:4;
	unsigned long int pppoa:1;//sw self use
	unsigned long int ipoa:1;//sw self use
	unsigned long int vc_mux:1;//sw self use
	unsigned long int resv0:11;
	unsigned long int xoa:1;
	unsigned long int uu:8;
	unsigned long int clp:1;
	unsigned long int vcnum:4;
};

struct qdma_ptm{
	unsigned long int txq:4;
	unsigned long int resv0:6;
	unsigned long int tsid:5;
	unsigned long int tse:1;
	unsigned long int resv1:12;
	unsigned long int channel:4;
};

struct qdma_epon{
	unsigned long int txq:4;
	unsigned long int resv0:6;
	unsigned long int tsid:5;
	unsigned long int tse:1;
	unsigned long int resv1:12;
	unsigned long int llid:4;
};

struct qdma_gpon{
	unsigned long int txq:4;
	unsigned long int resv0:6;
	unsigned long int tsid:5;
	unsigned long int tse:1;
	unsigned long int gemid:12;
	unsigned long int tcon:4;
};

struct pdma{
	unsigned long int txq:4;
	unsigned long int resv0:27;
	unsigned long int is_wan:1;//sw self use
};
struct port_info {
	union {
		struct qdma_atm qatm;	
		struct qdma_ptm qptm;
		struct qdma_epon qepon;
		struct qdma_gpon qgpon;
		struct pdma pdma_eth;
		unsigned long int word;
	};
};

#endif
#ifdef TCSUPPORT_MT7510_FE
enum {
	/* tx */
	GDM2_TX_GET_CNT = 0, 	//0
	GDM2_TX_OK_CNT,
	GDM2_TX_DROP_CNT,
	GDM2_TX_OK_BYTE_CNT,
	GDM2_TX_ETH_PKT_CNT,
	GDM2_TX_ETH_BYTE_CNT,	//5
	GDM2_TX_ETH_DROP_CNT,
	GDM2_TX_ETH_BC_CNT,
	GDM2_TX_ETH_MC_CNT,
	GDM2_TX_ETH_RUNT_CNT,
	GDM2_TX_ETH_LONG_CNT,	//10
	GDM2_TX_ETH_E64_CNT,
	GDM2_TX_ETH_L64_CNT,
	GDM2_TX_ETH_L127_CNT,
	GDM2_TX_ETH_L255_CNT,
	GDM2_TX_ETH_L511_CNT,	//15
	GDM2_TX_ETH_L1023_CNT,
	/* rx */
	GDM2_RX_OK_CNT,
	GDM2_RX_OVER_DROP_CNT,
	GDM2_RX_ERROR_DROP_CNT,
	GDM2_RX_OK_BYTE_CNT,	//20
	GDM2_RX_ETH_PKT_CNT,
	GDM2_RX_ETH_BYTE_CNT,
	GDM2_RX_ETH_DROP_CNT,
	GDM2_RX_ETH_BC_CNT,
	GDM2_RX_ETH_MC_CNT,		//25
	GDM2_RX_ETH_CRCE_CNT,
	GDM2_RX_ETH_FRAG_CNT,
	GDM2_RX_ETH_JABBER_CNT,
	GDM2_RX_ETH_RUNT_CNT,
	GDM2_RX_ETH_LONG_CNT,	//30
	GDM2_RX_ETH_E64_CNT,
	GDM2_RX_ETH_L64_CNT,
	GDM2_RX_ETH_L127_CNT,
	GDM2_RX_ETH_L255_CNT,
	GDM2_RX_ETH_L511_CNT,	//35
	GDM2_RX_ETH_L1023_CNT,
	GDM2_TX_RX_LEN
};

typedef struct {
	unsigned long addr;
	unsigned long value;
	char * description;
} gdm2_reg_t;

extern unsigned long (*ra_sw_nat_hook_gdm2_state) (int gdm2AddrIndex);
extern void (*ra_sw_nat_hook_gdm2_clear_state) (void);
#endif //end of TCSUPPORT_MT7510_FE
/*****************************
 * FRAME ENGINE REGISTERS OFFSET *
 *****************************/
#define FE_GLO_CFG_OFF          (0x0000)
#define CDMP_VLAN_CT_OFF		(0x0400)
#define CDM_VLAN_GE_OFF         (0x1400)
#define GDM2_FWD_CFG_OFF		(0x1500)
#define GDM2_MIB_CLR_OFF		(0x1520)
#define GDM2_LEN_CFG_OFF		(0x1524)
#define GDM2_CHN_EN_OFF			(0x152c)
#define GDM2_TX_GET_CNT_OFF		(0x1600)
#define GDM2_TX_OK_CNT_OFF		(0x1604)
#define GDM2_TX_DROP_CNT_OFF	(0x1608)
#define GDM2_TX_OK_BYTE_CNT_OFF	(0x160c)
#define GDM2_RX_OK_CNT_OFF		(0x1650)
#define GDM2_RX_OVER_DROP_CNT_OFF	(0x1654)
#define GDM2_RX_ERROR_DROP_CNT_OFF	(0x1658)
#define GDM2_RX_OK_BYTE_CNT_OFF		(0x165c)
#define GDM2_RX_ETH_CRCE_CNT_OFF	(0x1674)
#define GDM2_RX_ETH_RUNT_CNT_OFF	(0x1680)
#define GDM2_RX_ETH_LONG_CNT_OFF	(0x1684)

	
struct SkbFoeInfo{	
	unsigned short ppe_magic;	
	unsigned short ppe_foe_entry;
	unsigned char ppe_ai;
};

struct sk_buff;

extern int (*ra_sw_nat_hook_rx) (struct sk_buff * skb);
#ifdef TCSUPPORT_MT7510_FE
extern int (*ra_sw_nat_hook_tx) (struct sk_buff * skb, struct port_info * pinfo, int magic);
#else
extern int (*ra_sw_nat_hook_tx) (struct sk_buff * skb, int gmac_no);
#endif
extern int (*ra_sw_nat_hook_free) (struct sk_buff * skb);
extern int (*ra_sw_nat_hook_rxinfo) (struct sk_buff * skb, int magic, char *data, int data_length);
extern int (*ra_sw_nat_hook_txq) (struct sk_buff * skb, int txq);
extern int (*ra_sw_nat_hook_magic) (struct sk_buff * skb, int magic);
extern int (*ra_sw_nat_hook_set_magic) (struct sk_buff * skb, int magic);
extern int (*ra_sw_nat_hook_xfer) (struct sk_buff *skb, const struct sk_buff *prev_p);
extern int (*ra_sw_nat_hook_foeentry) (void * inputvalue,int operation);
extern int (*ra_sw_nat_hook_is_alive_pkt)(unsigned int crsn);


#ifdef TCSUPPORT_RA_HWNAT_ENHANCE_HOOK
extern int (*ra_sw_nat_hook_drop_packet) (struct sk_buff * skb);
extern int (*ra_sw_nat_hook_clean_table) (void);
#endif
#endif
