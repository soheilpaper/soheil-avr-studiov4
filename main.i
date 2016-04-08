
#pragma used+
sfrb TWBR=0;
sfrb TWSR=1;
sfrb TWAR=2;
sfrb TWDR=3;
sfrb ADCL=4;
sfrb ADCH=5;
sfrw ADCW=4;      
sfrb ADCSRA=6;
sfrb ADCSR=6;     
sfrb ADMUX=7;
sfrb ACSR=8;
sfrb UBRRL=9;
sfrb UCSRB=0xa;
sfrb UCSRA=0xb;
sfrb UDR=0xc;
sfrb SPCR=0xd;
sfrb SPSR=0xe;
sfrb SPDR=0xf;
sfrb PIND=0x10;
sfrb DDRD=0x11;
sfrb PORTD=0x12;
sfrb PINC=0x13;
sfrb DDRC=0x14;
sfrb PORTC=0x15;
sfrb PINB=0x16;
sfrb DDRB=0x17;
sfrb PORTB=0x18;
sfrb PINA=0x19;
sfrb DDRA=0x1a;
sfrb PORTA=0x1b;
sfrb EECR=0x1c;
sfrb EEDR=0x1d;
sfrb EEARL=0x1e;
sfrb EEARH=0x1f;
sfrw EEAR=0x1e;   
sfrb UBRRH=0x20;
sfrb UCSRC=0X20;
sfrb WDTCR=0x21;
sfrb ASSR=0x22;
sfrb OCR2=0x23;
sfrb TCNT2=0x24;
sfrb TCCR2=0x25;
sfrb ICR1L=0x26;
sfrb ICR1H=0x27;
sfrb OCR1BL=0x28;
sfrb OCR1BH=0x29;
sfrw OCR1B=0x28;  
sfrb OCR1AL=0x2a;
sfrb OCR1AH=0x2b;
sfrw OCR1A=0x2a;  
sfrb TCNT1L=0x2c;
sfrb TCNT1H=0x2d;
sfrw TCNT1=0x2c;  
sfrb TCCR1B=0x2e;
sfrb TCCR1A=0x2f;
sfrb SFIOR=0x30;
sfrb OSCCAL=0x31;
sfrb TCNT0=0x32;
sfrb TCCR0=0x33;
sfrb MCUCSR=0x34;
sfrb MCUCR=0x35;
sfrb TWCR=0x36;
sfrb SPMCR=0x37;
sfrb TIFR=0x38;
sfrb TIMSK=0x39;
sfrb GIFR=0x3a;
sfrb GICR=0x3b;
sfrb OCR0=0X3c;
sfrb SPL=0x3d;
sfrb SPH=0x3e;
sfrb SREG=0x3f;
#pragma used-

#asm
	#ifndef __SLEEP_DEFINED__
	#define __SLEEP_DEFINED__
	.EQU __se_bit=0x80
	.EQU __sm_mask=0x70
	.EQU __sm_powerdown=0x20
	.EQU __sm_powersave=0x30
	.EQU __sm_standby=0x60
	.EQU __sm_ext_standby=0x70
	.EQU __sm_adc_noise_red=0x10
	.SET power_ctrl_reg=mcucr
	#endif
#endasm

#pragma used+
sfrw ICR1 													= 0x26;
#pragma used-

static const unsigned char	 									BitMASKn[8] = {
0b00000001, 				
0b00000010, 				
0b00000100, 				
0b00001000, 				
0b00010000, 				
0b00100000, 				
0b01000000, 				
0b10000000	 				
};

static const unsigned char	 									BitMASKb[8] = {
0b11111110, 				
0b11111101, 				
0b11111011, 				
0b11110111, 				
0b11101111, 				
0b11011111, 				
0b10111111, 				
0b01111111	 				
};

static const unsigned char	 									ByteMASKn[9] = {
0b00000000, 				
0b00000001, 				
0b00000011, 				
0b00000111, 				
0b00001111, 				
0b00011111, 				
0b00111111, 				
0b01111111, 				
0b11111111	 				
};

static const unsigned char	 									ByteMASKb[9] = {
0b11111111, 				
0b11111110, 				
0b11111100, 				
0b11111000, 				
0b11110000, 				
0b11100000, 				
0b11000000, 				
0b10000000, 				
0b00000000	 				
};

#pragma used+

