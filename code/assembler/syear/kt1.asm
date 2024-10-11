.model tiny
.186
.stack 100h

.data
    old_handler dd ?

.code
start proc near
    mov ax, @data
    mov ds, ax

    mov ax, 3509h
    int 21h
    mov word ptr [old_handler], bx
    mov word ptr [old_handler+2], es

    push ds
    mov ax, 2509h
    mov dx, seg kbh
    mov ds, dx
    mov dx, offset kbh
    int 21h
    pop ds
    ; call exit
p:
    jmp p
start endp

kbh proc far ; keyboard handler
    in al, 60h
    cmp al, 1Ch
    je kbh_exit

    mov ah, 0Eh
    mov al, 'S'
    mov bh, 0
    int 10h

    mov al, 20h
    out 20h, al
    iret
kbh_exit:
    mov ah, 0Eh
    mov al, 'Y'
    mov bh, 0
    int 10h
    mov ah, 0Eh
    mov al, 'e'
    mov bh, 0
    int 10h
    mov ah, 0Eh
    mov al, 's'
    mov bh, 0
    int 10h
    mov al, 20h
    out 20h, al
    call exit
kbh endp

exit proc
    push ds
    lds dx, old_handler
    mov ax, 2509h
    int 21h
    pop ds
    mov ax, 4C00h ; stop program
    int 21h ; dos interrupt
exit endp

end start