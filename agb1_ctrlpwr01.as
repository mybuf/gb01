opt subtitle "HI-TECH Software Omniscient Code Generator (PRO mode) build 10920"

opt pagewidth 120

	opt pm

	processor	16F684
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
	FNCALL	_main,_start
	FNCALL	_main,_delay_ms
	FNCALL	_main,_TM1650_SystemCmd
	FNCALL	_main,___lwdiv
	FNCALL	_main,___lwmod
	FNCALL	_main,_TM1650_send
	FNCALL	_main,_TM1650_read
	FNCALL	_TM1650_read,_TM1650_START
	FNCALL	_TM1650_read,_write_8bit
	FNCALL	_TM1650_read,_read_8bit
	FNCALL	_TM1650_read,_TM1650_STOP
	FNCALL	_TM1650_SystemCmd,_TM1650_START
	FNCALL	_TM1650_SystemCmd,_write_8bit
	FNCALL	_TM1650_SystemCmd,_TM1650_STOP
	FNCALL	_TM1650_send,_TM1650_START
	FNCALL	_TM1650_send,_write_8bit
	FNCALL	_TM1650_send,_TM1650_STOP
	FNCALL	_read_8bit,_delay_50us
	FNCALL	_write_8bit,_delay_50us
	FNCALL	_TM1650_STOP,_delay_50us
	FNCALL	_TM1650_START,_delay_50us
	FNROOT	_main
	FNCALL	intlevel1,_ISR
	global	intlevel1
	FNROOT	intlevel1
	global	_DispCode
psect	strings,class=STRING,delta=2
global __pstrings
__pstrings:
;	global	stringdir,stringtab,__stringbase
stringtab:
;	String table - string pointers are 1 byte each
stringcode:stringdir:
movlw high(stringdir)
movwf pclath
movf fsr,w
incf fsr
	addwf pc
__stringbase:
	retlw	0
psect	strings
	file	"app.c"
	line	234
_DispCode:
	retlw	0F9h
	retlw	011h
	retlw	0E5h
	retlw	0B5h
	retlw	01Dh
	retlw	0BCh
	retlw	0FCh
	retlw	091h
	retlw	0FDh
	retlw	0BDh
	retlw	0DDh
	retlw	07Ch
	retlw	0E8h
	retlw	075h
	retlw	0EDh
	retlw	0CCh
	global	_DispCode
	global	_cntTime1MS
	global	_cntTime1S
	global	_cntTime50uS
	global	_cntTime5MS
	global	_gLedCnt
	global	_uvledGrB
	global	_uvledGrB2
	global	_longState
	global	_pGrB
	global	_swBuf1
	global	_swBuf2
	global	_t5MSFlg
	global	_FSR
_FSR	set	4
	DABS	1,4,1	;_FSR

	global	_INDF
_INDF	set	0
	DABS	1,0,1	;_INDF

	global	_PCL
_PCL	set	2
	DABS	1,2,1	;_PCL

	global	_PCLATH
_PCLATH	set	10
	DABS	1,10,1	;_PCLATH

	global	_PORTA
_PORTA	set	5
	DABS	1,5,1	;_PORTA

	global	_PORTC
_PORTC	set	7
	DABS	1,7,1	;_PORTC

	global	_STATUS
_STATUS	set	3
	DABS	1,3,1	;_STATUS

	global	_TMR0
_TMR0	set	1
	DABS	1,1,1	;_TMR0

	global	_CCPR1
_CCPR1	set	19
	DABS	1,19,2	;_CCPR1

	global	_TMR1
_TMR1	set	14
	DABS	1,14,2	;_TMR1

	global	_INTCONbits
_INTCONbits	set	11
	DABS	1,11,1	;_INTCONbits

	global	_MSCKCONbits
_MSCKCONbits	set	27
	DABS	1,27,1	;_MSCKCONbits

	global	_PCLATHbits
_PCLATHbits	set	10
	DABS	1,10,1	;_PCLATHbits

	global	_PIR1bits
_PIR1bits	set	12
	DABS	1,12,1	;_PIR1bits

	global	_PORTAbits
_PORTAbits	set	5
	DABS	1,5,1	;_PORTAbits

	global	_STATUSbits
_STATUSbits	set	3
	DABS	1,3,1	;_STATUSbits

	global	_T2CONbits
_T2CONbits	set	18
	DABS	1,18,1	;_T2CONbits

	global	_WDTCONbits
_WDTCONbits	set	24
	DABS	1,24,1	;_WDTCONbits

	global	_ADFM
_ADFM	set	255
	DABS	1,31,1	;_ADFM

	global	_ADIF
_ADIF	set	102
	DABS	1,12,1	;_ADIF

	global	_ADON
_ADON	set	248
	DABS	1,31,1	;_ADON

	global	_C1IF
_C1IF	set	99
	DABS	1,12,1	;_C1IF

	global	_C1INV
_C1INV	set	204
	DABS	1,25,1	;_C1INV

	global	_C1OUT
_C1OUT	set	206
	DABS	1,25,1	;_C1OUT

	global	_C2IF
_C2IF	set	100
	DABS	1,12,1	;_C2IF

	global	_C2INV
_C2INV	set	205
	DABS	1,25,1	;_C2INV

	global	_C2OUT
_C2OUT	set	207
	DABS	1,25,1	;_C2OUT

	global	_C2SYNC
_C2SYNC	set	208
	DABS	1,26,1	;_C2SYNC

	global	_CARRY
_CARRY	set	24
	DABS	1,3,1	;_CARRY

	global	_CCP1IF
_CCP1IF	set	101
	DABS	1,12,1	;_CCP1IF

	global	_CCP1M0
_CCP1M0	set	168
	DABS	1,21,1	;_CCP1M0

	global	_CCP1M1
_CCP1M1	set	169
	DABS	1,21,1	;_CCP1M1

	global	_CCP1M2
_CCP1M2	set	170
	DABS	1,21,1	;_CCP1M2

	global	_CCP1M3
_CCP1M3	set	171
	DABS	1,21,1	;_CCP1M3

	global	_CHS0
_CHS0	set	250
	DABS	1,31,1	;_CHS0

	global	_CHS1
_CHS1	set	251
	DABS	1,31,1	;_CHS1

	global	_CHS2
_CHS2	set	252
	DABS	1,31,1	;_CHS2

	global	_CIS
_CIS	set	203
	DABS	1,25,1	;_CIS

	global	_CKCNT1
_CKCNT1	set	217
	DABS	1,27,1	;_CKCNT1

	global	_CKMAVG
_CKMAVG	set	218
	DABS	1,27,1	;_CKMAVG

	global	_CKMEAF
_CKMEAF	set	102
	DABS	1,12,1	;_CKMEAF

	global	_CM0
_CM0	set	200
	DABS	1,25,1	;_CM0

	global	_CM1
_CM1	set	201
	DABS	1,25,1	;_CM1

	global	_CM2
_CM2	set	202
	DABS	1,25,1	;_CM2

	global	_DC
_DC	set	25
	DABS	1,3,1	;_DC

	global	_DC1B0
_DC1B0	set	172
	DABS	1,21,1	;_DC1B0

	global	_DC1B1
_DC1B1	set	173
	DABS	1,21,1	;_DC1B1

	global	_ECCPAS0
_ECCPAS0	set	188
	DABS	1,23,1	;_ECCPAS0

	global	_ECCPAS1
_ECCPAS1	set	189
	DABS	1,23,1	;_ECCPAS1

	global	_ECCPAS2
_ECCPAS2	set	190
	DABS	1,23,1	;_ECCPAS2

	global	_ECCPASE
_ECCPASE	set	191
	DABS	1,23,1	;_ECCPASE

	global	_ECCPIF
_ECCPIF	set	101
	DABS	1,12,1	;_ECCPIF

	global	_EEIF
_EEIF	set	103
	DABS	1,12,1	;_EEIF

	global	_GIE
_GIE	set	95
	DABS	1,11,1	;_GIE

	global	_GO
_GO	set	249
	DABS	1,31,1	;_GO

	global	_GO_DONE
_GO_DONE	set	249
	DABS	1,31,1	;_GO_DONE

	global	_GO_nDONE
_GO_nDONE	set	249
	DABS	1,31,1	;_GO_nDONE

	global	_INTE
_INTE	set	92
	DABS	1,11,1	;_INTE

	global	_INTF
_INTF	set	89
	DABS	1,11,1	;_INTF

	global	_IRP
_IRP	set	31
	DABS	1,3,1	;_IRP

	global	_OSFIF
_OSFIF	set	98
	DABS	1,12,1	;_OSFIF

	global	_P1M0
_P1M0	set	174
	DABS	1,21,1	;_P1M0

	global	_P1M1
_P1M1	set	175
	DABS	1,21,1	;_P1M1

	global	_PA0
_PA0	set	40
	DABS	1,5,1	;_PA0

	global	_PA1
_PA1	set	41
	DABS	1,5,1	;_PA1

	global	_PA2
_PA2	set	42
	DABS	1,5,1	;_PA2

	global	_PA3
_PA3	set	43
	DABS	1,5,1	;_PA3

	global	_PA4
_PA4	set	44
	DABS	1,5,1	;_PA4

	global	_PA5
_PA5	set	45
	DABS	1,5,1	;_PA5

	global	_PAIE
_PAIE	set	91
	DABS	1,11,1	;_PAIE

	global	_PAIF
_PAIF	set	88
	DABS	1,11,1	;_PAIF

	global	_PDC0
_PDC0	set	176
	DABS	1,22,1	;_PDC0

	global	_PDC1
_PDC1	set	177
	DABS	1,22,1	;_PDC1

	global	_PDC2
_PDC2	set	178
	DABS	1,22,1	;_PDC2

	global	_PDC3
_PDC3	set	179
	DABS	1,22,1	;_PDC3

	global	_PDC4
_PDC4	set	180
	DABS	1,22,1	;_PDC4

	global	_PDC5
_PDC5	set	181
	DABS	1,22,1	;_PDC5

	global	_PDC6
_PDC6	set	182
	DABS	1,22,1	;_PDC6

	global	_PEIE
_PEIE	set	94
	DABS	1,11,1	;_PEIE

	global	_PRSEN
_PRSEN	set	183
	DABS	1,22,1	;_PRSEN

	global	_PSSAC0
_PSSAC0	set	186
	DABS	1,23,1	;_PSSAC0

	global	_PSSAC1
_PSSAC1	set	187
	DABS	1,23,1	;_PSSAC1

	global	_PSSBD0
_PSSBD0	set	184
	DABS	1,23,1	;_PSSBD0

	global	_PSSBD1
_PSSBD1	set	185
	DABS	1,23,1	;_PSSBD1

	global	_RA0
_RA0	set	40
	DABS	1,5,1	;_RA0

	global	_RA1
_RA1	set	41
	DABS	1,5,1	;_RA1

	global	_RA2
_RA2	set	42
	DABS	1,5,1	;_RA2

	global	_RA3
_RA3	set	43
	DABS	1,5,1	;_RA3

	global	_RA4
_RA4	set	44
	DABS	1,5,1	;_RA4

	global	_RA5
_RA5	set	45
	DABS	1,5,1	;_RA5

	global	_RAIE
_RAIE	set	91
	DABS	1,11,1	;_RAIE

	global	_RAIF
_RAIF	set	88
	DABS	1,11,1	;_RAIF

	global	_RC0
_RC0	set	56
	DABS	1,7,1	;_RC0

	global	_RC1
_RC1	set	57
	DABS	1,7,1	;_RC1

	global	_RC2
_RC2	set	58
	DABS	1,7,1	;_RC2

	global	_RC3
_RC3	set	59
	DABS	1,7,1	;_RC3

	global	_RC4
_RC4	set	60
	DABS	1,7,1	;_RC4

	global	_RC5
_RC5	set	61
	DABS	1,7,1	;_RC5

	global	_RP
_RP	set	29
	DABS	1,3,1	;_RP

	global	_RP0
_RP0	set	29
	DABS	1,3,1	;_RP0

	global	_RP1
_RP1	set	30
	DABS	1,3,1	;_RP1

	global	_SLVREN
_SLVREN	set	220
	DABS	1,27,1	;_SLVREN

	global	_SWDTEN
_SWDTEN	set	192
	DABS	1,24,1	;_SWDTEN

	global	_T0IE
_T0IE	set	93
	DABS	1,11,1	;_T0IE

	global	_T0IF
_T0IF	set	90
	DABS	1,11,1	;_T0IF

	global	_T1CKPS0
_T1CKPS0	set	132
	DABS	1,16,1	;_T1CKPS0

	global	_T1CKPS1
_T1CKPS1	set	133
	DABS	1,16,1	;_T1CKPS1

	global	_T1GINV
_T1GINV	set	135
	DABS	1,16,1	;_T1GINV

	global	_T1GSS
_T1GSS	set	209
	DABS	1,26,1	;_T1GSS

	global	_T1IF
_T1IF	set	96
	DABS	1,12,1	;_T1IF

	global	_T1OSCEN
_T1OSCEN	set	131
	DABS	1,16,1	;_T1OSCEN

	global	_T2CKPS0
_T2CKPS0	set	144
	DABS	1,18,1	;_T2CKPS0

	global	_T2CKPS1
_T2CKPS1	set	145
	DABS	1,18,1	;_T2CKPS1

	global	_T2IF
_T2IF	set	97
	DABS	1,12,1	;_T2IF

	global	_TMR0IE
_TMR0IE	set	93
	DABS	1,11,1	;_TMR0IE

	global	_TMR0IF
_TMR0IF	set	90
	DABS	1,11,1	;_TMR0IF

	global	_TMR1CS
_TMR1CS	set	129
	DABS	1,16,1	;_TMR1CS

	global	_TMR1GE
