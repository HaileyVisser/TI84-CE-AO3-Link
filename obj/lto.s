	.section	.text,"ax",@progbits
	.assume	ADL = 1
	.file	"llvm-link"
	.section	.text._build_filename,"ax",@progbits
	.globl	_build_filename                 ; -- Begin function build_filename
	.type	_build_filename,@function
_build_filename:                        ; @build_filename
; %bb.0:
	ld	hl, -14
	call	__frameset
	ld	de, (ix + 6)
	ld	iy, (ix + 9)
	lea	hl, ix - 5
	ld	(ix - 8), hl
	ld	(iy), 67
	ld	(iy + 1), 104
	sbc	hl, hl
	adc	hl, de
	jr	nz, .LBB0_2
; %bb.1:
	ld	bc, 1
	ld	(ix - 5), 48
	jp	.LBB0_9
	.local	.LBB0_2
.LBB0_2:
	ld	bc, 0
	push	de
	pop	iy
	ld	de, 1
	ld	l, -10
	ld	(ix - 14), l
	ld	(ix - 13), h
	.local	.LBB0_3
.LBB0_3:                                ; %.preheader
                                        ; =>This Inner Loop Header: Depth=1
	lea	hl, iy + 0
	or	a, a
	sbc	hl, de
	call	pe, __setflag
	ld	(ix - 11), bc
	jp	m, .LBB0_5
; %bb.4:                                ;   in Loop: Header=BB0_3 Depth=1
	lea	hl, iy + 0
	ld	bc, 10
	call	__idivu
	ld	c, (ix - 14)
	ld	b, (ix - 13)
	ld	b, l
	ld	(ix - 14), c
	ld	(ix - 13), b
	mlt	bc
	ld	e, iyl
	ld	a, c
	add	a, e
	ld	e, a
	ld	bc, (ix - 11)
	ld	d, 48
	ld	a, e
	or	a, d
	ld	e, a
	ld	iy, (ix - 8)
	add	iy, bc
	inc	bc
	ld	(iy), e
	push	hl
	pop	iy
	ld	de, 1
	jr	.LBB0_3
	.local	.LBB0_5
.LBB0_5:
	push	bc
	pop	hl
	call	__ishru_1
	ld	(ix - 14), hl
	ld	iy, (ix - 8)
	lea	hl, iy + 0
	add	hl, bc
	dec	hl
	push	hl
	pop	bc
	ld	de, (ix - 14)
	.local	.LBB0_6
.LBB0_6:                                ; =>This Inner Loop Header: Depth=1
	sbc	hl, hl
	adc	hl, de
	jr	z, .LBB0_8
; %bb.7:                                ;   in Loop: Header=BB0_6 Depth=1
	ld	a, (iy)
	push	bc
	pop	hl
	ld	l, (hl)
	ld	(iy), l
	push	bc
	pop	hl
	ld	(hl), a
	inc	iy
	dec	hl
	push	hl
	pop	bc
	dec	de
	jr	.LBB0_6
	.local	.LBB0_8
.LBB0_8:
	ld	iy, (ix + 9)
	ld	bc, (ix - 11)
	.local	.LBB0_9
.LBB0_9:                                ; %.loopexit
	ld	de, (ix - 8)
	push	de
	pop	hl
	add	hl, bc
	ld	(hl), 0
	ld	(iy + 2), 0
	ld	hl, 5
	push	hl
	push	de
	push	iy
	call	_strncat
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end0
.Lfunc_end0:
	.size	_build_filename, .Lfunc_end0-_build_filename
                                        ; -- End function
	.section	.text._read_line,"ax",@progbits
	.globl	_read_line                      ; -- Begin function read_line
	.type	_read_line,@function
_read_line:                             ; @read_line
; %bb.0:
	ld	hl, -7
	call	__frameset
	ld	iy, (ix + 9)
	ld	de, 2
	lea	hl, iy + 0
	or	a, a
	sbc	hl, de
	lea	de, iy + 0
	call	pe, __setflag
	jp	p, .LBB1_2
; %bb.1:
	ld	de, 1
	.local	.LBB1_2
.LBB1_2:
	ld	iy, (ix + 6)
	ld	bc, 0
	dec	de
	.local	.LBB1_3
.LBB1_3:                                ; =>This Inner Loop Header: Depth=1
	push	de
	pop	hl
	ld	(ix - 4), bc
	or	a, a
	sbc	hl, bc
	jr	z, .LBB1_8
; %bb.4:                                ;   in Loop: Header=BB1_3 Depth=1
	ld	(ix - 7), de
	ld	a, (_open_slot)
	ld	l, a
	push	hl
	ld	hl, 1
	push	hl
	push	hl
	pea	ix - 1
	call	_ti_Read
	ld	bc, 1
	pop	de
	pop	de
	pop	de
	pop	de
	or	a, a
	sbc	hl, bc
	jr	nz, .LBB1_7
; %bb.5:                                ;   in Loop: Header=BB1_3 Depth=1
	ld	a, (ix - 1)
	cp	a, 10
	ld	iy, (ix + 6)
	ld	de, (ix - 4)
	jr	z, .LBB1_8
; %bb.6:                                ;   in Loop: Header=BB1_3 Depth=1
	lea	hl, iy + 0
	add	hl, de
	inc	de
	ld	(hl), a
	push	de
	pop	bc
	ld	de, (ix - 7)
	jr	.LBB1_3
	.local	.LBB1_7
.LBB1_7:
	ld	de, (ix - 4)
	sbc	hl, hl
	adc	hl, de
	ld	iy, (ix + 6)
	ld	hl, 0
	jr	z, .LBB1_9
	.local	.LBB1_8
.LBB1_8:                                ; %.loopexit
	add	iy, de
	ld	(iy), 0
	ld	hl, 1
	.local	.LBB1_9
.LBB1_9:
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end1
.Lfunc_end1:
	.size	_read_line, .Lfunc_end1-_read_line
                                        ; -- End function
	.section	.text._free_lines,"ax",@progbits
	.globl	_free_lines                     ; -- Begin function free_lines
	.type	_free_lines,@function
