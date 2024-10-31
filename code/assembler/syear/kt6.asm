.model tiny
.386
.stack 100h

.data
    msgError db 'Ошибка','$'


    welcomeMsg db "Ряд Лорана от sin(z)/z^2", '$' ; R = 1
    enterKMsg db "Введите K = ", '$'
    enterZMsg db "Веедите Z = ", '$'
    message4 db "Ряд: ", '$'
    message5 db " + ", '$'
    message7 db " = ", '$'
    msgContinueQuestion db "Продолжить? (Y/N) ", '$'
    msgIncorectNumber db "Неправильное число!", "$"

    z dt 0
    z1 dt 0
    k dt 0
    i dt 1.0
    i1 dt 1.0
    c dt 1.0
    result dt 0
    sign dt 1.0
    tmp dt 0
    ten equ word ptr [bp-2] ; какой-то регистр для вывода
    temp equ word ptr [bp-4] ; еще какой-то регистр для вывода
    kStr db 254, 0, 254 dup("$")
    zStr db 254, 0, 254 dup("$")
    continueQuestionAnswer db 254, 0, 254 dup("$")

.code
include libs\io.asm
include libs\fpu\io.asm
include libs\fpu\s2f.asm
clearScrean proc
    mov ax, 0003h
    int 10h
    ret
clearScrean endp
main proc
    mov ax, @data
    mov ds, ax

    finit
main_loop:
    call clearScrean

    mov ax, offset welcomeMsg
    call println

    mov ax, offset enterKMsg
    mov bx, offset kStr
    call input

    mov si, offset kStr + 2
    call string_to_float
    fstp k

    mov ax, offset enterZMsg
    mov bx, offset zStr
    call input

    mov si, offset zStr + 2
    call string_to_float
    fstp z
    fld z
    fstp z1

    call loran

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

loran proc
    push ax
    ; Setup Defaults
    fld1
    fstp sign
    fld1
    fstp i
    fld z
    fld1
    fdiv st(0), st(1)
    fstp result
    fld result
    call print_float
    mov ax, offset message5
    call print
loran_loop:

    ; Calculate sign
    fld sign
    fchs
    fstp sign

    ; Calculate factorial
    fld1
    fld i1
    fadd st(0), st(1)
    fstp i1

    fld i1
    fld i
    fmul st(0), st(1)
    fstp i

    fld1
    fld i1
    fadd st(0), st(1)
    fstp i1

    fld i1
    fld i
    fmul st(0), st(1)
    fstp i

    ; Divide z/i
    fld i
    fld z
    fdiv st(0), st(1)
    fstp tmp

    fld sign
    fld tmp
    fmul st(0), st(1)
    fstp tmp

    fld tmp
    call print_float

    fld result
    fld tmp
    fadd st(0), st(1)
    fstp result

    ; Calculate step
    fld z
    fld z1
    fmul st(0), st(1)
    fstp z

    fld z
    fld z1
    fmul st(0), st(1)
    fstp z

    fld c
    fld1
    fadd st(0), st(1)
    fstp c

    fld c
    fld k
    fcom
    fstsw ax
    sahf
    je loran_end
    jb loran_end
    mov ax, offset message5
    call print
    jmp loran_loop

loran_end:
    pop ax
    ret
loran endp

exit proc
    mov ax, 4C00h
    int 21h
exit endp

end main