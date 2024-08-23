ClawMOVE2:
push r14 
ldr r1,=ClawPool
ldrb r0,[r5,0x8]
ldr r1,[r1,r0]
mov r14,r15
bx r1
pop r15
.pool
ClawPool:
.dw Init|1
.dw move|1
.dw Destory|1

Destory:
push r14
BXwithR11 0x8002DAC|1
pop r15