_free_lines:                            ; @free_lines
; %bb.0:
	ld	hl, -6
	call	__frameset
	ld	bc, 0
	ld	de, (_lines)
	sbc	hl, hl
	adc	hl, de
	jr	z, .LBB2_5
; %bb.1:                                ; %.preheader.preheader
	ld	(ix - 3), bc
	push	de
	pop	iy
	.local	.LBB2_2
.LBB2_2:                                ; %.preheader
                                        ; =>This Inner Loop Header: Depth=1
	ld	de, (_total_lines)
	push	bc
	pop	hl
	or	a, a
	sbc	hl, de
	call	pe, __setflag
	jp	p, .LBB2_4
; %bb.3:                                ;   in Loop: Header=BB2_2 Depth=1
	ld	de, (ix - 3)
	add	iy, de
	ld	hl, (iy)
	push	hl
	ld	(ix - 6), bc
	call	_free
	ld	bc, (ix - 6)
	pop	hl
	inc	bc
	ld	iy, (_lines)
	ld	hl, (ix - 3)
	ld	de, 3
	add	hl, de
	ld	(ix - 3), hl
	jr	.LBB2_2
	.local	.LBB2_4
.LBB2_4:
	push	iy
	call	_free
	pop	hl
	ld	bc, 0
	ld	(_lines), bc
	.local	.LBB2_5
.LBB2_5:
	ld	(_total_lines), bc
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end2
.Lfunc_end2:
	.size	_free_lines, .Lfunc_end2-_free_lines
                                        ; -- End function
	.section	.text._open_chapter,"ax",@progbits
	.globl	_open_chapter                   ; -- Begin function open_chapter
	.type	_open_chapter,@function
_open_chapter:                          ; @open_chapter
; %bb.0:
	ld	hl, -60
	call	__frameset
	lea	hl, ix - 8
	ld	(ix - 54), hl
	call	_free_lines
	ld	a, (_open_slot)
	ld	l, a
	or	a, a
	jr	z, .LBB3_2
; %bb.1:
	push	hl
	call	_ti_Close
	pop	hl
	xor	a, a
	ld	(_open_slot), a
	.local	.LBB3_2
.LBB3_2:
	ld	hl, (ix - 54)
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_build_filename
	pop	hl
	pop	hl
	ld	hl, _.str
	push	hl
	ld	hl, (ix - 54)
	push	hl
	call	_ti_Open
	ld	l, a
	pop	de
	pop	de
	ld	(_open_slot), a
	or	a, a
	jr	nz, .LBB3_4
; %bb.3:
	or	a, a
	sbc	hl, hl
	jp	.LBB3_10
	.local	.LBB3_4
.LBB3_4:
	ld	iy, 2
	ld	bc, 1
	lea	de, ix - 51
	ld	(ix - 54), de
	push	hl
	push	bc
	push	iy
	pea	ix - 11
	call	_ti_Read
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	or	a, a
	sbc	hl, hl
	.local	.LBB3_5
.LBB3_5:                                ; =>This Inner Loop Header: Depth=1
	ld	(_total_lines), hl
	ld	hl, 40
	push	hl
	ld	hl, (ix - 54)
	push	hl
	call	_read_line
	pop	de
	pop	de
	add	hl, bc
	or	a, a
	sbc	hl, bc
	jr	z, .LBB3_9
; %bb.6:                                ;   in Loop: Header=BB3_5 Depth=1
	ld	de, (_lines)
	ld	hl, (_total_lines)
	ld	bc, 3
	call	__imulu
	add	hl, bc
	push	hl
	push	de
	call	_realloc
	pop	de
	pop	de
	push	hl
	pop	de
	add	hl, bc
	or	a, a
	sbc	hl, bc
	jr	z, .LBB3_9
; %bb.7:                                ;   in Loop: Header=BB3_5 Depth=1
	ld	(ix - 57), de
	ld	(_lines), de
	ld	hl, (ix - 54)
	push	hl
	call	_strlen
	pop	de
	inc	hl
	ld	(ix - 60), hl
	push	hl
	call	_malloc
	ex	de, hl
	pop	hl
	ld	iy, (_total_lines)
	lea	hl, iy + 0
	ld	bc, 3
	call	__imulu
	push	hl
	pop	bc
	ld	hl, (ix - 57)
	add	hl, bc
	ld	(hl), de
	sbc	hl, hl
	adc	hl, de
	jr	z, .LBB3_9
; %bb.8:                                ;   in Loop: Header=BB3_5 Depth=1
	ld	hl, (ix - 60)
	push	hl
	ld	hl, (ix - 54)
	push	hl
	push	de
	ld	(ix - 57), iy
	call	_memcpy
	pop	hl
	pop	hl
	pop	hl
	ld	hl, (ix - 57)
	inc	hl
	jp	.LBB3_5
	.local	.LBB3_9
.LBB3_9:
	ld	a, (_open_slot)
	ld	l, a
	push	hl
	call	_ti_Close
	pop	hl
	xor	a, a
	ld	(_open_slot), a
	ld	hl, 1
	.local	.LBB3_10
.LBB3_10:
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end3
.Lfunc_end3:
	.size	_open_chapter, .Lfunc_end3-_open_chapter
                                        ; -- End function
	.section	.text._draw_screen,"ax",@progbits
	.globl	_draw_screen                    ; -- Begin function draw_screen
	.type	_draw_screen,@function
_draw_screen:                           ; @draw_screen
; %bb.0:
	ld	hl, -12
	call	__frameset
	ld	hl, (ix + 6)
	ld	(ix - 3), hl
	ld	hl, 1
	push	hl
	call	_gfx_SetDraw
	pop	hl
	or	a, a
	sbc	hl, hl
	push	hl
	call	_gfx_FillScreen
	pop	hl
	ld	hl, 254
	push	hl
	call	_gfx_SetTextFGColor
	pop	hl
	ld	hl, (ix - 3)
	ld	bc, 3
	call	__imulu
	ex	de, hl
	ld	bc, 240
	ld	iy, 0
	ld	hl, (ix - 3)
	ld	(ix - 6), hl
	.local	.LBB4_1
