; ax - placeholder
; bx - buffer
input proc

    mov dx, ax
    mov ah, 09h
    int 21h

    mov ah, 0Ah
    mov dx, bx
    int 21h

    mov dl, 0Dh
    mov ah, 02h
    int 21h
    mov dl, 0Ah
    mov ah, 02h
    int 21h

    ret
input endp

; ax - address of text
println proc
    mov dx, ax
    mov ah, 09h
    int 21h
    ; new line
    mov dl, 0Dh
    mov ah, 02h
    int 21h
    mov dl, 0Ah
    mov ah, 02h
    int 21h
    ;
    ret
println endp

; al - text
println_text proc
    mov dl, al
    mov ah, 02h
    int 21h
    mov dl, 0Dh
    mov ah, 02h
    int 21h
    mov dl, 0Ah
    mov ah, 02h
    int 21h
    ret
println_text endp

; ax - number
print_int proc
   test    ax, ax
   jns     print_int_oi1

; Если оно отрицательное, выведем минус и оставим его модуль.
   mov  cx, ax
   mov     ah, 02h
   mov     dl, '-'
   int     21h
   mov  ax, cx
   neg     ax

; Количество цифр будем держать в CX.
print_int_oi1:
    xor     cx, cx
    mov     bx, 10 ; основание сс. 10 для десятеричной и т.п.
print_int_oi2:
    xor     dx,dx
    div     bx
; Делим число на основание сс. В остатке получается последняя цифра.
; Сразу выводить её нельзя, поэтому сохраним её в стэке.
    push    dx
    inc     cx
; А с частным повторяем то же самое, отделяя от него очередную
; цифру справа, пока не останется ноль, что значит, что дальше
; слева только нули.
    test    ax, ax
    jnz     print_int_oi2
; Теперь приступим к выводу.
    mov     ah, 02h
print_int_oi3:
    pop     dx
; Извлекаем очередную цифру, переводим её в символ и выводим.
; раскоментировать если основание сс > 10, т.е. для вывода требуются буквы
;   cmp     dl,9
;   jbe     oi4
;   add     dl,7
;oi4:
    add     dl, '0'
    int     21h
; Повторим ровно столько раз, сколько цифр насчитали.
    loop    print_int_oi3

    mov dl, 0Dh
    mov ah, 02h
    int 21h
    mov dl, 0Ah
    mov ah, 02h
    int 21h

    ret
print_int endp