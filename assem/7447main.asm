.include "/home/rahul/assem/m328Pdef.inc"


	ldi r21, 0b00100100
	ldi r16, 0b00111100 ;identifying output pins 2,3,4,5
	out DDRD,r16		;declaring pins as output

k1:		ldi r16,0b00000011	;initializing W
		ldi r17,0b00000000	;initializing X
Start: 	ldi r18,0b00001111  
		ldi r19,0b11111111	;initializing W
		ldi r20,0b11111111;initializing W
		inc r16
		out PORTD,r16		;writing output to pins 2,3,4,5

		;call w0		;calling the loopw routine
W0:  	dec r20
		brne W0
		dec r19
		brne W0
		dec r18
		brne W0
		
		cp r16,r21
		breq k1
		rjmp Start
 
