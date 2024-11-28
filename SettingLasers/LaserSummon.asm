SummonLaser equ 0x80A7962
Direction equ 0x800B3E4
SummonNavi equ 0x80024E6
EFC0A equ 0x80ABB74
ConvertCord equ 0x800B39A
EFC00 equ 0x80AA892
FireLaser:
push r14
mov r0,0xD0
BXwithR11 SummonNavi|1

BXwithR11 Direction|1
ldrb r1,[r5,0x12]
add r0,r0,r1
ldrb r1,[r5,0x13]
ldr r6,=0x9400D2
mov r3,0
mov r2,0
mov r4,0
BXwithR11 SummonLaser|1
ldrb r1,[r0]
mov r2,0x10
eor r1,r2
strb r1,[r0]
;ldr r4,=0x12800
ldr r4,=0x1000
BXwithR11 EFC0A|1
bl SetExplosion
pop r15
.pool

SetExplosion:
push r7,r14
BXwithR11 Direction|1
mov r7,r0
ldrb r0,[r5,0x12]
add r0,r0,r7
ldrb r1,[r5,0x13]
@@LoopThis:
cmp r0,7
beq @@Finish
cmp r0,0
beq @@Finish
push r0,r1,r7
BXwithR11 ConvertCord|1
mov r2,r1
mov r1,r0

mov r3,2
ldr r4,=0x80ADAD8
add r4,r4,r3
ldrb r4,[r4]
mov r3,0
BXwithR11 EFC00|1
pop r0,r1,r7
add r0,r0,r7
b @@LoopThis
@@Finish:
pop r7,r15
.pool