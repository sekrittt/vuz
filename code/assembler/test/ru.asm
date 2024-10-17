.model tiny
.code
.386
org 100h

.data
	common_msg db 'Привет мир!', '$'

include libs\io.asm
start proc
    mov ax, @data
    mov ds, ax
    mov ax, offset common_msg
    call println


    mov ax, 4C00h ; stop program
    int 21h ; dos interrupt
start endp


end start