/*
 * ex_mdio_api.c
 *
 *  Created on: 2013/4/22
 *      Author: mtk04880
 */
#include <linux/module.h>
#include <linux/init.h>
#include <linux/irq.h>
#include <linux/interrupt.h>
#include <asm/io.h>
#include <asm/irq.h>
#include <asm/mipsregs.h>
#include <asm/tc3162/tc3162.h>
#include <asm/tc3162/ledcetrl.h>
#include <linux/sched.h>

/*MACRO DEFINITION*/
//#define DBG 1
#define MDIO_WRITE (1)
#define MDIO_READ (0)

#define GPIO_HIGH(x) 	VPint(CR_GPIO_DATA) |= (1<<(x))
#define GPIO_LOW(x) 	VPint(CR_GPIO_DATA) &= ~(1<<(x))
#define GPIO_VALUE(x) 	((VPint(CR_GPIO_DATA))&(1<<(x)))>>(x)

#define GPIO_OEN(x) (x > 15) ? (VPint(CR_GPIO_CTRL1) |= (1<<(x-16)*2)):\
						(VPint(CR_GPIO_CTRL) |= (1<<((x)*2))); VPint(CR_GPIO_ODRAIN) |= (1<<(x));
/* input enable */
#define GPIO_IEN(x) (x > 15) ? (VPint(CR_GPIO_CTRL1) &= ~(0x00000003 << ((x-16)* 2)) ): \
							(VPint(CR_GPIO_CTRL) &= ~(0x00000003 << ((x)* 2))); VPint(CR_GPIO_ODRAIN) &= ~(0x00000001 << (x));

#define MDC_GPIO_DEF (25)
#define MDIO_GPIO_DEF (26)
/*GLOBAL VARIABLE*/
static int mdc_gpio = MDC_GPIO_DEF;
static int mdio_gpio = MDIO_GPIO_DEF;

static void word2Bit(uint32 word, uint8 *bit){
	uint8 i;
	for (i=0;i<32;i++)
	{
		bit[i]=(word & (0x00000001<<i))>>i ;
	}
}
static uint32 bit2Word( uint8 *bit){
	uint8 i;
	uint32 word=0;
	for (i=0;i<32;i++)
	{
		word+=(bit[i])<<(31-i) ;
	}

	return word;
}

static void HwGpioSetMode(uint8 mode){
	uint32 word;
	if(isRT63365)
		VPint(0xbfb00860) &=~((1<<9)|(1<<12));//>63365 GPIO 7 and 10 share use for enthnet LED

	if (mode == MDIO_READ){
		// set gpio10 as output pin
		//VPint(CR_GPIO_CTRL) |= (1<<(10*2));
		//VPint(CR_GPIO_ODRAIN) |= (1<<10);
#if 0
		// set gpio7 as input pin
		VPint(CR_GPIO_ODRAIN) &= ~(1<<7);
		VPint(CR_GPIO_CTRL) &= ~(1<<(7*2));
#else
		GPIO_IEN(mdio_gpio);
#endif
	}
	else if (mode == MDIO_WRITE){
#if 0
	// set gpio7/10 as output pin
		VPint(CR_GPIO_CTRL) |= (1<<(7*2))|(1<<(10*2));
		VPint(CR_GPIO_ODRAIN) |= (1<<7)|(1<<(10));
#else
		GPIO_OEN(mdio_gpio);
		GPIO_OEN(mdc_gpio);
#endif
	}
}

