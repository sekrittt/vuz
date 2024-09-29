.model small
.stack 100h

.data
    ;
.code
include libs\drawRect.asm
start proc

    mov ax, @data ;
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
    mov ax, 000ch
    mov cx, 01h
    mov dx, offset mouse_handler
    int 33h

    mov ah, 0
    int 16h
    call exit
start endp

mouse_handler proc far
    ; call clearScreen
    mov ah, 0ch
    mov al, 01h
    mov bh, 00h
    int 10h
    retf
mouse_handler endp

clearScreen proc
    mov ax, 0012h
    int 10h
    ret
clearScreen endp

exit proc
    ;
    mov ax, 001Fh
    int 33h
    ;

    ; mov ax, 0003h
    ; int 10h

    mov ax, 4C00h ; stop program
    int 21h ; dos interrupt
    ret
exit endp
end start