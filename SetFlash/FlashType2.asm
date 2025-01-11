SetFlash:
push r14
push r5,r7
mov r0,0x6C
BXwithR11 0x08002C90|1
mov r0,r5
pop r5,r7
beq @@Finish
str r7,[r0,0x60]
ldrb r1,[r0]
mov r2,0x14
orr r1,r2
strb r1,[r0]


@@Finish:
pop r15