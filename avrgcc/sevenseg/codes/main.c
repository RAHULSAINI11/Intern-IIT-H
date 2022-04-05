
//Prints a decimal number 
//on the display
//#include <avr/io.h>
 
//int main (void)
//{
	
	
 //set PD2-PD7 as output pins 0xFC=0b11111100 (binary)
 // DDRD   |= 0xFC;
  //set PB0 as output pin
 // DDRB    |= ((1 << DDB0));
  //DDRD   |= 0b00111100  ; declared for 7447
 // while (1) {
//turn PB0 off
   // PORTB = ((1 <<  PB0));
//turn PD2-PD7 on    
   // PORTD = 0b00001000; 
 // }

  /* . */
 // return 0;

//}
//Prints the numbers from 0
//to 9 in a loop
/*#include <avr/io.h>
#include <util/delay.h>
 
void sevenseg(int);
int main (void)
{
	
 int i;

  DDRD   |= 0xFC;
  //set 0 as output pin
  DDRB   |= ((1 << DDB0));
 
  while (1) 
  {
	//loop counting from 0 to 9
  for (i=0; i < 10; i++)
 	{

		sevenseg(i);
		_delay_ms (1000L);		
	}
	}
  /* . */
//  return 0;
/*
}
void sevenseg(int dec)
{
switch(dec)
{
case 0:
    PORTB = ((1 <<  0));
    PORTD = 0b00000000; 
    break;
case 1:
    PORTB = ((1 <<  0));
    PORTD = 0b11100100; 
    break;
case 2:
    PORTB = ((0 <<  0));
    PORTD = 0b10010000; 
    break;
case 3:
	PORTB = ((0 <<  0));
	PORTD = 0b11000000; 
	break;
case 4:
	PORTB = ((0 <<  0));
	PORTD = 0b01100100; 
	break;
case 5:
	PORTB = ((0 <<  0));
	PORTD = 0b01001000; 
	break;
case 6:
	PORTB = ((0 <<  0));
	PORTD = 0b00001000; 
	break;
case 7:
	PORTB = ((1 <<  0));
	PORTD = 0b11100000; 
	break;
case 8:
	PORTB = ((0 <<  0));
	PORTD = 0b00000000; 
	break;
case 9:
	PORTB = ((0 <<  0));
	PORTD = 0b01000000; 
	break;
default:
	PORTB = ((0 <<  0));
	PORTD = 0b00011000; 
	break;
}
}

*/

//Prints the numbers from 0
//to 9 in a loop


// 7447 
/*#include <avr/io.h>
#include <util/delay.h>
int main (void)
{
 int A,B,C,D,a=0,b=0,c=0,d=0;
        DDRD = 0b00111100;
        while(1){
  D=(!d);
  C=((c&&(!d))||((!a)&&(!c)&&(d)));
  B=((b && (!d))  (b && (!c))  ((!b) && c && d));
  A=((a && (!d)) || (b && c && d));
                PORTD = (D << 2);
                PORTD |= (C << 3);
                PORTD |= (B << 4);
                PORTD |= (A << 5);
                _delay_ms (500L);
                a = A;
                b = B;
                c = C;
                d = D;
        }
        return 0;
}*/




#include <avr/io.h>
#include <util/delay.h>
int A;
int B;
int C;
int D;
int W=0;
int X=0;
int Y=0;
int Z=0;
int main (void)
{
DDRD = 0b00111100;
DDRB = 0b00100000;
PORTD = 0b11000000;
PORTB = 0b00000011;

  while (1) {
PORTB = ((1 << PB5));
 A=!W;
   B=(W&&!X&&!Z) || (!W&&X);
   C=(W&&X&&!Y)||  (!X&&Y)||  (!W&&Y);
   D=(W&&X&&Y) || (!W&&Z);
   PORTD = (D << 5);
   PORTD |= (C << 4);
   PORTD |= (B << 3);
   PORTD |= (A << 2);
W =  (PIND & ( 1<< PIND6)) == (1 << PIND6);
X =  (PIND & ( 1<< PIND7)) == (1 << PIND7);
Y =  (PINB & ( 1<< PINB0)) == (1 << PINB0);
Z =  (PINB & ( 1<< PINB1)) == (1 << PINB1);

PORTB = ((0 << PB5));
_delay_ms (500L);
}


  /* . */
  return 0;

}
