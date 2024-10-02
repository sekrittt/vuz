.model small
.186
.stack 100h

.code

print proc ; al - текст
    mov dl, al
    mov ah, 02h
    int 21h
    ret
print endp

start proc
    ; Установка собственного обработчика
    mov ax, 2509h
    mov dx, seg handler
    mov ds, dx
    mov dx, offset handler
    int 21h
start endp

handler proc
    ; Обработчик
    push ax

;_loop:
    sub ax, ax
    in al, 60h

    ; кнопка прерывания - F1
        cmp al, 3Bh
        je f1

    ; кнопка прерывания - F2
        cmp al, 3Ch
        je f2

    ; кнопка прерывания - F3
        cmp al, 3Dh
        je f3

    ; кнопка прерывания - F4
        cmp al, 3Eh
        je f4

    ; кнопка прерывания - esc
        cmp al, 01h
        je kill

    ; кнопки не совпали
        jne skip

skip:
    pop ax

    call handler

handler endp

f1 proc
    mov al, "1"
    call print
    ;call _loop

    call handler
f1 endp

f2 proc
    mov al, "2"
    call print
    ;call _loop

    call handler
f2 endp


f3 proc
    mov al, "3"
    call print
    ;call _loop

    call handler
f3 endp


f4 proc
    mov al, "4"
    call print
    ;call _loop

    call handler
f4 endp


kill proc
    mov ax, 4C01h
    int 21h
kill endp


end start