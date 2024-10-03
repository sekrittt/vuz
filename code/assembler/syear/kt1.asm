.model small
.386
.stack 100h

.data
    old_handler dd ? ; address of interrupt handler


.code
include libs\io.asm
start proc
    ; IRQ1 or INT9 - keyboard
    ; Save old handler
    mov ax, 3509h
    int 21h
    mov word ptr old_handler, bx
    mov word ptr old_handler+2, es
    ; Setup custom handler
    mov ax, 2509h
    mov dx, seg keyboard_handler
    mov ds, dx
    mov dx, offset keyboard_handler
    int 21h
start endp

keyboard_handler proc
    pusha
    push ax
    ; xor ax, ax
    ; in al, 60h
    ; cmp al, 1ch
    ; pop ax
    ; jne skip
    ; push ax
    ; mov al, 20h
    ; out 20h, al
    xor ax, ax
    mov al, "Y"
    call println_text
    pop ax
    popa
    jmp cs:old_handler
    iret

; skip:
;     ; mov al, 20h
;     ; out 20h, al
;     jmp cs:old_handler
;     iret
keyboard_handler endp

exit proc
    lds dx, old_handler
    mov ax, 2509h
    int 21h
    mov ax, 4C00h
    int 21h
exit endp

end start