void exModeMDIOWrite(uint32 reg, uint32 data){
	uint8 i;
	uint8 Addr[32]={0};
	uint8 Data[32]={0};
	uint8 temp1[32]={0};
	uint8 temp2[32]={0};
	//uint32 reg=0x8;
	//uint32 data=0xb;
	uint8 mdio_signal_real[116*2] ={0};
	uint8 mdio_signal[116]={
		1,1,1,1,0,1,0,1,	//PRE  ST  OP
		1,1,				//ADDR 2bit
		0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,
		0,0,0,0,0,1,1,1,	//ADDR  32bit  //0xbfb50800//0x7
		1,0,				//TA
		1,1,1,1,1,1,1,1,	//byte-enable  DATA 8bit

		0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,

		0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,	// DATA 64bit
	};

	uint8 mdc_signal[116*2+16]={
		1,0,1,0,1,0,1,0,	//PRE  ST  OP
		1,0,				//ADDR 2bit
		1,0,1,0,1,0,1,0,
		1,0,1,0,1,0,1,0,
		1,0,1,0,1,0,1,0,
		1,0,1,0,1,0,1,0,	//ADDR  32bit
		1,0,				//TA
		1,0,1,0,1,0,1,0,	//byte-enable  DATA 8bit
		1,0,1,0,1,0,1,0,
		1,0,1,0,1,0,1,0,
		1,0,1,0,1,0,1,0,
		1,0,1,0,1,0,1,0,
		1,0,1,0,1,0,1,0,
		1,0,1,0,1,0,1,0,
		1,0,1,0,1,0,1,0,
		1,0,1,0,1,0,1,0,	//byte-enable  DATA 64bit

		1,0,1,0,1,0,1,0,	//PRE  ST  OP
		1,0,				//ADDR 2bit
		1,0,1,0,1,0,1,0,
		1,0,1,0,1,0,1,0,
		1,0,1,0,1,0,1,0,
		1,0,1,0,1,0,1,0,	//ADDR  32bit
		1,0,				//TA
		1,0,1,0,1,0,1,0,	//byte-enable  DATA 8bit
		1,0,1,0,1,0,1,0,
		1,0,1,0,1,0,1,0,
		1,0,1,0,1,0,1,0,
		1,0,1,0,1,0,1,0,
		1,0,1,0,1,0,1,0,
		1,0,1,0,1,0,1,0,
		1,0,1,0,1,0,1,0,
		1,0,1,0,1,0,1,0,	//byte-enable  DATA 64bit

		1,0,1,0,1,0,1,0,
		1,0,1,0,1,0,1,0,
	};
#ifdef DBG
	printk("%s(%d)Entry \n",__func__,__LINE__);
#endif
	if((reg<0x7)||(reg>0xff)){
	reg=reg-0xa0000000;//for 0xb4000000 ->0x14000000
	}
	word2Bit(reg,temp1);
	word2Bit(data,temp2);

	for(i=0;i<32;i++)
	{
		Addr[i]=temp1[31-i];
		Data[i]=temp2[31-i];
		//printf("reg[%d]  = %d\r\n", i, Addr[i]);
		//printf("data[%d]  = %d\r\n", i, Data[i]);
	}

	if((reg>=0x7)&&(reg<=0xff))//contril register space
	{
		mdio_signal[8]=0;
		mdio_signal[9]=0;

		for (i=84;i<116;i++) //Data
		{
			mdio_signal[i]=Data[i-84];
		}
	}
	else if(((reg&0xf)==0x0)||((reg&0xf)==0x8))
	{
		mdio_signal[8]=1;//high 32bit  addr bit[33:32] = 0x10
		mdio_signal[9]=0;

		mdio_signal[44]=1;//byte-enable  DATA 8bit
		mdio_signal[45]=1;
		mdio_signal[46]=1;
		mdio_signal[47]=1;
		mdio_signal[48]=0;
		mdio_signal[49]=0;
		mdio_signal[50]=0;
		mdio_signal[51]=0;

		for (i=52;i<84;i++) //Data
		{
			mdio_signal[i]=Data[i-52];
		}


	}
	else if(((reg&0xf)==0x4)||((reg&0xf)==0xc))
	{
		mdio_signal[8]=0;//low 32bit  addr bit[33:32] = 0x01
		mdio_signal[9]=1;

		mdio_signal[44]=0;//byte-enable  DATA 8bit
		mdio_signal[45]=0;
		mdio_signal[46]=0;
		mdio_signal[47]=0;
		mdio_signal[48]=1;
		mdio_signal[49]=1;
		mdio_signal[50]=1;
		mdio_signal[51]=1;

		for (i=84;i<116;i++) //Data
		{
			mdio_signal[i]=Data[i-84];
		}
	}



	for(i=10;i<42;i++)
	{
		mdio_signal[i]=Addr[i-10];

	}

	for (i=0;i<116;i++)
	{
		mdio_signal_real[i*2]=mdio_signal[i];
		mdio_signal_real[i*2+1]=mdio_signal[i];
		//printf("mdio_signal[%d]  = %d\r\n", i, mdio_signal[i]);
	}

	HwGpioSetMode(MDIO_WRITE);//write

	//GPIO_HIGH(mdio_gpio);//let MDIO can be push by MDC
	//delayDmtSymbols(1);

	for (i=0;i<116*2+16;i++)
	{
		if (mdc_signal[i] ==0)
		{
			GPIO_LOW(mdc_gpio);
			//delayDmtSymbols(1);
		}
		else if (mdc_signal[i] ==1)
		{
			GPIO_HIGH(mdc_gpio);
			//delayDmtSymbols(1);
		}

		if(i<116*2)
		{
			if (mdio_signal_real[i] ==0)
			{
				GPIO_LOW(mdio_gpio);
				//delayDmtSymbols(1);
			}
			else if (mdio_signal_real[i] ==1)
			{
				GPIO_HIGH(mdio_gpio);
				//delayDmtSymbols(1);
			}
		}
	}
#ifdef DBG
	printk("%s(%d)Exit \n",__func__,__LINE__);
#endif
}