_TMR1GE	set	134
	DABS	1,16,1	;_TMR1GE

	global	_TMR1IF
_TMR1IF	set	96
	DABS	1,12,1	;_TMR1IF

	global	_TMR1ON
_TMR1ON	set	128
	DABS	1,16,1	;_TMR1ON

	global	_TMR2IF
_TMR2IF	set	97
	DABS	1,12,1	;_TMR2IF

	global	_TMR2ON
_TMR2ON	set	146
	DABS	1,18,1	;_TMR2ON

	global	_TOUTPS0
_TOUTPS0	set	147
	DABS	1,18,1	;_TOUTPS0

	global	_TOUTPS1
_TOUTPS1	set	148
	DABS	1,18,1	;_TOUTPS1

	global	_TOUTPS2
_TOUTPS2	set	149
	DABS	1,18,1	;_TOUTPS2

	global	_TOUTPS3
_TOUTPS3	set	150
	DABS	1,18,1	;_TOUTPS3

	global	_VCFG
_VCFG	set	254
	DABS	1,31,1	;_VCFG

	global	_WDTPS0
_WDTPS0	set	193
	DABS	1,24,1	;_WDTPS0

	global	_WDTPS1
_WDTPS1	set	194
	DABS	1,24,1	;_WDTPS1

	global	_WDTPS2
_WDTPS2	set	195
	DABS	1,24,1	;_WDTPS2

	global	_WDTPS3
_WDTPS3	set	196
	DABS	1,24,1	;_WDTPS3

	global	_ZERO
_ZERO	set	26
	DABS	1,3,1	;_ZERO

	global	_nDONE
_nDONE	set	249
	DABS	1,31,1	;_nDONE

	global	_nPD
_nPD	set	27
	DABS	1,3,1	;_nPD

	global	_nT1SYNC
_nT1SYNC	set	130
	DABS	1,16,1	;_nT1SYNC

	global	_nTO
_nTO	set	28
	DABS	1,3,1	;_nTO

	global	_cntTimeNMS
psect	nvCOMMON,class=COMMON,space=1
global __pnvCOMMON
__pnvCOMMON:
_cntTimeNMS:
       ds      2

	global	_gLedCntBak
_gLedCntBak:
       ds      2

	global	_cntPDDown
_cntPDDown:
       ds      1

	global	_gWState
_gWState:
       ds      1

	global	_tm1650UpdateFlg
_tm1650UpdateFlg:
       ds      1

	global	_OPTION
_OPTION	set	129
	DABS	1,129,1	;_OPTION

	global	_EECON1bits
_EECON1bits	set	156
	DABS	1,156,1	;_EECON1bits

	global	_EECON2bits
_EECON2bits	set	157
	DABS	1,157,1	;_EECON2bits

	global	_EEDATA
_EEDATA	set	154
	DABS	1,154,1	;_EEDATA

	global	_IOC
_IOC	set	150
	DABS	1,150,1	;_IOC

	global	_IOCAbits
_IOCAbits	set	150
	DABS	1,150,1	;_IOCAbits

	global	_OPTION_REG
_OPTION_REG	set	129
	DABS	1,129,1	;_OPTION_REG

	global	_OPTIONbits
_OPTIONbits	set	129
	DABS	1,129,1	;_OPTIONbits

	global	_OSCCONbits
_OSCCONbits	set	143
	DABS	1,143,1	;_OSCCONbits

	global	_PCONbits
_PCONbits	set	142
	DABS	1,142,1	;_PCONbits

	global	_PIE1bits
_PIE1bits	set	140
	DABS	1,140,1	;_PIE1bits

	global	_TRISAbits
_TRISAbits	set	133
	DABS	1,133,1	;_TRISAbits

	global	_WPU
_WPU	set	149
	DABS	1,149,1	;_WPU

	global	_WPUAbits
_WPUAbits	set	149
	DABS	1,149,1	;_WPUAbits

	global	_ADCS0
_ADCS0	set	1276
	DABS	1,159,1	;_ADCS0

	global	_ADCS1
_ADCS1	set	1277
	DABS	1,159,1	;_ADCS1

	global	_ADCS2
_ADCS2	set	1278
	DABS	1,159,1	;_ADCS2

	global	_ADIE
_ADIE	set	1126
	DABS	1,140,1	;_ADIE

	global	_ANS0
_ANS0	set	1160
	DABS	1,145,1	;_ANS0

	global	_ANS1
_ANS1	set	1161
	DABS	1,145,1	;_ANS1

	global	_ANS2
_ANS2	set	1162
	DABS	1,145,1	;_ANS2

	global	_ANS3
_ANS3	set	1163
	DABS	1,145,1	;_ANS3

	global	_ANS4
_ANS4	set	1164
	DABS	1,145,1	;_ANS4

	global	_ANS5
_ANS5	set	1165
	DABS	1,145,1	;_ANS5

	global	_ANS6
_ANS6	set	1166
	DABS	1,145,1	;_ANS6

	global	_ANS7
_ANS7	set	1167
	DABS	1,145,1	;_ANS7

	global	_C1IE
_C1IE	set	1123
	DABS	1,140,1	;_C1IE

	global	_C2IE
_C2IE	set	1124
	DABS	1,140,1	;_C2IE

	global	_CCP1IE
_CCP1IE	set	1125
	DABS	1,140,1	;_CCP1IE

	global	_CKMEAIE
_CKMEAIE	set	1126
	DABS	1,140,1	;_CKMEAIE

	global	_ECCPIE
_ECCPIE	set	1125
	DABS	1,140,1	;_ECCPIE

	global	_EEIE
_EEIE	set	1127
	DABS	1,140,1	;_EEIE

	global	_HFIOFR
_HFIOFR	set	1146
	DABS	1,143,1	;_HFIOFR

	global	_HTS
_HTS	set	1146
	DABS	1,143,1	;_HTS

	global	_INTEDG
_INTEDG	set	1038
	DABS	1,129,1	;_INTEDG

	global	_IOC0
_IOC0	set	1200
	DABS	1,150,1	;_IOC0

	global	_IOC1
_IOC1	set	1201
	DABS	1,150,1	;_IOC1

	global	_IOC2
_IOC2	set	1202
	DABS	1,150,1	;_IOC2

	global	_IOC3
_IOC3	set	1203
	DABS	1,150,1	;_IOC3

	global	_IOC4
_IOC4	set	1204
	DABS	1,150,1	;_IOC4

	global	_IOC5
_IOC5	set	1205
	DABS	1,150,1	;_IOC5

	global	_IOCA0
_IOCA0	set	1200
	DABS	1,150,1	;_IOCA0

	global	_IOCA1
_IOCA1	set	1201
	DABS	1,150,1	;_IOCA1

	global	_IOCA2
_IOCA2	set	1202
	DABS	1,150,1	;_IOCA2

	global	_IOCA3
_IOCA3	set	1203
	DABS	1,150,1	;_IOCA3

	global	_IOCA4
_IOCA4	set	1204
	DABS	1,150,1	;_IOCA4

	global	_IOCA5
_IOCA5	set	1205
	DABS	1,150,1	;_IOCA5

	global	_IRCF0
_IRCF0	set	1148
	DABS	1,143,1	;_IRCF0

	global	_IRCF1
_IRCF1	set	1149
	DABS	1,143,1	;_IRCF1

	global	_IRCF2
_IRCF2	set	1150
	DABS	1,143,1	;_IRCF2

	global	_LFIOFR
_LFIOFR	set	1145
	DABS	1,143,1	;_LFIOFR

	global	_LFOMOD
_LFOMOD	set	1151
	DABS	1,143,1	;_LFOMOD

	global	_LTS
_LTS	set	1145
	DABS	1,143,1	;_LTS

	global	_OSFIE
_OSFIE	set	1122
	DABS	1,140,1	;_OSFIE

	global	_OSTS
_OSTS	set	1147
	DABS	1,143,1	;_OSTS

	global	_PS0
_PS0	set	1032
	DABS	1,129,1	;_PS0

	global	_PS1
_PS1	set	1033
	DABS	1,129,1	;_PS1

	global	_PS2
_PS2	set	1034
	DABS	1,129,1	;_PS2

	global	_PSA
_PSA	set	1035
	DABS	1,129,1	;_PSA

	global	_RD
_RD	set	1248
	DABS	1,156,1	;_RD

	global	_SBODEN
_SBODEN	set	1140
	DABS	1,142,1	;_SBODEN

	global	_SBOREN
_SBOREN	set	1140
	DABS	1,142,1	;_SBOREN

	global	_SCS
_SCS	set	1144
	DABS	1,143,1	;_SCS

	global	_T0CS
_T0CS	set	1037
	DABS	1,129,1	;_T0CS

	global	_T0SE
_T0SE	set	1036
	DABS	1,129,1	;_T0SE

	global	_T1IE
_T1IE	set	1120
	DABS	1,140,1	;_T1IE

	global	_T2IE
_T2IE	set	1121
	DABS	1,140,1	;_T2IE

	global	_TMR1IE
_TMR1IE	set	1120
	DABS	1,140,1	;_TMR1IE

	global	_TMR2IE
_TMR2IE	set	1121
	DABS	1,140,1	;_TMR2IE

	global	_TRISA0
_TRISA0	set	1064
	DABS	1,133,1	;_TRISA0

	global	_TRISA1
_TRISA1	set	1065
	DABS	1,133,1	;_TRISA1

	global	_TRISA2
_TRISA2	set	1066
	DABS	1,133,1	;_TRISA2

	global	_TRISA3
_TRISA3	set	1067
	DABS	1,133,1	;_TRISA3

	global	_TRISA4
_TRISA4	set	1068
	DABS	1,133,1	;_TRISA4

	global	_TRISA5
_TRISA5	set	1069
	DABS	1,133,1	;_TRISA5

	global	_TRISC0
_TRISC0	set	1080
	DABS	1,135,1	;_TRISC0

	global	_TRISC1
_TRISC1	set	1081
	DABS	1,135,1	;_TRISC1

	global	_TRISC2
_TRISC2	set	1082
	DABS	1,135,1	;_TRISC2

	global	_TRISC3
_TRISC3	set	1083
	DABS	1,135,1	;_TRISC3

	global	_TRISC4
_TRISC4	set	1084
	DABS	1,135,1	;_TRISC4

	global	_TRISC5
_TRISC5	set	1085
	DABS	1,135,1	;_TRISC5

	global	_TUN0
_TUN0	set	1152
	DABS	1,144,1	;_TUN0

	global	_TUN1
_TUN1	set	1153
	DABS	1,144,1	;_TUN1

	global	_TUN2
_TUN2	set	1154
	DABS	1,144,1	;_TUN2

	global	_TUN3
_TUN3	set	1155
	DABS	1,144,1	;_TUN3

	global	_TUN4
_TUN4	set	1156
	DABS	1,144,1	;_TUN4

	global	_ULPWUE
_ULPWUE	set	1141
	DABS	1,142,1	;_ULPWUE

	global	_VR0
_VR0	set	1224
	DABS	1,153,1	;_VR0

	global	_VR1
_VR1	set	1225
	DABS	1,153,1	;_VR1

	global	_VR2
_VR2	set	1226
	DABS	1,153,1	;_VR2

	global	_VR3
_VR3	set	1227
	DABS	1,153,1	;_VR3

	global	_VREN
_VREN	set	1231
	DABS	1,153,1	;_VREN

	global	_VRR
_VRR	set	1229
	DABS	1,153,1	;_VRR

	global	_WPU0
_WPU0	set	1192
	DABS	1,149,1	;_WPU0

	global	_WPU1
_WPU1	set	1193
	DABS	1,149,1	;_WPU1

	global	_WPU2
_WPU2	set	1194
	DABS	1,149,1	;_WPU2

	global	_WPU4
_WPU4	set	1196
	DABS	1,149,1	;_WPU4

	global	_WPU5
_WPU5	set	1197
	DABS	1,149,1	;_WPU5

	global	_WPUA0
_WPUA0	set	1192
	DABS	1,149,1	;_WPUA0

	global	_WPUA1
_WPUA1	set	1193
	DABS	1,149,1	;_WPUA1

	global	_WPUA2
_WPUA2	set	1194
	DABS	1,149,1	;_WPUA2

	global	_WPUA4
_WPUA4	set	1196
	DABS	1,149,1	;_WPUA4

	global	_WPUA5
_WPUA5	set	1197
	DABS	1,149,1	;_WPUA5

	global	_WR
_WR	set	1256
	DABS	1,157,1	;_WR

	global	_WREN
_WREN	set	1250
	DABS	1,156,1	;_WREN

	global	_WREN1
_WREN1	set	1250
	DABS	1,156,1	;_WREN1

	global	_WREN2
_WREN2	set	1252
	DABS	1,156,1	;_WREN2

	global	_WREN3
_WREN3	set	1253
	DABS	1,156,1	;_WREN3

	global	_WRERR
_WRERR	set	1251
	DABS	1,156,1	;_WRERR

	global	_nBOD
_nBOD	set	1136
	DABS	1,142,1	;_nBOD

	global	_nBOR
_nBOR	set	1136
	DABS	1,142,1	;_nBOR

	global	_nPOR
_nPOR	set	1137
	DABS	1,142,1	;_nPOR

	global	_nRABPU
_nRABPU	set	1039
	DABS	1,129,1	;_nRABPU

	global	_nRAPU
_nRAPU	set	1039
	DABS	1,129,1	;_nRAPU

	global	_INTCON
_INTCON	set	11
	DABS	1,11,1	;_INTCON

	global	_PIR1
_PIR1	set	12
	DABS	1,12,1	;_PIR1

	global	_TMR1L
