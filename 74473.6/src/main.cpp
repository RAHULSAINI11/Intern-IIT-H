#include<Arduino.h>
int D,C,B,A ;
int a,b,c,d,e,f,g;

void setup() {

  pinMode(2, OUTPUT);  
  pinMode(3, OUTPUT);
  pinMode(4, OUTPUT);
  pinMode(5, OUTPUT);
  pinMode(6, OUTPUT);
  pinMode(7, OUTPUT);
  pinMode(8, OUTPUT);   

}

void arduino(int D , int C , int B , int A) {

  a = (!D && !C && !B && A) || (!D && C && !A);
  b = (!D && C && !B && A) || (!D && C && B && !A);
  c = (!D && !C && B && !A);
  d = (!D & C && !B && !A) || (!D && C && B && A) || (!C && !B && A);
  e = (!D && A) || (!D && C && !B) || (!C && !B && A);
  f = (!D && !C && A) || ( !D && B && A) || (!D && !C && B);
  g = (!D && !C && !B ) || (!D && C && B && A);

  
  digitalWrite(2, a); 
  digitalWrite(3, b); 
  digitalWrite(4, c); 
  digitalWrite(5, d); 
  digitalWrite(6, e); 
  digitalWrite(7, f);
  digitalWrite(8, g); 

  

  
  // put your main code here, to run repeatedly:

}
void loop()
{
arduino(0,0,0,0) ;
delay(1000) ;
arduino(0,0,0,1) ;
delay(1000) ;
arduino(0,0,1,0) ;
delay(1000) ;
arduino(0,0,1,1) ;
delay(1000) ;
arduino(0,1,0,0) ;
delay(1000) ;
arduino(0,1,0,1) ;
delay(1000) ;
arduino(0,1,1,0);
delay(1000);
arduino(0,1,1,1);
delay(1000);
arduino(1,0,0,0);
delay(1000) ;
arduino(1,0,0,1);
delay(1000) ;
}


