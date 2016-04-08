//-----------------------------------------------------------------------------
// Copyright:      	RAD Electronic Co. LTD,
// Author:         	Sh. Nourbakhsh Rad
// Remarks:        	
// known Problems: 	none
// Version:        	3.5.5
// Description:    	NOKIA 1100 Display (PCF8814) driver
//									
//-----------------------------------------------------------------------------
//
//
//		display: rear site, pin 1 on left site
//		.														.
//		.														.
//		|			  	rear side  				|
//		|___________________________|
//		|   _  | | | | | | | |  _   |
//		|  |   8             1   |  |
//		|__|                     |__| 
//
//		1 XRES Reset
//		2 XCS Chip Select
//		3 VSS (GND) Ground
//		4 SDA Serial Data
//		5 SCLK Serial Clock
//		6 VDDI Power supply 1.8v - max. 3.3v
//		7 VDD Power supply  2.8v - max. 3.3v
//		8 LED+ Power Led
//-----------------------------------------------------------------------------

#ifndef _N1100C_H_
	#define _N1100C_H_

  #include "..\app_config.h"

	
	//----------- Definitions
	#define LCDlight												1					// 0: normal LCD
																										// 1: light LCD ( simple, read from LCD impossible! )
																										// 2: light LCD ( very simple, only upper case letters text!!)
	
	#define MirrorY													0					// mirror Y axis (about X axis)
	#define InvertScreen										0					// invert screen in horizontal axis

	
	// Pins.....
	#define N11_CS_DDR											DDRA
	#define N11_CS_PRT											PORTA
	#define N11_CS_BIT											7
	//------
	#define N11_SDA_DDR											DDRA
	#define N11_SDA_PRT											PORTA
	#define N11_SDA_BIT											2

	#define N11_SCL_DDR											DDRA
	#define N11_SCL_PRT											PORTA
	#define N11_SCL_BIT											6
	//------
	#define N11_RST_DDR											DDRA
	#define N11_RST_PRT											PORTA
	#define N11_RST_BIT											4

	#define N11_BKL_DDR											DDRA
	#define N11_BKL_PRT											PORTA
	#define N11_BKL_BIT											3

	//---------------------------------------------------------------
	//---------------------------------------------------------------
	#define N11_CS_init()										SetBit(N11_CS_DDR, N11_CS_BIT);		SetBit(N11_CS_PRT, N11_CS_BIT)

	#define N11_SDA_init()									SetBit(N11_SDA_DDR, N11_SDA_BIT); ClrBit(N11_SDA_PRT, N11_SDA_BIT)
	#define N11_SCL_init()									SetBit(N11_SCL_DDR, N11_SCL_BIT); ClrBit(N11_SCL_PRT, N11_SCL_BIT)

	//---------------------
	#define N11_CS(x)												(x ? (SetBit(N11_CS_PRT, N11_CS_BIT)) : (ClrBit(N11_CS_PRT, N11_CS_BIT)))
	#define N11_CS_low()										ClrBit(N11_CS_PRT, N11_CS_BIT)
	#define N11_CS_high()										SetBit(N11_CS_PRT, N11_CS_BIT)

	#define N11_SDA(x)											(x ? (SetBit(N11_SDA_PRT, N11_SDA_BIT)) : (ClrBit(N11_SDA_PRT, N11_SDA_BIT)))
	#define N11_SDA_low()										ClrBit(N11_SDA_PRT, N11_SDA_BIT)
	#define N11_SDA_high()									SetBit(N11_SDA_PRT, N11_SDA_BIT)

	#define N11_SCL(x)											(x ? (SetBit(N11_SCL_PRT, N11_SCL_BIT)) : (ClrBit(N11_SCL_PRT, N11_SCL_BIT)))
	#define N11_SCL_low()										ClrBit(N11_SCL_PRT, N11_SCL_BIT)
	#define N11_SCL_high()									SetBit(N11_SCL_PRT, N11_SCL_BIT)

	//---------------------------------------------------------------
	//---------------------------------------------------------------
	#ifdef N11_RST_BIT
		#define N11_RST_init()								SetBit(N11_RST_DDR, N11_RST_BIT); ClrBit(N11_RST_PRT, N11_RST_BIT)

		#define N11_RST(x)										(x ? (SetBit(N11_RST_PRT, N11_RST_BIT)) : (ClrBit(N11_RST_PRT, N11_RST_BIT)))
		#define N11_RST_low()									ClrBit(N11_RST_PRT, N11_RST_BIT)
		#define N11_RST_high()								SetBit(N11_RST_PRT, N11_RST_BIT)
	
	#else
		#define N11_RST_init()

		#define N11_RST(x)
		#define N11_RST_low()
		#define N11_RST_high()
	
	#endif

	#ifdef N11_BKL_BIT
		#define N11_BKL_init()								SetBit(N11_BKL_DDR, N11_BKL_BIT); ClrBit(N11_BKL_PRT, N11_BKL_BIT)

		#define N11_BKL(x)										(x ? (SetBit(N11_BKL_PRT, N11_BKL_BIT)) : (ClrBit(N11_BKL_PRT, N11_BKL_BIT)))
		#define N11_BKL_off()									ClrBit(N11_BKL_PRT, N11_BKL_BIT)
		#define N11_BKL_on()									SetBit(N11_BKL_PRT, N11_BKL_BIT)
	
	#else
		#define N11_BKL_init()

		#define N11_BKL(x)
		#define N11_BKL_off()
		#define N11_BKL_on()
	
	#endif

#endif	//_N1100C_H_
