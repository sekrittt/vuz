.model small
.stack 100h

.data
    msgFirstOperand db "Enter first number: ", 20, "$"
    msgSecondOperand db "Enter second number: ", 21, "$"
    msgOperators db "Select operator (+, -, *, /): ", 30, "$"
    testMsg db "Test", 4, 10, "$"
    operand1 db 8
    operand2 db 8
    operator db 1

.code
main proc
    mov ax, @data ;
    mov ds, ax

    mov dx, offset msgFirstOperand
    mov di, offset operand1
    call input

    mov dx, offset msgSecondOperand
    mov di, offset operand2
    call input

    mov dx, offset msgOperators
    mov di, offset operator
    call input

    mov dx, offset operand2
    mov ah, 09h
    int 21h

    call exit
main endp

input proc
    mov ah, 09h
    int 21h
    call read_loop
    ret
input endp

read_loop proc
    mov ah, 01h ; Function 01h Read character from stdin with echo
    int 21h
    cmp al, 1Bh ; Check is Escape
    je exit
    cmp al, 0Dh ; Check is Enter
    mov byte[di], al
    stosb ; store the character at es:di and increment di
    jne read_loop ; Continue read
    mov byte[di], "$" ; read done, add "end" char
    ret
read_loop endp

tes proc
    mov dx, offset testMsg
    mov ah, 09h
    int 21h
tes endp

exit proc
    mov ax, 4C00h
    int 21h
exit endp

end main