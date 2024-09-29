.model small
.stack 100h

.data
    message db "Hello world", 10, 10, "$" ; объявление переменной

.code
start proc
    mov ax, @data ;
    mov ds, ax ;

    mov ah, 02h ; считывание состояние клавиатуры
    int 16h ; прерывание биос

    mov bh, al ; запись состояния командных клавиш

    mov ah, 09h ; функция вывода
    mov dx, offset message ; подстановка значения
    int 21h ; прерывание дос
start endp

check proc
    mov ah, 02h ; считывание состояние клавиатуры
    int 16h ; прерывание биос

    cmp bh, al ; проверка с начальным значением состояния
    jne exit ; выход из программы

    jmp check ; переход в начало блока
check endp

exit proc
    mov ax, 4C00h ; завершение программы
    int 21h ; прерывание дос
exit endp

end start