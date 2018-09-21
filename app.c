/*===========================================================*/
#include "CM.h"
#include "CM8M02X.h"






unsigned char Read_Code_Success ;

#define  SCL PA2                       //ʱ����
#define  SDA PA1                      //������
#define  UVLED PA4					// UV��
#define  PD		PA5

#define		CH455_SDA_D_OUT		{TRISA1 = 0 ;}				// ����SDAΪ�������,����˫��I/O���л�Ϊ���
#define		CH455_SDA_D_IN		{TRISA1 = 1;}				// ����SDAΪ���뷽��,����˫��I/O���л�Ϊ����

void delay_ms(unsigned int time) ;
void delay_50us(unsigned int us50) ;

/************ START�ź�*******************************/
void TM1650_START()
{
	CH455_SDA_D_OUT
	SCL=1;
	SDA=1;
	delay_50us(1);
	SDA=0;
	delay_50us(1);
	SCL=0;
	// CH455_SDA_D_IN ;
}

/******************** STOP�ź�************************/
void TM1650_STOP()
{
	CH455_SDA_D_OUT
	SDA=0;
	delay_50us(1);
	SCL=1;
	delay_50us(1);
	SDA=1;
	delay_50us(1);
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
			delay_50us(1);
			SCL=1;
			delay_50us(1);
			SCL=0;	 
		}
		else
		{
			SDA=0;
			delay_50us(1);
			SCL=1;
			delay_50us(1);
			SCL=0;
		}	
			dat<<=1;	 
		}
		CH455_SDA_D_IN ;
		// SDA=1;			//ACK�ź�
		delay_50us(1);
		SCL=1;
		delay_50us(1);
		SCL=0;
		delay_50us(1);
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
		delay_50us(1);
		dat<<=1;
		if(SDA)
		 dat++;
		delay_50us(1);
		SCL=0;
		delay_50us(1);
	}
	CH455_SDA_D_OUT ;
	SDA=0;			    //ACK�ź�
	delay_50us(1);
	SCL=1;
	delay_50us(1);
	SCL=0;
	delay_50us(1);
	
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

void start()
{
	
	
	
  OSCCON = 0B01110001;//WDT 32KHZ IRCF=111=16MHZ/2=8MHZ,0.125US/T
                     //Bit0=1,ϵͳʱ��Ϊ�ڲ�����
                     //Bit0=0,ʱ��Դ��FOSC<2��0>����������ѡ��ʱѡ��
 //OSCCON = 0B01110000;//WDT 32KHZ IRCF=111=16MHZ/2=8MHZ,0.125US/T
                     //Bit0=1,ϵͳʱ��Ϊ�ڲ�����
                     //Bit0=0,ʱ��Դ��FOSC<2��0>����������ѡ��ʱѡ��

 INTCON = 0;  //�ݽ�ֹ�����ж�
 
 PORTA = 0B00000000;//LAMP��ʼ״̬��1Ϩ��LED 
 TRISA = 0B00100010;//PA0 IPCLK
                    //PA1 <-> SDA
                    //PA2  -> SCL
                    //PA3	-> UVLED
                    //PA5  <- PD
                    //PA6
                    //PA7

 WPUA = 0X0A;          //��ֹ����PA������ // pa1  SDA
 WPUA1 = 1 ;	// SDA
 WPUA5 = 1 ; 	// PD
 
 OPTION = 0B00001000;//Bit4=1 WDT MODE,
					//PS=000=1:1 WDT RATE
                     //Bit7(RAPU)=0 ENABLED PULL UP PA

	
	
    //  �����ж�
  //  BRGH = 1;		 //�����ʸ���ģʽ��Fosc/(16*(BRR+1))
  //  BRR = 103;       //���ò�����9600
//	TXLEN=0;
	//TXEN=1;
    //TXIE=0;

	// *********T8P2INT ��ʱ���ж�50us********* //
  TMR2 = 0;  //TMR2����ֵ
 //PR2 = 166; //����TMR2����Ƚ�ֵ��ʱ41.666us=(1/500000)*166(PR2)
 PR2 = 200; //����TMR2����Ƚ�ֵ��ʱ0.25us=(1/500000)*1(PR2)
 TMR2IF = 0;//��TMER2�жϱ�־
 TMR2IE = 1;//ʹ��TMER2���ж�
 TMR2ON = 1;//����TMER2 // */
 PEIE=1;    //ʹ�������ж�
 
 GIE = 1;   //ʹ��ȫ

	//read_f=0;
//	read_data=0;
}

