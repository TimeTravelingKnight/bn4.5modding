setShl equ 0x8002CC8|1
Claw equ 0x77
.align 2
SetClaw: 

push r14
mov r6,0xFF
bl SetShlClaw
pop r15

SetShlClaw:
push r14
push r1,r2,r5,r6
mov r0,Claw


BXwithR11 setShl



mov r0,r5
pop r1,r2,r5,r6
beq @@Escape
strb r1,[r0,0x12]
strb r2,[r0,0x13]
strh r6,[r0,0x2C]
ldrb r1,[r5,0x16]
strb r1,[r0,0x16]
str r5,[r0,0x4C]

@@Escape:
pop r15