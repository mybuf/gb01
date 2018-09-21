#include "CM.h"
#include "CM8M02X.h"


/************ START信号*******************************/
void TM1650_START()
{
	CH455_SDA_D_OUT
	SCL=1;
	SDA=1;
	_nop();
	SDA=0;
	_nop();
	SCL=0;
	// CH455_SDA_D_IN ;
}

/******************** STOP信号************************/
void TM1650_STOP()
{
	CH455_SDA_D_OUT
	SDA=0;
	_nop();
	SCL=1;
	_nop();
	SDA=1;
	_nop();
	SCL=0;
	SDA=1;
	CH455_SDA_D_IN
}


/****************写1个字节给TM1650********************/
void write_8bit( unsigned char dat)
{
 	unsigned char i;
	SCL=0;
	CH455_SDA_D_OUT
	for(i=0;i<8;i++)
		{
		if(dat&0x80)
		{
			SDA=1;
			_nop();
			_nop();
			SCL=1;
			nop_pro
			SCL=0;	 
		}
		else
		{
			SDA=0;
			_nop();
			_nop();
			SCL=1;
			nop_pro
			SCL=0;
		}	
			dat<<=1;	 
		}
		CH455_SDA_D_IN ;
		// SDA=1;			//ACK信号
		nop_pro
		SCL=1;
		nop_pro
		SCL=0;
		nop_pro	 
/* 		CH455_SDA_D_OUT ;
		SDA=1; */
		CH455_SDA_D_IN
}


/****读8bit
注意：本程序采用双向IO口，对于需要配置端口特性的MCU需要注意
在发送指令时配置为输出模式;
接受ACK为输入模式；
读数据位输入模式；
**************************/
unsigned char read_8bit()
{
	unsigned char dat,i;
	CH455_SDA_D_IN ;
	// nop_pro
	// SDA=1;
	dat=0;
	for(i=0;i<8;i++)
	{
	SCL=1;                        //时钟上沿
	nop_pro
	dat<<=1;
	if(SDA)
	 dat++;
	SCL=0;
	nop_pro
	}
	CH455_SDA_D_OUT ;
	SDA=0;			    //ACK信号
	nop_pro
	SCL=1;
	nop_pro
	SCL=0;
	_nop();
	
	return dat ;
} 

/********发送显示数据*******/
void TM1650_send(unsigned char saddr,unsigned char sdate)
{
 	TM1650_START();
	write_8bit(saddr);
	write_8bit(sdate);
	TM1650_STOP();
}

/**系统设置命令
light -- 亮度级别(00H 8级亮度、10H为1级亮度。。。。。。70H为7级亮度)
segMod -- 段模式设置(00H为8段模式，08H为7段模式)
WorkMod -- 工作模式(00H为正常模式，04H为低功耗模式)
Onoff -- 开关(00H为关显示，01H为开显示)
例如：1级亮度，7段模式，正常工作模式，开显示则函数为
TM1650_SystemCmd(0x10, 0x08, 0x01, 0x01 );
***/
void TM1650_SystemCmd(unsigned char light,unsigned char segMod, unsigned char WorkMod, unsigned char Onoff)
{
 	TM1650_START();
	write_8bit(0x48);
	write_8bit(light | segMod | WorkMod | Onoff );
	TM1650_STOP();
}

/**4位显示数据
0x68 对应DIG1
0x6A 对应DIG2
0x6C 对应DIG3
0x6E 对应DIG4
如果要DIG1-4显示0-3 则函数为TM1650Disp(DispCode[0],DispCode[1],DispCode[2],DispCode[3]);
***/

/*******************读按键命令************************/
unsigned char TM1650_read()
{
	unsigned char key;
	TM1650_START();
    write_8bit(0x4F);   //读按键指令	
	key=read_8bit();
	TM1650_STOP();
	return key;
}
