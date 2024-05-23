.model small
.stack 100h

.data
    msg db "Hello, wrold!", 13, 10, "$"
    crlf db 0Dh, 0Ah, "$"
    buffer db 6
    blength db ?
    bcontents db ?

.code
main proc
    mov ax, @data ;
    mov ds, ax

    mov ah, 9 ; функция вывода
    mov dx, offset msg ;
    int 21h ; dos прирывание

    jmp read_loop

    mov ax, 4C00h
    int 21h
main endp

read_loop proc
    mov ah, 01h ; Function 01h Read character from stdin with echo
    int 21h
    cmp al, "9" ; character is carriage return?
    je read_done ; yes? exit the loop
    stosb ; store the character at es:di and increment di
    jmp read_loop ; loop again
read_loop endp

read_done proc
    mov ax, 4C00h
    int 21h
read_done endp

end main