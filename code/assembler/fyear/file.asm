.model small
.stack 100h

.data
    ; название
    fileName db "text.txt", 0                               ; название файла

    ; сообщения
    msgSuccessFileCreate db "Success file create!", "$"     ; сообщение об успешном создании файла
    msgSuccessFileWrite db "Success file write!", "$"       ; сообщение об успешной записи в файл

    msgEnterText db "Text: ", "$"                           ; сообщение ввода текста
    msgNotFoundPath db "Path not found!", "$"               ; сообщение, что путь не найден
    msgNotFoundFile db "File not found!", "$"               ; сообщение, что файл не найден
    msgToManyFilesOpened db "Too many files opened!", "$"   ; сообщение, что открыто слишком ного файлов
    msgAccessDenied db "Access denied!", "$"                ; сообщение, что доступ запрещён
    msgInvalidAccessMode db "Invalid access mode!", "$"     ; сообщение, что неверный режим доступа
    msgInvalidFileId db "Invalid file indentifactor!", "$"  ; сообщение, что неверный идентификатор файла

    ; вспомогательные данные
    buffer db 17, 0, 17 dup("$")                            ; буффер ввода
    howManyWrite db 10                                      ; количество записываемых символов в файл

.code
; функции ввода-вывода
; ax - заполнитель
; bx - буфер

; функция ввода
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

; функция вывода
; ax - адрес текста
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

; точка входа
start proc
    mov ax, @data
    mov ds, ax

    mov ah, 41h
    mov dx, offset fileName
    int 21h

    ; создание файла
    mov ah, 3Ch
    mov cx, 00000000b
    mov dx, offset fileName
    int 21h
    jc error_handler

    mov ah, 3Dh
    mov al, 00010010b
    mov cl, 0
    mov dx, offset fileName
    int 21h
    jc error_handler

    push ax

    mov ax, offset msgSuccessFileCreate
    call println

    mov ax, offset msgEnterText
    mov bx, offset buffer
    call input

    mov ax, offset buffer + 2
    call println

    pop ax

    mov bx, ax
    push ax

    xor ax, ax
    mov ax, 4000h

    push bx

    mov bl, buffer + 1
    cmp bl, howManyWrite
    jb skip
    mov bl, howManyWrite

skip:
    mov cx, bx

    pop bx

    mov dx, offset buffer + 2
    int 21h
    jc error_handler
    pop ax

    mov bx, ax
    mov ah, 3Eh
    int 21h
    jc error_handler

    mov ax, offset msgSuccessFileWrite
    call println

    call exit
start endp

; нахождение длины строки
; ax - адрес сторки
; cx - длина
str_len proc
    mov cx,0FFFFh  ; максимальное 16-разрядное число
    mov al,'$'     ; ищем терминатор строки в DOS
    mov di, ax     ; в регистр DI адрес начала строки
    repne scasb    ; ищем
    not cx         ; в регистре CX количество символов строки без символа '$'
    ret
str_len endp

; вывод ошибок
error_handler proc
    cmp ax, 02h
    je not_found_error
    cmp ax, 03h
    je path_not_found_error
    cmp ax, 04h
    je to_many_files_opened_error
    cmp ax, 05h
    je access_denied_error
    cmp ax, 06h
    je invalid_id_error
    cmp ax, 0Ch
    je invalid_access_mode_error
error_handler endp

not_found_error proc
    mov ax, offset msgNotFoundFile
    call println
    jmp exit
not_found_error endp

path_not_found_error proc
    mov ax, offset msgNotFoundPath
    call println
    jmp exit
path_not_found_error endp

to_many_files_opened_error proc
    mov ax, offset msgToManyFilesOpened
    call println
    jmp exit
to_many_files_opened_error endp

access_denied_error proc
    mov ax, offset msgAccessDenied
    call println
    jmp exit
access_denied_error endp

invalid_id_error proc
    mov ax, offset msgInvalidFileId
    call println
    jmp exit
invalid_id_error endp

invalid_access_mode_error proc
    mov ax, offset msgInvalidAccessMode
    call println
    jmp exit
invalid_access_mode_error endp

exit proc
    mov ax, 4C00h
    int 21h
exit endp

end start