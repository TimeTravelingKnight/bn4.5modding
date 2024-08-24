
;instrustment, track, song pointers, song header

swooshinstrustment:
.incbin "swooshinstrustment.bin"

.align 4
swooshtrack:
.incbin "swooshtrack.bin"

.align 4
swooshSongHeader:
.db 1,0,0x40,0
.dw swooshinstrustment
.dw swooshtrack

.org 0x8135C44
.dw swooshSongHeader
.db 0x19,0,0x19,0