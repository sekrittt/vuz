[org 0x100]

section .text

call	setVGA

;call	performSecondTask	; second task
;call	waitKey

;mov	byte [Color],	0x4
;mov	word [X],	0d203
;mov	word [Y],	0d101
;call	drawPixel		; third task
;call	waitKey

mov	byte [Color],	0x1
call	backGroundColor

mov	byte [Color],	0x4

mov	word [X],	0d100
mov	word [Y],	0d50
mov	word [Length],	0d20
call	drawHorizontalLine

mov	word [X],	0d100
mov	word [Y],	0d120
mov	word [Length],	0d20
call	drawHorizontalLine

mov	word [X],	0d120
mov	word [Y],	0d80
mov	word [Length],	0d40
call	drawVerticalLine

mov	word [X],	0d120
mov	word [Y],	0d100
mov	word [Length],	0d20
call	drawHorizontalLine

mov	word [X],	0d120
mov	word [Y],	0d110
mov	word [Length],	0d30
call	drawHorizontalLine

mov	word [X],	0d160
mov	word [Y],	0d120
mov	word [Length],	0d30
call	drawHorizontalLine

mov	word [X],	0d100
mov	word [Y],	0d50
mov	word [Length],	0d70
call	drawVerticalLine

mov	word [X],	0d120
mov	word [X2],	0d190
mov	word [Y],	0d50
mov	word [Y2],	0d120
call	drawLine

mov	word [X],	0d120
mov	word [X2],	0d160
mov	word [Y],	0d80
mov	word [Y2],	0d120
call	drawLine
call	waitKey

mov word[X],		0d105
mov word[Y],		0d55
mov byte[Color],	0x2
mov byte[Color2],	0x4
call fill
call	waitKey

mov word[X],		0d125
mov word[Y],		0d105
mov byte[Color],	0x2
mov byte[Color2],	0x4
call fill

call	waitKey
call	setText
jmp	exit

; waits for user input
waitKey:
	push	ax

	xor 	ax,	ax
	int 	0x16

	pop	ax
	ret

; calls exit syscall
exit:
	mov	ax,	0x4c00
	int 	0x21

; sets current mode to text
setText:
	push	ax

	mov	ax,	0x3
	int	0x10

	pop	ax
	ret

; fills the whole screen with [Color]
backGroundColor:
	push	ax
	push	cx
	push	di

	call	setES
	xor	ax,	ax	; start offset is zero
	xor	di,	di	; setting start offset
	mov	al,	[Color]	; 320 * 200 = 64000 but we
	mov	ah,	[Color]	; can use al and ah to set
	mov	cx,	0d32000	; colors for different pixels
	rep	stosw

	pop	di
	pop	cx
	pop 	ax
	ret

; puts zeroes to all cells in videomemory
; and then writes 0xC9 to 0x20A2
performSecondTask:
	push	ax
	push	cx
	push	di

	call	setES
	xor	ax,	ax	; put zero color
	xor	di,	di	; at zero offset
	mov	cx,	0d32000
	rep	stosw		; zeroing word by word

	mov	ax,	0xC9
	mov	di,	0x20A2
	stosw

	pop	di
	pop	cx
	pop	ax
	ret

; sets current mode to VGA 320x200x256
setVGA:
	push	ax

	mov	ax,	0x13	; 320x200x256
	int	0x10

	pop	ax
	ret

; draws pixel at ([X], [Y]) in [Color]
drawPixel:
	push	ax

	call	setES
	call	calcStartOffset
	mov	al,	[Color]
	stosb

	pop	ax
	ret

; calculates start offset based on [Y] and [X]
; and puts it to di
calcStartOffset:
	push	ax
	push	dx

	mov	ax,	0d320
	mul	word [Y]
	add	ax,	[X]
	mov	di,	ax

	pop	dx
	pop	ax
	ret

; sets es segment
setES:
	push	ax

	mov	ax,	0xA000
	mov	es,	ax

	pop	ax
	ret

; draws line from ([X],[Y]) to ([X]+[Length], [Y]) in [Color]
drawHorizontalLine:
	push	cx
	push	ax

	call	setES
	call	calcStartOffset
	xor	dx,	dx
	mov	ax,	[Length]
	mov	cx,	2
	div	cx
	mov	cx,	ax
	mov	al,	[Color]
	mov	ah,	[Color]
	rep	stosw

	pop	ax
	pop	cx
	ret

; draws line from ([X],[Y]) to ([X], [Y]+[Length]) in [Color]
drawVerticalLine:
	push	cx
	push	ax

	call	setES
	call	calcStartOffset
	mov	al,	[Color]
	mov	cx,	[Length]
	.loop:
		stosb
		add	di,	0d319
		loop	.loop

	pop	ax
	pop	cx
	ret

; draws line from ([X], [Y]) to ([X2], [Y2]) in [Color]
drawLine:
	push	cx
	push	ax
	push	bx

	call	setES
	call	calcStartOffset

	; deltax = x1 - x0
	mov	cx,	[X2]
	sub	cx,	[X]	; cx = deltax
	jle	.exit		; if X2 <= X1 exit
	mov	bx,	cx	; deltax in cx is loop counter
	shl	bx,	0d1	; bx = 2*deltax

	; deltay = y1 - y0
	mov	ax,	[Y2]
	sub	ax,	[Y]	; ax = deltay
	jle	.exit		; if Y2 <= Y1 exit
	shl	ax,	0d1	; only 2*deltay is used

	; D = 2 * deltay - deltax
	mov	dx,	ax
	sub	dx,	cx	; dx = D

	.loop:
		call	drawPixel
		inc	word [X]
		cmp	dx,	0
		jle	.endIf
		inc	word [Y]
		sub	dx,	bx
	.endIf:
		add	dx,	ax
		loop	.loop

	.exit:
		pop	bx
		pop	ax
		pop	cx
		ret

; gets color of pixel at ([X],[Y])
getColor:
    call	setES
    call	calcStartOffset

	xor	ax,	ax				; clearing registers before comparing

    mov	al, [es:di]    		; reading current pixel color

	ret


; fills out everything it can access
fill:
    push	ax
    push	dx
    push	cx

	xor	dx,	dx				; clearing before comparison
	call	getColor		; ax contains current pixel color
    mov	dl, [Color2]        ; reading boundary color
    cmp	al, dl              ; comparing current color to boundary color
    je	.exit				; exiting if they equal
    mov dl, [Color]
    cmp al, dl
    je  .exit

    call	drawPixel		; drawing the pixel

    mov dx, [X]
    mov cx, [Y]

    mov	ax,	dx
	inc ax
    mov	[X],    ax
    call fill
    mov [X],    dx

    mov	ax,	cx
	inc ax
    mov	[Y],    ax
    call fill
    mov [Y],    cx

    mov	ax,	dx
	dec ax
    mov	[X],    ax
    call fill
    mov [X],    dx

    mov	ax,	cx
	dec ax
    mov	[Y],    ax
    call fill
    mov [Y],    cx

    .exit:
        pop cx
        pop dx
        pop ax
        ret

section .bss

	X:	resw	1
	Y:	resw	1
	X2:	resw	1
	Y2:	resw	1
	Color:	resb	1
	Length:	resw	1
	Color2:	resb	1