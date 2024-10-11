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

drawRect proc
    push ax
    push bx
    push cx
    push dx

    call drawWhiteLine

    pop dx
    pop cx
    pop bx
    pop ax

    inc ax
    cmp ax, bx
    jna drawRect
    ret
drawRect endp