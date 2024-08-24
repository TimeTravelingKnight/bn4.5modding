
.relativeinclude on
.gba
.open "rockmanreal.gba","Output/rockmanreal.gba",0x8000000

size equ filesize("rockmanreal.gba")
.include "macros/helpermacro.asm"

.orga size
.include "SettingClaw/Claw.asm"
.align 4
ClawSprite:
.incbin "bins/theclaw.DMP"

.align 4
BassSprite:
.incbin "bins/Bass.DMP"

.include "Sound/addingswosh.asm"

.orga 0x8124E8
.dw BASSCLAWATTACK|1

.orga 0x34F4+0x1DC
.dw ClawMOVE2|1


.orga 0x2B700
.dw ClawSprite

.orga 0x2BC20
.dw ClawSprite

.orga 0x2B478
.dw BassSprite


.close
