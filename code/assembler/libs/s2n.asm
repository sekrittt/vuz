; String to number

; input: si - buffer address
; output: ax - number
string_to_number proc
; обрабатываем содержимое буфера
    ; mov si,offset buff+2 ; берем адрес начала строки
    xor di, di
    cmp byte ptr [si],"-" ; если первый символ минус
    jnz ii1
    mov di,1  ; устанавливаем флаг
    inc si    ; и пропускаем его
ii1:
    xor ax,ax
    mov bx,10  ; основание сc
ii2:
    mov cl,[si] ; берем символ из буфера
    cmp cl,0dh  ; проверяем не последний ли он
    jz endin

; если символ не последний, то проверяем его на правильность
    cmp cl,'0'  ; если введен неверный символ <0
    jb er
    cmp cl,'9'  ; если введен неверный символ >9
    ja er

    sub cl,'0' ; делаем из символа число
    mul bx     ; умножаем на 10
    add ax,cx  ; прибавляем к остальным
    inc si     ; указатель на следующий символ
    jmp ii2     ; повторяем

er:   ; если была ошибка, то выводим сообщение об этом и выходим
    mov dx, offset msgIncorectNumber
    mov ah,09
    int 21h
    int 20h

; все символы из буфера обработаны число находится в ax

endin:
    cmp di,1 ; если установлен флаг, то
    je do_neg
    ret
string_to_number endp

do_neg proc
    neg ax
    ret
do_neg endp