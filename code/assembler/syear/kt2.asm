.model small
.stack 100h


.data
    msg db "Yes", "$"

.code
include libs\drawRect.asm
clearScreen proc
    mov ax, 0011h
    int 10h
    ret
clearScreen endp
start proc
    mov ax, @data
    mov ds, ax

    call clearScreen
    ; Init
    push ds
    mov ax, 0000h
    int 33h
    ; Show
    mov ax, 0001h
    int 33h
    ; Set position
    mov ax, 0004h
    mov cx, 0
    mov dx, 0
    int 33h
    ; Setup custom handler
    mov ax, 000Ch
    mov cx, 00000001b
    push cs
    pop es
    mov dx, offset mouse_handler
    int 33h
    pop ds

    mov ah, 0
    int 16h
    call exit
start endp

mouse_handler proc far ; dx, cx - coords
    call clearScreen
    mov ax, 0001h
    int 33h
    ; swap coords
    push dx
    push cx
    pop dx
    pop cx
    ;

    add dx, 20 ;
    add cx, 20 ;

    mov ax, cx ; start y
    mov bx, cx ; start y + height
    add bx, 100
    mov cx, dx ; start x
    mov dx, dx ; start x + width
    add dx, 100
    call drawRect

    retf
mouse_handler endp

exit proc
    ;
    mov ax, 000Ch
    mov cx, 0000h
    int 33h
    ;

    mov ax, 0003h
    int 10h

    mov ax, 4C00h ; stop program
    int 21h ; dos interrupt
    ret
exit endp
end start