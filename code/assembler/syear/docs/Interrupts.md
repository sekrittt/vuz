# Прерывания
## Клавиатура
1. Устанавливаем модель памяти, как правило ```tiny``` достаточно
    ```assembly
    .model tiny
    ```
2. Выделяем 100 байт стека
    ```assembly
    .stack 100h
    ```
3. Определяем секцию данных и переменную ```old_handler``` для хранения адреса старого обработчика
    ```assembly
    .data
        old_handler dd ?
    ```
4. Основной код
    ```assembly
    .code
    start proc near
        mov ax, @data
        mov ds, ax

        mov ax, 3509h
        int 21h
        mov word ptr [old_handler], bx   ; save old handler
        mov word ptr [old_handler+2], es ; save segment address old handler

        push ds ; Save data section
        mov ax, 2509h
        mov dx, seg kbh
        mov ds, dx
        mov dx, offset kbh
        int 21h
        pop ds ; restore data section


    p:
        jmp p
    start endp

    kbh proc far ; keyboard handler
        in al, 60h ; Read data from port
        cmp al, 1Ch ; If al == 1Ch (Enter key)
        je kbh_exit

        ; ... Делаем что-то

        mov al, 20h
        out 20h, al
        iret
    kbh_exit:
        ; ... Делаем что-то
        mov al, 20h
        out 20h, al
        call exit
    kbh endp

    exit proc
        ; Restore old handler
        push ds
        lds dx, old_handler
        mov ax, 2509h
        int 21h
        pop ds
        ;
        mov ax, 4C00h ; stop program
        int 21h ; dos interrupt
    exit endp

    end start
    ```
    - Загрузка секции данных в регистр ds
        ```assembly
        mov ax, @data
        mov ds, ax
        ```
    - Получаем текущий обработчик прерывания.
        ```assembly
        mov ax, 3509h
        int 21h
        ```
        35 - DOS-функция получения адреса текущего обработчика, 09 - номер прерывания
    - Сохраняем адрес текущего обработчика.
        ```assembly
        mov word ptr [old_handler], bx
        mov word ptr [old_handler+2], es
        ```
        bx - адрес обработчика, es - сегментный адрес обработчика
    - Установка нового обработчика.
        ```assembly
        push ds
        mov ax, 2509h
        mov dx, seg kbh
        mov ds, dx
        mov dx, offset kbh
        int 21h
        pop ds
        ```
        Предварительно сохраняем регистр данных, так как будем его использовать для передачи сегментного адрес нашего обработчика. 25 - DOS-функция установки обработчика, 09 - номер прерывания. Ключевое слово ```seg``` получает сегментный адрес.
    - Делаем бесконечный цикл чтобы программа не закрывалась.
        ```assembly
        p:
            jmp p
        ```
    - Наш обработчик клавиатуры.
        ```assembly
        kbh proc far
            in al, 60h ; Read data from port
            cmp al, 1Ch ; If al == 1Ch (Enter key)
            je kbh_exit

            ; ... Делаем что-то

            mov al, 20h
            out 20h, al
            iret
        kbh_exit:
            ; ... Делаем что-то
            mov al, 20h
            out 20h, al
            call exit
        kbh endp
        ```
        Ключевое слово ```far``` указывает на то, что это будет "дальняя" процедура.
        - Читаем данные из порта №60.
            ```assembly
            in al, 60h
            ```
            Используется именно чтение из порта, потому что мы реализуем свой обработчик и по правильному мы не должны использовать прерывания по крайней мере не использовать их слишком много. В ```al``` будет результат скан-код клавиши. 