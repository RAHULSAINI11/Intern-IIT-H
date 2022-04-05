.include "/home/rahul/assem/m328Pdef.inc"

ldi r24, 0b00111100
out DDRD, r24
ldi r16, 0b00000001

start:

ldi r20, 0b00001000  ; A
mov r3, r20 
and r3, r16
lsr r3
lsr r3
lsr r3

ldi r20, 0b00000100 ;B
mov r2, r20
and r2, r16
lsr r2
lsr r2

ldi r20, 0b00000001 ;D
mov r1, r20
and r1, r16

ldi r20, 0b00000010 ; C
mov r0, r20
and r0, r16
lsr r0

ldi r20, 0b00000001

mov r7, r20
eor r7, r3  ; !A

mov r6, r20
eor r6, r2 ; !B

mov r5, r20
eor r5, r1 ;!D 

mov r4, r20
eor r4, r0 ; !C

mov r12, r4
and r12, r1
and r12, r7  ; !C D !A
mov r11,r5
and r11,r0; !D C = Y

mov r10, r1
and r10, r0
and r10, r6 ; D C !B
mov r9,r4
and r9,r2 ; !C B
mov r8,r5
and r8,r2 ; B !D = X

mov r18, r1
and r18, r0
and r18, r2 ; D C B
mov r19,r5
and r19,r3 ; A !D = W

or r12, r11; Y

lsl r12; ?

or r10,r9
or r10, r8; X

lsl r10
lsl r10

or r18,r19 ; W
lsl r18
lsl r18
lsl r18

or r18, r10 ; W + X
or r18, r12 ; W + X + Y
or r18, r5; W + X + Y + Z

mov r16, r18

call wait 

lsl r18
lsl r18

out PORTD,r18
rjmp start

wait:
;ush r16

;ush r17
push r18

ldi r16, 0x50
ldi r17, 0x00
ldi r18, 0x00

w0:
dec r18
brne w0
dec r17
brne w0
dec r16
brne w0
pop r18

ret
