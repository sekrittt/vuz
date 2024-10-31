.model small
.386
.stack 100h

.data
    errormes db 'Error','$'
    x dt 0
    x1 dt 0
    n dt 0
    i dt 1.0
    result dt 0
    minusOne dt -1.0
    lastSign dt 1.0

    tmp dt 0

    ten equ word ptr [bp-2] ; какой-то регистр для вывода
    temp equ word ptr [bp-4] ; еще какой-то регистр для вывода

    welcomeMsg db "Ряд Тейлора от ln(1+x)", '$'
    enterNMsg db "Введите N = ", '$'
    enterXMsg db "Веедите X = ", '$'
    message4 db "Ряд: ", '$'
    message5 db " + ", '$'
    message6 db "/", '$'
    message7 db " = ", '$'
    message8 db "  ", '$'
    msgContinueQuestion db "Продолжить? (Y/N) ", '$'
    msgIncorectNumber db "Неправильное число!", "$"

    nStr db 254, 0, 254 dup("$")
    xStr db 254, 0, 254 dup("$")
    continueQuestionAnswer db 254, 0, 254 dup("$")

.code

include libs\io.asm
include libs\fpu\io.asm
include libs\fpu\s2f.asm
clearscreen proc
   mov ax, 0003h
   int 10h
   ret
clearscreen endp
main proc
    mov ax, @data
    mov ds, ax

    finit

main_loop:
    call clearscreen

    mov ax, offset welcomeMsg
    call println

    mov ax, offset enterNMsg
    mov bx, offset nStr
    call input

    mov si, offset nStr + 2
    call string_to_float
    fstp n


    mov ax, offset enterXMsg
    mov bx, offset xStr
    call input

    mov si, offset xStr + 2
    call string_to_float
    fstp x
    fld x
    fstp x1

    mov ax, offset message4
    call print

    call tayl

    mov ax, offset message7
    call print

    fld result

    call print_float

    call print_newline
    mov ax, offset msgContinueQuestion
    mov bx, offset continueQuestionAnswer
    call input

    mov cl, continueQuestionAnswer + 2
    cmp cx, "n"
    je main_exit
    cmp cx, "N"
    je main_exit
    jmp main_loop

main_exit:
    call exit
main endp

tayl proc
    push ax
    push cx
    xor cx, cx
    ; Устанавливаем значения по умолчанию
    fld x
    fstp result
    fld1
    fstp i
    fld1
    fstp lastSign
    ;
    fld result
    call print_float
    mov ax, offset message5
    call print

    ; Получаем следующую степень x
    fld x
    fld x1
    fmul st(0), st(1)
    fstp x

    tayl_loop:

        fld minusOne
        fld lastSign
        fmul st(0), st(1) ; Формируем новый знак
        fstp lastSign

        fld i ;
        fld1 ; Загружаем единицу в стек
        fadd st(0), st(1) ; Добавляем единицу к текущему значению i
        fstp i ; Сохраняем текущее i

        ; fld i
        ; call print_float
        ; call print_newline
        ; fld x
        ; call print_float
        ; call print_newline

        fld i ; Загружаем текущий i
        fld x ; Загружаем текущий x
        fdiv st(0), st(1) ; Делим x на i
        fstp tmp

        fld tmp
        fld lastSign ; Загружаем текущий знак
        fmul st(0), st(1) ;
        fstp tmp
        fld tmp
        call print_float

        fld result ; Загружаем предыдущий промежуточный реультат
        fld tmp
        fadd st(0), st(1) ; Складываем
        fstp result ; Сохраняем промежуточный результат

        ; Получаем следующую степень x
        fld x
        fld x1
        fmul st(0), st(1)
        fstp x

        ; Проверяем закончили ли мы
        fld i
        fld n
        fcom
        fstsw ax
        sahf
        je tayl_exit
        jb tayl_exit
        mov ax, offset message5
        call print
        jmp tayl_loop
    tayl_exit:
        pop cx
        pop ax
        ret
tayl endp

exit proc
    mov ax,4c00h
    int 21h
exit endp
end main