unsigned int cntTime1MS ;
unsigned int cntTimeNMS ;
unsigned int cntTime5MS ;
unsigned int cntTime1S	;
unsigned char t1MsFlg ;
unsigned char t5MSFlg ;
unsigned int gLedCnt ;
unsigned int gLedCntBak ;

const unsigned char  DispCode[16]={ //0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x6F,0x77,0x7C,0x39,0x5E,0x79,0x71,0x00}; 
	0b11111001	,	// "0"
	0b00010001	,	// "1"
	0b11100101	,	// "2"
	0b10110101	,	// "3"
	0b00011101	,	// "4"
	0b10111100	,	// "5"
	0b11111100	,	// "6"
	0b10010001	,	// "7"
	0b11111101	,	// "8"
	0b10111101	,	// "9"
	0b11011101	,	// "a"
	0b01111100	,	// "b"
	0b11101000	,	// "c"
	0b01110101	,	// "d"
	0b11101101	,	// "e"
	0b11001100	/*,	// "f"
	
	
	0b00000000		// [�ڰ�] */
	} ;


#define USE_DIG_hud 0x68
#define USE_DIG_ten 0x6A
#define USE_DIG_bit 0x6C


#define SWA	0X04
#define SWB	0X0C
#define SWC	0X14
#define SWD	0X1C
#define SWE	0X24
#define SWF	0X2C
#define SWG	0X34



unsigned char tm1650UpdateFlg ;

unsigned char swBuf1 , swBuf2 ;
unsigned char cntSWDown ;


unsigned int cntTime50uS ;


unsigned int uvledGrB  ,  uvledGrB2 ;
unsigned char pGrB ;

unsigned char gWState ; // 1 - idle ; 2 - idle2 ; 4 - switch
unsigned char cntPDDown ;

// 1-30 2-60 3-120
// logic   113322132
unsigned char longState ;

//**************�жϴ���*******************
void interrupt ISR(void)//PIC_HI-TECHʹ��  100us�ж�һ��
{
	//��ʱ���ж�  50us����һ��
        if(TMR2IF)//��ʱ��2
		{ 
			TMR2IF = 0 ;
			Read_Code_Success=1;
			if(cntTime1MS<20) {
				cntTime1MS++ ;
			}
			else {
				cntTime1MS = 0 ;
				t1MsFlg = 1 ;
				if(cntTimeNMS>0) {
					cntTimeNMS-- ;
				}
				
				if(cntTime5MS<5) {
					cntTime5MS++ ;
				}
				else {
					cntTime5MS = 0 ;
					t5MSFlg = 1 ;
					if(uvledGrB2<uvledGrB) {
						uvledGrB2 ++ ;
					}
				}
				
				
				if(cntTime1S<1000) {
					cntTime1S++ ;
				}
				else {
					cntTime1S = 0 ;
					if(gLedCnt>120) {
						
					}
					else if(gLedCnt>0) {
						gLedCnt-- ;
						tm1650UpdateFlg = 1 ;
						if(gLedCnt==0) {
							gWState = 0x02 ;
							uvledGrB = 0 ;
							longState = 0 ;
						}
					}
				}
			}

			if(cntTime50uS>0) {
				cntTime50uS--;
			}

			if(pGrB<16) {
				pGrB++ ;
			}
			else {
				pGrB = 0 ;
			}
			if(uvledGrB==0) {
				uvledGrB2 = 0 ;
			}

			if(pGrB<uvledGrB2) {
				UVLED = 1 ;
			}
			else {
				UVLED = 0 ;
			}

/* 			if(pGrB<16) {
				pGrB++ ;
			}
			else {
				pGrB = 0 ;
			}
			if(uvledGrB & (1<<pGrB)) {
				UVLED = 1 ;
			}
			else {
				UVLED = 0 ;
			} */

		}

}



void delay_ms(unsigned int time) {
	cntTimeNMS = time ;
	while(cntTimeNMS>0) ;
	
}
void delay_50us(unsigned int us50) {
	cntTime50uS = us50 ;
	while(cntTime50uS>0) ;
}

