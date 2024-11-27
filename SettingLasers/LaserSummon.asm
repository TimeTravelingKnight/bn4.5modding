SummonLaser equ 0x80A7962
Direction equ 0x800B3E4
SummonNavi equ 0x80024E6
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
pop r15
.pool