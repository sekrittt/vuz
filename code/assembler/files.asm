.model small
.stack 100h

.data
    msgEnterText db "Enter text: ", "$"
    msgNotFoundPath db "Path not found!", "$"
    msgNotFoundFile db "File not found!", "$"
    msgToManyFilesOpened db "To many files opened!", "$"
    msgAccessDenied db "Access denied!", "$"
    msgInvalidAccessMode db "Invalid access mode!", "$"
    msgInvalidFileId db "Invalid file indentifactor!", "$"
    msgSuccessFileCreate db "Success file create!", "$"
    msgSuccessFileWrite db "Success file write!", "$"
    fileName db "file.txt", 0
    newLine db 0Dh, 0Ah, "$"
    tLine db "T", "$"
    buffer db 254, 0, 254 dup("$")

.code
include io.asm
main proc
    mov ax, @data ;
    mov ds, ax

    ; mov ax, 0003h
    ; int 10h

    ; Make file
    mov ah, 3Ch
    mov cx, 00000000b
    mov dx, offset fileName
    int 21h
    jc file_error_handler

    mov ah, 3Dh
    mov al, 00010010b
    mov cl, 0
    mov dx, offset fileName
    int 21h
    jc file_error_handler

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
    mov cx, bx

    pop bx

    mov dx, offset buffer + 2
    int 21h
    jc file_error_handler
    pop ax

    mov bx, ax
    mov ah, 3Eh
    int 21h
    jc file_error_handler

    mov ax, offset msgSuccessFileWrite
    call println

    call exit
main endp

; ax - address of string
; cx - output length
str_len proc
    mov cx,0FFFFh; максимальное 16-разрядное число
    mov al,'$'; ищем терминатор строки в DOS
    mov di, ax; в регистр DI адрес начала строки
    repne scasb; ищем
    not cx; в регистре CX количество символов строки без символа '$'
    ret
str_len endp

test_loop proc
    push ax
    mov ax, offset tLine
    call println
    pop ax
    loop test_loop
    ret
test_loop endp

file_error_handler proc
    cmp ax, 02h
    je file_not_found_error
    cmp ax, 03h
    je file_path_not_found_error
    cmp ax, 04h
    je file_to_many_files_opened_error
    cmp ax, 05h
    je file_access_denied_error
    cmp ax, 06h
    je file_invalid_file_id_error
    cmp ax, 0Ch
    je file_invalid_access_mode_error
file_error_handler endp

file_not_found_error proc
    mov ax, offset msgNotFoundFile
    call println
    jmp exit
file_not_found_error endp

file_path_not_found_error proc
    mov ax, offset msgNotFoundPath
    call println
    jmp exit
file_path_not_found_error endp

file_to_many_files_opened_error proc
    mov ax, offset msgToManyFilesOpened
    call println
    jmp exit
file_to_many_files_opened_error endp

file_access_denied_error proc
    mov ax, offset msgAccessDenied
    call println
    jmp exit
file_access_denied_error endp

file_invalid_file_id_error proc
    mov ax, offset msgInvalidFileId
    call println
    jmp exit
file_invalid_file_id_error endp

file_invalid_access_mode_error proc
    mov ax, offset msgInvalidAccessMode
    call println
    jmp exit
file_invalid_access_mode_error endp

exit proc
    mov ax, 4C00h
    int 21h
exit endp

end main