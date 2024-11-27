Shl03EV equ 0x8094BAE
SetLaserDmg:
push r14
BXwithR11 Shl03EV|1

ldrb r1,[r5]
mov r2,0x10
AND r1,r2
tst r1,r1
bne @@PutCounterForDmg
ldrb r1,[r0]
mov r2,0x10
eor r1,r2
strb r1,[r0]

 
@@PutCounterForDmg:
push r5
mov r5,r0
mov r0,45
strh r0,[r5,0x20]
pop r5


pop r15
.pool