unsigned char cabs(signed char x);
unsigned int abs(int x);
unsigned long labs(long x);
float fabs(float x);
int atoi(char *str);
long int atol(char *str);
float atof(char *str);
void itoa(int n,char *str);
void ltoa(long int n,char *str);
void ftoa(float n,unsigned char decimals,char *str);
void ftoe(float n,unsigned char decimals,char *str);
void srand(int seed);
int rand(void);
void *malloc(unsigned int size);
void *calloc(unsigned int num, unsigned int size);
void *realloc(void *ptr, unsigned int size); 
void free(void *ptr);

#pragma used-
#pragma library stdlib.lib

typedef char *va_list;

#pragma used+

char getchar(void);
void putchar(char c);
void puts(char *str);
void putsf(char flash *str);
int printf(char flash *fmtstr,...);
int sprintf(char *str, char flash *fmtstr,...);
int vprintf(char flash * fmtstr, va_list argptr);
int vsprintf(char *str, char flash * fmtstr, va_list argptr);

char *gets(char *str,unsigned int len);
int snprintf(char *str, unsigned int size, char flash *fmtstr,...);
int vsnprintf(char *str, unsigned int size, char flash * fmtstr, va_list argptr);

int scanf(char flash *fmtstr,...);
int sscanf(char *str, char flash *fmtstr,...);

#pragma used-

#pragma library stdio.lib

#pragma used+

char *strcat(char *str1,char *str2);
char *strcatf(char *str1,char flash *str2);
char *strchr(char *str,char c);
signed char strcmp(char *str1,char *str2);
signed char strcmpf(char *str1,char flash *str2);
char *strcpy(char *dest,char *src);
char *strcpyf(char *dest,char flash *src);
unsigned char strlcpy(char *dest,char *src,unsigned char n);	
unsigned char strlcpyf(char *dest,char flash *src,unsigned char n); 
unsigned int strlenf(char flash *str);
char *strncat(char *str1,char *str2,unsigned char n);
char *strncatf(char *str1,char flash *str2,unsigned char n);
signed char strncmp(char *str1,char *str2,unsigned char n);
signed char strncmpf(char *str1,char flash *str2,unsigned char n);
char *strncpy(char *dest,char *src,unsigned char n);
char *strncpyf(char *dest,char flash *src,unsigned char n);
char *strpbrk(char *str,char *set);
char *strpbrkf(char *str,char flash *set);
char *strrchr(char *str,char c);
char *strrpbrk(char *str,char *set);
char *strrpbrkf(char *str,char flash *set);
char *strstr(char *str1,char *str2);
char *strstrf(char *str1,char flash *str2);
char *strtok(char *str1,char flash *str2);

unsigned int strlen(char *str);
void *memccpy(void *dest,void *src,char c,unsigned n);
void *memchr(void *buf,unsigned char c,unsigned n);
signed char memcmp(void *buf1,void *buf2,unsigned n);
signed char memcmpf(void *buf1,void flash *buf2,unsigned n);
void *memcpy(void *dest,void *src,unsigned n);
void *memcpyf(void *dest,void flash *src,unsigned n);
void *memmove(void *dest,void *src,unsigned n);
void *memset(void *buf,unsigned char c,unsigned n);
unsigned int strcspn(char *str,char *set);
unsigned int strcspnf(char *str,char flash *set);
int strpos(char *str,char c);
int strrpos(char *str,char c);
unsigned int strspn(char *str,char *set);
unsigned int strspnf(char *str,char flash *set);

#pragma used-
#pragma library string.lib

#pragma used+

void delay_us(unsigned int n);
void delay_ms(unsigned int n);

#pragma used-

typedef signed char             								int8;
typedef unsigned char           								uint8;
typedef signed int              								int16;
typedef unsigned int            								uint16;
typedef signed long int         								int32;
typedef unsigned long int       								uint32;	

typedef enum {
cmd   	= 0,
data  	= 1
} N11_RS;

typedef enum {
PIXEL_OFF  	= 0,
PIXEL_ON  	= 1,
PIXEL_XOR  	= 2
} N11_Pmode;

void N11_Write(N11_RS DC, unsigned char c);
void N11_GotoXR(unsigned char x, unsigned char r);

void N11_Init(void);
void N11_CLS(void);

void N11_Update(void);

void N11_Contrast(unsigned char cont);
void N11_Backlight(unsigned char x);

void N11_SetPixel(unsigned char x, unsigned char y, N11_Pmode mode);	
unsigned char N11_ReadPixel(unsigned char x, unsigned char y);
void N11_FillRect(unsigned char x1, unsigned char y1, unsigned char x2, unsigned char y2, N11_Pmode mode);

void N11_DrawBitmap(flash unsigned char *bitmap, unsigned char x, unsigned char y, N11_Pmode mode);

extern unsigned char 							CursorX;
extern unsigned char 							CursorY;

