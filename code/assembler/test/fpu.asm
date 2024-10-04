.model small
.386
.stack 100h

.data
    controlReg dw ?
    t dd 2.5
    t2 dd 2.0
    result dw ?

.code

print_float proc

print_float endp

main proc
    mov ax, @data ;
    mov ds, ax

    finit
    xor eax, eax
    fstcw controlReg
    mov ax, controlReg  ; помещаем в регистр AX
    and ax, 0f0ffh      ; Сбрасываем биты 8-11
    or ax, 0c00h        ; устанавливаем 11-10, 9-8 биты - округление = 11, точность = 00
    mov controlReg, ax  ; из AX в controlReg
    fldcw controlReg    ; загружаем в регистр данные из controlReg

    fld t
    fld t2
    fmul
    fistp result
    mov ax, result
    call print_int

    mov ax, 4C00h
    int 21h
main endp
end main