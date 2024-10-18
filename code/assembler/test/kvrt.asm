.model tiny
.386
.stack 100h

.data
    common_msg db 'Square levels', '$'
    msgContinueQuestion db "Continue? (y/n): ", "$"
    msgIncorectNumber db "Incorrect number!", "$"
    operand1 db 254, 0, 254 dup("$")
    operand2 db 254, 0, 254 dup("$")
    operand3 db 254, 0, 254 dup("$")
    continueQuestionAnswer db 254, 0, 254 dup("$")

    msg1 db 'No roots', '$'
    msg2 db 'X1 = $'
    msg3 db 'X2 = $'

    input_a db 'Operand a = $' ; сообщение для ввода а
    input_b db 'Operand b = $' ; сообщение для ввода b
    input_c db 'Operand c = $' ; сообщение для вводa c
    input_r db 'Result: $' ;

    a dd ?
    b dd ?
    c dd ?
    d dd ?
    x1 dd ?
    x2 dd ?


    aa dd ?
    bb dd ?
    sqrtd dd ?
    ten equ word ptr [bp-2] ; какой-то регистр для вывода
    temp equ word ptr [bp-4] ; еще какой-то регистр для вывода

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

    mov ax, offset common_msg
    call println

    mov ax, offset input_a
    mov bx, offset operand1
    call input

    mov si, offset operand1 + 2
    call string_to_float
    FSTP a ; выталкиваем а из стека в регистр а

    mov ax, offset input_b
    mov bx, offset operand2
    call input

    mov si, offset operand2 + 2
    call string_to_float
    FSTP b ; выталкиваем б из стека в регистр б

    mov ax, offset input_c
    mov bx, offset operand3
    call input

    mov si, offset operand3 + 2
    call string_to_float
    FSTP c ; выталкиваем с из стека в регистр с

    cmp a,0 ; сравнение a с нулем
    je nul

    fld [b] ; помещаем б в стек
    fmul st(0),st(0) ; возводим б в квадрат
    FSTP bb ; выталкиваем b^2 в bb
    fld [a] ; ..a..
    fmul [c] ; ..c*a..

    fadd st(0), st(0) ; ..2*c*a..
    fadd st(0), st(0) ; ..4*c*a..
    fld [bb] ; запихиваем b^2 в стэк ..b^2.. ..4*c*a..
    fsub ; ..b^2-4*a*c.. посчитали дискриминант, он оказался на верхушке стека
    fchs ; меняем знак, получаем дискриминант с правильным знаком

    ftst ; сравнение с нулем
    fstsw ax ; копируем регистр состояния SWR в регистр AX
    sahf ; "копируем" флаги C0, C2, C3 в младший байт регистра EFLAGS/FLAGS

    jc j1 ; дискриминант < 0
    jz j2 ; дискриминант = 0

        ; D > 0
        ; X1 = (-b-sqrt(D))/(2*a)
        ; X2 = (-b+sqrt(D))/(2*a)

    ;первый корень
    fsqrt ; ..sqrt(d)..
    FSTP sqrtd ; помещаем корень дискриминанта в соотсветствующий регистр
    fld a ; ..a..
    fadd st(0), st(0) ; ..2*a..
    FSTP aa ; помещаем 2*а в регистр аа

    fld [b] ; ..b..
    fchs ; ..-b..
    fld sqrtd ; засовываем в стек корень дискриминанта ..sqrt(d).. ..-b..
    fsub ; ..-b-sqrt(d)..

    fld aa ; помещаем в стек 2*a ..2*a.. ..-b-sqrt(d)..
    fdiv ; делим, получаем первый корень
    fstp [x1] ; выталкиваем первый корень в регистр

    ; второй корень
    fld [b] ; ..b..
    fchs ; ..-b..
    fld sqrtd ; засовываем в стек корень дискриминанта ..sqrt(d).. ..-b..
    fadd ; ..-b-sqrt(d)..

    fld aa ; помещаем в стек 2*a ..2*a.. ..-b+sqrt(d)..
    fdiv ; делим, получаем второй корень
    fstp [x2] ; выталкиваем второй корень в регистр

    ;вывод корней

    mov ax, offset input_r
    call println

    mov ax, offset msg2
    call print

    fld [x1];вставляем x1 в стек
    call print_float
    call print_newline

    mov ax, offset msg3
    call print

    fld [x2];вставляем x2 в стек
    call print_float
    call print_newline

    jmp main_exit

nul:
    cmp b,0 ; сравнение с '+'
    je j1

    fld [b] ; помещаем в стек b
    fld [c] ; помещаем в стек c
    fchs ; меняем знак у c
    fdiv st(0), st(1)
    fstp [x1]

    mov ax, offset msg2
    call print

    fninit
    fld [x1]
    mov ax, 5
    push ax
    call print_float
    jmp main_exit

j1:

    mov ax, offset input_r
    call print

    mov ax, offset msg1
    call print

    jmp main_exit

j2:
    fld [b]
    fchs
    fld [a]
    fadd st(0),st(0)
    fdiv

    mov ax, offset msg2
    call print

    call print_float
main_exit:
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

clear_screen proc
    mov ax, 0003h
    int 10h
    ret
clear_screen endp

end main