uint32 exModeMDIORead(uint32 reg){
	uint32 data = 0;
	uint8 i;
	uint8 Addr[32]={0};
	uint8 Data[32]={0};
	uint8 temp1[32]={0};
	//uint8 temp2[32]={0};
	uint8 mdio_signal_real[116*2] ={0};

	uint8 mdio_signal[116]={
		1,1,1,1,0,1,1,0,	//PRE  ST  OP
		1,1,				//ADDR 2bit
		1,0,1,1,1,1,1,1,
		1,0,1,1,0,1,0,1,
		0,0,0,0,1,0,0,0,
		0,0,0,0,0,0,0,0,	//ADDR  32bit  //0xbfb50800  //0xbfb50a00
		1,0, 				//TA
		0,0,0,0,0,0,0,1, 	//byte-enable  DATA 8bit

		0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,

		0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,
		1,0,1,1,0,1,0,0,	//byte-enable  DATA 64bit
	};

	uint8 mdc_signal[116*2+16]={
		1,0,1,0,1,0,1,0, 	//PRE  ST  OP
		1,0,				//ADDR 2bit
		1,0,1,0,1,0,1,0,
		1,0,1,0,1,0,1,0,
		1,0,1,0,1,0,1,0,
		1,0,1,0,1,0,1,0,	//ADDR  32bit
		1,0, 				//TA
		1,0,1,0,1,0,1,0,	//byte-enable  DATA 8bit
		1,0,1,0,1,0,1,0,
		1,0,1,0,1,0,1,0,
		1,0,1,0,1,0,1,0,
		1,0,1,0,1,0,1,0,
		1,0,1,0,1,0,1,0,
		1,0,1,0,1,0,1,0,
		1,0,1,0,1,0,1,0,
		1,0,1,0,1,0,1,0,	//byte-enable  DATA 64bit

		1,0,1,0,1,0,1,0, 	//PRE  ST  OP
		1,0,				//ADDR 2bit
		1,0,1,0,1,0,1,0,
		1,0,1,0,1,0,1,0,
		1,0,1,0,1,0,1,0,
		1,0,1,0,1,0,1,0,	//ADDR  32bit
		1,0, 				//TA
		1,0,1,0,1,0,1,0,	//byte-enable  DATA 8bit
		1,0,1,0,1,0,1,0,
		1,0,1,0,1,0,1,0,
		1,0,1,0,1,0,1,0,
		1,0,1,0,1,0,1,0,
		1,0,1,0,1,0,1,0,
		1,0,1,0,1,0,1,0,
		1,0,1,0,1,0,1,0,
		1,0,1,0,1,0,1,0,	//byte-enable  DATA 64bit

		1,0,1,0,1,0,1,0,
		1,0,1,0,1,0,1,0,
	};
#ifdef DBG
	printk("%s(%d)Entry \n",__func__,__LINE__);
#endif

	if((reg>=0x7)&&(reg<=0xff))//contril register space
	{
		mdio_signal[8]=0;
		mdio_signal[9]=0;
	}
	else if(((reg&0xf)==0x0)||((reg&0xf)==0x8))  //high 32bit  addr bit[33:32] = 0x10
	{
		mdio_signal[8]=1;
		mdio_signal[9]=0;
		reg=reg-0xa0000000;//for 0xb4000000 ->0x14000000
	}
	else if(((reg&0xf)==0x4)||((reg&0xf)==0xc))//low 32bit  addr bit[33:32] = 0x01
	{
		mdio_signal[8]=0;
		mdio_signal[9]=1;
		reg=reg-0xa0000000;//for 0xb4000000 ->0x14000000
	}


	word2Bit(reg,temp1);


	for(i=0;i<32;i++)
	{
		Addr[i]=temp1[31-i];
	//	Data[i]=temp2[31-i];
		//printf("reg[%d]  = %d\r\n", i, Addr[i]);
		//printf("data[%d]  = %d\r\n", i, Data[i]);
	}

	for(i=10;i<42;i++)
	{
		mdio_signal[i]=Addr[i-10];

	}

	for (i=0;i<42;i++)
	{
		mdio_signal_real[i*2]=mdio_signal[i];
		mdio_signal_real[i*2+1]=mdio_signal[i];
		//printf("mdio_signal0[%d]  = %d\r\n", i, mdio_signal[i]);
	}

	HwGpioSetMode(MDIO_WRITE);//write
	//GPIO_HIGH(mdio_gpio);//let MDIO can be push by MDC
	//delayDmtSymbols(1);

	for (i=0;i<116*2+16;i++)
	{
		//printk("mdiod:%d ",mdio_signal_real[i]);
		//if(i % 10 == 0)
		//	printk("\n");
		if(i<42*2)
		{
			if (mdc_signal[i] ==0)
			{
				GPIO_LOW(mdc_gpio);
				//delayDmtSymbols(1);
			}
			else if (mdc_signal[i] ==1)
			{
				GPIO_HIGH(mdc_gpio);
				//delayDmtSymbols(1);
			}

			if (mdio_signal_real[i] ==0)
			{
				GPIO_LOW(mdio_gpio);
				//delayDmtSymbols(1);
			}
			else if (mdio_signal_real[i] ==1)
			{
				GPIO_HIGH(mdio_gpio);
				//delayDmtSymbols(1);
			}
		}
		else if (i==42*2)
		{
			if (mdc_signal[i] ==0)
			{
				GPIO_LOW(mdc_gpio);
				//delayDmtSymbols(1);
			}
			else if (mdc_signal[i] ==1)
			{
				GPIO_HIGH(mdc_gpio);
				//delayDmtSymbols(1);
			}

			//delayDmtSymbols(2);
			HwGpioSetMode(MDIO_READ);//read
		}
		else
		{
			//delayDmtSymbols(1);
			if (mdc_signal[i] ==0)
			{
				GPIO_LOW(mdc_gpio);
				//delayDmtSymbols(1);
			}
			else if (mdc_signal[i] ==1)
			{
				GPIO_HIGH(mdc_gpio);
				//delayDmtSymbols(1);
				if((i>42*2)&&(i<116*2+2))
				{
					mdio_signal_real[i-2] = GPIO_VALUE(mdio_gpio);
				}
			}

		}
	}

	for (i=0;i<116;i++)
	{
		mdio_signal[i]=mdio_signal_real[i*2];
		//printf("mdio_signal1[%d]  = %d\r\n", i, mdio_signal[i]);
	}
// get data from mdio_signal
	for(i=0;i<32;i++)
	{
		if((reg>=0x7)&&(reg<=0xff))//contril register space //data low 32bit
		{
			Data[i]=mdio_signal[i+84];
		}
		else if(((reg&0xf)==0x0)||((reg&0xf)==0x8))  //high 32bit  addr bit[33:32] = 0x10
		{
			Data[i]=mdio_signal[i+52];
		}
		else if(((reg&0xf)==0x4)||((reg&0xf)==0xc))//low 32bit  addr bit[33:32] = 0x01
		{
			Data[i]=mdio_signal[i+84];
		}
		//printf("Data[%d]  = %d\r\n", i, Data[i]);
	}
	data=bit2Word(Data);
#ifdef DBG
	printk("%s(%d)Exit \n",__func__,__LINE__);
#endif
	return data;

}

