.model small
.stack 100h

.data
    msg db "Hello, wrold!", 13, 10, "$"

.code
main proc
    mov ax, @data ;
    mov ds, ax

    mov ah, 9 ; функция вывода
    mov dx, offset msg ;
    int 21h ; dos прирывание

    mov ah, 1
    int 21h

    mov ax, 4C00h
    int 21h
main endp
end main