.include "/home/rahul/assem/m328Pdef.inc"
 
ldi r19, 0b00111100
out DDRD, r19
ldi r16, 0b00001010

start:

ldi r20, 0b00001000  ; z
mov r3, r20 
and r3, r16
lsr r3
lsr r3
lsr r3

ldi r20, 0b00000100 ;   y
mov r2, r20
and r2, r16
lsr r2
lsr r2

ldi r20, 0b00000010 ;   x
mov r1, r20
and r1, r16
lsr r1


ldi r20, 0b00000001 ;   w
mov r0, r20
and r0, r16

ldi r20, 0b00000001
mov r4,r20
eor r4,r0             
mov r21,r4             ;!w = A

mov r5,r20
eor r5,r1             ;!x

mov r6,r20
eor r6,r2             ;!y

mov r7,r20
eor r7,r3             ;!z

;B = wx'z'+w'x
mov r8,r0
and r8,r5
and r8,r7              ;wx'z'

mov r9,r4
and r9,r1

or r8,r9
mov r10,r8
lsl r10               ;B

; C = wxy'+ x'y + w'y
mov r11,r0
and r11,r1
and r11,r6
and r5,r2
and r4,r2
or r11,r5
or r11,r4
mov r12,r11
lsl r12
lsl r12

; D = wxy + w'z
mov r13,r0
and r13,r1
and r13,r2
mov r14,r4
and r14,r3
or r13,r14
lsl r13
lsl r13
lsl r13

or r19,r21
or r19,r10
or r19,r12
or r19,r13
lsl r19
lsl r19
out PORTD,r19