_TMR1L	set	14
	DABS	1,14,1	;_TMR1L

	global	_TMR2
_TMR2	set	17
	DABS	1,17,1	;_TMR2

	global	_CCP1CON
_CCP1CON	set	21
	DABS	1,21,1	;_CCP1CON

	global	_CCPR1H
_CCPR1H	set	20
	DABS	1,20,1	;_CCPR1H

	global	_CCPR1L
_CCPR1L	set	19
	DABS	1,19,1	;_CCPR1L

	global	_ECCPAS
_ECCPAS	set	23
	DABS	1,23,1	;_ECCPAS

	global	_PWM1CON
_PWM1CON	set	22
	DABS	1,22,1	;_PWM1CON

	global	_T2CON
_T2CON	set	18
	DABS	1,18,1	;_T2CON

	global	_WDTCON
_WDTCON	set	24
	DABS	1,24,1	;_WDTCON

	global	_CMCON0
_CMCON0	set	25
	DABS	1,25,1	;_CMCON0

	global	_CMCON1
_CMCON1	set	26
	DABS	1,26,1	;_CMCON1

	global	_MSCKCON
_MSCKCON	set	27
	DABS	1,27,1	;_MSCKCON

	global	_ADCON0
_ADCON0	set	31
	DABS	1,31,1	;_ADCON0

	global	_ADRESH
_ADRESH	set	30
	DABS	1,30,1	;_ADRESH

	global	_SOSCPRH
_SOSCPRH	set	29
	DABS	1,29,1	;_SOSCPRH

	global	_SOSCPRL
_SOSCPRL	set	28
	DABS	1,28,1	;_SOSCPRL

	global	_TRISA
_TRISA	set	133
	DABS	1,133,1	;_TRISA

	global	_PIE1
_PIE1	set	140
	DABS	1,140,1	;_PIE1

	global	_TRISC
_TRISC	set	135
	DABS	1,135,1	;_TRISC

	global	_PCON
_PCON	set	142
	DABS	1,142,1	;_PCON

	global	_ANSEL
_ANSEL	set	145
	DABS	1,145,1	;_ANSEL

	global	_OSCCON
_OSCCON	set	143
	DABS	1,143,1	;_OSCCON

	global	_OSCTUNE
_OSCTUNE	set	144
	DABS	1,144,1	;_OSCTUNE

	global	_PR2
_PR2	set	146
	DABS	1,146,1	;_PR2

	global	_WPUA
_WPUA	set	149
	DABS	1,149,1	;_WPUA

	global	_EEDAT
_EEDAT	set	154
	DABS	1,154,1	;_EEDAT

	global	_IOCA
_IOCA	set	150
	DABS	1,150,1	;_IOCA

	global	_VRCON
_VRCON	set	153
	DABS	1,153,1	;_VRCON

	global	_ADCON1
_ADCON1	set	159
	DABS	1,159,1	;_ADCON1

	global	_ADRESL
_ADRESL	set	158
	DABS	1,158,1	;_ADRESL

	global	_EEADR
_EEADR	set	155
	DABS	1,155,1	;_EEADR

	global	_EECON1
_EECON1	set	156
	DABS	1,156,1	;_EECON1

	global	_EECON2
_EECON2	set	157
	DABS	1,157,1	;_EECON2

	global	_T1CON
_T1CON	set	16
	DABS	1,16,1	;_T1CON

	global	_TMR1H
_TMR1H	set	15
	DABS	1,15,1	;_TMR1H

	file	"agb1_ctrlpwr01.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_cntTime1MS:
       ds      2

_cntTime1S:
       ds      2

_cntTime50uS:
       ds      2

_cntTime5MS:
       ds      2

_gLedCnt:
       ds      2

_uvledGrB:
       ds      2

_uvledGrB2:
       ds      2

_longState:
       ds      1

_pGrB:
       ds      1

_swBuf1:
       ds      1

_swBuf2:
       ds      1

_t5MSFlg:
       ds      1

psect clrtext,class=CODE,delta=2
global clear_ram
;	Called with FSR containing the base address, and
;	W with the last address+1
clear_ram:
	clrwdt			;clear the watchdog before getting into this loop
clrloop:
	clrf	indf		;clear RAM location pointed to by FSR
	incf	fsr,f		;increment pointer
	xorwf	fsr,w		;XOR with final address
	btfsc	status,2	;have we reached the end yet?
	retlw	0		;all done for this memory range, return
	xorwf	fsr,w		;XOR again to restore value
	goto	clrloop		;do the next byte

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	movlw	low(__pbssCOMMON)
	movwf	fsr
	movlw	low((__pbssCOMMON)+013h)
	fcall	clear_ram
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_TM1650_START
?_TM1650_START:	; 0 bytes @ 0x0
	global	?_TM1650_STOP
?_TM1650_STOP:	; 0 bytes @ 0x0
	global	?_write_8bit
?_write_8bit:	; 0 bytes @ 0x0
	global	?_start
?_start:	; 0 bytes @ 0x0
	global	?_ISR
?_ISR:	; 0 bytes @ 0x0
	global	??_ISR
??_ISR:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_read_8bit
?_read_8bit:	; 1 bytes @ 0x0
	global	?_TM1650_read
?_TM1650_read:	; 1 bytes @ 0x0
	ds	4
	global	?_delay_50us
?_delay_50us:	; 0 bytes @ 0x4
	global	??_start
??_start:	; 0 bytes @ 0x4
	global	?_delay_ms
?_delay_ms:	; 0 bytes @ 0x4
	global	?___lwdiv
?___lwdiv:	; 2 bytes @ 0x4
	global	delay_ms@time
delay_ms@time:	; 2 bytes @ 0x4
	global	delay_50us@us50
delay_50us@us50:	; 2 bytes @ 0x4
	global	___lwdiv@divisor
___lwdiv@divisor:	; 2 bytes @ 0x4
	ds	2
	global	??_delay_50us
??_delay_50us:	; 0 bytes @ 0x6
	global	??_TM1650_START
??_TM1650_START:	; 0 bytes @ 0x6
	global	??_TM1650_STOP
??_TM1650_STOP:	; 0 bytes @ 0x6
	global	??_write_8bit
??_write_8bit:	; 0 bytes @ 0x6
	global	??_read_8bit
??_read_8bit:	; 0 bytes @ 0x6
	global	??_delay_ms
??_delay_ms:	; 0 bytes @ 0x6
	global	write_8bit@dat
write_8bit@dat:	; 1 bytes @ 0x6
	global	read_8bit@dat
read_8bit@dat:	; 1 bytes @ 0x6
	global	___lwdiv@dividend
___lwdiv@dividend:	; 2 bytes @ 0x6
	ds	1
	global	write_8bit@i
write_8bit@i:	; 1 bytes @ 0x7
	global	read_8bit@i
read_8bit@i:	; 1 bytes @ 0x7
	ds	1
	global	?_TM1650_send
?_TM1650_send:	; 0 bytes @ 0x8
	global	?_TM1650_SystemCmd
?_TM1650_SystemCmd:	; 0 bytes @ 0x8
	global	??_TM1650_read
??_TM1650_read:	; 0 bytes @ 0x8
	global	??___lwdiv
??___lwdiv:	; 0 bytes @ 0x8
	global	TM1650_send@sdate
TM1650_send@sdate:	; 1 bytes @ 0x8
	global	TM1650_SystemCmd@segMod
TM1650_SystemCmd@segMod:	; 1 bytes @ 0x8
	global	TM1650_read@key
TM1650_read@key:	; 1 bytes @ 0x8
	global	___lwdiv@quotient
___lwdiv@quotient:	; 2 bytes @ 0x8
	ds	1
	global	??_TM1650_send
??_TM1650_send:	; 0 bytes @ 0x9
	global	TM1650_send@saddr
TM1650_send@saddr:	; 1 bytes @ 0x9
	global	TM1650_SystemCmd@WorkMod
TM1650_SystemCmd@WorkMod:	; 1 bytes @ 0x9
	ds	1
	global	TM1650_SystemCmd@Onoff
TM1650_SystemCmd@Onoff:	; 1 bytes @ 0xA
	global	___lwdiv@counter
___lwdiv@counter:	; 1 bytes @ 0xA
	ds	1
	global	??_TM1650_SystemCmd
??_TM1650_SystemCmd:	; 0 bytes @ 0xB
	global	?___lwmod
?___lwmod:	; 2 bytes @ 0xB
	global	TM1650_SystemCmd@light
TM1650_SystemCmd@light:	; 1 bytes @ 0xB
	global	___lwmod@divisor
___lwmod@divisor:	; 2 bytes @ 0xB
	ds	2
	global	___lwmod@dividend
___lwmod@dividend:	; 2 bytes @ 0xD
	ds	2
	global	??___lwmod
??___lwmod:	; 0 bytes @ 0xF
	global	___lwmod@counter
___lwmod@counter:	; 1 bytes @ 0xF
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x10
	global	main@bai
main@bai:	; 1 bytes @ 0x10
	ds	1
	global	main@gew
main@gew:	; 1 bytes @ 0x11
	ds	1
	global	main@shi
main@shi:	; 1 bytes @ 0x12
	ds	1
;;Data sizes: Strings 0, constant 16, data 0, bss 19, persistent 7 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          62     19      45
;; BANK0hll         1      0       0
;; BANK0lh          2      0       0
;; BANK0ll          1      0       0
;; BANK1hhhhhhl     2      0       0
;; BANK1hhhhhl      2      0       0
;; BANK1hhhl        1      0       0
;; BANK1hhlh        4      0       0
;; BANK1hhll        1      0       0
;; BANK1hl          3      0       0
;; BANK1l           1      0       0

;;
;; Pointer list with targets:

