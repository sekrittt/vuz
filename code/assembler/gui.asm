.model small
.stack 100h


; extern drawRect:proc
.code

clearScreen proc
    mov ax, 0011h
    int 10h
clearScreen endp

delay proc ; 33 милисекунды = 30 fps
    ; mov cx, 0fh
    ; mov dx, 4240h
    mov cx, 00h
    mov dx, 8235h
    mov ax, 8600h
    int 15h
    ret
delay endp



drawWhiteLine proc

    push ax
    push dx
    mov dx, ax ; y

    push cx
    mov cx, cx ; x

    mov bh, 0

    mov ah, 0Ch
    mov al, 1

    int 10h

    pop cx
    pop dx
    pop ax

    inc cx
    cmp cx, dx
    jna drawWhiteLine
    ret
drawWhiteLine endp

_wait proc
    mov ah, 01h ; Function 01h Read character from stdin with echo
    int 21h
    cmp al, 1Bh ; Check is Escape
    je exit
    jne _wait ; Continue read
    ret
_wait endp

exit proc
    mov ax, 0003h
    int 10h
    mov ax, 4C00h
    int 21h
exit endp


include drawRect.asm

main proc
    mov ax, @data ;
    mov ds, ax

    call clearScreen

    mov ax, 0 ; start y
    mov bx, 100 ; start y + height
    mov cx, 0 ; start x
    mov dx, 100 ; start x + width
    call drawRect

    call delay


    mov ax, 200 ; y
    mov cx, 0 ; start x
    mov dx, 100 ; start x + width
    call drawWhiteLine

    call delay
    call clearScreen

    mov ax, 100 ; start y
    mov bx, 200 ; start y + height
    mov cx, 0 ; start x
    mov dx, 100 ; start x + width
    call drawRect

    ; jmp exit
    jmp _wait
main endp


end main