#include "CM.h"
#include "CM8M02X.h"


/************ START�ź�*******************************/
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

/******************** STOP�ź�************************/
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


/****************д1���ֽڸ�TM1650********************/
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
		// SDA=1;			//ACK�ź�
		nop_pro
		SCL=1;
		nop_pro
		SCL=0;
		nop_pro	 
/* 		CH455_SDA_D_OUT ;
		SDA=1; */
		CH455_SDA_D_IN
}


/****��8bit
ע�⣺���������˫��IO�ڣ�������Ҫ���ö˿����Ե�MCU��Ҫע��
�ڷ���ָ��ʱ����Ϊ���ģʽ;
����ACKΪ����ģʽ��
������λ����ģʽ��
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
	SCL=1;                        //ʱ������
	nop_pro
	dat<<=1;
	if(SDA)
	 dat++;
	SCL=0;
	nop_pro
	}
	CH455_SDA_D_OUT ;
	SDA=0;			    //ACK�ź�
	nop_pro
	SCL=1;
	nop_pro
	SCL=0;
	_nop();
	
	return dat ;
} 

/********������ʾ����*******/
void TM1650_send(unsigned char saddr,unsigned char sdate)
{
 	TM1650_START();
	write_8bit(saddr);
	write_8bit(sdate);
	TM1650_STOP();
}

/**ϵͳ��������
light -- ���ȼ���(00H 8�����ȡ�10HΪ1�����ȡ�����������70HΪ7������)
segMod -- ��ģʽ����(00HΪ8��ģʽ��08HΪ7��ģʽ)
WorkMod -- ����ģʽ(00HΪ����ģʽ��04HΪ�͹���ģʽ)
Onoff -- ����(00HΪ����ʾ��01HΪ����ʾ)
���磺1�����ȣ�7��ģʽ����������ģʽ������ʾ����Ϊ
TM1650_SystemCmd(0x10, 0x08, 0x01, 0x01 );
***/
void TM1650_SystemCmd(unsigned char light,unsigned char segMod, unsigned char WorkMod, unsigned char Onoff)
{
 	TM1650_START();
	write_8bit(0x48);
	write_8bit(light | segMod | WorkMod | Onoff );
	TM1650_STOP();
}

/**4λ��ʾ����
0x68 ��ӦDIG1
0x6A ��ӦDIG2
0x6C ��ӦDIG3
0x6E ��ӦDIG4
���ҪDIG1-4��ʾ0-3 ����ΪTM1650Disp(DispCode[0],DispCode[1],DispCode[2],DispCode[3]);
***/

/*******************����������************************/
unsigned char TM1650_read()
{
	unsigned char key;
	TM1650_START();
    write_8bit(0x4F);   //������ָ��	
	key=read_8bit();
	TM1650_STOP();
	return key;
}