.LBB4_1:                                ; =>This Inner Loop Header: Depth=1
	lea	hl, iy + 0
	or	a, a
	sbc	hl, bc
	jr	z, .LBB4_5
; %bb.2:                                ;   in Loop: Header=BB4_1 Depth=1
	ld	(ix - 9), de
	ld	de, (_total_lines)
	ld	hl, (ix - 6)
	or	a, a
	sbc	hl, de
	call	pe, __setflag
	jp	p, .LBB4_4
; %bb.3:                                ;   in Loop: Header=BB4_1 Depth=1
	ld	hl, (_lines)
	ld	de, (ix - 9)
	add	hl, de
	ld	de, (hl)
	sbc	hl, hl
	adc	hl, de
	push	iy
	ld	hl, 2
	push	hl
	push	de
	ld	(ix - 12), iy
	call	nz, _gfx_PrintStringXY
	ld	iy, (ix - 12)
	pop	hl
	pop	hl
	pop	hl
	ld	bc, 240
	.local	.LBB4_4
.LBB4_4:                                ;   in Loop: Header=BB4_1 Depth=1
	ld	hl, (ix - 9)
	ld	de, 3
	add	hl, de
	ld	de, (ix - 6)
	inc	de
	ld	(ix - 6), de
	ld	de, 10
	add	iy, de
	ex	de, hl
	jr	.LBB4_1
	.local	.LBB4_5
.LBB4_5:
	or	a, a
	sbc	hl, hl
	push	hl
	ld	hl, 230
	push	hl
	call	_gfx_SetTextXY
	pop	hl
	pop	hl
	ld	hl, (ix - 3)
	inc	hl
	ld	de, 4
	push	de
	push	hl
	call	_gfx_PrintInt
	pop	hl
	pop	hl
	ld	hl, _.str.1
	push	hl
	call	_gfx_PrintString
	pop	hl
	ld	hl, (_total_lines)
	ld	de, 4
	push	de
	push	hl
	call	_gfx_PrintInt
	pop	hl
	pop	hl
	ld	hl, 1
	ld	(ix + 6), hl
	ld	sp, ix
	pop	ix
	jp	_gfx_Blit
	.local	.Lfunc_end4
.Lfunc_end4:
	.size	_draw_screen, .Lfunc_end4-_draw_screen
                                        ; -- End function
	.section	.text._select_chapter,"ax",@progbits
	.globl	_select_chapter                 ; -- Begin function select_chapter
	.type	_select_chapter,@function
_select_chapter:                        ; @select_chapter
; %bb.0:
	ld	hl, -4
	call	__frameset
	ld	hl, 1
	ld	de, 0
	ld	(ix - 3), de
	.local	.LBB5_1
.LBB5_1:                                ; %.loopexit
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB5_66 Depth 2
	push	hl
	call	_gfx_SetDraw
	pop	hl
	or	a, a
	sbc	hl, hl
	push	hl
	call	_gfx_FillScreen
	pop	hl
	ld	hl, 254
	push	hl
	call	_gfx_SetTextFGColor
	pop	hl
	ld	hl, 80
	push	hl
	ld	hl, 100
	push	hl
	ld	hl, _.str.2
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 110
	push	hl
	ld	hl, 80
	push	hl
	ld	hl, _.str.3
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 130
	push	hl
	push	hl
	ld	hl, _.str.4
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 1
	push	hl
	ld	hl, (ix - 3)
	push	hl
	call	_gfx_PrintInt
	pop	hl
	pop	hl
	ld	hl, 160
	push	hl
	ld	hl, 85
	push	hl
	ld	hl, _.str.5
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 175
	push	hl
	ld	hl, 85
	push	hl
	ld	hl, _.str.6
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 1
	push	hl
	call	_gfx_Blit
	pop	hl
	call	_kb_Scan
	ld	hl, -720874
	push	de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, e
	ld	h, d
	pop	de
	ld.sis	bc, 1
	call	__sand
	ld	c, l
	ld	b, h
	ld	hl, (ix - 3)
	ld	de, 99
	or	a, a
	sbc	hl, de
	call	pe, __setflag
	ld	l, -1
	ld	de, (ix - 3)
	jp	m, .LBB5_3
; %bb.2:                                ; %.loopexit
                                        ;   in Loop: Header=BB5_1 Depth=1
	ld	l, 0
	.local	.LBB5_3
.LBB5_3:                                ; %.loopexit
                                        ;   in Loop: Header=BB5_1 Depth=1
	ld	a, c
	and	a, l
	ld	l, a
	ld	(ix - 4), l
	push	de
	pop	hl
	ld	bc, 10
	call	__imulu
	push	hl
	pop	iy
	bit	0, (ix - 4)                     ; 1-byte Folded Reload
	jr	nz, .LBB5_5
; %bb.4:                                ; %.loopexit
                                        ;   in Loop: Header=BB5_1 Depth=1
	push	de
	pop	iy
	.local	.LBB5_5
.LBB5_5:                                ; %.loopexit
                                        ;   in Loop: Header=BB5_1 Depth=1
	ld	hl, -720874
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	lea	hl, iy + 0
	ld	bc, 99
	or	a, a
	sbc	hl, bc
	call	pe, __setflag
	ld	c, -1
	ld	l, c
	jp	m, .LBB5_7
; %bb.6:                                ; %.loopexit
                                        ;   in Loop: Header=BB5_1 Depth=1
	ld	l, 0
	.local	.LBB5_7
.LBB5_7:                                ; %.loopexit
                                        ;   in Loop: Header=BB5_1 Depth=1
	ld	a, e
	bit	1, a
	ld	a, c
	jr	nz, .LBB5_9
; %bb.8:                                ; %.loopexit
                                        ;   in Loop: Header=BB5_1 Depth=1
	ld	a, 0
	.local	.LBB5_9
.LBB5_9:                                ; %.loopexit
                                        ;   in Loop: Header=BB5_1 Depth=1
	and	a, l
	ld	l, a
	ld	(ix - 3), l
	lea	hl, iy + 0
	ld	bc, 10
	call	__imulu
	ex	de, hl
	bit	0, (ix - 3)                     ; 1-byte Folded Reload
	jr	nz, .LBB5_11