extern unsigned char 							FntSpaceX;
extern unsigned char 							FntSpaceY;

void N11_FontSelect(flash unsigned char *Fpntr);

void N11_PrintChar(char ch, N11_Pmode color);								
void N11_PrintString(char *str, N11_Pmode color);						

void SFN_GotoXR(unsigned char x, unsigned char ln);

void N11_TypeStr(unsigned char lin, unsigned char col, char *str, unsigned char len, N11_Pmode color, unsigned char dly);
void N11_ChrCls(unsigned char dly);

unsigned char N11_GetStrLenC(char *str);
unsigned char N11_GetStrLenX(char *str);

flash unsigned char ef5x7[] = {
3,		
5,		
8,		

0x00, 0x00, 0x00, 0x00, 0x00,					

0x00, 0x00, 0x5F, 0x00, 0x00,					
0x00, 0x07, 0x00, 0x07, 0x00,					
0x14, 0x7F, 0x14, 0x7F, 0x14,					
0x24, 0x2A, 0x7F, 0x2A, 0x12,					
0x23, 0x13, 0x08, 0x64, 0x62,					
0x36, 0x49, 0x55, 0x22, 0x50,					
0x00, 0x05, 0x03, 0x00, 0x00,					
0x00, 0x1C, 0x22, 0x41, 0x00,					
0x00, 0x41, 0x22, 0x1C, 0x00,					
0x08, 0x2A, 0x1C, 0x2A, 0x08,					
0x08, 0x08, 0x3E, 0x08, 0x08,					
0x00, 0x50, 0x30, 0x00, 0x00,					
0x08, 0x08, 0x08, 0x08, 0x08,					
0x00, 0x30, 0x30, 0x00, 0x00,					
0x20, 0x10, 0x08, 0x04, 0x02,					

0x3E, 0x51, 0x49, 0x45, 0x3E,					
0x00, 0x42, 0x7F, 0x40, 0x00,					
0x42, 0x61, 0x51, 0x49, 0x46,					
0x21, 0x41, 0x45, 0x4B, 0x31,					
0x18, 0x14, 0x12, 0x7F, 0x10,					
0x27, 0x45, 0x45, 0x45, 0x39,					
0x3C, 0x4A, 0x49, 0x49, 0x30,					
0x01, 0x71, 0x09, 0x05, 0x03,					
0x36, 0x49, 0x49, 0x49, 0x36,					
0x06, 0x49, 0x49, 0x29, 0x1E,					

0x00, 0x36, 0x36, 0x00, 0x00,					
0x00, 0x56, 0x36, 0x00, 0x00,					
0x00, 0x08, 0x14, 0x22, 0x41,					
0x14, 0x14, 0x14, 0x14, 0x14,					
0x41, 0x22, 0x14, 0x08, 0x00,					
0x02, 0x01, 0x51, 0x09, 0x06,					
0x32, 0x49, 0x79, 0x41, 0x3E,					

0x7E, 0x11, 0x11, 0x11, 0x7E,					
0x7F, 0x49, 0x49, 0x49, 0x36,					
0x3E, 0x41, 0x41, 0x41, 0x22,					
0x7F, 0x41, 0x41, 0x22, 0x1C,					
0x7F, 0x49, 0x49, 0x49, 0x41,					
0x7F, 0x09, 0x09, 0x01, 0x01,					
0x3E, 0x41, 0x41, 0x51, 0x32,					
0x7F, 0x08, 0x08, 0x08, 0x7F,					
0x00, 0x41, 0x7F, 0x41, 0x00,					
0x20, 0x40, 0x41, 0x3F, 0x01,					
0x7F, 0x08, 0x14, 0x22, 0x41,					
0x7F, 0x40, 0x40, 0x40, 0x40,					
0x7F, 0x02, 0x04, 0x02, 0x7F,					
0x7F, 0x04, 0x08, 0x10, 0x7F,					
0x3E, 0x41, 0x41, 0x41, 0x3E,					
0x7F, 0x09, 0x09, 0x09, 0x06,					
0x3E, 0x41, 0x51, 0x21, 0x5E,					
0x7F, 0x09, 0x19, 0x29, 0x46,					
0x46, 0x49, 0x49, 0x49, 0x31,					
0x01, 0x01, 0x7F, 0x01, 0x01,					
0x3F, 0x40, 0x40, 0x40, 0x3F,					
0x1F, 0x20, 0x40, 0x20, 0x1F,					
0x7F, 0x20, 0x18, 0x20, 0x7F,					
0x63, 0x14, 0x08, 0x14, 0x63,					
0x03, 0x04, 0x78, 0x04, 0x03,					
0x61, 0x51, 0x49, 0x45, 0x43	 				

,
0x00, 0x00, 0x7F, 0x41, 0x41,				
0x02, 0x04, 0x08, 0x10, 0x20,				
0x41, 0x41, 0x7F, 0x00, 0x00,				
0x04, 0x02, 0x01, 0x02, 0x04,				
0x40, 0x40, 0x40, 0x40, 0x40,				
0x00, 0x01, 0x02, 0x04, 0x00,				

0x20, 0x54, 0x54, 0x54, 0x78,				
0x7F, 0x48, 0x44, 0x44, 0x38,				
0x38, 0x44, 0x44, 0x44, 0x20,				
0x38, 0x44, 0x44, 0x48, 0x7F,				
0x38, 0x54, 0x54, 0x54, 0x18,				
0x08, 0x7E, 0x09, 0x01, 0x02,				
0x08, 0x14, 0x54, 0x54, 0x3C,				
0x7F, 0x08, 0x04, 0x04, 0x78,				
0x00, 0x44, 0x7D, 0x40, 0x00,				
0x20, 0x40, 0x44, 0x3D, 0x00,				
0x00, 0x7F, 0x10, 0x28, 0x44,				
0x00, 0x41, 0x7F, 0x40, 0x00,				
0x7C, 0x04, 0x18, 0x04, 0x78,				
0x7C, 0x08, 0x04, 0x04, 0x78,				
0x38, 0x44, 0x44, 0x44, 0x38,				
0x7C, 0x14, 0x14, 0x14, 0x08,				
0x08, 0x14, 0x14, 0x18, 0x7C,				
0x7C, 0x08, 0x04, 0x04, 0x08,				
0x48, 0x54, 0x54, 0x54, 0x20,				
0x04, 0x3F, 0x44, 0x40, 0x20,				
0x3C, 0x40, 0x40, 0x20, 0x7C,				
0x1C, 0x20, 0x40, 0x20, 0x1C,				
0x3C, 0x40, 0x30, 0x40, 0x3C,				
0x44, 0x28, 0x10, 0x28, 0x44,				
0x0C, 0x50, 0x50, 0x50, 0x3C,				
0x44, 0x64, 0x54, 0x4C, 0x44,				

0x00, 0x08, 0x36, 0x41, 0x00,				
0x00, 0x00, 0x7F, 0x00, 0x00,				
0x00, 0x41, 0x36, 0x08, 0x00,				
0x08, 0x08, 0x2A, 0x1C, 0x08,				
0x08, 0x1C, 0x2A, 0x08, 0x08	 			
};

