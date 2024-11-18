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
    msgPleaseEnterWord db "Пожалуйста введите слово для перевода: ", "$"
    msgNotFoundTranslation db "Нет такого слова в словаре!", "$"
    dictFileName db "./syear/dict.txt", 0
    fileId dw ?
    fileSize dw 0
    lineBuffer db 254, 0, 254 dup("$")
    lineLength dw 0
    lineStartPos dw 0
    splitedLine1 db 254, 0, 254 dup("$")
    splitedLine2 db 254, 0, 254 dup("$")
    inputWord db 254, 0, 254 dup("$")
    exitInput1 db "exit", "$"
    exitInput2 db "выход", "$"

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

    wait_word_loop:
        mov cx, 0
        mov lineLength, cx
        mov lineStartPos, cx


        mov ax, offset msgPleaseEnterWord
        mov bx, offset inputWord
        call input

        mov si, offset inputWord
        call removeTwoEndBytes

        mov ax, offset exitInput1
        mov bx, offset inputWord + 2
        call cmpLines
        cmp cx, 1
        je start_loop_exit

        mov ax, offset exitInput2
        mov bx, offset inputWord + 2
        call cmpLines
        cmp cx, 1
        je start_loop_exit

    finding_loop:
        call getLine

        ; mov ax, lineLength
        ; call print_int
        ; mov ax, offset lineBuffer
        ; call println

        mov ax, lineLength
        cmp ax, -1
        je finding_loop_not_found
        cmp ax, 0
        je finding_loop_not_found

        mov al, "="
        call splitLine

        mov ax, offset splitedLine1
        mov bx, offset inputWord + 2
        call cmpLines
        cmp cx, 1
        je finding_loop_end_1

        mov ax, offset splitedLine2
        mov bx, offset inputWord + 2
        call cmpLines
        cmp cx, 1
        je finding_loop_end_2

        jmp finding_loop

    finding_loop_end_1:

        mov ax, offset splitedLine2
        call println
        jmp wait_word_loop

    finding_loop_end_2:

        mov ax, offset splitedLine1
        call println
        jmp wait_word_loop

    finding_loop_not_found:
        mov ax, offset msgNotFoundTranslation
        call println
        jmp wait_word_loop

    start_loop_exit:

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
        mov ah, 3Fh
        mov bx, fileId
        mov cx, 01h
        mov dx, offset lineBuffer
        int 21h
        jc file_error_handler

        cmp ax, 0
        je getLine_stop

        mov si, offset lineBuffer
        mov al, byte ptr [si]
        cmp al, 0Ah ; End of line, if don't work replace to 0Ah
        jne getLine_loop

    getLine_stop:
        push ax
        mov ah, 42h
        mov bx, fileId
        mov dx, lineStartPos
        mov cx, 0
        mov al, 0
        int 21h

        mov cx, lineLength
        mov bx, lineStartPos
        add cx, bx
        mov lineStartPos, cx
        xor bx, bx

        pop ax
        mov cx, lineLength

        cmp ax, 0
        je ___skip
        cmp cx, 2
        je ___skip
        dec cx
    ___skip:
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
        mov cx, -1
        mov lineLength, cx
        mov cx, 0
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


; si - offest buffer
removeTwoEndBytes proc
    push ax
    push cx
    mov ch, 0
    mov cl, byte ptr [si + 1] ; Line Length
    add si, cx ; Add to address of buffer line lenght

    mov byte ptr [si + 2], '$' ; 0Dh byte
    mov byte ptr [si + 3], '$' ; 0Ah byte

    pop cx
    pop ax
    ret
removeTwoEndBytes endp

; ax - first line offset
; bx - second line offset
; cx - result 1 or 0
cmpLines proc
    push dx
    push si
    mov cx, 1
    cmpLines_loop:
        mov si, ax
        mov dl, [si]
        inc ax

        mov si, bx
        mov dh, [si]
        inc bx
        cmp dl, '$'
        je cmpLines_stop
        cmp dh, '$'
        je cmpLines_stop
        cmp dl, dh
        je cmpLines_loop
    cmpLines_stop:

        cmp dl, dh
        je cmpLines_skip
        mov cx, 0
    cmpLines_skip:
        pop si
        pop dx
        ret
cmpLines endp

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