void exModeMDIOGpioQuery(uint8* mdc_gpio_num,uint8* mdio_gpio_num){
#ifdef DBG
	printk("%s(%d) Entry\n",__func__,__LINE__);
#endif
	if(mdc_gpio_num && mdio_gpio_num){
		*mdc_gpio_num = mdc_gpio;
		*mdio_gpio_num = mdio_gpio;
#ifdef DBG
	printk("%s(%d) Exit\n",__func__,__LINE__);
#endif
	}
	else{
		printk("%s(%d) Err Exit:NULL Ptr\n",__func__,__LINE__);
	}

}

int exModeMDIOGpioConf(uint8 mdc_gpio_num,uint8 mdio_gpio_num){
#ifdef DBG
	printk("%s(%d):mdc/mdio gpio:%d/%d \n",__func__,__LINE__,mdc_gpio_num,mdio_gpio_num);
#endif
	if((mdc_gpio_num >0) && (mdio_gpio_num > 0)){
		mdc_gpio = mdc_gpio_num;
		mdio_gpio = mdio_gpio_num;
		return 1;
	}
	else{
		return 0;
	}

}
EXPORT_SYMBOL(exModeMDIOGpioQuery);
EXPORT_SYMBOL(exModeMDIOGpioConf);
EXPORT_SYMBOL(exModeMDIORead);
EXPORT_SYMBOL(exModeMDIOWrite);
