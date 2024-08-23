rand_rand2 equ 0x8001392|1
shootingclawpostions:
push r5,r14
;time to randomize locs
add sp,-0x8

BXwithR11 rand_rand2|1
mov r1,9
swi 6
mov r5,r1
mov r2,r1
mov r0,0
mov r1,0
@@Loop:
cmp r0,r2
beq @@Inc
mov r3,sp
strb r0,[r3,r1]
add r1,1
@@Inc:
add r0,1
cmp r0,9 
bne @@Loop
BXwithR11 rand_rand2
mov r1,8
swi 6
ldr r0,=Dic 
ldrb r1,[r0,r1]
ldrb r2,[r0,r5]

mov r4,28
mov r0,r1
lsl r0,r4
lsr r0,r4
lsr r1,r1,4

;nextset
mov r3,r2
lsl r2,r4
lsr r2,r4
lsr r3,r3,4
add sp,0x8
pop r5,r15
.pool
Dic:
.db 0x14,0x15,0x16,0x24,0x25,0x26,0x34,0x35,0x36







