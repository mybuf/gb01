//Deviec:CM8M02X
//-----------------------Variable---------------------------------
		_ISR		EQU		1641DDH
		_cntTime1MS		EQU		40H
		_cntTimeNMS		EQU		66H
		_cntTime5MS		EQU		46H
		_cntTime1S		EQU		42H
		_t5MSFlg		EQU		52H
		_gLedCnt		EQU		48H
		_gLedCntBak		EQU		68H
		_DispCode		EQU		1641DDH
		_tm1650UpdateFlg		EQU		6CH
		_swBuf1		EQU		50H
		_swBuf2		EQU		51H
		_cntTime50uS		EQU		44H
		_uvledGrB		EQU		4AH
		_uvledGrB2		EQU		4CH
		_pGrB		EQU		4FH
		_gWState		EQU		6BH
		_cntPDDown		EQU		6AH
		_longState		EQU		4EH
		_ISR		EQU		1641DDH
//-----------------------Variable END---------------------------------
		ORG		0000H
		LJUMP 	0AH 			//0000 	380A
		ORG		0004H
		STR 	7EH 			//0004 	01FE
		SWAPR 	STATUS,0 		//0005 	0703
		STR 	55H 			//0006 	01D5
		LDR 	PCLATH,0 		//0007 	080A
		STR 	56H 			//0008 	01D6
		LJUMP 	158H 			//0009 	3958
		LJUMP 	30AH 			//000A 	3B0A

		//;app.c: 395: if(1) {
		LCALL 	280H 			//000B 	3280
		LDWI 	AH 			//000C 	2A0A

		//;app.c: 396: PA4 = 0 ;
		BCR 	5H,4 			//000D 	1205

		//;app.c: 397: tm1650UpdateFlg = 1 ;
		CLRR 	6CH 			//000E 	016C
		INCR	6CH,1 			//000F 	09EC

		//;app.c: 399: cntSWDown = 0 ;
		CLRR 	46H 			//0010 	0146
		CLRR 	47H 			//0011 	0147

		//;app.c: 400: gLedCnt = 0 ;
		CLRR 	48H 			//0012 	0148
		CLRR 	49H 			//0013 	0149

		//;app.c: 401: cntTime1S = 0 ;
		CLRR 	42H 			//0014 	0142
		CLRR 	43H 			//0015 	0143

		//;app.c: 402: gWState = 0x01 ;
		CLRR 	6BH 			//0016 	016B
		INCR	6BH,1 			//0017 	09EB

		//;app.c: 403: cntPDDown = 10 ;
		STR 	6AH 			//0018 	01EA

		//;app.c: 404: gLedCntBak = 60 ;
		LDWI 	3CH 			//0019 	2A3C
		STR 	68H 			//001A 	01E8
		LDWI 	32H 			//001B 	2A32
		CLRR 	69H 			//001C 	0169

		//;app.c: 405: longState = 0 ;
		CLRR 	4EH 			//001D 	014E

		//;app.c: 406: }
		//;app.c: 407: delay_ms(50) ;
		STR 	57H 			//001E 	01D7
		CLRR 	58H 			//001F 	0158
		LCALL 	2E1H 			//0020 	32E1
		LDWI 	20H 			//0021 	2A20

		//;app.c: 409: TM1650_SystemCmd(0x20,0x00,0x00,0x01);
		CLRR 	5BH 			//0022 	015B
		CLRR 	5CH 			//0023 	015C
		CLRR 	5DH 			//0024 	015D
		INCR	5DH,1 			//0025 	09DD
		LCALL 	2D7H 			//0026 	32D7

		//;app.c: 410: delay_ms(200) ;
		LDWI 	C8H 			//0027 	2AC8
		STR 	57H 			//0028 	01D7
		CLRR 	58H 			//0029 	0158
		LCALL 	2E1H 			//002A 	32E1

		//;app.c: 412: delay_ms(50) ;
		LDWI 	32H 			//002B 	2A32
		STR 	57H 			//002C 	01D7
		CLRR 	58H 			//002D 	0158
		LCALL 	2E1H 			//002E 	32E1

		//;app.c: 415: if(tm1650UpdateFlg) {
		LDR 	6CH,0 			//002F 	086C
		BTSC 	STATUS,2 		//0030 	1503
		LJUMP 	8BH 			//0031 	388B
		LDWI 	64H 			//0032 	2A64

		//;app.c: 416: tm1650UpdateFlg = 0 ;
		CLRR 	6CH 			//0033 	016C

		//;app.c: 417: bai = gLedCnt/100 ;
		STR 	57H 			//0034 	01D7
		CLRR 	58H 			//0035 	0158
		LDR 	49H,0 			//0036 	0849
		STR 	5AH 			//0037 	01DA
		LDR 	48H,0 			//0038 	0848
		STR 	59H 			//0039 	01D9
		LCALL 	20AH 			//003A 	320A
		LDR 	57H,0 			//003B 	0857
		STR 	63H 			//003C 	01E3

		//;app.c: 418: shi = gLedCnt/10%10 ;
		LDWI 	AH 			//003D 	2A0A
		STR 	5EH 			//003E 	01DE
		CLRR 	5FH 			//003F 	015F
		STR 	57H 			//0040 	01D7
		CLRR 	58H 			//0041 	0158
		LDR 	49H,0 			//0042 	0849
		STR 	5AH 			//0043 	01DA
		LDR 	48H,0 			//0044 	0848
		STR 	59H 			//0045 	01D9
		LCALL 	20AH 			//0046 	320A
		LDR 	58H,0 			//0047 	0858
		STR 	61H 			//0048 	01E1
		LDR 	57H,0 			//0049 	0857
		STR 	60H 			//004A 	01E0
		LCALL 	25CH 			//004B 	325C
		LDR 	5EH,0 			//004C 	085E
		STR 	65H 			//004D 	01E5

		//;app.c: 419: gew = gLedCnt%10 ;
		LDWI 	AH 			//004E 	2A0A
		STR 	5EH 			//004F 	01DE
		CLRR 	5FH 			//0050 	015F
		LDR 	49H,0 			//0051 	0849
		STR 	61H 			//0052 	01E1
		LDR 	48H,0 			//0053 	0848
		STR 	60H 			//0054 	01E0
		LCALL 	25CH 			//0055 	325C
		LDR 	5EH,0 			//0056 	085E
		STR 	64H 			//0057 	01E4

		//;app.c: 421: TM1650_send(0x6C,DispCode[gew]) ;
		ADDWI 	1H 			//0058 	2701
		STR 	FSR 			//0059 	0184
		LCALL 	29DH 			//005A 	329D
		STR 	5BH 			//005B 	01DB
		LDWI 	6CH 			//005C 	2A6C
		LCALL 	303H 			//005D 	3303

		//;app.c: 422: if(gLedCnt>0) {
		LDR 	49H,0 			//005E 	0849
		IORWR 	48H,0 			//005F 	0348
		BTSC 	STATUS,2 		//0060 	1503
		LJUMP 	76H 			//0061 	3876

		//;app.c: 423: if(gLedCnt>99) {
		LDWI 	0H 			//0062 	2A00
		SUBWR 	49H,0 			//0063 	0C49
		LDWI 	64H 			//0064 	2A64
		BTSC 	STATUS,2 		//0065 	1503
		SUBWR 	48H,0 			//0066 	0C48
		BTSC 	STATUS,0 		//0067 	1403
		LJUMP 	76H 			//0068 	3876

		//;app.c: 426: }
		//;app.c: 425: TM1650_send(0x6A , DispCode[shi]) ;
		//;app.c: 424: TM1650_send(0x68 , DispCode[bai]);
		LDWI 	68H 			//0069 	2A68

		//;app.c: 427: else {
		//;app.c: 428: TM1650_send(0x68 , 0x00) ;
		CLRR 	5BH 			//006A 	015B
		LCALL 	303H 			//006B 	3303

		//;app.c: 429: if(gLedCnt>9) {
		LDWI 	0H 			//006C 	2A00
		SUBWR 	49H,0 			//006D 	0C49
		LDWI 	AH 			//006E 	2A0A
		BTSC 	STATUS,2 		//006F 	1503
		SUBWR 	48H,0 			//0070 	0C48
		BTSC 	STATUS,0 		//0071 	1403
		LJUMP 	7DH 			//0072 	387D

		//;app.c: 431: }
		//;app.c: 430: TM1650_send(0x6A , DispCode[shi]) ;
		LDWI 	6AH 			//0073 	2A6A

		//;app.c: 432: else {
		//;app.c: 433: TM1650_send(0x6A , 0x00) ;
		CLRR 	5BH 			//0074 	015B
		LJUMP 	83H 			//0075 	3883

		//;app.c: 437: else {
		//;app.c: 438: TM1650_send(0x68 , DispCode[bai]);
		LDR 	63H,0 			//0076 	0863
		ADDWI 	1H 			//0077 	2701
		STR 	FSR 			//0078 	0184
		LCALL 	29DH 			//0079 	329D
		STR 	5BH 			//007A 	01DB
		LDWI 	68H 			//007B 	2A68
		LCALL 	303H 			//007C 	3303

		//;app.c: 439: TM1650_send(0x6A , DispCode[shi]) ;
		LDR 	65H,0 			//007D 	0865
		ADDWI 	1H 			//007E 	2701
		STR 	FSR 			//007F 	0184
		LCALL 	29DH 			//0080 	329D
		STR 	5BH 			//0081 	01DB
		LDWI 	6AH 			//0082 	2A6A
		LCALL 	303H 			//0083 	3303

		//;app.c: 440: }
		//;app.c: 441: TM1650_send(0x6C , DispCode[gew]);
		LDR 	64H,0 			//0084 	0864
		ADDWI 	1H 			//0085 	2701
		STR 	FSR 			//0086 	0184
		LCALL 	29DH 			//0087 	329D
		STR 	5BH 			//0088 	01DB
		LDWI 	6CH 			//0089 	2A6C
		LCALL 	303H 			//008A 	3303

		//;app.c: 448: if(1) {
		LDR 	52H,0 			//008B 	0852
		BTSC 	STATUS,2 		//008C 	1503
		LJUMP 	2FH 			//008D 	382F

		//;app.c: 449: swBuf1 = TM1650_read() ;
		LCALL 	2FBH 			//008E 	32FB
		STR 	50H 			//008F 	01D0

		//;app.c: 450: if(0X40 & swBuf1) {
		BTSS 	50H,6 			//0090 	1F50

		//;app.c: 453: else if(0X40 & swBuf2) {
		//;app.c: 452: }
		BTSS 	51H,6 			//0091 	1F51
		LJUMP 	126H 			//0092 	3926

		//;app.c: 454: if(swBuf2 == 0x47) {
		LDR 	51H,0 			//0093 	0851
		XORWI 	47H 			//0094 	2647
		BTSS 	STATUS,2 		//0095 	1D03
		LJUMP 	C3H 			//0096 	38C3

		//;app.c: 455: cntTime1S = 0 ;
		CLRR 	42H 			//0097 	0142
		CLRR 	43H 			//0098 	0143

		//;app.c: 456: cntTime1MS = 0 ;
		CLRR 	40H 			//0099 	0140
		CLRR 	41H 			//009A 	0141

		//;app.c: 457: tm1650UpdateFlg = 1 ;
		CLRR 	6CH 			//009B 	016C
		INCR	6CH,1 			//009C 	09EC

		//;app.c: 458: if(gLedCnt>0) {
		LDR 	49H,0 			//009D 	0849
		IORWR 	48H,0 			//009E 	0348
		BTSC 	STATUS,2 		//009F 	1503
		LJUMP 	A7H 			//00A0 	38A7
		LDWI 	2H 			//00A1 	2A02

		//;app.c: 459: uvledGrB = 0 ;
		CLRR 	4AH 			//00A2 	014A
		CLRR 	4BH 			//00A3 	014B

		//;app.c: 460: gLedCnt = 0 ;
		CLRR 	48H 			//00A4 	0148
		CLRR 	49H 			//00A5 	0149

		//;app.c: 461: gWState = 2 ;
		LJUMP 	B0H 			//00A6 	38B0

		//;app.c: 462: }
		//;app.c: 463: else {
		//;app.c: 464: uvledGrB = 8 ;
		LDWI 	8H 			//00A7 	2A08
		STR 	4AH 			//00A8 	01CA
		LDWI 	78H 			//00A9 	2A78
		CLRR 	4BH 			//00AA 	014B

		//;app.c: 465: gLedCnt = 120 ;
		STR 	48H 			//00AB 	01C8
		CLRR 	49H 			//00AC 	0149

		//;app.c: 466: gLedCntBak = 120 ;
		STR 	68H 			//00AD 	01E8
		LDWI 	4H 			//00AE 	2A04
		CLRR 	69H 			//00AF 	0169

		//;app.c: 467: gWState = 4 ;
		STR 	6BH 			//00B0 	01EB

		//;app.c: 468: }
		//;app.c: 472: if(0==longState) {
		LDR 	4EH,1 			//00B1 	08CE
		BTSS 	STATUS,2 		//00B2 	1D03
		LJUMP 	B7H 			//00B3 	38B7

		//;app.c: 473: longState = 1 ;
		CLRR 	4EH 			//00B4 	014E
		INCR	4EH,1 			//00B5 	09CE

		//;app.c: 474: }
		LJUMP 	126H 			//00B6 	3926

		//;app.c: 475: else if(1==longState) {
		DECRSZ 	4EH,0 		//00B7 	0E4E
		LJUMP 	BBH 			//00B8 	38BB

		//;app.c: 476: longState = 2 ;
		LDWI 	2H 			//00B9 	2A02
		LJUMP 	125H 			//00BA 	3925

		//;app.c: 477: }
		//;app.c: 478: else if(6==longState) {
		LDR 	4EH,0 			//00BB 	084E
		XORWI 	6H 			//00BC 	2606
		BTSS 	STATUS,2 		//00BD 	1D03
		LJUMP 	C1H 			//00BE 	38C1

		//;app.c: 479: longState = 7 ;
		LDWI 	7H 			//00BF 	2A07
		LJUMP 	125H 			//00C0 	3925

		//;app.c: 480: }
		//;app.c: 481: else {
		//;app.c: 482: longState = 0 ;
		CLRR 	4EH 			//00C1 	014E
		LJUMP 	126H 			//00C2 	3926

		//;app.c: 488: else if(swBuf2 == 0x5F) {
		LDR 	51H,0 			//00C3 	0851
		XORWI 	5FH 			//00C4 	265F
		BTSS 	STATUS,2 		//00C5 	1D03
		LJUMP 	F6H 			//00C6 	38F6

		//;app.c: 489: cntTime1S = 0 ;
		CLRR 	42H 			//00C7 	0142
		CLRR 	43H 			//00C8 	0143

		//;app.c: 490: cntTime1MS = 0 ;
		CLRR 	40H 			//00C9 	0140
		CLRR 	41H 			//00CA 	0141

		//;app.c: 491: tm1650UpdateFlg = 1 ;
		CLRR 	6CH 			//00CB 	016C
		INCR	6CH,1 			//00CC 	09EC

		//;app.c: 492: if(gLedCnt>0) {
		LDR 	49H,0 			//00CD 	0849
		IORWR 	48H,0 			//00CE 	0348
		BTSC 	STATUS,2 		//00CF 	1503
		LJUMP 	D7H 			//00D0 	38D7
		LDWI 	2H 			//00D1 	2A02

		//;app.c: 493: uvledGrB = 0 ;
		CLRR 	4AH 			//00D2 	014A
		CLRR 	4BH 			//00D3 	014B

		//;app.c: 494: gLedCnt = 0 ;
		CLRR 	48H 			//00D4 	0148
		CLRR 	49H 			//00D5 	0149

		//;app.c: 495: gWState = 2 ;
		LJUMP 	E0H 			//00D6 	38E0

		//;app.c: 496: }
		//;app.c: 497: else {
		//;app.c: 498: uvledGrB = 16 ;
		LDWI 	10H 			//00D7 	2A10
		STR 	4AH 			//00D8 	01CA
		LDWI 	3CH 			//00D9 	2A3C
		CLRR 	4BH 			//00DA 	014B

		//;app.c: 499: gLedCnt = 60 ;
		STR 	48H 			//00DB 	01C8
		CLRR 	49H 			//00DC 	0149

		//;app.c: 500: gLedCntBak = 60 ;
		STR 	68H 			//00DD 	01E8
		LDWI 	4H 			//00DE 	2A04
		CLRR 	69H 			//00DF 	0169

		//;app.c: 501: gWState = 4 ;
		STR 	6BH 			//00E0 	01EB

		//;app.c: 502: }
		//;app.c: 506: if(4==longState) {
		LDR 	4EH,0 			//00E1 	084E
		XORWI 	4H 			//00E2 	2604
		BTSS 	STATUS,2 		//00E3 	1D03
		LJUMP 	E7H 			//00E4 	38E7

		//;app.c: 507: longState = 5 ;
		LDWI 	5H 			//00E5 	2A05
		LJUMP 	125H 			//00E6 	3925

		//;app.c: 508: }
		//;app.c: 509: else if(5==longState) {
		LDR 	4EH,0 			//00E7 	084E
		XORWI 	5H 			//00E8 	2605
		BTSS 	STATUS,2 		//00E9 	1D03
		LJUMP 	EDH 			//00EA 	38ED

		//;app.c: 510: longState = 6 ;
		LDWI 	6H 			//00EB 	2A06
		LJUMP 	125H 			//00EC 	3925

		//;app.c: 511: }
		//;app.c: 512: else if(8==longState) {
		LDR 	4EH,0 			//00ED 	084E
		XORWI 	8H 			//00EE 	2608
		BTSS 	STATUS,2 		//00EF 	1D03
		LJUMP 	C1H 			//00F0 	38C1

		//;app.c: 513: gLedCnt = 888 ;
		LDWI 	78H 			//00F1 	2A78
		STR 	48H 			//00F2 	01C8
		LDWI 	3H 			//00F3 	2A03
		STR 	49H 			//00F4 	01C9
		LJUMP 	C1H 			//00F5 	38C1

		//;app.c: 522: else if(swBuf2 == 0x77) {
		LDR 	51H,0 			//00F6 	0851
		XORWI 	77H 			//00F7 	2677
		BTSS 	STATUS,2 		//00F8 	1D03
		LJUMP 	126H 			//00F9 	3926

		//;app.c: 523: cntTime1S = 0 ;
		CLRR 	42H 			//00FA 	0142
		CLRR 	43H 			//00FB 	0143

		//;app.c: 524: cntTime1MS = 0 ;
		CLRR 	40H 			//00FC 	0140
		CLRR 	41H 			//00FD 	0141

		//;app.c: 525: tm1650UpdateFlg = 1 ;
		CLRR 	6CH 			//00FE 	016C
		INCR	6CH,1 			//00FF 	09EC

		//;app.c: 526: if(gLedCnt>0) {
		LDR 	49H,0 			//0100 	0849
		IORWR 	48H,0 			//0101 	0348
		BTSC 	STATUS,2 		//0102 	1503
		LJUMP 	10AH 			//0103 	390A
		LDWI 	2H 			//0104 	2A02

		//;app.c: 527: uvledGrB = 0 ;
		CLRR 	4AH 			//0105 	014A
		CLRR 	4BH 			//0106 	014B

		//;app.c: 528: gLedCnt = 0 ;
		CLRR 	48H 			//0107 	0148
		CLRR 	49H 			//0108 	0149

		//;app.c: 529: gWState = 2 ;
		LJUMP 	113H 			//0109 	3913

		//;app.c: 530: }
		//;app.c: 531: else {
		//;app.c: 532: uvledGrB = 16 ;
		LDWI 	10H 			//010A 	2A10
		STR 	4AH 			//010B 	01CA
		LDWI 	1EH 			//010C 	2A1E
		CLRR 	4BH 			//010D 	014B

		//;app.c: 533: gLedCnt = 30 ;
		STR 	48H 			//010E 	01C8
		CLRR 	49H 			//010F 	0149

		//;app.c: 534: gLedCntBak = 30 ;
		STR 	68H 			//0110 	01E8
		LDWI 	4H 			//0111 	2A04
		CLRR 	69H 			//0112 	0169

		//;app.c: 535: gWState = 4 ;
		STR 	6BH 			//0113 	01EB

		//;app.c: 536: }
		//;app.c: 539: if(2==longState) {
		LDR 	4EH,0 			//0114 	084E
		XORWI 	2H 			//0115 	2602
		BTSS 	STATUS,2 		//0116 	1D03
		LJUMP 	11AH 			//0117 	391A

		//;app.c: 540: longState = 3 ;
		LDWI 	3H 			//0118 	2A03
		LJUMP 	125H 			//0119 	3925

		//;app.c: 541: }
		//;app.c: 542: else if(3==longState) {
		LDR 	4EH,0 			//011A 	084E
		XORWI 	3H 			//011B 	2603
		BTSS 	STATUS,2 		//011C 	1D03
		LJUMP 	120H 			//011D 	3920

		//;app.c: 543: longState = 4 ;
		LDWI 	4H 			//011E 	2A04
		LJUMP 	125H 			//011F 	3925

		//;app.c: 544: }
		//;app.c: 545: else if(7==longState) {
		LDR 	4EH,0 			//0120 	084E
		XORWI 	7H 			//0121 	2607
		BTSS 	STATUS,2 		//0122 	1D03
		LJUMP 	C1H 			//0123 	38C1

		//;app.c: 546: longState = 8 ;
		LDWI 	8H 			//0124 	2A08
		STR 	4EH 			//0125 	01CE

		//;app.c: 547: }
		//;app.c: 550: }
		//;app.c: 553: }
		//;app.c: 554: }
		//;app.c: 555: swBuf2 = swBuf1 ;
		LDR 	50H,0 			//0126 	0850
		STR 	51H 			//0127 	01D1

		//;app.c: 559: if(0x03 & gWState) {
		//;app.c: 556: }
		//;app.c: 558: if(1) {
		LDR 	6BH,0 			//0128 	086B
		ANDWI 	3H 			//0129 	2403
		BTSC 	STATUS,2 		//012A 	1503
		LJUMP 	156H 			//012B 	3956

		//;app.c: 560: if(1==PA5) {
		BCR 	STATUS,5 		//012C 	1283
		BTSS 	5H,5 			//012D 	1E85
		LJUMP 	145H 			//012E 	3945

		//;app.c: 561: if(cntPDDown<20) {
		LDWI 	14H 			//012F 	2A14
		SUBWR 	6AH,0 			//0130 	0C6A
		BTSC 	STATUS,0 		//0131 	1403
		LJUMP 	156H 			//0132 	3956

		//;app.c: 562: cntPDDown++ ;
		INCR	6AH,1 			//0133 	09EA

		//;app.c: 563: if(20==cntPDDown && gWState==0x01) {
		LDR 	6AH,0 			//0134 	086A
		XORWI 	14H 			//0135 	2614
		BTSS 	STATUS,2 		//0136 	1D03
		LJUMP 	156H 			//0137 	3956
		DECRSZ 	6BH,0 		//0138 	0E6B
		LJUMP 	156H 			//0139 	3956

		//;app.c: 564: cntTime1S = 0 ;
		CLRR 	42H 			//013A 	0142
		CLRR 	43H 			//013B 	0143

		//;app.c: 565: cntTime1MS = 0 ;
		CLRR 	40H 			//013C 	0140
		CLRR 	41H 			//013D 	0141

		//;app.c: 566: gLedCnt = gLedCntBak ;
		LDR 	69H,0 			//013E 	0869
		STR 	49H 			//013F 	01C9
		LDR 	68H,0 			//0140 	0868
		STR 	48H 			//0141 	01C8

		//;app.c: 567: uvledGrB = 16 ;
		LDWI 	10H 			//0142 	2A10
		STR 	4AH 			//0143 	01CA
		LJUMP 	153H 			//0144 	3953

		//;app.c: 572: else {
		//;app.c: 573: if(cntPDDown>0) {
		LDR 	6AH,0 			//0145 	086A
		BTSC 	STATUS,2 		//0146 	1503
		LJUMP 	156H 			//0147 	3956

		//;app.c: 574: cntPDDown-- ;
		DECRSZ 	6AH,1 		//0148 	0EEA

		//;app.c: 575: if(0==cntPDDown) {
		LJUMP 	156H 			//0149 	3956

		//;app.c: 576: gWState = 1 ;
		CLRR 	6BH 			//014A 	016B
		INCR	6BH,1 			//014B 	09EB

		//;app.c: 577: cntTime1S = 0 ;
		CLRR 	42H 			//014C 	0142
		CLRR 	43H 			//014D 	0143

		//;app.c: 578: cntTime1MS = 0 ;
		CLRR 	40H 			//014E 	0140
		CLRR 	41H 			//014F 	0141

		//;app.c: 579: gLedCnt = 0 ;
		CLRR 	48H 			//0150 	0148
		CLRR 	49H 			//0151 	0149

		//;app.c: 580: uvledGrB = 0 ;
		CLRR 	4AH 			//0152 	014A
		CLRR 	4BH 			//0153 	014B

		//;app.c: 568: tm1650UpdateFlg = 1 ;
		CLRR 	6CH 			//0154 	016C
		INCR	6CH,1 			//0155 	09EC

		//;app.c: 582: }
		//;app.c: 583: }
		//;app.c: 584: }
		//;app.c: 585: }
		//;app.c: 586: }
		//;app.c: 589: t5MSFlg = 0 ;
		CLRR 	52H 			//0156 	0152
		LJUMP 	2FH 			//0157 	382F

		//;app.c: 295: if(TMR2IF)
		BCR 	STATUS,5 		//0158 	1283
		BTSS 	CH,1 			//0159 	1C8C
		LJUMP 	1D5H 			//015A 	39D5
		LDWI 	0H 			//015B 	2A00

		//;app.c: 298: Read_Code_Success=1;
		BCR 	CH,1 			//015C 	108C

		//;app.c: 299: if(cntTime1MS<20) {
		SUBWR 	41H,0 			//015D 	0C41
		LDWI 	14H 			//015E 	2A14
		BTSC 	STATUS,2 		//015F 	1503
		SUBWR 	40H,0 			//0160 	0C40
		BTSC 	STATUS,0 		//0161 	1403
		LJUMP 	167H 			//0162 	3967

		//;app.c: 300: cntTime1MS++ ;
		INCR	40H,1 			//0163 	09C0
		BTSC 	STATUS,2 		//0164 	1503
		INCR	41H,1 			//0165 	09C1

		//;app.c: 301: }
		LJUMP 	1B2H 			//0166 	39B2

		//;app.c: 304: t1MsFlg = 1 ;
		CLRR 	40H 			//0167 	0140
		CLRR 	41H 			//0168 	0141

		//;app.c: 305: if(cntTimeNMS>0) {
		LDR 	67H,0 			//0169 	0867
		IORWR 	66H,0 			//016A 	0366
		BTSC 	STATUS,2 		//016B 	1503
		LJUMP 	171H 			//016C 	3971

		//;app.c: 306: cntTimeNMS-- ;
		LDWI 	1H 			//016D 	2A01
		SUBWR 	66H,1 			//016E 	0CE6
		BTSS 	STATUS,0 		//016F 	1C03
		DECR 	67H,1 			//0170 	0DE7

		//;app.c: 307: }
		//;app.c: 309: if(cntTime5MS<5) {
		LDWI 	0H 			//0171 	2A00
		SUBWR 	47H,0 			//0172 	0C47
		LDWI 	5H 			//0173 	2A05
		BTSC 	STATUS,2 		//0174 	1503
		SUBWR 	46H,0 			//0175 	0C46
		BTSC 	STATUS,0 		//0176 	1403
		LJUMP 	17CH 			//0177 	397C

		//;app.c: 310: cntTime5MS++ ;
		INCR	46H,1 			//0178 	09C6
		BTSC 	STATUS,2 		//0179 	1503
		INCR	47H,1 			//017A 	09C7

		//;app.c: 311: }
		LJUMP 	18BH 			//017B 	398B

		//;app.c: 312: else {
		//;app.c: 313: cntTime5MS = 0 ;
		CLRR 	46H 			//017C 	0146
		CLRR 	47H 			//017D 	0147

		//;app.c: 314: t5MSFlg = 1 ;
		CLRR 	52H 			//017E 	0152
		INCR	52H,1 			//017F 	09D2

		//;app.c: 315: if(uvledGrB2<uvledGrB) {
		LDR 	4BH,0 			//0180 	084B
		SUBWR 	4DH,0 			//0181 	0C4D
		BTSS 	STATUS,2 		//0182 	1D03
		LJUMP 	186H 			//0183 	3986
		LDR 	4AH,0 			//0184 	084A
		SUBWR 	4CH,0 			//0185 	0C4C
		BTSC 	STATUS,0 		//0186 	1403
		LJUMP 	18BH 			//0187 	398B

		//;app.c: 316: uvledGrB2 ++ ;
		INCR	4CH,1 			//0188 	09CC
		BTSC 	STATUS,2 		//0189 	1503
		INCR	4DH,1 			//018A 	09CD

		//;app.c: 317: }
		//;app.c: 318: }
		//;app.c: 321: if(cntTime1S<1000) {
		LDWI 	3H 			//018B 	2A03
		SUBWR 	43H,0 			//018C 	0C43
		LDWI 	E8H 			//018D 	2AE8
		BTSC 	STATUS,2 		//018E 	1503
		SUBWR 	42H,0 			//018F 	0C42
		BTSC 	STATUS,0 		//0190 	1403
		LJUMP 	196H 			//0191 	3996

		//;app.c: 322: cntTime1S++ ;
		INCR	42H,1 			//0192 	09C2
		BTSC 	STATUS,2 		//0193 	1503
		INCR	43H,1 			//0194 	09C3

		//;app.c: 323: }
		LJUMP 	1B2H 			//0195 	39B2
		LDWI 	0H 			//0196 	2A00

		//;app.c: 324: else {
		//;app.c: 325: cntTime1S = 0 ;
		CLRR 	42H 			//0197 	0142
		CLRR 	43H 			//0198 	0143

		//;app.c: 326: if(gLedCnt>120) {
		SUBWR 	49H,0 			//0199 	0C49
		LDWI 	79H 			//019A 	2A79
		BTSC 	STATUS,2 		//019B 	1503
		SUBWR 	48H,0 			//019C 	0C48
		BTSC 	STATUS,0 		//019D 	1403
		LJUMP 	1B2H 			//019E 	39B2

		//;app.c: 329: else if(gLedCnt>0) {
		LDR 	49H,0 			//019F 	0849
		IORWR 	48H,0 			//01A0 	0348
		BTSC 	STATUS,2 		//01A1 	1503
		LJUMP 	1B2H 			//01A2 	39B2

		//;app.c: 330: gLedCnt-- ;
		LDWI 	1H 			//01A3 	2A01
		SUBWR 	48H,1 			//01A4 	0CC8
		BTSS 	STATUS,0 		//01A5 	1C03
		DECR 	49H,1 			//01A6 	0DC9

		//;app.c: 331: tm1650UpdateFlg = 1 ;
		CLRR 	6CH 			//01A7 	016C
		INCR	6CH,1 			//01A8 	09EC

		//;app.c: 332: if(gLedCnt==0) {
		LDR 	49H,0 			//01A9 	0849
		IORWR 	48H,0 			//01AA 	0348
		BTSS 	STATUS,2 		//01AB 	1D03
		LJUMP 	1B2H 			//01AC 	39B2

		//;app.c: 333: gWState = 0x02 ;
		LDWI 	2H 			//01AD 	2A02
		STR 	6BH 			//01AE 	01EB

		//;app.c: 334: uvledGrB = 0 ;
		CLRR 	4AH 			//01AF 	014A
		CLRR 	4BH 			//01B0 	014B

		//;app.c: 335: longState = 0 ;
		CLRR 	4EH 			//01B1 	014E

		//;app.c: 336: }
		//;app.c: 337: }
		//;app.c: 338: }
		//;app.c: 339: }
		//;app.c: 341: if(cntTime50uS>0) {
		LDR 	45H,0 			//01B2 	0845
		IORWR 	44H,0 			//01B3 	0344
		BTSC 	STATUS,2 		//01B4 	1503
		LJUMP 	1BAH 			//01B5 	39BA

		//;app.c: 342: cntTime50uS--;
		LDWI 	1H 			//01B6 	2A01
		SUBWR 	44H,1 			//01B7 	0CC4
		BTSS 	STATUS,0 		//01B8 	1C03
		DECR 	45H,1 			//01B9 	0DC5

		//;app.c: 343: }
		//;app.c: 345: if(pGrB<16) {
		LDWI 	10H 			//01BA 	2A10
		SUBWR 	4FH,0 			//01BB 	0C4F
		BTSC 	STATUS,0 		//01BC 	1403
		LJUMP 	1C0H 			//01BD 	39C0

		//;app.c: 346: pGrB++ ;
		INCR	4FH,1 			//01BE 	09CF

		//;app.c: 347: }
		LJUMP 	1C1H 			//01BF 	39C1

		//;app.c: 348: else {
		//;app.c: 349: pGrB = 0 ;
		CLRR 	4FH 			//01C0 	014F

		//;app.c: 350: }
		//;app.c: 351: if(uvledGrB==0) {
		LDR 	4BH,0 			//01C1 	084B
		IORWR 	4AH,0 			//01C2 	034A
		BTSS 	STATUS,2 		//01C3 	1D03
		LJUMP 	1C7H 			//01C4 	39C7

		//;app.c: 352: uvledGrB2 = 0 ;
		CLRR 	4CH 			//01C5 	014C
		CLRR 	4DH 			//01C6 	014D

		//;app.c: 353: }
		//;app.c: 355: if(pGrB<uvledGrB2) {
		LDR 	4FH,0 			//01C7 	084F
		STR 	53H 			//01C8 	01D3
		CLRR 	54H 			//01C9 	0154
		LDR 	4DH,0 			//01CA 	084D
		SUBWR 	54H,0 			//01CB 	0C54
		BTSS 	STATUS,2 		//01CC 	1D03
		LJUMP 	1D0H 			//01CD 	39D0
		LDR 	4CH,0 			//01CE 	084C
		SUBWR 	53H,0 			//01CF 	0C53
		BTSC 	STATUS,0 		//01D0 	1403
		LJUMP 	1D4H 			//01D1 	39D4

		//;app.c: 356: PA4 = 1 ;
		BSR 	5H,4 			//01D2 	1A05

		//;app.c: 357: }
		LJUMP 	1D5H 			//01D3 	39D5
		BCR 	5H,4 			//01D4 	1205
		LDR 	56H,0 			//01D5 	0856
		STR 	PCLATH 			//01D6 	018A
		SWAPR 	55H,0 			//01D7 	0755
		STR 	STATUS 			//01D8 	0183
		SWAPR 	7EH,1 			//01D9 	07FE
		SWAPR 	7EH,0 			//01DA 	077E
		RETI		 			//01DB 	0009
		STR 	59H 			//01DC 	01D9

		//;app.c: 55: unsigned char i;
		//;app.c: 56: PA2=0;
		BCR 	STATUS,5 		//01DD 	1283
		BCR 	5H,2 			//01DE 	1105

		//;app.c: 57: {TRISA1 = 0 ;}
		BSR 	STATUS,5 		//01DF 	1A83
		BCR 	5H,1 			//01E0 	1085

		//;app.c: 58: for(i=0;i<8;i++)
		CLRR 	5AH 			//01E1 	015A

		//;app.c: 59: {
		//;app.c: 60: if(dat&0x80)
		BTSS 	59H,7 			//01E2 	1FD9
		LJUMP 	1E7H 			//01E3 	39E7

		//;app.c: 61: {
		//;app.c: 62: PA1=1;
		BCR 	STATUS,5 		//01E4 	1283
		BSR 	5H,1 			//01E5 	1885

		//;app.c: 67: }
		LJUMP 	1E9H 			//01E6 	39E9

		//;app.c: 68: else
		//;app.c: 69: {
		//;app.c: 70: PA1=0;
		BCR 	STATUS,5 		//01E7 	1283
		BCR 	5H,1 			//01E8 	1085

		//;app.c: 63: delay_50us(1);
		CLRR 	57H 			//01E9 	0157
		INCR	57H,1 			//01EA 	09D7
		CLRR 	58H 			//01EB 	0158
		LCALL 	2EAH 			//01EC 	32EA

		//;app.c: 64: PA2=1;
		//;app.c: 65: delay_50us(1);
		LCALL 	205H 			//01ED 	3205
		LCALL 	2EAH 			//01EE 	32EA
		LDWI 	8H 			//01EF 	2A08

		//;app.c: 66: PA2=0;
		BCR 	5H,2 			//01F0 	1105

		//;app.c: 75: }
		//;app.c: 76: dat<<=1;
		BCR 	STATUS,0 		//01F1 	1003
		RLR 	59H,1 			//01F2 	05D9
		INCR	5AH,1 			//01F3 	09DA
		SUBWR 	5AH,0 			//01F4 	0C5A
		BTSS 	STATUS,0 		//01F5 	1C03
		LJUMP 	1E2H 			//01F6 	39E2

		//;app.c: 77: }
		//;app.c: 78: {TRISA1 = 1;} ;
		BSR 	STATUS,5 		//01F7 	1A83
		BSR 	5H,1 			//01F8 	1885

		//;app.c: 80: delay_50us(1);
		CLRR 	57H 			//01F9 	0157
		INCR	57H,1 			//01FA 	09D7
		CLRR 	58H 			//01FB 	0158
		LCALL 	2EAH 			//01FC 	32EA

		//;app.c: 81: PA2=1;
		BCR 	STATUS,5 		//01FD 	1283

		//;app.c: 82: delay_50us(1);
		LCALL 	205H 			//01FE 	3205
		LCALL 	2EAH 			//01FF 	32EA

		//;app.c: 83: PA2=0;
		//;app.c: 84: delay_50us(1);
		LCALL 	257H 			//0200 	3257
		LCALL 	2EAH 			//0201 	32EA

		//;app.c: 87: {TRISA1 = 1;}
		BSR 	STATUS,5 		//0202 	1A83
		BSR 	5H,1 			//0203 	1885
		RET		 					//0204 	0004
		BSR 	5H,2 			//0205 	1905
		CLRR 	57H 			//0206 	0157
		INCR	57H,1 			//0207 	09D7
		CLRR 	58H 			//0208 	0158
		RET		 					//0209 	0004
		CLRR 	5BH 			//020A 	015B
		CLRR 	5CH 			//020B 	015C
		LDR 	58H,0 			//020C 	0858
		IORWR 	57H,0 			//020D 	0357
		BTSC 	STATUS,2 		//020E 	1503
		LJUMP 	22FH 			//020F 	3A2F
		CLRR 	5DH 			//0210 	015D
		INCR	5DH,1 			//0211 	09DD
		BTSC 	58H,7 			//0212 	17D8
		LJUMP 	218H 			//0213 	3A18
		BCR 	STATUS,0 		//0214 	1003
		RLR 	57H,1 			//0215 	05D7
		RLR 	58H,1 			//0216 	05D8
		LJUMP 	211H 			//0217 	3A11
		BCR 	STATUS,0 		//0218 	1003
		RLR 	5BH,1 			//0219 	05DB
		RLR 	5CH,1 			//021A 	05DC
		LDR 	58H,0 			//021B 	0858
		SUBWR 	5AH,0 			//021C 	0C5A
		BTSS 	STATUS,2 		//021D 	1D03
		LJUMP 	221H 			//021E 	3A21
		LDR 	57H,0 			//021F 	0857
		SUBWR 	59H,0 			//0220 	0C59
		BTSS 	STATUS,0 		//0221 	1C03
		LJUMP 	22BH 			//0222 	3A2B
		LDR 	57H,0 			//0223 	0857
		SUBWR 	59H,1 			//0224 	0CD9
		LDR 	58H,0 			//0225 	0858
		BTSS 	STATUS,0 		//0226 	1C03
		DECR 	5AH,1 			//0227 	0DDA
		SUBWR 	5AH,1 			//0228 	0CDA
		BSR 	5BH,0 			//0229 	185B
		BCR 	STATUS,0 		//022A 	1003
		RRR	58H,1 			//022B 	06D8
		RRR	57H,1 			//022C 	06D7
		DECRSZ 	5DH,1 		//022D 	0EDD
		LJUMP 	218H 			//022E 	3A18
		LDR 	5CH,0 			//022F 	085C
		STR 	58H 			//0230 	01D8
		LDR 	5BH,0 			//0231 	085B
		STR 	57H 			//0232 	01D7
		RET		 					//0233 	0004

		//;app.c: 99: unsigned char dat,i;
		//;app.c: 100: {TRISA1 = 1;} ;
		BSR 	5H,1 			//0234 	1885

		//;app.c: 103: dat=0;
		CLRR 	59H 			//0235 	0159

		//;app.c: 104: for(i=0;i<8;i++)
		CLRR 	5AH 			//0236 	015A

		//;app.c: 105: {
		//;app.c: 106: PA2=1;
		BCR 	STATUS,5 		//0237 	1283

		//;app.c: 107: delay_50us(1);
		LCALL 	205H 			//0238 	3205
		LCALL 	2EAH 			//0239 	32EA

		//;app.c: 108: dat<<=1;
		BCR 	STATUS,0 		//023A 	1003
		RLR 	59H,1 			//023B 	05D9

		//;app.c: 109: if(PA1)
		BTSC 	5H,1 			//023C 	1485

		//;app.c: 110: dat++;
		INCR	59H,1 			//023D 	09D9

		//;app.c: 111: delay_50us(1);
		CLRR 	57H 			//023E 	0157
		INCR	57H,1 			//023F 	09D7
		CLRR 	58H 			//0240 	0158
		LCALL 	2EAH 			//0241 	32EA

		//;app.c: 112: PA2=0;
		//;app.c: 113: delay_50us(1);
		LCALL 	257H 			//0242 	3257
		LCALL 	2EAH 			//0243 	32EA
		LDWI 	8H 			//0244 	2A08
		INCR	5AH,1 			//0245 	09DA
		SUBWR 	5AH,0 			//0246 	0C5A
		BTSS 	STATUS,0 		//0247 	1C03
		LJUMP 	237H 			//0248 	3A37

		//;app.c: 114: }
		//;app.c: 115: {TRISA1 = 0 ;} ;
		BSR 	STATUS,5 		//0249 	1A83
		BCR 	5H,1 			//024A 	1085

		//;app.c: 116: PA1=0;
		BCR 	STATUS,5 		//024B 	1283
		BCR 	5H,1 			//024C 	1085

		//;app.c: 117: delay_50us(1);
		CLRR 	57H 			//024D 	0157
		INCR	57H,1 			//024E 	09D7
		CLRR 	58H 			//024F 	0158
		LCALL 	2EAH 			//0250 	32EA

		//;app.c: 118: PA2=1;
		//;app.c: 119: delay_50us(1);
		LCALL 	205H 			//0251 	3205
		LCALL 	2EAH 			//0252 	32EA

		//;app.c: 120: PA2=0;
		//;app.c: 121: delay_50us(1);
		LCALL 	257H 			//0253 	3257
		LCALL 	2EAH 			//0254 	32EA

		//;app.c: 123: return dat ;
		LDR 	59H,0 			//0255 	0859
		RET		 					//0256 	0004
		BCR 	5H,2 			//0257 	1105
		CLRR 	57H 			//0258 	0157
		INCR	57H,1 			//0259 	09D7
		CLRR 	58H 			//025A 	0158
		RET		 					//025B 	0004
		LDR 	5FH,0 			//025C 	085F
		IORWR 	5EH,0 			//025D 	035E
		BTSC 	STATUS,2 		//025E 	1503
		LJUMP 	27BH 			//025F 	3A7B
		CLRR 	62H 			//0260 	0162
		INCR	62H,1 			//0261 	09E2
		BTSC 	5FH,7 			//0262 	17DF
		LJUMP 	268H 			//0263 	3A68
		BCR 	STATUS,0 		//0264 	1003
		RLR 	5EH,1 			//0265 	05DE
		RLR 	5FH,1 			//0266 	05DF
		LJUMP 	261H 			//0267 	3A61
		LDR 	5FH,0 			//0268 	085F
		SUBWR 	61H,0 			//0269 	0C61
		BTSS 	STATUS,2 		//026A 	1D03
		LJUMP 	26EH 			//026B 	3A6E
		LDR 	5EH,0 			//026C 	085E
		SUBWR 	60H,0 			//026D 	0C60
		BTSS 	STATUS,0 		//026E 	1C03
		LJUMP 	277H 			//026F 	3A77
		LDR 	5EH,0 			//0270 	085E
		SUBWR 	60H,1 			//0271 	0CE0
		LDR 	5FH,0 			//0272 	085F
		BTSS 	STATUS,0 		//0273 	1C03
		DECR 	61H,1 			//0274 	0DE1
		SUBWR 	61H,1 			//0275 	0CE1
		BCR 	STATUS,0 		//0276 	1003
		RRR	5FH,1 			//0277 	06DF
		RRR	5EH,1 			//0278 	06DE
		DECRSZ 	62H,1 		//0279 	0EE2
		LJUMP 	268H 			//027A 	3A68
		LDR 	61H,0 			//027B 	0861
		STR 	5FH 			//027C 	01DF
		LDR 	60H,0 			//027D 	0860
		STR 	5EH 			//027E 	01DE
		RET		 					//027F 	0004

		//;app.c: 175: OSCCON = 0B01110001;
		LDWI 	71H 			//0280 	2A71
		BSR 	STATUS,5 		//0281 	1A83
		STR 	FH 			//0282 	018F

		//;app.c: 182: INTCON = 0;
		CLRR 	INTCON 			//0283 	010B

		//;app.c: 184: PORTA = 0B00000000;
		BCR 	STATUS,5 		//0284 	1283
		CLRR 	5H 			//0285 	0105

		//;app.c: 185: TRISA = 0B00100010;
		LDWI 	22H 			//0286 	2A22
		BSR 	STATUS,5 		//0287 	1A83
		STR 	5H 			//0288 	0185

		//;app.c: 193: WPUA = 0X0A;
		LDWI 	AH 			//0289 	2A0A
		STR 	15H 			//028A 	0195
		LDWI 	8H 			//028B 	2A08

		//;app.c: 194: WPUA1 = 1 ;
		BSR 	15H,1 			//028C 	1895
		BSR 	15H,5 			//028D 	1A95

		//;app.c: 197: OPTION = 0B00001000;
		STR 	1H 			//028E 	0181

		//;app.c: 211: TMR2 = 0;
		BCR 	STATUS,5 		//028F 	1283
		CLRR 	11H 			//0290 	0111

		//;app.c: 213: PR2 = 200;
		LDWI 	C8H 			//0291 	2AC8
		BSR 	STATUS,5 		//0292 	1A83
		STR 	12H 			//0293 	0192

		//;app.c: 214: TMR2IF = 0;
		BCR 	STATUS,5 		//0294 	1283
		BCR 	CH,1 			//0295 	108C

		//;app.c: 215: TMR2IE = 1;
		BSR 	STATUS,5 		//0296 	1A83
		BSR 	CH,1 			//0297 	188C

		//;app.c: 216: TMR2ON = 1;
		BCR 	STATUS,5 		//0298 	1283
		BSR 	12H,2 			//0299 	1912

		//;app.c: 217: PEIE=1;
		BSR 	INTCON,6 		//029A 	1B0B

		//;app.c: 219: GIE = 1;
		BSR 	INTCON,7 		//029B 	1B8B
		RET		 					//029C 	0004
		LDWI 	2H 			//029D 	2A02
		STR 	PCLATH 			//029E 	018A
		LDR 	FSR,0 			//029F 	0804
		INCR	FSR,1 			//02A0 	0984
		ADDWR 	PCL,1 			//02A1 	0B82
		RETW 	0H 			//02A2 	2100
		RETW 	F9H 			//02A3 	21F9
		RETW 	11H 			//02A4 	2111
		RETW 	E5H 			//02A5 	21E5
		RETW 	B5H 			//02A6 	21B5
		RETW 	1DH 			//02A7 	211D
		RETW 	BCH 			//02A8 	21BC
		RETW 	FCH 			//02A9 	21FC
		RETW 	91H 			//02AA 	2191
		RETW 	FDH 			//02AB 	21FD
		RETW 	BDH 			//02AC 	21BD
		RETW 	DDH 			//02AD 	21DD
		RETW 	7CH 			//02AE 	217C
		RETW 	E8H 			//02AF 	21E8
		RETW 	75H 			//02B0 	2175
		RETW 	EDH 			//02B1 	21ED
		RETW 	CCH 			//02B2 	21CC

		//;app.c: 39: {TRISA1 = 0 ;}
		BSR 	STATUS,5 		//02B3 	1A83
		BCR 	5H,1 			//02B4 	1085

		//;app.c: 40: PA1=0;
		BCR 	STATUS,5 		//02B5 	1283
		BCR 	5H,1 			//02B6 	1085

		//;app.c: 41: delay_50us(1);
		CLRR 	57H 			//02B7 	0157
		INCR	57H,1 			//02B8 	09D7
		CLRR 	58H 			//02B9 	0158
		LCALL 	2EAH 			//02BA 	32EA

		//;app.c: 42: PA2=1;
		//;app.c: 43: delay_50us(1);
		LCALL 	205H 			//02BB 	3205
		LCALL 	2EAH 			//02BC 	32EA

		//;app.c: 44: PA1=1;
		BSR 	5H,1 			//02BD 	1885

		//;app.c: 45: delay_50us(1);
		CLRR 	57H 			//02BE 	0157
		INCR	57H,1 			//02BF 	09D7
		CLRR 	58H 			//02C0 	0158
		LCALL 	2EAH 			//02C1 	32EA

		//;app.c: 46: PA2=0;
		BCR 	5H,2 			//02C2 	1105

		//;app.c: 47: PA1=1;
		BSR 	5H,1 			//02C3 	1885

		//;app.c: 48: {TRISA1 = 1;}
		BSR 	STATUS,5 		//02C4 	1A83
		BSR 	5H,1 			//02C5 	1885
		RET		 					//02C6 	0004

		//;app.c: 26: {TRISA1 = 0 ;}
		BSR 	STATUS,5 		//02C7 	1A83
		BCR 	5H,1 			//02C8 	1085

		//;app.c: 27: PA2=1;
		BCR 	STATUS,5 		//02C9 	1283
		BSR 	5H,2 			//02CA 	1905

		//;app.c: 28: PA1=1;
		BSR 	5H,1 			//02CB 	1885

		//;app.c: 29: delay_50us(1);
		CLRR 	57H 			//02CC 	0157
		INCR	57H,1 			//02CD 	09D7
		CLRR 	58H 			//02CE 	0158
		LCALL 	2EAH 			//02CF 	32EA

		//;app.c: 30: PA1=0;
		BCR 	5H,1 			//02D0 	1085

		//;app.c: 31: delay_50us(1);
		CLRR 	57H 			//02D1 	0157
		INCR	57H,1 			//02D2 	09D7
		CLRR 	58H 			//02D3 	0158
		LCALL 	2EAH 			//02D4 	32EA

		//;app.c: 32: PA2=0;
		BCR 	5H,2 			//02D5 	1105
		RET		 					//02D6 	0004
		STR 	5EH 			//02D7 	01DE

		//;app.c: 145: TM1650_START();
		LCALL 	2C7H 			//02D8 	32C7

		//;app.c: 146: write_8bit(0x48);
		LDWI 	48H 			//02D9 	2A48
		LCALL 	1DCH 			//02DA 	31DC

		//;app.c: 147: write_8bit(light | segMod | WorkMod | Onoff );
		LDR 	5EH,0 			//02DB 	085E
		IORWR 	5BH,0 			//02DC 	035B
		IORWR 	5CH,0 			//02DD 	035C
		IORWR 	5DH,0 			//02DE 	035D
		LCALL 	1DCH 			//02DF 	31DC

		//;app.c: 148: TM1650_STOP();
		LJUMP 	2B3H 			//02E0 	3AB3

		//;app.c: 382: cntTimeNMS = time ;
		LDR 	58H,0 			//02E1 	0858
		STR 	67H 			//02E2 	01E7
		LDR 	57H,0 			//02E3 	0857
		STR 	66H 			//02E4 	01E6

		//;app.c: 383: while(cntTimeNMS>0) ;
		LDR 	67H,0 			//02E5 	0867
		IORWR 	66H,0 			//02E6 	0366
		BTSC 	STATUS,2 		//02E7 	1503
		RET		 					//02E8 	0004
		LJUMP 	2E5H 			//02E9 	3AE5

		//;app.c: 387: cntTime50uS = us50 ;
		LDR 	58H,0 			//02EA 	0858
		STR 	45H 			//02EB 	01C5
		LDR 	57H,0 			//02EC 	0857
		STR 	44H 			//02ED 	01C4

		//;app.c: 388: while(cntTime50uS>0) ;
		LDR 	45H,0 			//02EE 	0845
		IORWR 	44H,0 			//02EF 	0344
		BTSC 	STATUS,2 		//02F0 	1503
		RET		 					//02F1 	0004
		LJUMP 	2EEH 			//02F2 	3AEE
		CLRWDT	 			//02F3 	0001
		CLRR 	INDF 			//02F4 	0100
		INCR	FSR,1 			//02F5 	0984
		XORWR 	FSR,0 			//02F6 	0404
		BTSC 	STATUS,2 		//02F7 	1503
		RETW 	0H 			//02F8 	2100
		XORWR 	FSR,0 			//02F9 	0404
		LJUMP 	2F4H 			//02FA 	3AF4

		//;app.c: 162: unsigned char key;
		//;app.c: 163: TM1650_START();
		LCALL 	2C7H 			//02FB 	32C7

		//;app.c: 164: write_8bit(0x4F);
		LDWI 	4FH 			//02FC 	2A4F
		LCALL 	1DCH 			//02FD 	31DC

		//;app.c: 165: key=read_8bit();
		LCALL 	234H 			//02FE 	3234
		STR 	5BH 			//02FF 	01DB

		//;app.c: 166: TM1650_STOP();
		LCALL 	2B3H 			//0300 	32B3

		//;app.c: 167: return key;
		LDR 	5BH,0 			//0301 	085B
		RET		 					//0302 	0004
		STR 	5CH 			//0303 	01DC

		//;app.c: 129: TM1650_START();
		LCALL 	2C7H 			//0304 	32C7

		//;app.c: 130: write_8bit(saddr);
		LDR 	5CH,0 			//0305 	085C
		LCALL 	1DCH 			//0306 	31DC

		//;app.c: 131: write_8bit(sdate);
		LDR 	5BH,0 			//0307 	085B
		LCALL 	1DCH 			//0308 	31DC

		//;app.c: 132: TM1650_STOP();
		LJUMP 	2B3H 			//0309 	3AB3
		LDWI 	40H 			//030A 	2A40
		STR 	FSR 			//030B 	0184
		LDWI 	53H 			//030C 	2A53
		LCALL 	2F3H 			//030D 	32F3
		CLRR 	STATUS 			//030E 	0103
		LJUMP 	0BH 			//030F 	380B
			END
