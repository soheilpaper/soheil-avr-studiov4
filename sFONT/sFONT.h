//-----------------------------------------------------------------------------
// Copyright:      	RAD Electronic Co. LTD,
// Author:         	Sh. Nourbakhsh Rad
// Remarks:        	
// known Problems: 	none
// Version:        	2.0.0
// Description:    	NOKIA 1100 Display (PCF8814) simple FONT
//									
//-----------------------------------------------------------------------------

#ifndef EFONT_H_
	#define EFONT_H_
	
  #include "..\app_config.h"
	#include "..\N11\N1100.h"	


	//----------- Definitions
	#define SFNsimple										0					//1: Simple   mode
																								//0: Complete mode (LCDlight should be in "normal LCD")
	
	#if (SFNsimple ==1)
		extern unsigned char 							FntSpaceX;
	
		#define LcdFontSpaceX(n)					FntSpaceX  = n

	#else
		extern unsigned char 							CursorX;
		extern unsigned char 							CursorY;
	
		extern unsigned char 							FntSpaceX;
		extern unsigned char 							FntSpaceY;
	
		/////////////////////////////////////////////////////////	
		#define setCursorX(x) 						CursorX = x
		#define setCursorY(y) 						CursorY = y
	
		#define setCursor(x,y) 						{CursorX = x; CursorY = y;}
	
		#define getCursorX() 							CursorX
		#define getCursorY() 							CursorY
	
		#define LcdFontSpaceX(n)					FntSpaceX  = n
		#define LcdFontSpaceY(n)					FntSpaceY  = n
	
	#endif

	//******************* Function Prototypes
	void N11_FontSelect(const unsigned char *Fpntr);
	
	//---------------------
	#if (SFNsimple ==1)
		void N11_PrintChar(char ch);															//write character to LCD
		void N11_PrintString(char *str);													//write string to LCD (C string type)

		//---------------------
		#define StringAt(lin, col, str)												{N11_GotoXR(col, lin);	N11_PrintString(str);}							//l: 0...7  &  c: 0...95
		#define CharAt(lin, col, chr)													{N11_GotoXR(col, lin);	N11_PrintChar(chr);}

	#else
		void N11_PrintChar(char ch, N11_Pmode color);								//write character to LCD
		void N11_PrintString(char *str, N11_Pmode color);						//write string to LCD (C string type)
	
		void SFN_GotoXR(unsigned char x, unsigned char ln);
	
		//---------------------
		void N11_TypeStr(unsigned char lin, unsigned char col, char *str, unsigned char len, N11_Pmode color, unsigned char dly);
		void N11_ChrCls(unsigned char dly);

		#define StringAt(lin, col, str, clr)									{SFN_GotoXR(col, lin);	N11_PrintString(str, clr);}					//l: 0...7  &  c: 0...95
		#define CharAt(lin, col, chr, clr)										{SFN_GotoXR(col, lin);	N11_PrintChar(chr, clr);}
	
	#endif
	
	//---------------------
	unsigned char N11_GetStrLenC(char *str);
	unsigned char N11_GetStrLenX(char *str);

#endif	//EFONT_H_
