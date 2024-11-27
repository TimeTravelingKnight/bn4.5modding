Shl03EV equ 0x8094BAE
SetLaserDmg:
push r14
BXwithR11 Shl03EV|1
push r5
mov r5,r0
mov r0,45
strh r0,[r5,0x20]

pop r5

pop r15
.pool