; %bb.10:                               ; %.loopexit
                                        ;   in Loop: Header=BB5_1 Depth=1
	lea	de, iy + 0
	jr	.LBB5_12
	.local	.LBB5_11
.LBB5_11:                               ;   in Loop: Header=BB5_1 Depth=1
	inc	de
	.local	.LBB5_12
.LBB5_12:                               ; %.loopexit
                                        ;   in Loop: Header=BB5_1 Depth=1
	ld	hl, -720872
	push	de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	iyl, e
	ld	iyh, d
	pop	de
	push	de
	pop	hl
	ld	bc, 99
	or	a, a
	sbc	hl, bc
	call	pe, __setflag
	ld	c, -1
	ld	l, c
	jp	m, .LBB5_14
; %bb.13:                               ; %.loopexit
                                        ;   in Loop: Header=BB5_1 Depth=1
	ld	l, 0
	.local	.LBB5_14
.LBB5_14:                               ; %.loopexit
                                        ;   in Loop: Header=BB5_1 Depth=1
	ld	a, iyl
	bit	1, a
	ld	a, c
	jr	nz, .LBB5_16
; %bb.15:                               ; %.loopexit
                                        ;   in Loop: Header=BB5_1 Depth=1
	ld	a, 0
	.local	.LBB5_16
.LBB5_16:                               ; %.loopexit
                                        ;   in Loop: Header=BB5_1 Depth=1
	and	a, l
	ld	l, a
	ld	(ix - 3), l
	push	de
	pop	hl
	ld	bc, 10
	call	__imulu
	push	hl
	pop	iy
	ld	bc, 2
	add	iy, bc
	bit	0, (ix - 3)                     ; 1-byte Folded Reload
	jr	nz, .LBB5_18
; %bb.17:                               ; %.loopexit
                                        ;   in Loop: Header=BB5_1 Depth=1
	push	de
	pop	iy
	.local	.LBB5_18
.LBB5_18:                               ; %.loopexit
                                        ;   in Loop: Header=BB5_1 Depth=1
	ld	hl, -720870
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	lea	hl, iy + 0
	ld	bc, 99
	or	a, a
	sbc	hl, bc
	call	pe, __setflag
	ld	c, -1
	ld	l, c
	jp	m, .LBB5_20
; %bb.19:                               ; %.loopexit
                                        ;   in Loop: Header=BB5_1 Depth=1
	ld	l, 0
	.local	.LBB5_20
.LBB5_20:                               ; %.loopexit
                                        ;   in Loop: Header=BB5_1 Depth=1
	ld	a, e
	bit	1, a
	ld	a, c
	jr	nz, .LBB5_22
; %bb.21:                               ; %.loopexit
                                        ;   in Loop: Header=BB5_1 Depth=1
	ld	a, 0
	.local	.LBB5_22
.LBB5_22:                               ; %.loopexit
                                        ;   in Loop: Header=BB5_1 Depth=1
	and	a, l
	ld	e, a
	lea	hl, iy + 0
	ld	bc, 10
	call	__imulu
	ld	(ix - 3), iy
	push	hl
	pop	iy
	ld	bc, 3
	add	iy, bc
	bit	0, e
	jr	nz, .LBB5_24
; %bb.23:                               ; %.loopexit
                                        ;   in Loop: Header=BB5_1 Depth=1
	ld	iy, (ix - 3)
	.local	.LBB5_24
.LBB5_24:                               ; %.loopexit
                                        ;   in Loop: Header=BB5_1 Depth=1
	ld	hl, -720874
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	lea	hl, iy + 0
	ld	bc, 99
	or	a, a
	sbc	hl, bc
	call	pe, __setflag
	ld	c, -1
	ld	l, c
	jp	m, .LBB5_26
; %bb.25:                               ; %.loopexit
                                        ;   in Loop: Header=BB5_1 Depth=1
	ld	l, 0
	.local	.LBB5_26
.LBB5_26:                               ; %.loopexit
                                        ;   in Loop: Header=BB5_1 Depth=1
	ld	a, e
	bit	2, a
	ld	a, c
	jr	nz, .LBB5_28
; %bb.27:                               ; %.loopexit
                                        ;   in Loop: Header=BB5_1 Depth=1
	ld	a, 0
	.local	.LBB5_28
.LBB5_28:                               ; %.loopexit
                                        ;   in Loop: Header=BB5_1 Depth=1
	and	a, l
	ld	e, a
	lea	hl, iy + 0
	ld	bc, 10
	call	__imulu
	ld	(ix - 3), iy
	push	hl
	pop	iy
	ld	bc, 4
	add	iy, bc
	bit	0, e
	jr	nz, .LBB5_30
; %bb.29:                               ; %.loopexit
                                        ;   in Loop: Header=BB5_1 Depth=1
	ld	iy, (ix - 3)
	.local	.LBB5_30
.LBB5_30:                               ; %.loopexit
                                        ;   in Loop: Header=BB5_1 Depth=1
	ld	hl, -720872
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	lea	hl, iy + 0
	ld	bc, 99
	or	a, a
	sbc	hl, bc
	call	pe, __setflag
	ld	c, -1
	ld	l, c
	jp	m, .LBB5_32
; %bb.31:                               ; %.loopexit
                                        ;   in Loop: Header=BB5_1 Depth=1
	ld	l, 0
	.local	.LBB5_32
.LBB5_32:                               ; %.loopexit
                                        ;   in Loop: Header=BB5_1 Depth=1
	ld	a, e
	bit	2, a
	ld	a, c
	jr	nz, .LBB5_34
; %bb.33:                               ; %.loopexit
                                        ;   in Loop: Header=BB5_1 Depth=1
	ld	a, 0
	.local	.LBB5_34
.LBB5_34:                               ; %.loopexit
                                        ;   in Loop: Header=BB5_1 Depth=1
	and	a, l
	ld	e, a
	lea	hl, iy + 0
	ld	bc, 10
	call	__imulu
	ld	(ix - 3), iy
	push	hl
	pop	iy
	ld	bc, 5
	add	iy, bc
	bit	0, e
	jr	nz, .LBB5_36
