.model tiny
.386
.stack 100h

.data
    msgNotFoundPath db "Путь не найден!", "$"               ; сообщение, что путь не найден
    msgNotFoundFile db "Файл не найден!", "$"               ; сообщение, что файл не найден
    msgToManyFilesOpened db "Открыто много файлов!", "$"   ; сообщение, что открыто слишком много файлов
    msgAccessDenied db "Доступ запрещён!", "$"                ; сообщение, что доступ запрещён
    msgInvalidAccessMode db "Неверный режим доступа!", "$"     ; сообщение, что неверный режим доступа
    msgInvalidFileId db "Неверные идентификатор файла!", "$"  ; сообщение, что неверный идентификатор файла
    msgPleaseEnterWord db "                     Пожалуйста, введите слово для перевода", "$"
    msgPleaseEnterWordPlaceholder db ">>> ", "$"
    msgWordTranslation db "Перевод: ", "$"
    emptyString db "", "$"
    msgNotFoundTranslation db "Нет такого слова в словаре!", "$"
    msgHelperText db "Нажмите shift для запуска словаря", "$"
    dictFileName db "./syear/dict.txt", 0
    fileId dw ?
    isFileEnd dw 0
    lineBuffer db 254, 0, 254 dup("$")
    lineLength dw 0
    lineStartPos dw 0
    splittedLine1 db 254, 0, 254 dup("$")
    splittedLine2 db 254, 0, 254 dup("$")
    inputWord db 254, 0, 254 dup("$")
    exitInput1 db "exit", "$"
    exitInput2 db "выход", "$"
    clearInput1 db "clear", "$"
    clearInput2 db "очистить", "$"
    old_handler dw 0, 0
    altPressed dw 0

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
    jmp kb__exit
file_error_handler endp

not_found_error proc
    mov ax, offset msgNotFoundFile
    call println
    jmp kb__exit
not_found_error endp

path_not_found_error proc
    mov ax, offset msgNotFoundPath
    call println
    jmp kb__exit
path_not_found_error endp

to_many_files_opened_error proc
    mov ax, offset msgToManyFilesOpened
    call println
    jmp kb__exit
to_many_files_opened_error endp

access_denied_error proc
    mov ax, offset msgAccessDenied
    call println
    jmp kb__exit
access_denied_error endp

invalid_id_error proc
    mov ax, offset msgInvalidFileId
    call println
    jmp kb__exit
invalid_id_error endp

invalid_access_mode_error proc
    mov ax, offset msgInvalidAccessMode
    call println
    jmp kb__exit
invalid_access_mode_error endp

main proc
    mov ax, @data
    mov ds, ax

    mov ax, offset msgHelperText
    call println

    mov ax, 3509h
    int 21h
    mov old_handler, bx   ; save old handler
    mov old_handler+2, es ; save segment address old handler

    push ds ; Save data section
    mov ax, 2509h
    mov dx, seg kb_handler
    mov ds, dx
    mov dx, offset kb_handler
    int 21h
    pop ds ; restore data section

    call exit
main endp

start proc
        mov ax, @data
        mov ds, ax

    start_loop:
        ; Open dict file
        mov ah, 3Dh
        mov al, 00000000b
        mov cl, 0
        mov dx, offset dictFileName
        int 21h
        jc file_error_handler

        mov fileId, ax

    clear_screen:
        call clearScreen
        mov ax, offset msgPleaseEnterWord
        call println

    wait_word_loop:
        mov cx, 0
        mov lineLength, cx
        mov lineStartPos, cx
        mov isFileEnd, cx


        mov ax, offset msgPleaseEnterWordPlaceholder
        mov bx, offset inputWord
        call input

        mov al, byte ptr [inputWord + 1]
        cmp al, 0
        je wait_word_loop

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

        mov ax, offset clearInput1
        mov bx, offset inputWord + 2
        call cmpLines
        cmp cx, 1
        je clear_screen

        mov ax, offset clearInput2
        mov bx, offset inputWord + 2
        call cmpLines
        cmp cx, 1
        je clear_screen

    finding_loop:
        call getLine

        mov bx, isFileEnd
        mov ax, lineLength
        add ax, bx
        cmp ax, 1
        je finding_loop_not_found
        cmp ax, 0
        je finding_loop

        mov al, "="
        call splitLine

        mov ax, offset splittedLine1
        mov bx, offset inputWord + 2
        call cmpLines
        cmp cx, 1
        je finding_loop_end_1

        mov ax, offset splittedLine2
        mov bx, offset inputWord + 2
        call cmpLines
        cmp cx, 1
        je finding_loop_end_2

        jmp finding_loop

    finding_loop_end_1:
        mov ax, offset splittedLine2
        call println
        jmp wait_word_loop

    finding_loop_end_2:
        mov ax, offset splittedLine1
        call println
        jmp wait_word_loop

    finding_loop_not_found:
        mov ax, offset msgNotFoundTranslation
        call println
        jmp wait_word_loop

    start_loop_exit:
        ret
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
        mov bl, byte ptr [si]
        cmp bl, 0Ah ; End of line, if don't work replace to 0Ah
        je getLine_stop
        jmp getLine_loop

    getLine_stop:

        mov bx, 1
        sub ax, bx ; ax = ax - bx
        neg ax
        mov isFileEnd, ax

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

        mov cx, lineLength
        dec cx
        mov lineLength, cx
        cmp cx, 0
        je getLine_exit

        mov ah, 3Fh
        mov bx, fileId
        mov cx, lineLength
        mov dx, offset lineBuffer
        int 21h
        jc file_error_handler

        mov si, offset lineBuffer
        mov cx, lineLength
        add si, cx
        dec si
        cmp byte ptr [si], 0Dh
        jne getLine_exit
        mov byte ptr [si], '$'
        dec cx
        mov lineLength, cx
        jmp getLine_exit

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

        mov si, offset splittedLine1
        call clearBuffer
        mov si, offset splittedLine2
        call clearBuffer

        mov si, 0
        mov cx, 0
    splitLine1_loop:
        cmp al, byte ptr [lineBuffer + si]
        je splitLine2_loop
        mov bl, byte ptr [lineBuffer + si]
        mov byte ptr [splittedLine1 + si], bl
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
        mov byte ptr [splittedLine2 + si], bh
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
    add si, cx ; Add to address of buffer line length

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

kb_handler proc
    pushf
    in al, 60h
    cmp al, 2Ah
    je kb__skip
    cmp al, 38h
    je kb__alt
    cmp al, 36h
    je kb__skip
kb__exit:
    call dword ptr cs:old_handler
    mov al, 20h
    out 20h, al
    iret
kb__alt:
    push ax
    mov ax, 1
    mov altPressed, ax
    pop ax
    call dword ptr cs:old_handler
    mov al, 20h
    out 20h, al
    iret
kb__skip:
    push ax
    mov ax, altPressed
    cmp ax, 1
    pop ax
    je kb__skip2
    mov al, 20h
    out 20h, al
    call start
kb__skip2:
    push ax
    mov ax, 0
    mov altPressed, ax
    pop ax
    call dword ptr cs:old_handler
    mov al, 20h
    out 20h, al
    iret
kb_handler endp

exit proc
    ; Make it resident
    mov ax, 3100h ; stop program
    int 21h ; dos interrupt
exit endp

end main