char Ctemp[50];
int  Itemp;

void Initial(void);
void Splash(void);

void main(void)
{
unsigned char i;
Initial();															

static char *mySTR[3] = {
"S-Font test...",
"Complete mode!",				
"Www.Elasa.ir!"
};

N11_TypeStr(1, 1, mySTR[1], N11_GetStrLenC(mySTR[1]), PIXEL_ON, 150);
delay_ms(2000);
N11_TypeStr(1, 1, mySTR[1], N11_GetStrLenC(mySTR[1]), PIXEL_OFF, 50);

delay_ms(1000);

N11_TypeStr(0, 1, mySTR[0], N11_GetStrLenC(mySTR[0]), PIXEL_ON, 100);
N11_TypeStr(2, 1, mySTR[1], N11_GetStrLenC(mySTR[1]), PIXEL_ON, 100);
N11_TypeStr(4, 1, mySTR[2], N11_GetStrLenC(mySTR[2]), PIXEL_ON, 100);
N11_TypeStr(6, 1, mySTR[3], N11_GetStrLenC(mySTR[3]), PIXEL_ON, 100);
delay_ms(3000);

N11_ChrCls(100);
delay_ms(500);

{SFN_GotoXR(1, 1);	N11_PrintString("YES!!!  :)", PIXEL_ON);}					;

while(1);
} 

void Initial(void)
{
N11_Init();
N11_Contrast(10);
N11_Backlight(1);

N11_CLS();

N11_FontSelect(ef5x7);
Splash();
}	

void Splash(void)
{
static char *SPchar[3] = {
"S-Font test...",
"by :",
"Www.Elasa.ir"
};

{SFN_GotoXR(1, 1);	N11_PrintString(SPchar[0], PIXEL_ON);}					;
{SFN_GotoXR(1, 4);	N11_PrintString(SPchar[1], PIXEL_ON);}					;
{SFN_GotoXR(1, 6);	N11_PrintString(SPchar[2], PIXEL_ON);}					;

delay_ms(2000);
N11_CLS();
}	