; %bb.35:                               ; %.loopexit
                                        ;   in Loop: Header=BB5_1 Depth=1
	ld	iy, (ix - 3)
	.local	.LBB5_36
.LBB5_36:                               ; %.loopexit
                                        ;   in Loop: Header=BB5_1 Depth=1
	ld	hl, -720870
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	lea	hl, iy + 0
	ld	bc, 99
	or	a, a
	sbc	hl, bc
	call	pe, __setflag
	ld	c, -1
	ld	l, c
	jp	m, .LBB5_38
; %bb.37:                               ; %.loopexit
                                        ;   in Loop: Header=BB5_1 Depth=1
	ld	l, 0
	.local	.LBB5_38
.LBB5_38:                               ; %.loopexit
                                        ;   in Loop: Header=BB5_1 Depth=1
	ld	a, e
	bit	2, a
	ld	a, c
	jr	nz, .LBB5_40
; %bb.39:                               ; %.loopexit
                                        ;   in Loop: Header=BB5_1 Depth=1
	ld	a, 0
	.local	.LBB5_40
.LBB5_40:                               ; %.loopexit
                                        ;   in Loop: Header=BB5_1 Depth=1
	and	a, l
	ld	e, a
	lea	hl, iy + 0
	ld	bc, 10
	call	__imulu
	ld	(ix - 3), iy
	push	hl
	pop	iy
	ld	bc, 6
	add	iy, bc
	bit	0, e
	jr	nz, .LBB5_42
; %bb.41:                               ; %.loopexit
                                        ;   in Loop: Header=BB5_1 Depth=1
	ld	iy, (ix - 3)
	.local	.LBB5_42
.LBB5_42:                               ; %.loopexit
                                        ;   in Loop: Header=BB5_1 Depth=1
	ld	hl, -720874
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	lea	hl, iy + 0
	ld	bc, 99
	or	a, a
	sbc	hl, bc
	call	pe, __setflag
	ld	c, -1
	ld	l, c
	jp	m, .LBB5_44
; %bb.43:                               ; %.loopexit
                                        ;   in Loop: Header=BB5_1 Depth=1
	ld	l, 0
	.local	.LBB5_44
.LBB5_44:                               ; %.loopexit
                                        ;   in Loop: Header=BB5_1 Depth=1
	ld	a, e
	bit	3, a
	ld	a, c
	jr	nz, .LBB5_46
; %bb.45:                               ; %.loopexit
                                        ;   in Loop: Header=BB5_1 Depth=1
	ld	a, 0
	.local	.LBB5_46
.LBB5_46:                               ; %.loopexit
                                        ;   in Loop: Header=BB5_1 Depth=1
	and	a, l
	ld	e, a
	lea	hl, iy + 0
	ld	bc, 10
	call	__imulu
	ld	(ix - 3), iy
	push	hl
	pop	iy
	ld	bc, 7
	add	iy, bc
	bit	0, e
	jr	nz, .LBB5_48
; %bb.47:                               ; %.loopexit
                                        ;   in Loop: Header=BB5_1 Depth=1
	ld	iy, (ix - 3)
	.local	.LBB5_48
.LBB5_48:                               ; %.loopexit
                                        ;   in Loop: Header=BB5_1 Depth=1
	ld	hl, -720872
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	lea	hl, iy + 0
	ld	bc, 99
	or	a, a
	sbc	hl, bc
	call	pe, __setflag
	ld	c, -1
	ld	l, c
	jp	m, .LBB5_50
; %bb.49:                               ; %.loopexit
                                        ;   in Loop: Header=BB5_1 Depth=1
	ld	l, 0
	.local	.LBB5_50
.LBB5_50:                               ; %.loopexit
                                        ;   in Loop: Header=BB5_1 Depth=1
	ld	a, e
	bit	3, a
	ld	a, c
	jr	nz, .LBB5_52
; %bb.51:                               ; %.loopexit
                                        ;   in Loop: Header=BB5_1 Depth=1
	ld	a, 0
	.local	.LBB5_52
.LBB5_52:                               ; %.loopexit
                                        ;   in Loop: Header=BB5_1 Depth=1
	and	a, l
	ld	e, a
	lea	hl, iy + 0
	ld	bc, 10
	call	__imulu
	ld	(ix - 3), iy
	push	hl
	pop	iy
	ld	bc, 8
	add	iy, bc
	bit	0, e
	jr	nz, .LBB5_54
; %bb.53:                               ; %.loopexit
                                        ;   in Loop: Header=BB5_1 Depth=1
	ld	iy, (ix - 3)
	.local	.LBB5_54
.LBB5_54:                               ; %.loopexit
                                        ;   in Loop: Header=BB5_1 Depth=1
	ld	hl, -720870
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	lea	hl, iy + 0
	ld	bc, 99
	or	a, a
	sbc	hl, bc
	call	pe, __setflag
	ld	c, -1
	ld	l, c
	jp	m, .LBB5_56
; %bb.55:                               ; %.loopexit
                                        ;   in Loop: Header=BB5_1 Depth=1
	ld	l, 0
	.local	.LBB5_56
.LBB5_56:                               ; %.loopexit
                                        ;   in Loop: Header=BB5_1 Depth=1
	ld	a, e
	bit	3, a
	ld	a, c
	jr	nz, .LBB5_58
; %bb.57:                               ; %.loopexit
                                        ;   in Loop: Header=BB5_1 Depth=1
	ld	a, 0
	.local	.LBB5_58
.LBB5_58:                               ; %.loopexit
                                        ;   in Loop: Header=BB5_1 Depth=1
	and	a, l
	ld	e, a
	lea	hl, iy + 0
	ld	bc, 10
	call	__imulu
	ld	(ix - 3), iy
	push	hl
	pop	iy
	dec	bc
	add	iy, bc
	bit	0, e
	jr	nz, .LBB5_60
; %bb.59:                               ; %.loopexit
                                        ;   in Loop: Header=BB5_1 Depth=1
	ld	iy, (ix - 3)
	.local	.LBB5_60
