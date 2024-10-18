.model tiny
.386
.stack 100h

.data
    commonMsg db 'Calculator on FPU', '$'
    msgUnknownOperator db "Unknow operator", "$"
    msgDivisionbyZero db "Division by zero!", "$"
    msgOperators db "Select operator (+, -, *, /): ", "$"
    msgIncorectNumber db "Incorrect number!", "$"
    msgContinueQuestion db "Continue? (y/n): ", "$"

    firstOperandMsg db 'First operand = ', '$' ; сообщение для ввода а
    secondOperandMsg db 'Second operand = ', '$' ; сообщение для ввода b
    resultMsg db 'Result: ', '$' ;
    operand1 db 254, 0, 254 dup("$")
    operand2 db 254, 0, 254 dup("$")
    operator db 254, 0, 254 dup("$")
    continueQuestionAnswer db 254, 0, 254 dup("$")

    firstOperand dd ?
    secondOperand dd ?
    result dd ?

    ten equ word ptr [bp-2] ; какой-то регистр для вывода      ; for fpu-io lib
    temp equ word ptr [bp-4] ; еще какой-то регистр для вывода ; for fpu-io lib

.code
include libs\io.asm
include libs\fpu\io.asm
include libs\fpu\s2f.asm
main proc
    mov ax, @data
    mov ds, ax

    finit
    xor eax,eax ; обнуление регистров
    xor edx,edx

main_loop:
    call clear_screen

    mov ax, offset commonMsg
    call println

    mov ax, offset firstOperandMsg
    mov bx, offset operand1
    call input

    mov si, offset operand1 + 2
    call string_to_float
    FSTP firstOperand

    mov ax, offset secondOperandMsg
    mov bx, offset operand2
    call input

    mov si, offset operand2 + 2
    call string_to_float
    FSTP secondOperand

    ; Now we have values in firstOperand and secondOperand variables

    mov ax, offset msgOperators
    mov bx, offset operator
    call input

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
    call print

continue:
    call print_newline
    mov ax, offset msgContinueQuestion
    mov bx, offset continueQuestionAnswer
    call input

    mov cl, continueQuestionAnswer + 2
    cmp cx, "n"
    jne main_loop

    mov ax, 4C00h
    int 21h
main endp


_add proc
    fld [firstOperand]
    fld [secondOperand]
    fadd st(0), st(1)
    call print_float
    jmp continue
_add endp

_sub proc
    fld [firstOperand]
    fld [secondOperand]
    fsub st(0), st(1)
    call print_float
    jmp continue
_sub endp

_mul proc
    fld [firstOperand]
    fld [secondOperand]
    fmul st(0), st(1)
    call print_float
    jmp continue
_mul endp


_div proc
    cmp secondOperand, 0
    je _div_division_by_zero

    fld [firstOperand]
    fld [secondOperand]
    fdiv st(0), st(1)
    call print_float

    jmp continue
_div_division_by_zero:
    mov ax, offset msgDivisionbyZero
    call println
    jmp continue
_div endp

clear_screen proc
    mov ax, 0003h
    int 10h
    ret
clear_screen endp

end main