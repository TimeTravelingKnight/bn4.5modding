BASSefcControl:
push r14
push r0-r2,r5
mov r0,0x56
BXwithR11 0x08002C90|1
mov r0,r5
pop r1-r3,r5
beq @@FINISH
strb r1,[r0,0x12]
strb r2,[r0,0x13]

ldrb r1,[r5,0x16]
strb r1,[r5,0x16]
str r5,[r0,0x4C]

@@FINISH:
pop r15
.pool

.include "BassStillinStateCheck.asm" 