.LBB5_60:                               ; %.loopexit
                                        ;   in Loop: Header=BB5_1 Depth=1
	ld	hl, -720878
	push	de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, e
	ld	h, d
	pop	de
	ld	e, -128
	ld	a, l
	and	a, e
	ld	e, a
	lea	hl, iy + 0
	ld	bc, 10
	call	__idivu
	or	a, a
	jr	z, .LBB5_62
; %bb.61:                               ; %.loopexit
                                        ;   in Loop: Header=BB5_1 Depth=1
	push	hl
	pop	iy
	.local	.LBB5_62
.LBB5_62:                               ; %.loopexit
                                        ;   in Loop: Header=BB5_1 Depth=1
	ld	(ix - 3), iy
	ld	iy, -720868
	ld	l, (iy)
	ld	h, (iy + 1)
	ld	a, l
	bit	6, a
	ld.sis	bc, 1
	jr	nz, .LBB5_68
; %bb.63:                               ;   in Loop: Header=BB5_1 Depth=1
	ld	l, (iy)
	ld	h, (iy + 1)
	call	__sand
	bit	0, l
	jr	z, .LBB5_66
; %bb.64:                               ;   in Loop: Header=BB5_1 Depth=1
	ld	hl, (ix - 3)
	ld	de, 1
	or	a, a
	sbc	hl, de
	call	pe, __setflag
	jp	m, .LBB5_66
	jr	.LBB5_69
	.local	.LBB5_65
.LBB5_65:                               ;   in Loop: Header=BB5_66 Depth=2
	call	_kb_Scan
	.local	.LBB5_66
.LBB5_66:                               ; %.preheader
                                        ;   Parent Loop BB5_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	call	_kb_AnyKey
	or	a, a
	jr	nz, .LBB5_65
; %bb.67:                               ;   in Loop: Header=BB5_1 Depth=1
	ld	hl, 1
	jp	.LBB5_1
	.local	.LBB5_68
.LBB5_68:
	or	a, a
	sbc	hl, hl
	jr	.LBB5_70
	.local	.LBB5_69
.LBB5_69:
	ld	hl, (ix - 3)
	.local	.LBB5_70
.LBB5_70:
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end5
.Lfunc_end5:
	.size	_select_chapter, .Lfunc_end5-_select_chapter
                                        ; -- End function
	.section	.text._run_debug,"ax",@progbits
	.globl	_run_debug                      ; -- Begin function run_debug
	.type	_run_debug,@function
_run_debug:                             ; @run_debug
; %bb.0:
	ld	hl, -13
	call	__frameset
	ld	hl, _.str.7
	ld	de, _.str
	push	de
	push	hl
	call	_ti_Open
	ld	l, a
	ld	(ix - 7), hl
	pop	hl
	pop	hl
	ld	hl, 1
	push	hl
	call	_gfx_SetDraw
	pop	hl
	or	a, a
	sbc	hl, hl
	push	hl
	call	_gfx_FillScreen
	pop	hl
	ld	hl, 254
	push	hl
	call	_gfx_SetTextFGColor
	pop	hl
	ld	hl, (ix - 7)
	ld	a, l
	or	a, a
	jr	nz, .LBB6_4
; %bb.1:
	ld	hl, _.str.8
	ld	de, 10
	push	de
	push	de
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 1
	push	hl
	call	_gfx_Blit
	pop	hl
	.local	.LBB6_2
.LBB6_2:                                ; =>This Inner Loop Header: Depth=1
	ld	hl, -720868
	push	de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, e
	ld	h, d
	pop	de
	ld	a, l
	bit	6, a
	jp	nz, .LBB6_11
; %bb.3:                                ;   in Loop: Header=BB6_2 Depth=1
	call	_kb_Scan
	jr	.LBB6_2
	.local	.LBB6_4
.LBB6_4:
	ld	de, 2
	push	hl
	ld	hl, 1
	push	hl
	push	de
	pea	ix - 3
	call	_ti_Read
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	de, 20
	or	a, a
	sbc	hl, hl
	push	hl
	pop	iy
	.local	.LBB6_5
.LBB6_5:                                ; =>This Inner Loop Header: Depth=1
	ld	(ix - 10), hl
	or	a, a
	sbc	hl, de
	jr	z, .LBB6_8
; %bb.6:                                ;   in Loop: Header=BB6_5 Depth=1
	ld	hl, (ix - 7)
	push	hl
	ld	hl, 1
	push	hl
	push	hl
	pea	ix - 4
	ld	(ix - 13), iy
	call	_ti_Read
	ld	bc, (ix - 13)
	pop	de
	pop	de
	pop	de
	pop	de
	ld	de, 1
	or	a, a
	sbc	hl, de
	jr	nz, .LBB6_8
; %bb.7:                                ;   in Loop: Header=BB6_5 Depth=1
	push	bc
	or	a, a
	sbc	hl, hl
	push	hl
	call	_gfx_SetTextXY
	pop	hl
	pop	hl
	ld	hl, 2
	push	hl
	ld	hl, (ix - 10)
	push	hl
	call	_gfx_PrintInt
	pop	hl
	pop	hl
	ld	hl, _.str.9
	push	hl
	call	_gfx_PrintString
	pop	hl
	ld	a, (ix - 4)
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	de, 3
	push	de
	push	hl
	call	_gfx_PrintInt
	ld	iy, (ix - 13)
	pop	hl
	pop	hl
	ld	hl, (ix - 10)
	inc	hl
	ld	de, 10
	add	iy, de
	ld	de, 20
	jr	.LBB6_5
	.local	.LBB6_8
.LBB6_8:
	ld	hl, (ix - 7)
	push	hl
	call	_ti_Close
	pop	hl
	ld	hl, 1
	push	hl
	call	_gfx_Blit
	pop	hl
	.local	.LBB6_9
.LBB6_9:                                ; =>This Inner Loop Header: Depth=1
	ld	hl, -720868
	push	de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, e
	ld	h, d
	pop	de
	ld	a, l
	bit	6, a
	jr	nz, .LBB6_11
; %bb.10:                               ;   in Loop: Header=BB6_9 Depth=1
	call	_kb_Scan
	jr	.LBB6_9
	.local	.LBB6_11
