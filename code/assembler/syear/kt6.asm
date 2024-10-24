.model tiny
.386
.stack 100h
.data
    errormes db 'Error','$'
    z dd 0
    n dd 0
    outp dd 3.0
    i dd 1.0
    chisl dd 3
    znam  dd 1.0
    tmp dd 1.0
    pep dd 1.0
    minus dd 1.0
    koeff1 dd 3.0
    koeff2 dd 1.0
    ten equ word ptr [bp-2]
    temp equ word ptr [bp-4]
    message1 db "Ряд Лорана для 1/(z^2-1)^2 в окружности 0<|z-1|<2 ", '$'
    message2 db "Введите n: ", '$'
    message3 db "Введите z: ", '$'
    message4 db "Ряд: 1/4*(1/(", '$'
    message5 db "-1)^2-1/(", '$'
    message6 db "-1)+1/4*(3", '$'
    message7 db " + ", '$'
    message8 db "/", '$'
    message9 db "  ", '$'
    message10 db ")) = ", '$'
    msgContinueQuestion db "Продолжить? (Y/N) ", '$'
    msgIncorectNumber db "Неправильное число!", "$"

    nStr db 254, 0, 254 dup("$")
    zStr db 254, 0, 254 dup("$")
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

main_loop:
    call clearscreen

    mov ax, offset message1
    call println
    mov ax, offset message2
    mov bx, offset nStr
    call input

    mov si, offset nStr + 2
    call string_to_float
    fst n

    mov ax, offset message3
    mov bx, offset zStr
    call input

    mov si, offset zStr + 2
    call string_to_float
    fst z


    mov ax, offset message4
    call print


    fld z
    call print_float


    mov ax, offset message5
    call print


    fld z
    call print_float

    mov ax, offset message6
    call print

    fld1
    fld z
    fsub
    fst koeff2

    fld minus
    fldz
    fsub
    fst minus
    call Laurent

    fld1
    fld1
    fadd
    fld1
    fadd
    fld1
    fadd
    fld outp
    fdiv st(0), st(1)
    fst outp

    fld1
    fld z
    fsub
    fld minus
    fdiv st(0), st(1)
    fld outp
    fadd
    fst outp

    fld1
    fld z
    fsub
    fst tmp

    fld tmp
    fld tmp
    fmul
    fst tmp

    fld tmp
    fld1
    fdiv st(0), st(1)
    fld outp
    fadd
    fst outp

    fld1
    fld1
    fadd
    fld1
    fadd
    fld1
    fadd
    fld outp
    fdiv st(0), st(1)
    fst outp

    mov ax, offset message10
    call print

    fld outp
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
       mov ax,4c00h
        int 21h
main endp

Laurent proc
    Laurentcicle:
        mov ax, offset message7
        call print

        fld pep
        fld minus
        fmul
        fld koeff2
        fmul
        fst pep

        fld1
        fld koeff1
        fadd
        fst koeff1

        fld pep
        fld koeff1
        fmul
        fst chisl

        fld chisl
        call print_float



        mov ax, offset message8
        call print

        fld1
        fld1
        fadd
        fld znam
        fmul
        fst znam

        fld znam
        call print_float

        fld znam
        fld chisl


        fdiv st(0), st(1)
        fst tmp

        fld tmp



        fld outp
        fadd st(0), st(1)
        fst outp



        fld i
        fcom n
        fstsw ax
        sahf
        jb Laurentinc
        ret
    Laurentinc:

        fld i
        fld1
        fadd
        fst i
        jmp Laurentcicle
    ret
Laurent endp

exit proc
    mov ax,4c00h
    int 21h
exit endp

end main