.model small
.stack 100h



.code
main proc
    mov ax, @data ;
    mov ds, ax

    mov ax, 0011h
    int 10h

    mov dx, 100
    mov bx, 0
    mov cx, 100
    call drawRect

    ; jmp exit
main endp

drawRect proc
    push dx
    push bx
    push cx
    mov ax, cx
    call drawWhiteLine
    pop dx
    pop bx
    pop cx
    dec dx
    cmp dx, 0
    jne drawRect

drawRect endp

drawWhiteLine proc
    push ax

    mov ah, 0Ch
    mov bh, 0
    mov cx, bx
    mov al, 1
    int 10h

    pop ax
    inc bx
    cmp bx, ax
    jna drawWhiteLine
    ret
drawWhiteLine endp

exit proc
    mov ax, 0003h
    int 10h
    mov ax, 4C00h
    int 21h
exit endp
end main