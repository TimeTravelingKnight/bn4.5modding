LoopNumber equ 3
.align 2
BASSCLAWATTACK:
push r14
ldrb r0,[r5,0xB]
tst r0,r0
bne @@BRANCH1
mov r0,20
mov r1,0x20
strb r0,[r5,r1]
mov r0,0
add r1,1
strb r0,[r5,r1]
mov r0,24 ;Animation
strb r0,[r5,0x10]
mov r0,0x4
strb r0,[r5,0xB]
b @@FINISH
@@BRANCH1:
mov r1,0x20
ldrb r0,[r5,r1]
tst r0,r0
beq @@generate
ldrh r0,[r5,0x20]
sub r0,0x1
strh r0,[r5,0x20] 
b @@FINISH
@@generate:
bl shootingclawpostions
push r2,r3
mov r2,r1
mov r1,r0
bl SetClaw
pop r1,r2
bl SetClaw

mov r1,0x21
ldrb r0,[r5,r1]
cmp r0,LoopNumber
beq @@End
add r0,1
strb r0,[r5,r1]
mov r0,0xA
mov r1,0x20
strb r0,[r5,r1]
b @@FINISH

@@End:
mov r0, 0x6
strb r0,[r5,0x9]
mov r0,0
strh r0,[r5,0xA]
mov r0,0x4
strb r0,[r5,0xB]

@@FINISH:
pop r15


.include "ClawHelperFunctions/ClawLocate.asm"
.include "ClawHelperFunctions/ClawSet.asm"
.include "Shl/ClawMaster.asm"