void main() 
{
	unsigned char bai,shi,gew ;
	start();        
	if(1) {
		UVLED = 0 ;
		tm1650UpdateFlg = 1 ;
		cntTime5MS = 0 ;
		cntSWDown = 0 ;
		gLedCnt = 0 ;
		cntTime1S = 0 ;
		gWState = 0x01 ;
		cntPDDown = 10 ;
		gLedCntBak = 60 ;
		longState = 0 ;
	}
	delay_ms(50) ;
	
	TM1650_SystemCmd(0x20,0x00,0x00,0x01);    //2������+8��ģʽ+��������ģʽ+����ʾ
	delay_ms(200) ;
	
	delay_ms(50) ;
	while(1){
		// ���������
		if(tm1650UpdateFlg) {
			tm1650UpdateFlg = 0 ;
			bai = gLedCnt/100 ;
			shi = gLedCnt/10%10 ;
			gew = gLedCnt%10 ;
			
			TM1650_send(USE_DIG_bit,DispCode[gew]) ;
			if(gLedCnt>0) {
				if(gLedCnt>99) {
					TM1650_send(USE_DIG_hud , DispCode[bai]);
					TM1650_send(USE_DIG_ten , DispCode[shi]) ;
				}
				else {
					TM1650_send(USE_DIG_hud , 0x00) ;
					if(gLedCnt>9) {
						TM1650_send(USE_DIG_ten , DispCode[shi]) ;
					}
					else {
						TM1650_send(USE_DIG_ten , 0x00) ;
					}
				}
			}
			else {
				TM1650_send(USE_DIG_hud , DispCode[bai]);
				TM1650_send(USE_DIG_ten , DispCode[shi]) ;
			}
			TM1650_send(USE_DIG_bit , DispCode[gew]);
			
		}
		
		// 5MS��ʱ����  ���� & �����Ӧ
		if(t5MSFlg) { // 5MS ��ȡһ�ΰ���ֵ
		
			if(1) {// ��������
				swBuf1 = TM1650_read() ;	
				if(0X40 & swBuf1) {
					
				}
				else if(0X40 & swBuf2) { //�Ƿ�δ����
					if(swBuf2 == 0x47) {
						cntTime1S = 0 ;
						cntTime1MS = 0 ;
						tm1650UpdateFlg = 1 ;
						if(gLedCnt>0) {
							uvledGrB = 0 ;
							gLedCnt = 0 ;
							gWState = 2 ;
						}
						else {
							uvledGrB = 8 ;
							gLedCnt = 120 ;
							gLedCntBak = 120 ;
							gWState = 4 ;
						}
						
						
						// �����
						if(0==longState) {
							longState = 1 ;
						}
						else if(1==longState) {
							longState = 2 ;
						}
						else if(6==longState) {
							longState = 7 ;
						}
						else {
							longState = 0 ;
						}
						
						
						
					}
					else if(swBuf2 == 0x5F) {
						cntTime1S = 0 ;
						cntTime1MS = 0 ;
						tm1650UpdateFlg = 1 ;
						if(gLedCnt>0) {
							uvledGrB = 0 ;
							gLedCnt = 0 ;
							gWState = 2 ;	
						}
						else {
							uvledGrB = 16 ;
							gLedCnt = 60 ;
							gLedCntBak = 60 ;	
							gWState = 4 ;						
						}
						
						
						// �����
						if(4==longState) {
							longState = 5 ;
						}
						else if(5==longState) {
							longState = 6 ;
						}
						else if(8==longState) {
							gLedCnt = 888 ;
							longState = 0 ;
						}
						else {
							longState = 0 ;
						}
						
						
					}					
					else if(swBuf2 == 0x77) {
						cntTime1S = 0 ;
						cntTime1MS = 0 ;
						tm1650UpdateFlg = 1 ;
						if(gLedCnt>0) {
							uvledGrB = 0 ;
							gLedCnt = 0 ;
							gWState = 2 ;	
						}
						else {
							uvledGrB = 16 ;
							gLedCnt = 30 ;
							gLedCntBak = 30 ;	
							gWState = 4 ;							
						}
						
						// �����
						if(2==longState) {
							longState = 3 ;
						}
						else if(3==longState) {
							longState = 4 ;
						}
						else if(7==longState) {
							longState = 8 ;
						}
						else {
							longState = 0 ;
						}
						
						
					}
				}
				swBuf2 = swBuf1 ;
			}
			
			if(1) {// �����߸�Ӧ
				if(0x03 & gWState) {
					if(1==PD) {
						if(cntPDDown<20) {
							cntPDDown++ ;
							if(20==cntPDDown && gWState==0x01) {
								cntTime1S = 0 ;
								cntTime1MS = 0 ;
								gLedCnt = gLedCntBak ;
								uvledGrB = 16 ;
								tm1650UpdateFlg = 1 ;
							}
						}
					}
					else {
						if(cntPDDown>0) {
							cntPDDown-- ;
							if(0==cntPDDown) {
								gWState = 1 ;
								cntTime1S = 0 ;
								cntTime1MS = 0 ;
								gLedCnt = 0 ;
								uvledGrB = 0 ;
								tm1650UpdateFlg = 1 ;
							}
						}
					}
				}
			}
			
			
			t5MSFlg = 0 ;
		}
	
	}
		
}




