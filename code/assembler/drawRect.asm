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