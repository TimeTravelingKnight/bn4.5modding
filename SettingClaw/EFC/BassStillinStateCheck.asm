BassClawAttackIndex equ 0x8D

BASSEFCCLAW:
push r14
ldr r2,[r5,0x4C]
ldrb r0,[r2,0x9]
mov r1,BassClawAttackIndex
cmp r0,r1
beq @@FINISH
mov r0,0
str r0,[r2,0x3C]
bl Destory

@@FINISH:
pop r15