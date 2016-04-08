
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

void N11_Write(N11_RS DC, unsigned char c)		
{
int i;

(PORTA &= BitMASKb[7]);

(PORTA &= BitMASKb[6]);
(DC ? ((PORTA |= BitMASKn[2])) : ((PORTA &= BitMASKb[2])));
(PORTA |= BitMASKn[6]);

for(i=7; i>=0; i--)
{
(PORTA &= BitMASKb[6]);
((c & BitMASKn[i]) ? ((PORTA |= BitMASKn[2])) : ((PORTA &= BitMASKb[2])));
(PORTA |= BitMASKn[6]);
}

(PORTA |= BitMASKn[7]);
}	

void N11_GotoXR(unsigned char x, unsigned char r)		
{
N11_Write(cmd, (0xB0| (r &0x0F)));        	
N11_Write(cmd, (0x00| (x &0x0F)));        	
N11_Write(cmd, (0x10|((x >>4) &0x07)));     
}	

void N11_Init(void)														
{
(DDRA |= BitMASKn[7]);		(PORTA |= BitMASKn[7]);

(DDRA |= BitMASKn[2]); (PORTA &= BitMASKb[2]);
(DDRA |= BitMASKn[6]); (PORTA &= BitMASKb[6]);

(DDRA |= BitMASKn[4]); (PORTA &= BitMASKb[4]);
(DDRA |= BitMASKn[3]); (PORTA &= BitMASKb[3]);

(PORTA &= BitMASKb[7]);
delay_ms(50);							

(PORTA |= BitMASKn[4]);

N11_Write(cmd, 0x23);     		
N11_Write(cmd, 0x90);					

N11_Write(cmd, 0xA4);     		
N11_Write(cmd, 0x2F);     		
N11_Write(cmd, 0x40);     		
N11_Write(cmd, 0xB0);     		
N11_Write(cmd, 0x10);     		
N11_Write(cmd, 0x00);      		

N11_Write(cmd, 0xAC);     		
N11_Write(cmd, 0x07);

N11_Write(cmd, 0xAF);    			

N11_CLS();     	    					
N11_Write(cmd, 0xA7);    			

delay_ms(500);
N11_Write(cmd, 0xA6);    			
delay_ms(500);
}	

void N11_CLS(void)														
{
unsigned char 			x, r;

N11_GotoXR(0, 0);
N11_Write(cmd, 0xAE); 					

for(r=0; r<(unsigned char)(65 /8 +1); r++)
{
for(x=0; x<(unsigned char)(96); x++)
{
N11_Write(data, 0x00);
}
}

N11_Write(cmd, 0xAF); 					
}	

void N11_Update(void) 												
{

}	

void N11_Contrast(unsigned char cont)					
{
N11_Write(cmd, 0x21);					
N11_Write(cmd, 0x80 |cont);		
N11_Write(cmd, 0x20)	;				
}	

void N11_Backlight(unsigned char x)						
{
(x ? ((PORTA |= BitMASKn[3])) : ((PORTA &= BitMASKb[3])));
}	

void N11_SetPixel(unsigned char x, unsigned char y, N11_Pmode mode)
{

}	

unsigned char N11_ReadPixel(unsigned char x, unsigned char y)
{	

return(0x00);

}	

void N11_FillRect(unsigned char x1, unsigned char y1, unsigned char x2, unsigned char y2, N11_Pmode mode)
{

}	

void N11_DrawBitmap(flash unsigned char *bitmap, unsigned char x, unsigned char y, N11_Pmode mode)
{

} 
