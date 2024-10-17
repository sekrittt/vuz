; String to float

; input: si - buffer address
; output: On top in FPU Stack
string_to_float proc
; обрабатываем содержимое буфера
    push ax
    push dx
    push si
    push bp ; формируем кадр стэка, чтобы хранить десятку и ещё какую-нибудь цифру.
    mov bp, sp
    push 10
    push 0

    fldz

    xor di, di
    cmp byte ptr [si],"-" ; если первый символ минус
    jnz s2f_1
    mov di,1  ; устанавливаем флаг
    inc si    ; и пропускаем его

s2f_1:
    mov cl,[si] ; берем символ из буфера
    cmp cl,0dh  ; проверяем не последний ли он
    jz s2f_end

; если символ не последний, то проверяем его на правильность
    cmp cl, '.'
    je s2f_2
    cmp cl,'0'  ; если введен неверный символ <0
    jb s2f_error
    cmp cl,'9'  ; если введен неверный символ >9
    ja s2f_error

    sub cl,'0' ; делаем из символа число
    mov [bp - 4], cl ; сохраним её во временной ячейке и допишем к текущему результату справа,
    fimul word ptr [bp - 2] ; то есть умножим уже имеющееся число на десять
    fiadd word ptr [bp - 4] ; и прибавим только что обретённую цифру.

    inc si     ; указатель на следующий символ
    jmp s2f_1     ; повторяем

s2f_2:
    inc si
    fld1
s2f_3:
    mov cl,[si] ; берем символ из буфера
    cmp cl,0dh  ; проверяем не последний ли он
    jz s2f_4

    cmp cl,'0'  ; если введен неверный символ <0
    jb s2f_error
    cmp cl,'9'  ; если введен неверный символ >9
    ja s2f_error

    sub cl,'0' ; делаем из символа число
    mov [bp - 4], cl
    fidiv word ptr [bp - 2] ; получаем очередную отрицательную степень десятки,
    fld st(0) ; дублируем её,
    fimul word ptr [bp - 4] ; помножаем на введённую цифру, тем самым получая её на нужном месте,
    faddp st(2), st ; и добавляем к текущему результату.
    inc si
    jmp s2f_3

s2f_error:   ; если была ошибка, то выводим сообщение об этом и выходим
    mov dx, offset msgIncorectNumber
    mov ah,09
    int 21h
    ret

s2f_4:
    fstp st(0)

s2f_end:
    cmp di,1 ; если установлен флаг, то
    jne s2f_exit
    fchs

s2f_exit:
    leave
    pop si
    pop dx
    pop ax
    ret
string_to_float endp