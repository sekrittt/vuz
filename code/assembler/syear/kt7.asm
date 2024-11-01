.model tiny
.386
.stack 100h

.data
    dictFileName db 'dict.txt', 0
    msgNotFoundPath db "���� �� ������!", "$"               ; ᮮ�饭��, �� ���� �� ������
    msgNotFoundFile db "���� �� ������!", "$"               ; ᮮ�饭��, �� 䠩� �� ������
    msgToManyFilesOpened db "������ ����� 䠩���!", "$"   ; ᮮ�饭��, �� ����� ᫨誮� ����� 䠩���
    msgAccessDenied db "����� ������!", "$"                ; ᮮ�饭��, �� ����� ������
    msgInvalidAccessMode db "������ ०�� ����㯠!", "$"     ; ᮮ�饭��, �� ������ ०�� ����㯠
    msgInvalidFileId db "������ �����䨪��� 䠩��!", "$"  ; ᮮ�饭��, �� ������ �����䨪��� 䠩��
    fileId dw 0
    currBuffer db 254, 0, 254 dup("$")
    symbolBuffer db 2, 0, 2 dup("$")

.code
include libs/io.asm

clearScreen proc
    mov ax, 0003h
    int 10h
    ret
clearScreen endp

main proc
    mov ax, @data
    mov ds, dx

main_loop:
    call clearScreen

    ; Open dict file
    mov ah, 3Dh
    mov al, 00000001h
    mov dx, offset dictFileName
    mov cl, 0
    int 21h
    jc error_handler

    mov fileId, ax ; Save file id in 'fileId' variable



    call exit
main endp

; Finding line in dict
findLine proc
    push dx
    push cx
    xor cx, cx
    xor dx, dx
findLine_loop:
    mov ah, 3Fh
    mov bx, fileId
    mov dx, offset symbolBuffer
    mov cx, 1
    int 21h
    jc error_handler
    mov al, [symbolBuffer]
    cmp al, '.'
    

    pop dx
    pop cx
    ret
findLine endp

; �뢮� �訡��
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
not_found_error endp

path_not_found_error proc
    mov ax, offset msgNotFoundPath
    call println
path_not_found_error endp

to_many_files_opened_error proc
    mov ax, offset msgToManyFilesOpened
    call println
to_many_files_opened_error endp

access_denied_error proc
    mov ax, offset msgAccessDenied
    call println
access_denied_error endp

invalid_id_error proc
    mov ax, offset msgInvalidFileId
    call println
invalid_id_error endp

invalid_access_mode_error proc
    mov ax, offset msgInvalidAccessMode
    call println
invalid_access_mode_error endp

exit proc
    ; Make it resident
exit endp

end main