;; ?___lwmod	unsigned int  size(1) Largest target is 0
;;
;; ?___lwdiv	unsigned int  size(1) Largest target is 0
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->___lwmod
;;   _TM1650_read->_write_8bit
;;   _TM1650_read->_read_8bit
;;   _TM1650_SystemCmd->_write_8bit
;;   _TM1650_send->_write_8bit
;;   _read_8bit->_delay_50us
;;   _write_8bit->_delay_50us
;;   _TM1650_STOP->_delay_50us
;;   _TM1650_START->_delay_50us
;;   ___lwmod->___lwdiv
;;
;; Critical Paths under _ISR in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0hll
;;
;;   None.
;;
;; Critical Paths under _ISR in BANK0hll
;;
;;   None.
;;
;; Critical Paths under _main in BANK0lh
;;
;;   None.
;;
;; Critical Paths under _ISR in BANK0lh
;;
;;   None.
;;
;; Critical Paths under _main in BANK0ll
;;
;;   None.
;;
;; Critical Paths under _ISR in BANK0ll
;;
;;   None.
;;
;; Critical Paths under _main in BANK1hhhhhhl
;;
;;   None.
;;
;; Critical Paths under _ISR in BANK1hhhhhhl
;;
;;   None.
;;
;; Critical Paths under _main in BANK1hhhhhl
;;
;;   None.
;;
;; Critical Paths under _ISR in BANK1hhhhhl
;;
;;   None.
;;
;; Critical Paths under _main in BANK1hhhl
;;
;;   None.
;;
;; Critical Paths under _ISR in BANK1hhhl
;;
;;   None.
;;
;; Critical Paths under _main in BANK1hhlh
;;
;;   None.
;;
;; Critical Paths under _ISR in BANK1hhlh
;;
;;   None.
;;
;; Critical Paths under _main in BANK1hhll
;;
;;   None.
;;
;; Critical Paths under _ISR in BANK1hhll
;;
;;   None.
;;
;; Critical Paths under _main in BANK1hl
;;
;;   None.
;;
;; Critical Paths under _ISR in BANK1hl
;;
;;   None.
;;
;; Critical Paths under _main in BANK1l
;;
;;   None.
;;
;; Critical Paths under _ISR in BANK1l
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 3     3      0     765
;;                                             16 COMMON     3     3      0
;;                              _start
;;                           _delay_ms
;;                   _TM1650_SystemCmd
;;                            ___lwdiv
;;                            ___lwmod
;;                        _TM1650_send
;;                        _TM1650_read
;; ---------------------------------------------------------------------------------
;; (1) _TM1650_read                                          1     1      0     165
;;                                              8 COMMON     1     1      0
;;                       _TM1650_START
;;                         _write_8bit
;;                          _read_8bit
;;                        _TM1650_STOP
;; ---------------------------------------------------------------------------------
;; (1) _TM1650_SystemCmd                                     4     1      3     150
;;                                              8 COMMON     4     1      3
;;                       _TM1650_START
;;                         _write_8bit
;;                        _TM1650_STOP
;; ---------------------------------------------------------------------------------
;; (1) _TM1650_send                                          2     1      1     120
;;                                              8 COMMON     2     1      1
;;                       _TM1650_START
;;                         _write_8bit
;;                        _TM1650_STOP
;; ---------------------------------------------------------------------------------
;; (2) _read_8bit                                            2     2      0      60
;;                                              6 COMMON     2     2      0
;;                         _delay_50us
;; ---------------------------------------------------------------------------------
;; (2) _write_8bit                                           2     2      0      60
;;                                              6 COMMON     2     2      0
;;                         _delay_50us
;; ---------------------------------------------------------------------------------
;; (2) _TM1650_STOP                                          0     0      0      15
;;                         _delay_50us
;; ---------------------------------------------------------------------------------
;; (2) _TM1650_START                                         0     0      0      15
;;                         _delay_50us
;; ---------------------------------------------------------------------------------
;; (1) ___lwmod                                              5     1      4     105
;;                                             11 COMMON     5     1      4
;;                            ___lwdiv (ARG)
;; ---------------------------------------------------------------------------------
;; (1) ___lwdiv                                              7     3      4     105
;;                                              4 COMMON     7     3      4
;; ---------------------------------------------------------------------------------
;; (1) _delay_ms                                             2     0      2      15
;;                                              4 COMMON     2     0      2
;; ---------------------------------------------------------------------------------
;; (1) _start                                                0     0      0       0
;; ---------------------------------------------------------------------------------
;; (3) _delay_50us                                           2     0      2      15
;;                                              4 COMMON     2     0      2
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (4) _ISR                                                  4     4      0       0
;;                                              0 COMMON     4     4      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 4
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _start
;;   _delay_ms
;;   _TM1650_SystemCmd
;;     _TM1650_START
;;       _delay_50us
;;     _write_8bit
;;       _delay_50us
;;     _TM1650_STOP
;;       _delay_50us
;;   ___lwdiv
;;   ___lwmod
;;     ___lwdiv (ARG)
;;   _TM1650_send
;;     _TM1650_START
;;       _delay_50us
;;     _write_8bit
;;       _delay_50us
;;     _TM1650_STOP
;;       _delay_50us
;;   _TM1650_read
;;     _TM1650_START
;;       _delay_50us
;;     _write_8bit
;;       _delay_50us
;;     _read_8bit
;;       _delay_50us
;;     _TM1650_STOP
;;       _delay_50us
;;
;; _ISR (ROOT)
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON           3E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON              3E     13      2D       1       72.6%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       3       2        0.0%
;;BITBANK0hll          1      0       0       3        0.0%
;;BITBANK0lh           2      0       0       4        0.0%
;;BITBANK0ll           1      0       0       5        0.0%
;;BANK0hll             1      0       0       6        0.0%
;;BANK0lh              2      0       0       7        0.0%
;;BANK0ll              1      0       0       8        0.0%
;;BITBANK1hhhhhhl      2      0       0       9        0.0%
;;BITBANK1hhhhhl       2      0       0      10        0.0%
;;BITBANK1hhhl         1      0       0      11        0.0%
;;BITBANK1hhlh         4      0       0      12        0.0%
;;BITBANK1hhll         1      0       0      13        0.0%
;;BITBANK1hl           3      0       0      14        0.0%
;;BITBANK1l            1      0       0      15        0.0%
;;BANK1hhhhhhl         2      0       0      16        0.0%
;;BANK1hhhhhl          2      0       0      17        0.0%
;;BANK1hhhl            1      0       0      18        0.0%
;;BANK1hhlh            4      0       0      19        0.0%
;;BANK1hhll            1      0       0      20        0.0%
;;BANK1hl              3      0       0      21        0.0%
;;BANK1l               1      0       0      22        0.0%
;;ABS                  0      0      2D      23        0.0%
;;DATA                 0      0      30      24        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 392 in file "app.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  shi             1   18[COMMON] unsigned char 
;;  gew             1   17[COMMON] unsigned char 
;;  bai             1   16[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 15F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMONBANK0hll BANK0lh BANK0llBANK1hhhBANK1hhhBANK1hhhBANK1hhlBANK1hhl BANK1hl  BANK1l
;;      Params:         0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         3       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         3       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_start
;;		_delay_ms
;;		_TM1650_SystemCmd
;;		___lwdiv
;;		___lwmod
;;		_TM1650_send
;;		_TM1650_read
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"app.c"
	line	392
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 4
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	394
	
l1674:	
;app.c: 395: if(1) {
	fcall	_start
	line	396
	
l1676:	
;app.c: 396: PA4 = 0 ;
	bcf	(44/8),(44)&7
	line	397
	
l1678:	
;app.c: 397: tm1650UpdateFlg = 1 ;
	clrf	(_tm1650UpdateFlg)
	incf	(_tm1650UpdateFlg),f
	line	398
	
l1680:	
;app.c: 399: cntSWDown = 0 ;
	clrf	(_cntTime5MS)
	clrf	(_cntTime5MS+1)
	line	400
	
l1682:	
;app.c: 400: gLedCnt = 0 ;
	clrf	(_gLedCnt)
	clrf	(_gLedCnt+1)
	line	401
	
l1684:	
;app.c: 401: cntTime1S = 0 ;
	clrf	(_cntTime1S)
	clrf	(_cntTime1S+1)
	line	402
	
l1686:	
;app.c: 402: gWState = 0x01 ;
	clrf	(_gWState)
	incf	(_gWState),f
	line	403
	
l1688:	
;app.c: 403: cntPDDown = 10 ;
	movlw	(0Ah)
	movwf	(_cntPDDown)
	line	404
	
l1690:	
;app.c: 404: gLedCntBak = 60 ;
	movlw	03Ch
	movwf	(_gLedCntBak)
	clrf	(_gLedCntBak+1)
	line	405
	
l1692:	
;app.c: 405: longState = 0 ;
	clrf	(_longState)
	line	406
	
l398:	
	line	407
;app.c: 406: }
;app.c: 407: delay_ms(50) ;
	movlw	032h
	movwf	(?_delay_ms)
	clrf	(?_delay_ms+1)
	fcall	_delay_ms
	line	409
;app.c: 409: TM1650_SystemCmd(0x20,0x00,0x00,0x01);
	clrf	(?_TM1650_SystemCmd)
	clrf	0+(?_TM1650_SystemCmd)+01h
	clrf	0+(?_TM1650_SystemCmd)+02h
	incf	0+(?_TM1650_SystemCmd)+02h,f
	movlw	(020h)
	fcall	_TM1650_SystemCmd
	line	410
;app.c: 410: delay_ms(200) ;
	movlw	0C8h
	movwf	(?_delay_ms)
	clrf	(?_delay_ms+1)
	fcall	_delay_ms
	line	412
;app.c: 412: delay_ms(50) ;
	movlw	032h
	movwf	(?_delay_ms)
	clrf	(?_delay_ms+1)
	fcall	_delay_ms
	line	415
	
l1694:	
;app.c: 415: if(tm1650UpdateFlg) {
	movf	(_tm1650UpdateFlg),w
	skipz
	goto	u280
	goto	l1722
u280:
	line	416
	
l1696:	
;app.c: 416: tm1650UpdateFlg = 0 ;
	clrf	(_tm1650UpdateFlg)
	line	417
	
l1698:	
;app.c: 417: bai = gLedCnt/100 ;
	movlw	064h
	movwf	(?___lwdiv)
	clrf	(?___lwdiv+1)
	movf	(_gLedCnt+1),w
	movwf	1+(?___lwdiv)+02h
	movf	(_gLedCnt),w
	movwf	0+(?___lwdiv)+02h
	fcall	___lwdiv
	movf	(0+(?___lwdiv)),w
	movwf	(main@bai)
	line	418
	
l1700:	
;app.c: 418: shi = gLedCnt/10%10 ;
	movlw	0Ah
	movwf	(?___lwmod)
	clrf	(?___lwmod+1)
	movlw	0Ah
	movwf	(?___lwdiv)
	clrf	(?___lwdiv+1)
	movf	(_gLedCnt+1),w
	movwf	1+(?___lwdiv)+02h
	movf	(_gLedCnt),w
	movwf	0+(?___lwdiv)+02h
	fcall	___lwdiv
	movf	(1+(?___lwdiv)),w
	movwf	1+(?___lwmod)+02h
	movf	(0+(?___lwdiv)),w
	movwf	0+(?___lwmod)+02h
	fcall	___lwmod
	movf	(0+(?___lwmod)),w
	movwf	(main@shi)
	line	419
	
l1702:	
;app.c: 419: gew = gLedCnt%10 ;
	movlw	0Ah
	movwf	(?___lwmod)
	clrf	(?___lwmod+1)
	movf	(_gLedCnt+1),w
	movwf	1+(?___lwmod)+02h
	movf	(_gLedCnt),w
	movwf	0+(?___lwmod)+02h
	fcall	___lwmod
	movf	(0+(?___lwmod)),w
	movwf	(main@gew)
	line	421
	
l1704:	
;app.c: 421: TM1650_send(0x6C,DispCode[gew]) ;
	movf	(main@gew),w
	addlw	low((_DispCode-__stringbase))
	movwf	fsr0
	fcall	stringdir
	movwf	(?_TM1650_send)
	movlw	(06Ch)
	fcall	_TM1650_send
	line	422
	
l1706:	
;app.c: 422: if(gLedCnt>0) {
	movf	(_gLedCnt+1),w
	iorwf	(_gLedCnt),w
	skipnz
	goto	u291
	goto	u290
u291:
	goto	l1720
u290:
	line	423
	
l1708:	
;app.c: 423: if(gLedCnt>99) {
	movlw	high(064h)
	subwf	(_gLedCnt+1),w
	movlw	low(064h)
	skipnz
	subwf	(_gLedCnt),w
	skipc
	goto	u301
	goto	u300
u301:
	goto	l1712
u300:
	line	424
	
l1710:	
;app.c: 424: TM1650_send(0x68 , DispCode[bai]);
	movf	(main@bai),w
	addlw	low((_DispCode-__stringbase))
	movwf	fsr0
	fcall	stringdir
	movwf	(?_TM1650_send)
	movlw	(068h)
	fcall	_TM1650_send
	line	425
;app.c: 425: TM1650_send(0x6A , DispCode[shi]) ;
	movf	(main@shi),w
	addlw	low((_DispCode-__stringbase))
	movwf	fsr0
	fcall	stringdir
	movwf	(?_TM1650_send)
	movlw	(06Ah)
	fcall	_TM1650_send
	line	426
;app.c: 426: }
	goto	l406
	line	428
	
l1712:	
;app.c: 427: else {
;app.c: 428: TM1650_send(0x68 , 0x00) ;
	clrf	(?_TM1650_send)
	movlw	(068h)
	fcall	_TM1650_send
	line	429
	
l1714:	
;app.c: 429: if(gLedCnt>9) {
	movlw	high(0Ah)
	subwf	(_gLedCnt+1),w
	movlw	low(0Ah)
	skipnz
	subwf	(_gLedCnt),w
	skipc
	goto	u311
	goto	u310
u311:
	goto	l1718
u310:
	line	430
	
l1716:	
;app.c: 430: TM1650_send(0x6A , DispCode[shi]) ;
	movf	(main@shi),w
	addlw	low((_DispCode-__stringbase))
	movwf	fsr0
	fcall	stringdir
	movwf	(?_TM1650_send)
	movlw	(06Ah)
	fcall	_TM1650_send
	line	431
;app.c: 431: }
	goto	l406
	line	433
	
l1718:	
;app.c: 432: else {
;app.c: 433: TM1650_send(0x6A , 0x00) ;
	clrf	(?_TM1650_send)
	movlw	(06Ah)
	fcall	_TM1650_send
	goto	l406
	line	438
	
l1720:	
;app.c: 437: else {
;app.c: 438: TM1650_send(0x68 , DispCode[bai]);
	movf	(main@bai),w
	addlw	low((_DispCode-__stringbase))
	movwf	fsr0
	fcall	stringdir
	movwf	(?_TM1650_send)
	movlw	(068h)
	fcall	_TM1650_send
	line	439
;app.c: 439: TM1650_send(0x6A , DispCode[shi]) ;
	movf	(main@shi),w
	addlw	low((_DispCode-__stringbase))
	movwf	fsr0
	fcall	stringdir
	movwf	(?_TM1650_send)
	movlw	(06Ah)
	fcall	_TM1650_send
	line	440
	
l406:	
	line	441
;app.c: 440: }
;app.c: 441: TM1650_send(0x6C , DispCode[gew]);
	movf	(main@gew),w
	addlw	low((_DispCode-__stringbase))
	movwf	fsr0
	fcall	stringdir
	movwf	(?_TM1650_send)
	movlw	(06Ch)
	fcall	_TM1650_send
	line	446
	
l1722:	
;app.c: 448: if(1) {
	movf	(_t5MSFlg),w
	skipz
	goto	u320
	goto	l1694
u320:
	line	449
	
l1724:	
;app.c: 449: swBuf1 = TM1650_read() ;
	fcall	_TM1650_read
	movwf	(_swBuf1)
	line	450
	
l1726:	
;app.c: 450: if(0X40 & swBuf1) {
	btfss	(_swBuf1),(6)&7
	goto	u331
	goto	u330
u331:
	goto	l409
u330:
	goto	l1812
	line	452
	
l1728:	
;app.c: 452: }
	goto	l1812
	line	453
	
l409:	
;app.c: 453: else if(0X40 & swBuf2) {
	btfss	(_swBuf2),(6)&7
	goto	u341
	goto	u340
u341:
	goto	l1812
u340:
	line	454
	
l1730:	
;app.c: 454: if(swBuf2 == 0x47) {
	movf	(_swBuf2),w
	xorlw	047h
	skipz
	goto	u351
	goto	u350
u351:
	goto	l1758
u350:
	line	455
	
l1732:	
;app.c: 455: cntTime1S = 0 ;
	clrf	(_cntTime1S)
	clrf	(_cntTime1S+1)
	line	456
;app.c: 456: cntTime1MS = 0 ;
	clrf	(_cntTime1MS)
	clrf	(_cntTime1MS+1)
	line	457
	
l1734:	
;app.c: 457: tm1650UpdateFlg = 1 ;
	clrf	(_tm1650UpdateFlg)
	incf	(_tm1650UpdateFlg),f
	line	458
	
l1736:	
;app.c: 458: if(gLedCnt>0) {
	movf	(_gLedCnt+1),w
	iorwf	(_gLedCnt),w
	skipnz
	goto	u361
	goto	u360
u361:
	goto	l1742
u360:
	line	459
	
l1738:	
;app.c: 459: uvledGrB = 0 ;
	clrf	(_uvledGrB)
	clrf	(_uvledGrB+1)
	line	460
;app.c: 460: gLedCnt = 0 ;
	clrf	(_gLedCnt)
	clrf	(_gLedCnt+1)
	line	461
	
l1740:	
;app.c: 461: gWState = 2 ;
	movlw	(02h)
	movwf	(_gWState)
	line	462
;app.c: 462: }
	goto	l1744
	line	464
	
l1742:	
;app.c: 463: else {
;app.c: 464: uvledGrB = 8 ;
	movlw	08h
	movwf	(_uvledGrB)
	clrf	(_uvledGrB+1)
	line	465
;app.c: 465: gLedCnt = 120 ;
	movlw	078h
	movwf	(_gLedCnt)
	clrf	(_gLedCnt+1)
	line	466
;app.c: 466: gLedCntBak = 120 ;
	movlw	078h
	movwf	(_gLedCntBak)
	clrf	(_gLedCntBak+1)
	line	467
;app.c: 467: gWState = 4 ;
	movlw	(04h)
	movwf	(_gWState)
	line	472
	
l1744:	
;app.c: 468: }
;app.c: 472: if(0==longState) {
	movf	(_longState),f
	skipz
	goto	u371
	goto	u370
u371:
	goto	l1748
u370:
	line	473
	
l1746:	
;app.c: 473: longState = 1 ;
	clrf	(_longState)
	incf	(_longState),f
	line	474
;app.c: 474: }
	goto	l1812
	line	475
	
l1748:	
;app.c: 475: else if(1==longState) {
	decf	(_longState),w
	skipz
	goto	u381
	goto	u380
u381:
	goto	l1752
u380:
	line	476
	
l1750:	
;app.c: 476: longState = 2 ;
	movlw	(02h)
	movwf	(_longState)
	line	477
;app.c: 477: }
	goto	l1812
	line	478
	
l1752:	
;app.c: 478: else if(6==longState) {
	movf	(_longState),w
	xorlw	06h
	skipz
	goto	u391
	goto	u390
u391:
	goto	l1756
u390:
	line	479
	
l1754:	
;app.c: 479: longState = 7 ;
	movlw	(07h)
	movwf	(_longState)
	line	480
;app.c: 480: }
	goto	l1812
	line	482
	
l1756:	
;app.c: 481: else {
;app.c: 482: longState = 0 ;
	clrf	(_longState)
	goto	l1812
	line	488
	
l1758:	
;app.c: 488: else if(swBuf2 == 0x5F) {
	movf	(_swBuf2),w
	xorlw	05Fh
	skipz
	goto	u401
	goto	u400
u401:
	goto	l1786
u400:
	line	489
	
l1760:	
;app.c: 489: cntTime1S = 0 ;
	clrf	(_cntTime1S)
	clrf	(_cntTime1S+1)
	line	490
;app.c: 490: cntTime1MS = 0 ;
	clrf	(_cntTime1MS)
	clrf	(_cntTime1MS+1)
	line	491
	
l1762:	
;app.c: 491: tm1650UpdateFlg = 1 ;
	clrf	(_tm1650UpdateFlg)
	incf	(_tm1650UpdateFlg),f
	line	492
	
l1764:	
;app.c: 492: if(gLedCnt>0) {
	movf	(_gLedCnt+1),w
	iorwf	(_gLedCnt),w
	skipnz
	goto	u411
	goto	u410
u411:
	goto	l1770
u410:
	line	493
	
l1766:	
;app.c: 493: uvledGrB = 0 ;
	clrf	(_uvledGrB)
	clrf	(_uvledGrB+1)
	line	494
;app.c: 494: gLedCnt = 0 ;
	clrf	(_gLedCnt)
	clrf	(_gLedCnt+1)
	line	495
	
l1768:	
;app.c: 495: gWState = 2 ;
	movlw	(02h)
	movwf	(_gWState)
	line	496
;app.c: 496: }
	goto	l424
	line	498
	
l1770:	
;app.c: 497: else {
;app.c: 498: uvledGrB = 16 ;
	movlw	010h
	movwf	(_uvledGrB)
	clrf	(_uvledGrB+1)
	line	499
;app.c: 499: gLedCnt = 60 ;
	movlw	03Ch
	movwf	(_gLedCnt)
	clrf	(_gLedCnt+1)
	line	500
;app.c: 500: gLedCntBak = 60 ;
	movlw	03Ch
	movwf	(_gLedCntBak)
	clrf	(_gLedCntBak+1)
	line	501
;app.c: 501: gWState = 4 ;
	movlw	(04h)
	movwf	(_gWState)
	line	502
	
l424:	
	line	506
;app.c: 502: }
;app.c: 506: if(4==longState) {
	movf	(_longState),w
	xorlw	04h
	skipz
	goto	u421
	goto	u420
u421:
	goto	l1774
u420:
	line	507
	
l1772:	
;app.c: 507: longState = 5 ;
	movlw	(05h)
	movwf	(_longState)
	line	508
;app.c: 508: }
	goto	l1812
	line	509
	
l1774:	
;app.c: 509: else if(5==longState) {
	movf	(_longState),w
	xorlw	05h
	skipz
	goto	u431
	goto	u430
u431:
	goto	l1778
u430:
	line	510
	
l1776:	
;app.c: 510: longState = 6 ;
	movlw	(06h)
	movwf	(_longState)
	line	511
;app.c: 511: }
	goto	l1812
	line	512
	
l1778:	
;app.c: 512: else if(8==longState) {
	movf	(_longState),w
	xorlw	08h
	skipz
	goto	u441
	goto	u440
u441:
	goto	l1756
u440:
	line	513
	
l1780:	
;app.c: 513: gLedCnt = 888 ;
	movlw	low(0378h)
	movwf	(_gLedCnt)
	movlw	high(0378h)
	movwf	((_gLedCnt))+1
	goto	l1756
	line	522
	
l1786:	
;app.c: 522: else if(swBuf2 == 0x77) {
	movf	(_swBuf2),w
	xorlw	077h
	skipz
	goto	u451
	goto	u450
u451:
	goto	l1728
u450:
	line	523
	
l1788:	
;app.c: 523: cntTime1S = 0 ;
	clrf	(_cntTime1S)
	clrf	(_cntTime1S+1)
	line	524
;app.c: 524: cntTime1MS = 0 ;
	clrf	(_cntTime1MS)
	clrf	(_cntTime1MS+1)
	line	525
	
l1790:	
;app.c: 525: tm1650UpdateFlg = 1 ;
	clrf	(_tm1650UpdateFlg)
	incf	(_tm1650UpdateFlg),f
	line	526
	
l1792:	
;app.c: 526: if(gLedCnt>0) {
	movf	(_gLedCnt+1),w
	iorwf	(_gLedCnt),w
	skipnz
	goto	u461
	goto	u460
u461:
	goto	l1798
u460:
	line	527
	
l1794:	
;app.c: 527: uvledGrB = 0 ;
	clrf	(_uvledGrB)
	clrf	(_uvledGrB+1)
	line	528
;app.c: 528: gLedCnt = 0 ;
	clrf	(_gLedCnt)
	clrf	(_gLedCnt+1)
	line	529
	
l1796:	
;app.c: 529: gWState = 2 ;
	movlw	(02h)
	movwf	(_gWState)
	line	530
;app.c: 530: }
	goto	l434
	line	532
	
l1798:	
;app.c: 531: else {
;app.c: 532: uvledGrB = 16 ;
	movlw	010h
	movwf	(_uvledGrB)
	clrf	(_uvledGrB+1)
	line	533
;app.c: 533: gLedCnt = 30 ;
	movlw	01Eh
	movwf	(_gLedCnt)
	clrf	(_gLedCnt+1)
	line	534
;app.c: 534: gLedCntBak = 30 ;
	movlw	01Eh
	movwf	(_gLedCntBak)
	clrf	(_gLedCntBak+1)
	line	535
;app.c: 535: gWState = 4 ;
	movlw	(04h)
	movwf	(_gWState)
	line	536
	
l434:	
	line	539
;app.c: 536: }
;app.c: 539: if(2==longState) {
	movf	(_longState),w
	xorlw	02h
	skipz
	goto	u471
	goto	u470
u471:
	goto	l1802
u470:
	line	540
	
l1800:	
;app.c: 540: longState = 3 ;
	movlw	(03h)
	movwf	(_longState)
	line	541
;app.c: 541: }
	goto	l1812
	line	542
	
l1802:	
;app.c: 542: else if(3==longState) {
	movf	(_longState),w
	xorlw	03h
	skipz
	goto	u481
	goto	u480
u481:
	goto	l1806
u480:
	line	543
	
l1804:	
;app.c: 543: longState = 4 ;
	movlw	(04h)
	movwf	(_longState)
	line	544
;app.c: 544: }
	goto	l1812
	line	545
	
l1806:	
;app.c: 545: else if(7==longState) {
	movf	(_longState),w
	xorlw	07h
	skipz
	goto	u491
	goto	u490
u491:
	goto	l1756
u490:
	line	546
	
l1808:	
;app.c: 546: longState = 8 ;
	movlw	(08h)
	movwf	(_longState)
	line	555
;app.c: 547: }
	
l1812:	
;app.c: 550: }
;app.c: 553: }
;app.c: 554: }
;app.c: 555: swBuf2 = swBuf1 ;
	movf	(_swBuf1),w
	movwf	(_swBuf2)
	line	556
;app.c: 556: }
;app.c: 558: if(1) {
	
l408:	
	line	559
;app.c: 559: if(0x03 & gWState) {
	movf	(_gWState),w
	andlw	03h
	btfsc	status,2
	goto	u501
	goto	u500
u501:
	goto	l441
u500:
	line	560
	
l1814:	
;app.c: 560: if(1==PA5) {
	bcf	status, 5	;RP0=0, select bank0
	btfss	(45/8),(45)&7
	goto	u511
	goto	u510
u511:
	goto	l1832
u510:
	line	561
	
l1816:	
;app.c: 561: if(cntPDDown<20) {
	movlw	(014h)
	subwf	(_cntPDDown),w
	skipnc
	goto	u521
	goto	u520
u521:
	goto	l441
u520:
	line	562
	
l1818:	
;app.c: 562: cntPDDown++ ;
	incf	(_cntPDDown),f
	line	563
	
l1820:	
;app.c: 563: if(20==cntPDDown && gWState==0x01) {
	movf	(_cntPDDown),w
	xorlw	014h
	skipz
	goto	u531
	goto	u530
u531:
	goto	l446
u530:
	
l1822:	
	decf	(_gWState),w
	skipz
	goto	u541
	goto	u540
u541:
	goto	l446
u540:
	line	564
	
l1824:	
;app.c: 564: cntTime1S = 0 ;
	clrf	(_cntTime1S)
	clrf	(_cntTime1S+1)
	line	565
;app.c: 565: cntTime1MS = 0 ;
	clrf	(_cntTime1MS)
	clrf	(_cntTime1MS+1)
	line	566
	
l1826:	
;app.c: 566: gLedCnt = gLedCntBak ;
	movf	(_gLedCntBak+1),w
	movwf	(_gLedCnt+1)
	movf	(_gLedCntBak),w
	movwf	(_gLedCnt)
	line	567
	
l1828:	
;app.c: 567: uvledGrB = 16 ;
	movlw	010h
	movwf	(_uvledGrB)
	clrf	(_uvledGrB+1)
	line	568
	
l1830:	
;app.c: 568: tm1650UpdateFlg = 1 ;
	clrf	(_tm1650UpdateFlg)
	incf	(_tm1650UpdateFlg),f
	goto	l441
	line	573
	
l1832:	
;app.c: 572: else {
;app.c: 573: if(cntPDDown>0) {
	movf	(_cntPDDown),w
	skipz
	goto	u550
	goto	l441
u550:
	line	574
	
l1834:	
;app.c: 574: cntPDDown-- ;
	decf	(_cntPDDown),f
	line	575
;app.c: 575: if(0==cntPDDown) {
	movf	(_cntPDDown),f
	skipz
	goto	u561
	goto	u560
u561:
	goto	l446
u560:
	line	576
	
l1836:	
;app.c: 576: gWState = 1 ;
	clrf	(_gWState)
	incf	(_gWState),f
	line	577
	
l1838:	
;app.c: 577: cntTime1S = 0 ;
	clrf	(_cntTime1S)
	clrf	(_cntTime1S+1)
	line	578
;app.c: 578: cntTime1MS = 0 ;
	clrf	(_cntTime1MS)
	clrf	(_cntTime1MS+1)
	line	579
;app.c: 579: gLedCnt = 0 ;
	clrf	(_gLedCnt)
	clrf	(_gLedCnt+1)
	line	580
;app.c: 580: uvledGrB = 0 ;
	clrf	(_uvledGrB)
	clrf	(_uvledGrB+1)
	goto	l1830
	line	584
	
l446:	
	line	586
	
l441:	
	line	589
;app.c: 582: }
;app.c: 583: }
;app.c: 584: }
;app.c: 585: }
;app.c: 586: }
;app.c: 589: t5MSFlg = 0 ;
	clrf	(_t5MSFlg)
	goto	l1694
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	594
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_TM1650_read
psect	text157,local,class=CODE,delta=2
global __ptext157
__ptext157:

;; *************** function _TM1650_read *****************
;; Defined at:
;;		line 161 in file "app.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  key             1    8[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 15F/20
;;		On exit  : 17F/20
;;		Unchanged: FFE80/0
;; Data sizes:     COMMONBANK0hll BANK0lh BANK0llBANK1hhhBANK1hhhBANK1hhhBANK1hhlBANK1hhl BANK1hl  BANK1l
;;      Params:         0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         1       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         1       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_TM1650_START
;;		_write_8bit
;;		_read_8bit
;;		_TM1650_STOP
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text157
	file	"app.c"
	line	161
	global	__size_of_TM1650_read
	__size_of_TM1650_read	equ	__end_of_TM1650_read-_TM1650_read
	
_TM1650_read:	
	opt	stack 4
; Regs used in _TM1650_read: [wreg+status,2+status,0+pclath+cstack]
	line	163
	
l1668:	
;app.c: 162: unsigned char key;
;app.c: 163: TM1650_START();
	fcall	_TM1650_START
	line	164
;app.c: 164: write_8bit(0x4F);
	movlw	(04Fh)
	fcall	_write_8bit
	line	165
;app.c: 165: key=read_8bit();
	fcall	_read_8bit
	movwf	(TM1650_read@key)
	line	166
;app.c: 166: TM1650_STOP();
	fcall	_TM1650_STOP
	line	167
	
l1670:	
;app.c: 167: return key;
	movf	(TM1650_read@key),w
	line	168
	
l358:	
	return
	opt stack 0
GLOBAL	__end_of_TM1650_read
	__end_of_TM1650_read:
;; =============== function _TM1650_read ends ============

	signat	_TM1650_read,89
	global	_TM1650_SystemCmd
psect	text158,local,class=CODE,delta=2
global __ptext158
__ptext158:

;; *************** function _TM1650_SystemCmd *****************
;; Defined at:
;;		line 144 in file "app.c"
;; Parameters:    Size  Location     Type
;;  light           1    wreg     unsigned char 
;;  segMod          1    8[COMMON] unsigned char 
;;  WorkMod         1    9[COMMON] unsigned char 
;;  Onoff           1   10[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  light           1   11[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/20
;;		Unchanged: FFE80/0
;; Data sizes:     COMMONBANK0hll BANK0lh BANK0llBANK1hhhBANK1hhhBANK1hhhBANK1hhlBANK1hhl BANK1hl  BANK1l
;;      Params:         3       0       0       0       0       0       0       0       0       0       0
;;      Locals:         1       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         4       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_TM1650_START
;;		_write_8bit
;;		_TM1650_STOP
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text158
	file	"app.c"
	line	144
	global	__size_of_TM1650_SystemCmd
	__size_of_TM1650_SystemCmd	equ	__end_of_TM1650_SystemCmd-_TM1650_SystemCmd
	
_TM1650_SystemCmd:	
	opt	stack 4
; Regs used in _TM1650_SystemCmd: [wreg+status,2+status,0+pclath+cstack]
;TM1650_SystemCmd@light stored from wreg
	movwf	(TM1650_SystemCmd@light)
	line	145
	
l1666:	
;app.c: 145: TM1650_START();
	fcall	_TM1650_START
	line	146
;app.c: 146: write_8bit(0x48);
	movlw	(048h)
	fcall	_write_8bit
	line	147
;app.c: 147: write_8bit(light | segMod | WorkMod | Onoff );
	movf	(TM1650_SystemCmd@light),w
	iorwf	(TM1650_SystemCmd@segMod),w
	iorwf	(TM1650_SystemCmd@WorkMod),w
	iorwf	(TM1650_SystemCmd@Onoff),w
	fcall	_write_8bit
	line	148
;app.c: 148: TM1650_STOP();
	fcall	_TM1650_STOP
	line	149
	
l355:	
	return
	opt stack 0
GLOBAL	__end_of_TM1650_SystemCmd
	__end_of_TM1650_SystemCmd:
;; =============== function _TM1650_SystemCmd ends ============

	signat	_TM1650_SystemCmd,16504
	global	_TM1650_send
psect	text159,local,class=CODE,delta=2
global __ptext159
__ptext159:

;; *************** function _TM1650_send *****************
;; Defined at:
;;		line 128 in file "app.c"
;; Parameters:    Size  Location     Type
;;  saddr           1    wreg     unsigned char 
;;  sdate           1    8[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  saddr           1    9[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 15F/20
;;		On exit  : 17F/20
;;		Unchanged: FFE80/0
;; Data sizes:     COMMONBANK0hll BANK0lh BANK0llBANK1hhhBANK1hhhBANK1hhhBANK1hhlBANK1hhl BANK1hl  BANK1l
;;      Params:         1       0       0       0       0       0       0       0       0       0       0
;;      Locals:         1       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         2       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_TM1650_START
;;		_write_8bit
;;		_TM1650_STOP
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text159
	file	"app.c"
	line	128
	global	__size_of_TM1650_send
	__size_of_TM1650_send	equ	__end_of_TM1650_send-_TM1650_send
	
_TM1650_send:	
	opt	stack 4
; Regs used in _TM1650_send: [wreg+status,2+status,0+pclath+cstack]
;TM1650_send@saddr stored from wreg
	movwf	(TM1650_send@saddr)
	line	129
	
l1664:	
;app.c: 129: TM1650_START();
	fcall	_TM1650_START
	line	130
;app.c: 130: write_8bit(saddr);
	movf	(TM1650_send@saddr),w
	fcall	_write_8bit
	line	131
;app.c: 131: write_8bit(sdate);
	movf	(TM1650_send@sdate),w
	fcall	_write_8bit
	line	132
;app.c: 132: TM1650_STOP();
	fcall	_TM1650_STOP
	line	133
	
l352:	
	return
	opt stack 0
GLOBAL	__end_of_TM1650_send
	__end_of_TM1650_send:
;; =============== function _TM1650_send ends ============

	signat	_TM1650_send,8312
	global	_read_8bit
psect	text160,local,class=CODE,delta=2
global __ptext160
__ptext160:

;; *************** function _read_8bit *****************
;; Defined at:
;;		line 98 in file "app.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               1    7[COMMON] unsigned char 
;;  dat             1    6[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/20
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMONBANK0hll BANK0lh BANK0llBANK1hhhBANK1hhhBANK1hhhBANK1hhlBANK1hhl BANK1hl  BANK1l
;;      Params:         0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         2       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         2       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_delay_50us
;; This function is called by:
;;		_TM1650_read
;; This function uses a non-reentrant model
;;
psect	text160
	file	"app.c"
	line	98
	global	__size_of_read_8bit
	__size_of_read_8bit	equ	__end_of_read_8bit-_read_8bit
	
_read_8bit:	
	opt	stack 4
; Regs used in _read_8bit: [wreg+status,2+status,0+pclath+cstack]
	line	100
	
l1630:	
;app.c: 99: unsigned char dat,i;
;app.c: 100: {TRISA1 = 1;} ;
	bsf	(1065/8)^080h,(1065)&7
	line	103
	
l1632:	
;app.c: 103: dat=0;
	clrf	(read_8bit@dat)
	line	104
;app.c: 104: for(i=0;i<8;i++)
	clrf	(read_8bit@i)
	line	105
	
l346:	
	line	106
;app.c: 105: {
;app.c: 106: PA2=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(42/8),(42)&7
	line	107
	
l1638:	
;app.c: 107: delay_50us(1);
	clrf	(?_delay_50us)
	incf	(?_delay_50us),f
	clrf	(?_delay_50us+1)
	fcall	_delay_50us
	line	108
	
l1640:	
;app.c: 108: dat<<=1;
	clrc
	rlf	(read_8bit@dat),f
	line	109
	
l1642:	
;app.c: 109: if(PA1)
	btfss	(41/8),(41)&7
	goto	u261
	goto	u260
u261:
	goto	l1646
u260:
	line	110
	
l1644:	
;app.c: 110: dat++;
	incf	(read_8bit@dat),f
	line	111
	
l1646:	
;app.c: 111: delay_50us(1);
	clrf	(?_delay_50us)
	incf	(?_delay_50us),f
	clrf	(?_delay_50us+1)
	fcall	_delay_50us
	line	112
	
l1648:	
;app.c: 112: PA2=0;
	bcf	(42/8),(42)&7
	line	113
	
l1650:	
;app.c: 113: delay_50us(1);
	clrf	(?_delay_50us)
	incf	(?_delay_50us),f
	clrf	(?_delay_50us+1)
	fcall	_delay_50us
	line	104
	incf	(read_8bit@i),f
	
l1652:	
	movlw	(08h)
	subwf	(read_8bit@i),w
	skipc
	goto	u271
	goto	u270
u271:
	goto	l346
u270:
	
l347:	
	line	115
;app.c: 114: }
;app.c: 115: {TRISA1 = 0 ;} ;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1065/8)^080h,(1065)&7
	line	116
;app.c: 116: PA1=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(41/8),(41)&7
	line	117
	
l1654:	
;app.c: 117: delay_50us(1);
	clrf	(?_delay_50us)
	incf	(?_delay_50us),f
	clrf	(?_delay_50us+1)
	fcall	_delay_50us
	line	118
	
l1656:	
;app.c: 118: PA2=1;
	bsf	(42/8),(42)&7
	line	119
;app.c: 119: delay_50us(1);
	clrf	(?_delay_50us)
	incf	(?_delay_50us),f
	clrf	(?_delay_50us+1)
	fcall	_delay_50us
	line	120
	
l1658:	
;app.c: 120: PA2=0;
	bcf	(42/8),(42)&7
	line	121
;app.c: 121: delay_50us(1);
	clrf	(?_delay_50us)
	incf	(?_delay_50us),f
	clrf	(?_delay_50us+1)
	fcall	_delay_50us
	line	123
	
l1660:	
;app.c: 123: return dat ;
	movf	(read_8bit@dat),w
	line	124
	
l349:	
	return
	opt stack 0
GLOBAL	__end_of_read_8bit
	__end_of_read_8bit:
;; =============== function _read_8bit ends ============

	signat	_read_8bit,89
	global	_write_8bit
psect	text161,local,class=CODE,delta=2
global __ptext161
__ptext161:

;; *************** function _write_8bit *****************
;; Defined at:
;;		line 54 in file "app.c"
;; Parameters:    Size  Location     Type
;;  dat             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  dat             1    6[COMMON] unsigned char 
;;  i               1    7[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 15F/0
;;		On exit  : 17F/20
;;		Unchanged: FFE80/0
;; Data sizes:     COMMONBANK0hll BANK0lh BANK0llBANK1hhhBANK1hhhBANK1hhhBANK1hhlBANK1hhl BANK1hl  BANK1l
;;      Params:         0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         2       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         2       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_delay_50us
;; This function is called by:
;;		_TM1650_send
;;		_TM1650_SystemCmd
;;		_TM1650_read
;; This function uses a non-reentrant model
;;
psect	text161
	file	"app.c"
	line	54
	global	__size_of_write_8bit
	__size_of_write_8bit	equ	__end_of_write_8bit-_write_8bit
	
_write_8bit:	
	opt	stack 4
; Regs used in _write_8bit: [wreg+status,2+status,0+pclath+cstack]
;write_8bit@dat stored from wreg
	line	56
	movwf	(write_8bit@dat)
	
l1594:	
;app.c: 55: unsigned char i;
;app.c: 56: PA2=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(42/8),(42)&7
	line	57
;app.c: 57: {TRISA1 = 0 ;}
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1065/8)^080h,(1065)&7
	line	58
	
l1596:	
;app.c: 58: for(i=0;i<8;i++)
	clrf	(write_8bit@i)
	line	59
	
l339:	
	line	60
;app.c: 59: {
;app.c: 60: if(dat&0x80)
	btfss	(write_8bit@dat),(7)&7
	goto	u241
	goto	u240
u241:
	goto	l341
u240:
	line	62
	
l1602:	
;app.c: 61: {
;app.c: 62: PA1=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(41/8),(41)&7
	line	63
	
l1604:	
;app.c: 63: delay_50us(1);
	clrf	(?_delay_50us)
	incf	(?_delay_50us),f
	clrf	(?_delay_50us+1)
	fcall	_delay_50us
	line	64
	
l1606:	
;app.c: 64: PA2=1;
	bsf	(42/8),(42)&7
	line	65
;app.c: 65: delay_50us(1);
	clrf	(?_delay_50us)
	incf	(?_delay_50us),f
	clrf	(?_delay_50us+1)
	fcall	_delay_50us
	line	66
	
l1608:	
;app.c: 66: PA2=0;
	bcf	(42/8),(42)&7
	line	67
;app.c: 67: }
	goto	l1616
	line	68
	
l341:	
	line	70
;app.c: 68: else
;app.c: 69: {
;app.c: 70: PA1=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(41/8),(41)&7
	goto	l1604
	line	76
	
l1616:	
;app.c: 75: }
;app.c: 76: dat<<=1;
	clrc
	rlf	(write_8bit@dat),f
	line	58
	
l1618:	
	incf	(write_8bit@i),f
	
l1620:	
	movlw	(08h)
	subwf	(write_8bit@i),w
	skipc
	goto	u251
	goto	u250
u251:
	goto	l339
u250:
	
l340:	
	line	78
;app.c: 77: }
;app.c: 78: {TRISA1 = 1;} ;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1065/8)^080h,(1065)&7
	line	80
	
l1622:	
;app.c: 80: delay_50us(1);
	clrf	(?_delay_50us)
	incf	(?_delay_50us),f
	clrf	(?_delay_50us+1)
	fcall	_delay_50us
	line	81
	
l1624:	
;app.c: 81: PA2=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(42/8),(42)&7
	line	82
;app.c: 82: delay_50us(1);
	clrf	(?_delay_50us)
	incf	(?_delay_50us),f
	clrf	(?_delay_50us+1)
	fcall	_delay_50us
	line	83
	
l1626:	
;app.c: 83: PA2=0;
	bcf	(42/8),(42)&7
	line	84
;app.c: 84: delay_50us(1);
	clrf	(?_delay_50us)
	incf	(?_delay_50us),f
	clrf	(?_delay_50us+1)
	fcall	_delay_50us
	line	87
	
l1628:	
;app.c: 87: {TRISA1 = 1;}
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1065/8)^080h,(1065)&7
	line	88
	
l343:	
	return
	opt stack 0
GLOBAL	__end_of_write_8bit
	__end_of_write_8bit:
;; =============== function _write_8bit ends ============

	signat	_write_8bit,4216
	global	_TM1650_STOP
psect	text162,local,class=CODE,delta=2
global __ptext162
__ptext162:

;; *************** function _TM1650_STOP *****************
;; Defined at:
;;		line 38 in file "app.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 15F/0
;;		On exit  : 17F/20
;;		Unchanged: FFE80/0
;; Data sizes:     COMMONBANK0hll BANK0lh BANK0llBANK1hhhBANK1hhhBANK1hhhBANK1hhlBANK1hhl BANK1hl  BANK1l
;;      Params:         0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_delay_50us
;; This function is called by:
;;		_TM1650_send
;;		_TM1650_SystemCmd
;;		_TM1650_read
;; This function uses a non-reentrant model
;;
psect	text162
	file	"app.c"
	line	38
	global	__size_of_TM1650_STOP
	__size_of_TM1650_STOP	equ	__end_of_TM1650_STOP-_TM1650_STOP
	
_TM1650_STOP:	
	opt	stack 4
; Regs used in _TM1650_STOP: [wreg+status,2+status,0+pclath+cstack]
	line	39
	
l1580:	
;app.c: 39: {TRISA1 = 0 ;}
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1065/8)^080h,(1065)&7
	line	40
;app.c: 40: PA1=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(41/8),(41)&7
	line	41
	
l1582:	
;app.c: 41: delay_50us(1);
	clrf	(?_delay_50us)
	incf	(?_delay_50us),f
	clrf	(?_delay_50us+1)
	fcall	_delay_50us
	line	42
	
l1584:	
;app.c: 42: PA2=1;
	bsf	(42/8),(42)&7
	line	43
;app.c: 43: delay_50us(1);
	clrf	(?_delay_50us)
	incf	(?_delay_50us),f
	clrf	(?_delay_50us+1)
	fcall	_delay_50us
	line	44
	
l1586:	
;app.c: 44: PA1=1;
	bsf	(41/8),(41)&7
	line	45
;app.c: 45: delay_50us(1);
	clrf	(?_delay_50us)
	incf	(?_delay_50us),f
	clrf	(?_delay_50us+1)
	fcall	_delay_50us
	line	46
	
l1588:	
;app.c: 46: PA2=0;
	bcf	(42/8),(42)&7
	line	47
	
l1590:	
;app.c: 47: PA1=1;
	bsf	(41/8),(41)&7
	line	48
	
l1592:	
;app.c: 48: {TRISA1 = 1;}
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1065/8)^080h,(1065)&7
	line	49
	
l336:	
	return
	opt stack 0
GLOBAL	__end_of_TM1650_STOP
	__end_of_TM1650_STOP:
;; =============== function _TM1650_STOP ends ============

	signat	_TM1650_STOP,88
	global	_TM1650_START
psect	text163,local,class=CODE,delta=2
global __ptext163
__ptext163:

;; *************** function _TM1650_START *****************
;; Defined at:
;;		line 25 in file "app.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 15F/20
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMONBANK0hll BANK0lh BANK0llBANK1hhhBANK1hhhBANK1hhhBANK1hhlBANK1hhl BANK1hl  BANK1l
;;      Params:         0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_delay_50us
;; This function is called by:
;;		_TM1650_send
;;		_TM1650_SystemCmd
;;		_TM1650_read
;; This function uses a non-reentrant model
;;
psect	text163
	file	"app.c"
	line	25
	global	__size_of_TM1650_START
	__size_of_TM1650_START	equ	__end_of_TM1650_START-_TM1650_START
	
_TM1650_START:	
	opt	stack 4
; Regs used in _TM1650_START: [wreg+status,2+status,0+pclath+cstack]
	line	26
	
l1572:	
;app.c: 26: {TRISA1 = 0 ;}
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1065/8)^080h,(1065)&7
	line	27
;app.c: 27: PA2=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(42/8),(42)&7
	line	28
;app.c: 28: PA1=1;
	bsf	(41/8),(41)&7
	line	29
	
l1574:	
;app.c: 29: delay_50us(1);
	clrf	(?_delay_50us)
	incf	(?_delay_50us),f
	clrf	(?_delay_50us+1)
	fcall	_delay_50us
	line	30
	
l1576:	
;app.c: 30: PA1=0;
	bcf	(41/8),(41)&7
	line	31
;app.c: 31: delay_50us(1);
	clrf	(?_delay_50us)
	incf	(?_delay_50us),f
	clrf	(?_delay_50us+1)
	fcall	_delay_50us
	line	32
	
l1578:	
;app.c: 32: PA2=0;
	bcf	(42/8),(42)&7
	line	34
	
l333:	
	return
	opt stack 0
GLOBAL	__end_of_TM1650_START
	__end_of_TM1650_START:
;; =============== function _TM1650_START ends ============

	signat	_TM1650_START,88
	global	___lwmod
psect	text164,local,class=CODE,delta=2
global __ptext164
__ptext164:

;; *************** function ___lwmod *****************
;; Defined at:
;;		line 5 in file "D:\Program Files\HI-TECH Software\PICC\9.83\sources\lwmod.c"
;; Parameters:    Size  Location     Type
;;  divisor         2   11[COMMON] unsigned int 
;;  dividend        2   13[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  counter         1   15[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2   11[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 15F/20
;;		On exit  : 15F/20
;;		Unchanged: FFEA0/0
;; Data sizes:     COMMONBANK0hll BANK0lh BANK0llBANK1hhhBANK1hhhBANK1hhhBANK1hhlBANK1hhl BANK1hl  BANK1l
;;      Params:         4       0       0       0       0       0       0       0       0       0       0
;;      Locals:         1       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         5       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text164
	file	"D:\Program Files\HI-TECH Software\PICC\9.83\sources\lwmod.c"
	line	5
	global	__size_of___lwmod
	__size_of___lwmod	equ	__end_of___lwmod-___lwmod
	
___lwmod:	
	opt	stack 6
; Regs used in ___lwmod: [wreg+status,2+status,0]
	line	8
	
l1552:	
	movf	(___lwmod@divisor+1),w
	iorwf	(___lwmod@divisor),w
	skipnz
	goto	u201
	goto	u200
u201:
	goto	l1568
u200:
	line	9
	
l1554:	
	clrf	(___lwmod@counter)
	incf	(___lwmod@counter),f
	line	10
	goto	l1558
	line	11
	
l1556:	
	clrc
	rlf	(___lwmod@divisor),f
	rlf	(___lwmod@divisor+1),f
	line	12
	incf	(___lwmod@counter),f
	line	10
	
l1558:	
	btfss	(___lwmod@divisor+1),(15)&7
	goto	u211
	goto	u210
u211:
	goto	l1556
u210:
	line	15
	
l1560:	
	movf	(___lwmod@divisor+1),w
	subwf	(___lwmod@dividend+1),w
	skipz
	goto	u225
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),w
u225:
	skipc
	goto	u221
	goto	u220
u221:
	goto	l1564
u220:
	line	16
	
l1562:	
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),f
	movf	(___lwmod@divisor+1),w
	skipc
	decf	(___lwmod@dividend+1),f
	subwf	(___lwmod@dividend+1),f
	line	17
	
l1564:	
	clrc
	rrf	(___lwmod@divisor+1),f
	rrf	(___lwmod@divisor),f
	line	18
	
l1566:	
	decfsz	(___lwmod@counter),f
	goto	u231
	goto	u230
u231:
	goto	l1560
u230:
	line	20
	
l1568:	
	movf	(___lwmod@dividend+1),w
	movwf	(?___lwmod+1)
	movf	(___lwmod@dividend),w
	movwf	(?___lwmod)
	line	21
	
l1035:	
	return
	opt stack 0
GLOBAL	__end_of___lwmod
	__end_of___lwmod:
;; =============== function ___lwmod ends ============

	signat	___lwmod,8314
	global	___lwdiv
psect	text165,local,class=CODE,delta=2
global __ptext165
__ptext165:

;; *************** function ___lwdiv *****************
;; Defined at:
;;		line 5 in file "D:\Program Files\HI-TECH Software\PICC\9.83\sources\lwdiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    4[COMMON] unsigned int 
;;  dividend        2    6[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  quotient        2    8[COMMON] unsigned int 
;;  counter         1   10[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    4[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 15F/20
;;		On exit  : 15F/20
;;		Unchanged: FFEA0/0
;; Data sizes:     COMMONBANK0hll BANK0lh BANK0llBANK1hhhBANK1hhhBANK1hhhBANK1hhlBANK1hhl BANK1hl  BANK1l
;;      Params:         4       0       0       0       0       0       0       0       0       0       0
;;      Locals:         3       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         7       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text165
	file	"D:\Program Files\HI-TECH Software\PICC\9.83\sources\lwdiv.c"
	line	5
	global	__size_of___lwdiv
	__size_of___lwdiv	equ	__end_of___lwdiv-___lwdiv
	
___lwdiv:	
	opt	stack 6
; Regs used in ___lwdiv: [wreg+status,2+status,0]
	line	9
	
l1526:	
	clrf	(___lwdiv@quotient)
	clrf	(___lwdiv@quotient+1)
	line	10
	
l1528:	
	movf	(___lwdiv@divisor+1),w
	iorwf	(___lwdiv@divisor),w
	skipnz
	goto	u161
	goto	u160
u161:
	goto	l1548
u160:
	line	11
	
l1530:	
	clrf	(___lwdiv@counter)
	incf	(___lwdiv@counter),f
	line	12
	goto	l1534
	line	13
	
l1532:	
	clrc
	rlf	(___lwdiv@divisor),f
	rlf	(___lwdiv@divisor+1),f
	line	14
	incf	(___lwdiv@counter),f
	line	12
	
l1534:	
	btfss	(___lwdiv@divisor+1),(15)&7
	goto	u171
	goto	u170
u171:
	goto	l1532
u170:
	line	17
	
l1536:	
	clrc
	rlf	(___lwdiv@quotient),f
	rlf	(___lwdiv@quotient+1),f
	line	18
	
l1538:	
	movf	(___lwdiv@divisor+1),w
	subwf	(___lwdiv@dividend+1),w
	skipz
	goto	u185
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),w
u185:
	skipc
	goto	u181
	goto	u180
u181:
	goto	l1544
u180:
	line	19
	
l1540:	
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),f
	movf	(___lwdiv@divisor+1),w
	skipc
	decf	(___lwdiv@dividend+1),f
	subwf	(___lwdiv@dividend+1),f
	line	20
	
l1542:	
	bsf	(___lwdiv@quotient)+(0/8),(0)&7
	line	22
	
l1544:	
	clrc
	rrf	(___lwdiv@divisor+1),f
	rrf	(___lwdiv@divisor),f
	line	23
	
l1546:	
	decfsz	(___lwdiv@counter),f
	goto	u191
	goto	u190
u191:
	goto	l1536
u190:
	line	25
	
l1548:	
	movf	(___lwdiv@quotient+1),w
	movwf	(?___lwdiv+1)
	movf	(___lwdiv@quotient),w
	movwf	(?___lwdiv)
	line	26
	
l1025:	
	return
	opt stack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
;; =============== function ___lwdiv ends ============

	signat	___lwdiv,8314
	global	_delay_ms
psect	text166,local,class=CODE,delta=2
global __ptext166
__ptext166:

;; *************** function _delay_ms *****************
;; Defined at:
;;		line 381 in file "app.c"
;; Parameters:    Size  Location     Type
;;  time            2    4[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 15F/0
;;		On exit  : 15F/0
;;		Unchanged: FFEA0/0
;; Data sizes:     COMMONBANK0hll BANK0lh BANK0llBANK1hhhBANK1hhhBANK1hhhBANK1hhlBANK1hhl BANK1hl  BANK1l
;;      Params:         2       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         2       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text166
	file	"app.c"
	line	381
	global	__size_of_delay_ms
	__size_of_delay_ms	equ	__end_of_delay_ms-_delay_ms
	
_delay_ms:	
	opt	stack 6
; Regs used in _delay_ms: [wreg+status,2+status,0]
	line	382
	
l1522:	
;app.c: 382: cntTimeNMS = time ;
	movf	(delay_ms@time+1),w
	movwf	(_cntTimeNMS+1)
	movf	(delay_ms@time),w
	movwf	(_cntTimeNMS)
	line	383
;app.c: 383: while(cntTimeNMS>0) ;
	
l1524:	
	movf	((_cntTimeNMS+1)),w
	iorwf	((_cntTimeNMS)),w
	skipz
	goto	u151
	goto	u150
u151:
	goto	l1524
u150:
	line	385
	
l389:	
	return
	opt stack 0
GLOBAL	__end_of_delay_ms
	__end_of_delay_ms:
;; =============== function _delay_ms ends ============

	signat	_delay_ms,4216
	global	_start
psect	text167,local,class=CODE,delta=2
global __ptext167
__ptext167:

;; *************** function _start *****************
;; Defined at:
;;		line 171 in file "app.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMONBANK0hll BANK0lh BANK0llBANK1hhhBANK1hhhBANK1hhhBANK1hhlBANK1hhl BANK1hl  BANK1l
;;      Params:         0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text167
	file	"app.c"
	line	171
	global	__size_of_start
	__size_of_start	equ	__end_of_start-_start
	
_start:	
	opt	stack 6
; Regs used in _start: [wreg+status,2]
	line	175
	
l1436:	
;app.c: 175: OSCCON = 0B01110001;
	movlw	(071h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(143)^080h	;volatile
	line	182
	
l1438:	
;app.c: 182: INTCON = 0;
	clrf	(11)	;volatile
	line	184
	
l1440:	
;app.c: 184: PORTA = 0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(5)	;volatile
	line	185
;app.c: 185: TRISA = 0B00100010;
	movlw	(022h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(133)^080h	;volatile
	line	193
;app.c: 193: WPUA = 0X0A;
	movlw	(0Ah)
	movwf	(149)^080h	;volatile
	line	194
	
l1442:	
;app.c: 194: WPUA1 = 1 ;
	bsf	(1193/8)^080h,(1193)&7
	line	195
	
l1444:	
;app.c: 195: WPUA5 = 1 ;
	bsf	(1197/8)^080h,(1197)&7
	line	197
;app.c: 197: OPTION = 0B00001000;
	movlw	(08h)
	movwf	(129)^080h	;volatile
	line	211
	
l1446:	
;app.c: 211: TMR2 = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(17)	;volatile
	line	213
	
l1448:	
;app.c: 213: PR2 = 200;
	movlw	(0C8h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(146)^080h	;volatile
	line	214
	
l1450:	
;app.c: 214: TMR2IF = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(97/8),(97)&7
	line	215
	
l1452:	
;app.c: 215: TMR2IE = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1121/8)^080h,(1121)&7
	line	216
	
l1454:	
;app.c: 216: TMR2ON = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(146/8),(146)&7
	line	217
	
l1456:	
;app.c: 217: PEIE=1;
	bsf	(94/8),(94)&7
	line	219
	
l1458:	
;app.c: 219: GIE = 1;
	bsf	(95/8),(95)&7
	line	223
	
l361:	
	return
	opt stack 0
GLOBAL	__end_of_start
	__end_of_start:
;; =============== function _start ends ============

	signat	_start,88
	global	_delay_50us
psect	text168,local,class=CODE,delta=2
global __ptext168
__ptext168:

;; *************** function _delay_50us *****************
;; Defined at:
;;		line 386 in file "app.c"
;; Parameters:    Size  Location     Type
;;  us50            2    4[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 15F/0
;;		On exit  : 15F/0
;;		Unchanged: FFEA0/0
;; Data sizes:     COMMONBANK0hll BANK0lh BANK0llBANK1hhhBANK1hhhBANK1hhhBANK1hhlBANK1hhl BANK1hl  BANK1l
;;      Params:         2       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         2       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_TM1650_START
;;		_TM1650_STOP
;;		_write_8bit
;;		_read_8bit
;; This function uses a non-reentrant model
;;
psect	text168
	file	"app.c"
	line	386
	global	__size_of_delay_50us
	__size_of_delay_50us	equ	__end_of_delay_50us-_delay_50us
	
_delay_50us:	
	opt	stack 4
; Regs used in _delay_50us: [wreg+status,2+status,0]
	line	387
	
l1432:	
;app.c: 387: cntTime50uS = us50 ;
	movf	(delay_50us@us50+1),w
	movwf	(_cntTime50uS+1)
	movf	(delay_50us@us50),w
	movwf	(_cntTime50uS)
	line	388
;app.c: 388: while(cntTime50uS>0) ;
	
l1434:	
	movf	((_cntTime50uS+1)),w
	iorwf	((_cntTime50uS)),w
	skipz
	goto	u11
	goto	u10
u11:
	goto	l1434
u10:
	line	389
	
l395:	
	return
	opt stack 0
GLOBAL	__end_of_delay_50us
	__end_of_delay_50us:
;; =============== function _delay_50us ends ============

	signat	_delay_50us,4216
	global	_ISR
psect	text169,local,class=CODE,delta=2
global __ptext169
__ptext169:

;; *************** function _ISR *****************
;; Defined at:
;;		line 293 in file "app.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 20/0
;;		Unchanged: FFFDF/0
;; Data sizes:     COMMONBANK0hll BANK0lh BANK0llBANK1hhhBANK1hhhBANK1hhhBANK1hhlBANK1hhl BANK1hl  BANK1l
;;      Params:         0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          4       0       0       0       0       0       0       0       0       0       0
;;      Totals:         4       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text169
	file	"app.c"
	line	293
	global	__size_of_ISR
	__size_of_ISR	equ	__end_of_ISR-_ISR
	
_ISR:	
	opt	stack 4
; Regs used in _ISR: [wreg+status,2+status,0]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	swapf	status,w
	movwf	(??_ISR+2)
	movf	pclath,w
	movwf	(??_ISR+3)
	ljmp	_ISR
psect	text169
	line	295
	
i1l1460:	
;app.c: 295: if(TMR2IF)
	bcf	status, 5	;RP0=0, select bank0
	btfss	(97/8),(97)&7
	goto	u2_21
	goto	u2_20
u2_21:
	goto	i1l383
u2_20:
	line	297
	
i1l1462:	
;app.c: 298: Read_Code_Success=1;
	bcf	(97/8),(97)&7
	line	299
	
i1l1464:	
;app.c: 299: if(cntTime1MS<20) {
	movlw	high(014h)
	subwf	(_cntTime1MS+1),w
	movlw	low(014h)
	skipnz
	subwf	(_cntTime1MS),w
	skipnc
	goto	u3_21
	goto	u3_20
u3_21:
	goto	i1l1468
u3_20:
	line	300
	
i1l1466:	
;app.c: 300: cntTime1MS++ ;
	incf	(_cntTime1MS),f
	skipnz
	incf	(_cntTime1MS+1),f
	line	301
;app.c: 301: }
	goto	i1l366
	line	303
	
i1l1468:	
;app.c: 304: t1MsFlg = 1 ;
	clrf	(_cntTime1MS)
	clrf	(_cntTime1MS+1)
	line	305
	
i1l1470:	
;app.c: 305: if(cntTimeNMS>0) {
	movf	(_cntTimeNMS+1),w
	iorwf	(_cntTimeNMS),w
	skipnz
	goto	u4_21
	goto	u4_20
u4_21:
	goto	i1l367
u4_20:
	line	306
	
i1l1472:	
;app.c: 306: cntTimeNMS-- ;
	movlw	low(01h)
	subwf	(_cntTimeNMS),f
	movlw	high(01h)
	skipc
	decf	(_cntTimeNMS+1),f
	subwf	(_cntTimeNMS+1),f
	line	307
	
i1l367:	
	line	309
;app.c: 307: }
;app.c: 309: if(cntTime5MS<5) {
	movlw	high(05h)
	subwf	(_cntTime5MS+1),w
	movlw	low(05h)
	skipnz
	subwf	(_cntTime5MS),w
	skipnc
	goto	u5_21
	goto	u5_20
u5_21:
	goto	i1l1476
u5_20:
	line	310
	
i1l1474:	
;app.c: 310: cntTime5MS++ ;
	incf	(_cntTime5MS),f
	skipnz
	incf	(_cntTime5MS+1),f
	line	311
;app.c: 311: }
	goto	i1l1484
	line	313
	
i1l1476:	
;app.c: 312: else {
;app.c: 313: cntTime5MS = 0 ;
	clrf	(_cntTime5MS)
	clrf	(_cntTime5MS+1)
	line	314
	
i1l1478:	
;app.c: 314: t5MSFlg = 1 ;
	clrf	(_t5MSFlg)
	incf	(_t5MSFlg),f
	line	315
	
i1l1480:	
;app.c: 315: if(uvledGrB2<uvledGrB) {
	movf	(_uvledGrB+1),w
	subwf	(_uvledGrB2+1),w
	skipz
	goto	u6_25
	movf	(_uvledGrB),w
	subwf	(_uvledGrB2),w
u6_25:
	skipnc
	goto	u6_21
	goto	u6_20
u6_21:
	goto	i1l1484
u6_20:
	line	316
	
i1l1482:	
;app.c: 316: uvledGrB2 ++ ;
	incf	(_uvledGrB2),f
	skipnz
	incf	(_uvledGrB2+1),f
	line	321
	
i1l1484:	
;app.c: 317: }
;app.c: 318: }
;app.c: 321: if(cntTime1S<1000) {
	movlw	high(03E8h)
	subwf	(_cntTime1S+1),w
	movlw	low(03E8h)
	skipnz
	subwf	(_cntTime1S),w
	skipnc
	goto	u7_21
	goto	u7_20
u7_21:
	goto	i1l1488
u7_20:
	line	322
	
i1l1486:	
;app.c: 322: cntTime1S++ ;
	incf	(_cntTime1S),f
	skipnz
	incf	(_cntTime1S+1),f
	line	323
;app.c: 323: }
	goto	i1l366
	line	325
	
i1l1488:	
;app.c: 324: else {
;app.c: 325: cntTime1S = 0 ;
	clrf	(_cntTime1S)
	clrf	(_cntTime1S+1)
	line	326
	
i1l1490:	
;app.c: 326: if(gLedCnt>120) {
	movlw	high(079h)
	subwf	(_gLedCnt+1),w
	movlw	low(079h)
	skipnz
	subwf	(_gLedCnt),w
	skipc
	goto	u8_21
	goto	u8_20
u8_21:
	goto	i1l1494
u8_20:
	goto	i1l366
	line	329
	
i1l1494:	
;app.c: 329: else if(gLedCnt>0) {
	movf	(_gLedCnt+1),w
	iorwf	(_gLedCnt),w
	skipnz
	goto	u9_21
	goto	u9_20
u9_21:
	goto	i1l366
u9_20:
	line	330
	
i1l1496:	
;app.c: 330: gLedCnt-- ;
	movlw	low(01h)
	subwf	(_gLedCnt),f
	movlw	high(01h)
	skipc
	decf	(_gLedCnt+1),f
	subwf	(_gLedCnt+1),f
	line	331
	
i1l1498:	
;app.c: 331: tm1650UpdateFlg = 1 ;
	clrf	(_tm1650UpdateFlg)
	incf	(_tm1650UpdateFlg),f
	line	332
	
i1l1500:	
;app.c: 332: if(gLedCnt==0) {
	movf	((_gLedCnt+1)),w
	iorwf	((_gLedCnt)),w
	skipz
	goto	u10_21
	goto	u10_20
u10_21:
	goto	i1l374
u10_20:
	line	333
	
i1l1502:	
;app.c: 333: gWState = 0x02 ;
	movlw	(02h)
	movwf	(_gWState)
	line	334
	
i1l1504:	
;app.c: 334: uvledGrB = 0 ;
	clrf	(_uvledGrB)
	clrf	(_uvledGrB+1)
	line	335
	
i1l1506:	
;app.c: 335: longState = 0 ;
	clrf	(_longState)
	goto	i1l366
	line	338
	
i1l374:	
	line	339
	
i1l366:	
	line	341
;app.c: 336: }
;app.c: 337: }
;app.c: 338: }
;app.c: 339: }
;app.c: 341: if(cntTime50uS>0) {
	movf	(_cntTime50uS+1),w
	iorwf	(_cntTime50uS),w
	skipnz
	goto	u11_21
	goto	u11_20
u11_21:
	goto	i1l377
u11_20:
	line	342
	
i1l1508:	
;app.c: 342: cntTime50uS--;
	movlw	low(01h)
	subwf	(_cntTime50uS),f
	movlw	high(01h)
	skipc
	decf	(_cntTime50uS+1),f
	subwf	(_cntTime50uS+1),f
	line	343
	
i1l377:	
	line	345
;app.c: 343: }
;app.c: 345: if(pGrB<16) {
	movlw	(010h)
	subwf	(_pGrB),w
	skipnc
	goto	u12_21
	goto	u12_20
u12_21:
	goto	i1l1512
u12_20:
	line	346
	
i1l1510:	
;app.c: 346: pGrB++ ;
	incf	(_pGrB),f
	line	347
;app.c: 347: }
	goto	i1l1514
	line	349
	
i1l1512:	
;app.c: 348: else {
;app.c: 349: pGrB = 0 ;
	clrf	(_pGrB)
	line	351
	
i1l1514:	
;app.c: 350: }
;app.c: 351: if(uvledGrB==0) {
	movf	((_uvledGrB+1)),w
	iorwf	((_uvledGrB)),w
	skipz
	goto	u13_21
	goto	u13_20
u13_21:
	goto	i1l1518
u13_20:
	line	352
	
i1l1516:	
;app.c: 352: uvledGrB2 = 0 ;
	clrf	(_uvledGrB2)
	clrf	(_uvledGrB2+1)
	line	355
	
i1l1518:	
;app.c: 353: }
;app.c: 355: if(pGrB<uvledGrB2) {
	movf	(_pGrB),w
	movwf	(??_ISR+0)+0
	clrf	(??_ISR+0)+0+1
	movf	(_uvledGrB2+1),w
	subwf	1+(??_ISR+0)+0,w
	skipz
	goto	u14_25
	movf	(_uvledGrB2),w
	subwf	0+(??_ISR+0)+0,w
u14_25:
	skipnc
	goto	u14_21
	goto	u14_20
u14_21:
	goto	i1l381
u14_20:
	line	356
	
i1l1520:	
;app.c: 356: PA4 = 1 ;
	bsf	(44/8),(44)&7
	line	357
;app.c: 357: }
	goto	i1l383
	line	358
	
i1l381:	
	line	359
;app.c: 358: else {
;app.c: 359: PA4 = 0 ;
	bcf	(44/8),(44)&7
	line	377
	
i1l383:	
	movf	(??_ISR+3),w
	movwf	pclath
	swapf	(??_ISR+2)^0FFFFFF80h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_ISR
	__end_of_ISR:
;; =============== function _ISR ends ============

	signat	_ISR,88
psect	text170,local,class=CODE,delta=2
global __ptext170
__ptext170:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
