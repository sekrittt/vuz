.model tiny
.386
.stack 100h

.data
    commonMsg db 'Калькулятор на FPU', '$'
    exitMsg db 'Для продолжения нажмите Enter', '$'
    msgUnknownOperator db "Неизвестный оператор", "$"
    msgDivisionbyZero db "Деление на ноль!", "$"
    msgOperators db "Выбирете оператор (+, -, *, /): ", "$"
    msgIncorectNumber db "Неправильное число", "$"

    firstOperandMsg db 'Первый операнд = ', '$' ; сообщение для ввода а
    secondOperandMsg db 'Второй операнд = ', '$' ; сообщение для ввода b
    resultMsg db 'Результат: ', '$' ;
    operand1 db 254, 0, 254 dup("$")
    operand2 db 254, 0, 254 dup("$")
    operator db 254, 0, 254 dup("$")

    firstOperand dd ?
    secondOperand dd ?
    result dd ?

    ten equ word ptr [bp-2] ; какой-то регистр для вывода      ; for fpu-io lib
    temp equ word ptr [bp-4] ; еще какой-то регистр для вывода ; for fpu-io lib

.code
include libs\io.asm
include libs\fpu\s2f.asm
include libs\fpu\io.asm
main proc
    mov ax, @data
    mov ds, ax

    finit
    xor eax,eax ; обнуление регистров
    xor edx,edx

    call clear_screen

    mov ax, offset commonMsg
    call println

    mov ax, offset firstOperandMsg
    mov bx, offset operand1
    call input
    ; call float_input;ввод А в стек
    ; FSTP firstOperand ; выталкиваем а из стека в регистр а

    mov ax, offset secondOperandMsg
    mov bx, offset operand2
    call input
    ; call print
    ; call float_input ; ввод B в стек
    ; FSTP secondOperand ; выталкиваем б из стека в регистр б

    mov si, offset operand1 + 2
    call string_to_float
    FSTP firstOperand ; выталкиваем а из стека в регистр а

    fld [firstOperand]
    call print_float

    mov ax, 4C00h
    int 21h
main endp

clear_screen proc
    mov ax, 0003h
    int 10h
    ret
clear_screen endp

end main