.LBB6_11:                               ; %.loopexit
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end6
.Lfunc_end6:
	.size	_run_debug, .Lfunc_end6-_run_debug
                                        ; -- End function
	.section	.text._main,"ax",@progbits
	.globl	_main                           ; -- Begin function main
	.type	_main,@function
_main:                                  ; @main
; %bb.0:
	ld	hl, -12
	call	__frameset
	call	_gfx_Begin
	.local	.LBB7_1
.LBB7_1:                                ; %.loopexit
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB7_9 Depth 2
                                        ;     Child Loop BB7_4 Depth 2
	call	_select_chapter
	ex	de, hl
	sbc	hl, hl
	adc	hl, de
	jp	z, .LBB7_26
; %bb.2:                                ;   in Loop: Header=BB7_1 Depth=1
	ld	hl, 1
	push	hl
	ld	(ix - 3), de
	call	_gfx_SetDraw
	pop	hl
	or	a, a
	sbc	hl, hl
	push	hl
	call	_gfx_FillScreen
	pop	hl
	ld	hl, 254
	push	hl
	call	_gfx_SetTextFGColor
	pop	hl
	ld	hl, 110
	push	hl
	push	hl
	ld	hl, _.str.10
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 1
	push	hl
	call	_gfx_Blit
	pop	hl
	ld	hl, (ix - 3)
	push	hl
	call	_open_chapter
	pop	de
	add	hl, bc
	or	a, a
	sbc	hl, bc
	jr	nz, .LBB7_6
; %bb.3:                                ;   in Loop: Header=BB7_1 Depth=1
	ld	hl, 1
	push	hl
	call	_gfx_SetDraw
	pop	hl
	or	a, a
	sbc	hl, hl
	push	hl
	call	_gfx_FillScreen
	pop	hl
	ld	hl, 254
	push	hl
	call	_gfx_SetTextFGColor
	pop	hl
	ld	hl, 110
	push	hl
	ld	hl, 80
	push	hl
	ld	hl, _.str.11
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 130
	push	hl
	ld	hl, 80
	push	hl
	ld	hl, _.str.12
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 1
	push	hl
	call	_gfx_Blit
	pop	hl
	.local	.LBB7_4
.LBB7_4:                                ;   Parent Loop BB7_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	call	_kb_AnyKey
	or	a, a
	jp	nz, .LBB7_1
; %bb.5:                                ;   in Loop: Header=BB7_4 Depth=2
	call	_kb_Scan
	jr	.LBB7_4
	.local	.LBB7_6
.LBB7_6:                                ;   in Loop: Header=BB7_1 Depth=1
	ld	iy, (_total_lines)
	lea	hl, iy + 0
	ld	de, 23
	or	a, a
	sbc	hl, de
	call	pe, __setflag
	jp	p, .LBB7_8
; %bb.7:                                ;   in Loop: Header=BB7_1 Depth=1
	ld	iy, 22
	.local	.LBB7_8
.LBB7_8:                                ;   in Loop: Header=BB7_1 Depth=1
	ld	de, -22
	add	iy, de
	ld	(ix - 6), iy
	or	a, a
	sbc	hl, hl
	.local	.LBB7_9
.LBB7_9:                                ;   Parent Loop BB7_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ld	(ix - 3), hl
	push	hl
	call	_draw_screen
	pop	hl
	call	_kb_Scan
	ld	hl, -720866
	push	de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	dec	hl
	ld	iyl, e
	ld	iyh, d
	pop	de
	push	de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, e
	ld	h, d
	pop	de
	ld	(ix - 8), l
	ld	(ix - 7), h
	ld	hl, -720868
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	dec	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	hl, -720878
	push	de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, e
	ld	h, d
	pop	de
	ld	a, l
	ld	hl, (ix - 3)
	bit	5, a
	jp	nz, .LBB7_25
; %bb.10:                               ;   in Loop: Header=BB7_9 Depth=2
	ld	(ix - 12), c
	ld	(ix - 11), b
	ld	(ix - 10), e
	ld	(ix - 9), d
	ld	de, 1
	or	a, a
	sbc	hl, de
	call	pe, __setflag
	ld	a, -1
	jp	p, .LBB7_12
; %bb.11:                               ;   in Loop: Header=BB7_9 Depth=2
	ld	a, 0
	.local	.LBB7_12
.LBB7_12:                               ;   in Loop: Header=BB7_9 Depth=2
	ex	de, hl
	ld	e, iyl
	ex	de, hl
	bit	3, l
	ld	l, -1
	jr	nz, .LBB7_14
; %bb.13:                               ;   in Loop: Header=BB7_9 Depth=2
	ld	l, 0
	.local	.LBB7_14
.LBB7_14:                               ;   in Loop: Header=BB7_9 Depth=2
	and	a, l
	ld	l, a
	ld	c, 23
	call	__ishl
	add	hl, hl
	sbc	hl, hl
	push	hl
	pop	bc
	ld	iy, (ix - 3)
	add	iy, bc
	ld	l, (ix - 8)
	ld	h, (ix - 7)
	ld.sis	bc, 1
	call	__sand
	ex.sis	de, hl
	lea	hl, iy + 0
	ld	bc, (ix - 6)
	or	a, a
	sbc	hl, bc
	call	pe, __setflag
	ld	l, -1
	jp	m, .LBB7_16
; %bb.15:                               ;   in Loop: Header=BB7_9 Depth=2
	ld	l, 0
	.local	.LBB7_16
.LBB7_16:                               ;   in Loop: Header=BB7_9 Depth=2
	ld	a, e
	and	a, l
	ld	l, a
	ld	bc, 1
	call	__iand
	ex	de, hl
	add	iy, de
	ld	(ix - 3), iy
	ld	de, 50
	add	iy, de
	lea	hl, iy + 0
	ld	de, (ix - 6)
	or	a, a
	sbc	hl, de
	call	pe, __setflag
	jp	m, .LBB7_18
; %bb.17:                               ;   in Loop: Header=BB7_9 Depth=2
	ld	iy, (ix - 6)
	.local	.LBB7_18
