//-----------------------------------------------------------------------------
// Copyright:      	RAD Electronic Co. LTD,
// Author:         	Sh. Nourbakhsh Rad
// Remarks:        	
// known Problems: 	none
// Version:        	2.0.1
// Description:    	NOKIA 1100 Display (PCF8814) simple FONT
//									
//-----------------------------------------------------------------------------

#include "sFONT.h"


//******************* Constants
	const unsigned char    *FontPntr; 								// Font	Pointer
	unsigned char						HeaderSize;								// Font specification size
	unsigned char						CharWidth;								// Font width
	unsigned char						FntHeight;								// Font height

#if (SFNsimple ==1)
	unsigned char 					FntSpaceX 	= 1;					// Space between char

#else
	unsigned char						CursorX 		= 0;					// X position
	unsigned char						CursorY 		= 0;					// Y position

	unsigned char 					FntSpaceX 	= 1;					// Space between char
	unsigned char 					FntSpaceY		= 0;					// Space between lines
#endif

//******************* Functions *******************
void N11_FontSelect(const unsigned char *Fpntr)
{
	FontPntr 				= Fpntr;

	HeaderSize 			= pgm_read_byte(&FontPntr[0]);
	CharWidth  			= pgm_read_byte(&FontPntr[1]);
	FntHeight 			= pgm_read_byte(&FontPntr[2]);
}	//N11_FontSelect

//--------------------------------------------------
#if (SFNsimple ==1)
	void N11_PrintChar(char ch)
#else
	void N11_PrintChar(char ch, N11_Pmode color)
#endif
	{	
		unsigned char 			xc,	yc;
		unsigned char 			i;
		
		unsigned char 			Cbyte;
		unsigned short			Cpos = ((unsigned short)(ch -' ') *CharWidth) +HeaderSize;
		
		for(xc=0; xc<CharWidth; xc++)
		{
	  	Cbyte = pgm_read_byte(&FontPntr[Cpos +xc]) <<1;
	
	#if (SFNsimple ==1)
			N11_Write(data,	Cbyte);
		}//for xc

		for(i=0; i<FntSpaceX; i++)
			N11_Write(data, 0x00);
		
	#else
			for(yc = 0; yc<FntHeight; yc++)
			{
				if(BitIsSet(Cbyte, yc))						N11_SetPixel(xc +CursorX, yc +CursorY, color);
				else															N11_SetPixel(xc +CursorX, yc +CursorY, WHITE);
			}
		}//for xc
		
		CursorX	+= (CharWidth +FntSpaceX);
	
	#endif
	}	//N11_PrintChar

#if (SFNsimple ==1)
	void N11_PrintString(char *str)
#else
	void N11_PrintString(char *str, N11_Pmode color)
#endif
	{   
		register char			chr;
	
		N11_Write(cmd, 0xAE); 				// disable display;
	
		while((chr = *str++))
	#if (SFNsimple ==1)
			N11_PrintChar(chr);
	#else
			N11_PrintChar(chr, color);
	#endif
	
		N11_Write(cmd, 0xAF); 				//enable display;
	}	//N11_PrintString

#if (SFNsimple ==0)
void SFN_GotoXR(unsigned char x, unsigned char ln)
{
	setCursorX(x);
	setCursorY(ln *(FntHeight +FntSpaceY));
}	//SFN_GotoXR

//--------------------------------------------------
void N11_TypeStr(unsigned char lin, unsigned char col, char *str, unsigned char len, N11_Pmode color, unsigned char dly)
{
	unsigned char				i;
	
	SFN_GotoXR(col, lin);
	for(i=0; i<len; i++)
	{
		N11_PrintChar(str[i], color);
		_delay_ms(dly);
	}	
}	//N11_TypeStr

void N11_ChrCls(unsigned char dly)
{
	unsigned char				lins 		= N11_SIZE_Y /(FntHeight +FntSpaceY);
	unsigned char				cols 		= CharWidth;
	unsigned char				tempXs 	= FntSpaceX;										//Save FntSpaceX
	unsigned char				i, j;
	
	FntSpaceX = 0;
	
	for(i=0; i<N11_SIZE_X; i+=cols)
	{
		for(j=0; j<lins; j++)
		{	
			CharAt(j, i, ' ', WHITE);
		}
		
		_delay_ms(dly);
	}
	
	FntSpaceX = tempXs;																					//Restore FntSpaceX
	_delay_ms(dly *10);
}	//N11_ChrCls
#endif

//--------------------------------------------------
unsigned char N11_GetStrLenC(char *str)
{
	unsigned char 			i = 0;

	while(str[i])			i++;
	
	return i;
}	//N11_GetStrLenC

unsigned char N11_GetStrLenX(char *str)
{
	return (N11_GetStrLenC(str) *(CharWidth +FntSpaceX));
}	//N11_GetStrLenX
