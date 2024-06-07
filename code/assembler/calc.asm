.model small
.stack 100h

.data
    msgFirstOperand db "Enter first number: ", "$"
    msgSecondOperand db "Enter second number: ", "$"
    msgOperators db "Select operator (+, -, *, /): ", "$"
    newLine db 0Dh, 0Ah, "$"
    cursorRight DB 27,'[9C$',27,'[=7|'
    operand1 db 254, '$','$','$','$','$','$','$','$', '$','$','$','$'
    operand2 db 254, '$','$','$','$','$','$','$','$', '$','$','$','$'
    operator db 254, '$','$','$','$','$','$','$','$', '$','$','$','$'

.code
include io.asm
main proc
    mov ax, @data ;
    mov ds, ax

    mov ax, 0003h
    int 10h

    mov ax, offset msgFirstOperand
    mov bx, offset operand1
    call input

    mov ax, offset msgSecondOperand
    mov bx, offset operand2
    call input

    mov ax, offset msgOperators
    mov bx, offset operator
    call input

    mov ax, offset operand1 + 2
    call println

    mov ax, offset operator + 2
    call println

    mov ax, offset operand2 + 2
    call println

    call exit
main endp

exit proc
    mov ax, 4C00h
    int 21h
exit endp

end main