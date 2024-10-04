.model small
.stack 100h

.data
    msgFirstOperand db "Enter first number: ", "$"
    msgSecondOperand db "Enter second number: ", "$"
    msgOperators db "Select operator (+, -, *, /): ", "$"
    msgIncorectNumber db "Incorrect number", "$"
    msgDivisionbyZero db "Division by zero", "$"
    msgUnknownOperator db "Unknown operator", "$"
    msgContinueQuestion db "Continue (y/n): ", "$"
    newLine db 0Dh, 0Ah, "$"
    operand1 db 254, 0, 254 dup("$")
    operand2 db 254, 0, 254 dup("$")
    operator db 254, 0, 254 dup("$")
    continueQuestionAnswer db 254, 0, 254 dup("$")

.code
include io.asm ; input-output lib
include s2n.asm ; string to number lib
main proc
    mov ax, @data ;
    mov ds, ax

    mov ax, 0003h
    int 10h

main_loop:
    finit ; FPU init
    mov ax, offset msgFirstOperand
    mov bx, offset operand1
    call input

    mov ax, offset msgSecondOperand
    mov bx, offset operand2
    call input

    mov ax, offset msgOperators
    mov bx, offset operator
    call input

    mov si, offset operand1 + 2
    call string_to_number ; result in ax
    push ax

    mov si, offset operand2 + 2
    call string_to_number
    mov bx, ax
    pop ax

    mov cl, operator + 2
    cmp cx, "+"
    je _add
    mov cl, operator + 2
    cmp cx, "-"
    je _sub
    mov cl, operator + 2
    cmp cx, "*"
    je _mul
    mov cl, operator + 2
    cmp cx, "/"
    je _div

    ; unknown operator
    mov ax, offset msgUnknownOperator
    call println

continue:
    mov ax, offset msgContinueQuestion
    mov bx, offset continueQuestionAnswer
    call input

    mov cl, continueQuestionAnswer + 2
    cmp cx, "n"
    jne main_loop

    call exit
main endp


; ax - first number
; bx - second number
_add proc
    add ax, bx
    call print_int
    jmp continue
_add endp

; ax - first number
; bx - second number
_sub proc
    sub ax, bx
    call print_int
    jmp continue
_sub endp

; ax - first number
; bx - second number
_mul proc
    imul ax, bx ; ax = ax * bx
    call print_int
    jmp continue
_mul endp

; ax - first number
; bx - second number
_div proc
    cmp bx, 0
    je _div_division_by_zero

    cwd ; заполним DX знаковым битом из AX
    idiv bx
    call print_int

    jmp continue
_div_division_by_zero:
    mov ax, offset msgDivisionbyZero
    call println
    jmp continue
_div endp

exit proc
    mov ax, 4C00h
    int 21h
exit endp

end main