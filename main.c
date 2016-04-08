//-----------------------------------------------------------------------------
// Copyright:      RAD Electronic Co. LTD,
// Author:         Sh. Nourbakhsh Rad
// Remarks:        
// known Problems: none
// Version:        2.0.0
// Description:    Simple font test +Proteus
//								 
//-----------------------------------------------------------------------------

//	Include Headers
//*****************************************************************************
#include "app_config.h"

//--------------------------------------------------
#include "N11\N1100.h"

#include "sFONT\sFONT.h"
#include "sFONT\ef5x7.h"


//	Constants and Varables
//*****************************************************************************

//Temp Const.
char Ctemp[50];
int  Itemp;

//	Functions Prototype
//*****************************************************************************
void Initial(void);
void Splash(void);


//	<<< main function >>>
//*****************************************************************************
void main(void)
{
unsigned char i;
	Initial();															//initial .....
	
	#if (SFNsimple ==0)
		//char						*mySTR = "Complete mode!";
		static char *mySTR[3] = {
				"S-Font test...",
				"Complete mode!",				
				"Www.Elasa.ir!"
				};

		N11_TypeStr(1, 1, mySTR[1], N11_GetStrLenC(mySTR[1]), BLACK, 150);
		_delay_ms(2000);
		N11_TypeStr(1, 1, mySTR[1], N11_GetStrLenC(mySTR[1]), WHITE, 50);
		
		_delay_ms(1000);
		
		N11_TypeStr(0, 1, mySTR[0], N11_GetStrLenC(mySTR[0]), BLACK, 100);
		N11_TypeStr(2, 1, mySTR[1], N11_GetStrLenC(mySTR[1]), BLACK, 100);
		N11_TypeStr(4, 1, mySTR[2], N11_GetStrLenC(mySTR[2]), BLACK, 100);
		N11_TypeStr(6, 1, mySTR[3], N11_GetStrLenC(mySTR[3]), BLACK, 100);
		_delay_ms(3000);
		
		N11_ChrCls(100);
		_delay_ms(500);
		
		StringAt(1, 1, "YES!!!  :)", BLACK);
	
	#endif

	//----- main loop!!!
 	while(1);
} //main

//---------------------------------------------------------//
//---------------------------------------------------------//
void Initial(void)
{
	N11_Init();
	N11_Contrast(10);
	N11_Backlight(ON);
	
	N11_CLS();
	
	//----------------------
	N11_FontSelect(ef5x7);
	Splash();
}	//Initial

void Splash(void)
{
	static char *SPchar[3] = {
			"S-Font test...",
			"by :",
            "Www.Elasa.ir"
			};

	//-------------
	#if (SFNsimple ==1)
		StringAt(1, 1, SPchar[0]);
		StringAt(4, 1, SPchar[1]);
		StringAt(6, 1, SPchar[2]);

	#else
		//-------------
		StringAt(1, 1, SPchar[0], BLACK);
		StringAt(4, 1, SPchar[1], BLACK);
		StringAt(6, 1, SPchar[2], BLACK);
	
		//-------------
		_delay_ms(2000);
		N11_CLS();
	#endif
}	//Splash
