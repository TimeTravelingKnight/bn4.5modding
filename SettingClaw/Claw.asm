LoopNumber equ 6
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

ldrb r2,[r5,0xB] ;phase of animation
cmp r2,0xC
beq @@NoAnimationupdate

cmp r2,0x4
beq @@CheckToUpdate

mov r1,0x20
ldrb r0,[r5,r1]
cmp r0,1
beq @@UpdateToPhaseC
b @@UpdateCounter
@@UpdateToPhaseC:
add r2,4
strb r2,[r5,0xB]
mov r0,26
strb r0,[r5,0x10]
b @@UpdateCounter



@@CheckToUpdate:
mov r1,0x20
ldrb r0,[r5,r1]
cmp r0,10
beq @@UpdateToPhase8
b @@UpdateCounter

@@UpdateToPhase8:
add r2,4
strb r2,[r5,0xB]
mov r0,25
strb r0,[r5,0x10]
b @@UpdateCounter

@@NoAnimationUpdate:
mov r1,0x20
ldrb r0,[r5,r1]
tst r0,r0
beq @@generate

@@UpdateCounter:
ldrb r0,[r5,r1]
sub r0,0x1
strb r0,[r5,r1] 
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
;mov r0, 0x6
;strb r0,[r5,0x9]
;mov r0,0
;strh r0,[r5,0xA]
;mov r0,0x4
;strb r0,[r5,0xB]

BXwithR11 0x800D5bC|1


@@FINISH:
pop r15


.include "ClawHelperFunctions/ClawLocate.asm"
.include "ClawHelperFunctions/ClawSet.asm"
.include "Shl/ClawMaster.asm"