.model tiny
.386
.stack 100h

.data
    msgNotFoundPath db "Путь не найден!", "$"               ; сообщение, что путь не найден
    msgNotFoundFile db "Файл не найден!", "$"               ; сообщение, что файл не найден
    msgToManyFilesOpened db "Октрыто много файлов!", "$"   ; сообщение, что открыто слишком много файлов
    msgAccessDenied db "Доступ запрещён!", "$"                ; сообщение, что доступ запрещён
    msgInvalidAccessMode db "Неверный режим доступа!", "$"     ; сообщение, что неверный режим доступа
    msgInvalidFileId db "Неверные идентификатор файла!", "$"  ; сообщение, что неверный идентификатор файла
    dictFileName db "./syear/dict.txt", 0
    fileId dw ?
    fileSize dw 0
    lineBuffer db 254, 0, 254 dup("$")
    lineLength dw 0
    lineStartPos dw 0
    splitedLine1 db 254, 0, 254 dup("$")
    splitedLine2 db 254, 0, 254 dup("$")
    inputWord db 254, 0, 254 dup("$")

.code
include libs/io.asm

clearScreen proc
    mov ax, 0003h
    int 10h
    ret
clearScreen endp

; вывод ошибок
file_error_handler proc
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
file_error_handler endp

not_found_error proc
    mov ax, offset msgNotFoundFile
    call println
    call exit
not_found_error endp

path_not_found_error proc
    mov ax, offset msgNotFoundPath
    call println
    call exit
path_not_found_error endp

to_many_files_opened_error proc
    mov ax, offset msgToManyFilesOpened
    call println
    call exit
to_many_files_opened_error endp

access_denied_error proc
    mov ax, offset msgAccessDenied
    call println
    call exit
access_denied_error endp

invalid_id_error proc
    mov ax, offset msgInvalidFileId
    call println
    call exit
invalid_id_error endp

invalid_access_mode_error proc
    mov ax, offset msgInvalidAccessMode
    call println
    call exit
invalid_access_mode_error endp

start proc
        mov ax, @data
        mov ds, ax

    start_loop:
        call clearScreen
        ; Open dict file
        mov ah, 3Dh
        mov al, 00000000b
        mov cl, 0
        mov dx, offset dictFileName
        int 21h
        jc file_error_handler

        mov fileId, ax

        ; call getLine

        ; mov al, "="
        ; call splitLine

        ; mov ax, offset splitedLine1
        ; call println

        ; mov ax, offset splitedLine2
        ; call println

        call exit
start endp

; si - buffer offset
clearBuffer proc
        push ax
        mov al, [si]
        cmp al, '$'
        je clearBuffer_exit
    clearBuffer_loop:
        mov al, [si]
        cmp al, '$'
        je clearBuffer_exit
        mov byte ptr [si], '$'
        inc si
        jmp clearBuffer_loop
    clearBuffer_exit:
        pop ax
        ret
clearBuffer endp

; Get one line in file
getLine proc
        mov si, offset lineBuffer
        call clearBuffer
        push ax
        push bx
        push cx
        push dx
        push si
        mov cx, 0
        mov lineLength, cx
        mov ah, 42h
        mov bx, fileId
        mov dx, lineStartPos
        mov cx, 0
        mov al, 0
        int 21h
    getLine_loop:
        mov cx, lineLength
        inc cx
        mov lineLength, cx
        cmp cx, 254
        je getLine_error
        mov ah, 3Fh
        mov bx, fileId
        mov cx, 01h
        mov dx, offset lineBuffer
        int 21h
        jc file_error_handler

        mov si, offset lineBuffer
        mov al, byte ptr [si]
        cmp al, 0Dh ; End of line, if don't work replace to 0Ah
        jne getLine_loop

    getLine_stop:
        mov ah, 42h
        mov bx, fileId
        mov dx, lineStartPos
        mov cx, 0
        mov al, 0
        int 21h

        mov cx, lineLength
        mov bx, lineStartPos
        add cx, bx
        inc cx
        mov lineStartPos, cx
        xor bx, bx

        mov cx, lineLength
        dec cx
        mov lineLength, cx

        mov ah, 3Fh
        mov bx, fileId
        mov cx, lineLength
        mov dx, offset lineBuffer
        int 21h
        jc file_error_handler
        jmp getLine_exit

    getLine_error:
        mov cx, 0
        mov lineLength, cx
        mov lineStartPos, cx
        mov ah, 42h
        mov bx, fileId
        mov dx, 0
        mov cx, 0
        mov al, 0
        int 21h
        mov si, offset lineBuffer
        call clearBuffer

    getLine_exit:
        pop si
        pop dx
        pop cx
        pop bx
        pop ax
        ret
getLine endp

; Split line by char
; al - splitter
splitLine proc
        push si
        push bx

        mov si, offset splitedLine1
        call clearBuffer
        mov si, offset splitedLine2
        call clearBuffer

        mov si, 0
        mov cx, 0
    splitLine1_loop:
        cmp al, byte ptr [lineBuffer + si]
        je splitLine2_loop
        mov bl, byte ptr [lineBuffer + si]
        mov byte ptr [splitedLine1 + si], bl
        inc si
        cmp si, lineLength
        je splitLine_end
        jmp splitLine1_loop
    splitLine2_loop:
        inc si
        cmp si, lineLength
        je splitLine_end
        mov bh, byte ptr [lineBuffer + si]
        push si
        mov si, cx
        mov byte ptr [splitedLine2 + si], bh
        inc cx
        pop si
        jmp splitLine2_loop
    splitLine_end:
        pop bx
        pop si
        ret
splitLine endp

exit proc
    ; Make it resident
    mov bx, fileId
    mov ah, 3Eh
    int 21h
    jc file_error_handler
    mov ax, 4C00h ; stop program
    int 21h ; dos interrupt
exit endp

end start