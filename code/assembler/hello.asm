.model small
.stack 100h

.data
    msg db "Hello, wrold!", 13, 10, "$"
    buffer db 17

.code
;Процедура преобразования байта в строку в двоичном виде
; AL - байт.
; DI - буфер для строки (8 символов). Значение регистра не сохраняется.
; byte_to_bin_str:
;     push cx                 ;Сохранение CX
;     mov cx,8                ;Счётчик цикла

; btbs_lp:
;     rol bh,1                ;Циклический сдвиг AL влево на 1 бит
;     jc btbs_1               ;Если выдвинутый бит = 1, то переход
;     mov byte[di],'0'        ;Добавление символа '0' в строку
;     jmp btbs_end
; btbs_1:
;     mov byte[di],'1'        ;Добавление символа '1' в строку
; btbs_end:
;     inc di                  ;Инкремент DI
;     loop btbs_lp            ;Команда цикла

;     pop cx                  ;Восстановление CX
;     ret                     ;Возврат из процедуры

; print_byte proc
;     mov di, offset buffer
;     call byte_to_bin_str
;     mov byte[di], '$'
;     sub di, 8

;     mov dx, offset buffer
;     mov ah, 09h
;     int 21h
; print_byte endp

main proc
    mov ax, @data ;
    mov ds, ax

    mov ah, 9 ; функция вывода
    mov dx, offset msg ;
    int 21h ; dos прирывание

    mov ah, 02h
    int 16h

    mov cl, al

    jmp wait_caps_lock

    ; jmp read_loop

    mov ax, 4C00h
    int 21h
main endp

wait_caps_lock proc

    mov ah, 02h
    int 16h
    cmp al, 00001100b

    jne wait_caps_lock

    ; console.log | print
    ; mov bh, al
    ; call print_byte
    ;

    je exit
    ret

wait_caps_lock endp

read_loop proc
    mov ah, 08h ; Function 01h Read character from stdin with echo
    int 21h
    cmp al, 09h ; character is carriage return?
    je exit ; yes? exit the loop
    ; stosb ; store the character at es:di and increment di
    jmp read_loop ; loop again
read_loop endp

exit proc
    mov ax, 4C00h
    int 21h
exit endp

end main