.model small
.186
.stack 100h


.data
    msg db "Yes"

.code
include libs\drawRect.asm
clearScreen proc
    mov ax, 0003h
    int 10h
    ret
clearScreen endp
start proc
    mov ax, @data
    mov ds, ax

    call clearScreen
    ; Init
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

    mov ah, 0
    int 16h
    call exit
start endp

mouse_handler proc far ; dx, cx - coords
    call clearScreen
    mov ax, 0001h
    int 33h

    push ds
    pop es

    mov ax, dx
    mov bl, 8
    idiv bl
    mov dh, al

    mov ax, cx
    mov bl, 8
    idiv bl
    mov dl, al

    mov ah, 13h
    mov al, 0
    mov bl, 00001111b
    mov cx, 3
    mov bp, offset msg
    int 10h


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