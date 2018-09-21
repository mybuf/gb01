

#include "CM8M02X.h"


void delay(unsigned int n) ;
void TM1650_START() ;
void TM1650_STOP() ;
void write_8bit( unsigned char dat) ;
unsigned char read_8bit() ;
void TM1650_send(unsigned char saddr,unsigned char sdate) ;
void TM1650_SystemCmd(unsigned char light,unsigned char segMod, unsigned char WorkMod, unsigned char Onoff) ;
unsigned char TM1650_read() ;