.LBB7_18:                               ;   in Loop: Header=BB7_9 Depth=2
	ld	l, (ix - 12)
	ld	h, (ix - 11)
	ld	a, l
	bit	1, a
	jr	z, .LBB7_20
; %bb.19:                               ;   in Loop: Header=BB7_9 Depth=2
	ld	(ix - 3), iy
	.local	.LBB7_20
.LBB7_20:                               ;   in Loop: Header=BB7_9 Depth=2
	ld	bc, (ix - 3)
	push	bc
	pop	hl
	ld	de, 51
	or	a, a
	sbc	hl, de
	call	pe, __setflag
	push	bc
	pop	hl
	jp	p, .LBB7_22
; %bb.21:                               ;   in Loop: Header=BB7_9 Depth=2
	ld	hl, 50
	.local	.LBB7_22
.LBB7_22:                               ;   in Loop: Header=BB7_9 Depth=2
	ld	e, (ix - 10)
	ld	d, (ix - 9)
	ld	a, e
	ld	de, -50
	add	hl, de
	bit	2, a
	ld	iy, -720868
	jr	z, .LBB7_24
; %bb.23:                               ;   in Loop: Header=BB7_9 Depth=2
	ld	(ix - 3), hl
	.local	.LBB7_24
.LBB7_24:                               ;   in Loop: Header=BB7_9 Depth=2
	ld	l, (iy)
	ld	h, (iy + 1)
	ld	a, l
	bit	6, a
	ld	hl, (ix - 3)
	jp	z, .LBB7_9
	.local	.LBB7_25
.LBB7_25:                               ;   in Loop: Header=BB7_1 Depth=1
	ld	hl, -720868
	push	de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, e
	ld	h, d
	pop	de
	ld	a, l
	bit	6, a
	jp	z, .LBB7_1
	jr	.LBB7_27
	.local	.LBB7_26
.LBB7_26:
	call	_free_lines
	.local	.LBB7_27
.LBB7_27:                               ; %.loopexit1
	call	_gfx_End
	or	a, a
	sbc	hl, hl
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end7
.Lfunc_end7:
	.size	_main, .Lfunc_end7-_main
                                        ; -- End function
	.section	.bss._lines,"aw",@nobits
	.balign	1
	.globl	_lines
_lines:
	.zero	3

	.section	.bss._total_lines,"aw",@nobits
	.balign	1
	.globl	_total_lines
_total_lines:
	.zero	3

	.section	.bss._open_slot,"aw",@nobits
	.balign	1
	.globl	_open_slot
_open_slot:
	.zero	1

	.section	.rodata._.str,"a",@progbits
	.balign	1
	.local	_.str
_.str:
	.asciz	"r"

	.section	.rodata._.str.1,"a",@progbits
	.balign	1
	.local	_.str.1
_.str.1:
	.asciz	"/"

	.section	.rodata._.str.2,"a",@progbits
	.balign	1
	.local	_.str.2
_.str.2:
	.asciz	"AO3 Reader"

	.section	.rodata._.str.3,"a",@progbits
	.balign	1
	.local	_.str.3
_.str.3:
	.asciz	"Enter chapter:"

	.section	.rodata._.str.4,"a",@progbits
	.balign	1
	.local	_.str.4
_.str.4:
	.asciz	"Ch"

	.section	.rodata._.str.5,"a",@progbits
	.balign	1
	.local	_.str.5
_.str.5:
	.asciz	"Clear = quit"

	.section	.rodata._.str.6,"a",@progbits
	.balign	1
	.local	_.str.6
_.str.6:
	.asciz	"Enter = open"

	.section	.rodata._.str.7,"a",@progbits
	.balign	1
	.local	_.str.7
_.str.7:
	.asciz	"Ch1"

	.section	.rodata._.str.8,"a",@progbits
	.balign	1
	.local	_.str.8
_.str.8:
	.asciz	"File not found!"

	.section	.rodata._.str.9,"a",@progbits
	.balign	1
	.local	_.str.9
_.str.9:
	.asciz	":"

	.section	.rodata._.str.10,"a",@progbits
	.balign	1
	.local	_.str.10
_.str.10:
	.asciz	"Loading..."

	.section	.rodata._.str.11,"a",@progbits
	.balign	1
	.local	_.str.11
_.str.11:
	.asciz	"Ch not found!"

	.section	.rodata._.str.12,"a",@progbits
	.balign	1
	.local	_.str.12
_.str.12:
	.asciz	"Press any key"

	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.section	".note.GNU-stack","",@progbits
	.extern	__idivu
	.extern	_llvm.eh.sjlj.functioncontext
	.extern	_llvm.smin.i24
	.extern	_llvm.smax.i24
	.extern	_gfx_PrintString
	.extern	_llvm.lifetime.end.p0
	.extern	__ishru_1
	.extern	_memcpy
	.extern	_llvm.eh.sjlj.lsda
	.extern	_gfx_PrintInt
	.extern	_realloc
	.extern	__Unwind_SjLj_Unregister
	.extern	_gfx_FillScreen
	.extern	_free
	.extern	_strlen
	.extern	__frameset
	.extern	_kb_Scan
	.extern	_strncat
	.extern	__iand
	.extern	__imulu
	.extern	__setflag
	.extern	_gfx_PrintStringXY
	.extern	_llvm.memcpy.p0.p0.i24
	.extern	_llvm.eh.sjlj.callsite
	.extern	_gfx_End
	.extern	_llvm.eh.sjlj.setup.dispatch
	.extern	_llvm.stacksave.p0
	.extern	_ti_Read
	.extern	_ti_Close
	.extern	_malloc
	.extern	_llvm.lifetime.start.p0
	.extern	__Unwind_SjLj_Register
	.extern	_llvm.frameaddress.p0
	.extern	__sand
	.extern	_gfx_SetTextXY
	.extern	_llvm.stackrestore.p0
	.extern	_ti_Open
	.extern	_gfx_Blit
	.extern	_kb_AnyKey
	.extern	_gfx_SetDraw
	.extern	__ishl
	.extern	_gfx_SetTextFGColor
	.extern	_gfx_Begin
