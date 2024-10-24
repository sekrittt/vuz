.model tiny
.386
.stack 100h

.data
    errormes db 'Error','$'
    x dd 0
    n dd 0
    outp dd 1.0
    i dd 1.0
    chisl dd 1.0
    znam  dd 1.0
    tmp dd 1.0
    ten equ word ptr [bp-2] ; какой-то регистр для вывода
    temp equ word ptr [bp-4] ; еще какой-то регистр для вывода

    message1 db "Ряд Тейлора от ln(1-x)", '$'
    message2 db "Введите N = ", '$'
    message3 db "Веедите X = ", '$'
    message4 db "Ряд: ", '$'
    message5 db " + ", '$'
    message6 db "/", '$'
    message7 db " = -", '$'
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
    mov bx, offset xStr
    call input

    mov si, offset xStr + 2
    call string_to_float
    fchs
    fst x


    mov ax, offset message4
    call print

    fld x
    fst chisl

    call tayl

    mov ax, offset message7
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
    call exit
main endp

tayl proc
    push cx
    xor cx, cx
    taylcicle:
        cmp cx, 0
        je __skip
        mov ax, offset message5
        call print
    __skip:
        fld chisl
        call print_float

        mov ax, offset message6
        call print

        fld znam
        call print_float

        fld znam
        fld chisl

        fdiv st(0), st(1)
        fst tmp

        fld tmp

        fld outp

        fsub st(0), st(1)
        fst outp

        fld i
        fcom n
        fstsw ax
        sahf
        mov cx, 1
        jb taylinc
        pop cx
        ret
    taylinc:
        fld chisl
        fld x
        fmul
        fchs
        fst chisl

        fld1
        fld znam
        fadd
        fst znam

        fld i
        fld1
        fadd
        fst i
        mov cx, 1
        jmp taylcicle
    pop cx
    ret
tayl endp

exit proc
    mov ax,4c00h
    int 21h
exit endp
end main