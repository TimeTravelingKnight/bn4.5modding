ObjCharMove equ 0x8014EA8|1
LaserMainMove:
push r14
ldr r1,=AnimationLaser
ldrb r0,[r5,0x8]
ldr  r1,[r1,r0]
mov r14,r15
bx r1
BXwithR11 ObjCharMove|1
pop r15
.pool
AnimationLaser:
.dw LaserInit|1
.dw LaserMoveMain|1
.dw 0x8010F21|1 ;KillShl