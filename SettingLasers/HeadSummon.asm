navistatus3 equ 0x800E3DC
shl02 equ 0x8094A72

SetHand:
push r14
mov r4,0x1
lsl r4,r4,0x8
add r4,47
lsl r4,r4,0x8
add r4,0x2E
mov r7,0x4C
add r7,r7,r5
BXwithR11 shl02|1
pop r15
.pool

SummonHead:
push r14
mov r0,0xD
strb r0,[r5,0x10]
mov r4,0x1
lsl r4,r4,0x8
;add r4,1
;mov r1,0x23
BXwithR11 navistatus3|1
;add r0,r0,r0
;sub r0,1
mov r4,48
add r4,r4,r0
lsl r4,r4,0x8
add r4,0x2E
mov r7,0x4C
add r7,r7,r5
BXwithR11 shl02|1
pop r15
.pool
