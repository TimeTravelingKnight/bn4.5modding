newShl equ 0x8002CC8
newLaser equ 0xB8
SHLlaserset:
push r14
push r0-r2,r5
mov r0,newLaser
BXwithR11 newShl|1
mov r0,r5
pop r1-r3,r5
beq @@Escape
strb r1,[r0,0x12]
strb r2,[r0,0x13]
strb r3,[r0,0x17]
str r6,[r0,0x2C]
ldrb r3,[r5,0x16]
@@Escape:
pop r15
.pool