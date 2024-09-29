.model small
.186
.stack 100h

.data
    old_handler dd ? ; address of interrupt handler
    msg db "Yes! Exit)", "$"


.code
include libs\io.asm
start proc near
    ; Setup custom interrup with interrupts table
    ; push 0 ; Segment address of table vertors interrupts -
    ; pop es ; to ES
    ; ; Save old interrupt handler
    ; mov eax, dword ptr es:[87h*4]
    ; mov dword ptr old_handler, eax
    ; ; Setup our handler
    ; pushf  ; move flag register to stack
    ; cli    ; disable interrupts
    ; mov word ptr es:[87h*4], offset keyboard_handler
    ; mov word ptr es:[87h*4+2], seg keyboard_handler
    ; popf ; Restore IF flag value
    ; ; Program
    ; ;
    ; ; Restore old handler
    ; push 0
    ; pop es
    ; pushf
    ; cli
    ; mov eax, word ptr old_handler
    ; mov word ptr es:[87h*4], eax
    ; popf

    ; DOS functions - recommended variant
    ; 25h - setup handler, 35h - read handler address
    ; mov ax, 3587h ; AH - 35h, AL - number of inperrupt
    ; int 21h       ; DOS interrupt
    ; mov word ptr old_handler, bx   ; Address in bx
    ; mov word ptr old_handler+2, es ; Segment address in ES
    ; mov ax, 2587h ; AH - 25h, AL - number of interrupt
    ; mov dx, seg keyboard_handler    ; Segment address
    ; mov ds, dx                      ; to DS
    ; mov dx, offset keyboard_handler ; Offset to DX
    ; int 21h ; DOS interrupt
    ; ; Program
    ; ;
    ; ; Restore old handler
    ; lds dx, old_handler ; Segment address to DS and offset to DX
    ; mov ax, 2587h ; AH = 25h, AL - number of interrupt
    ; int 21h ; DOS interrupt

    ; IRQ1 or INT9 - keyboard
    ; IRQ12 or INT74 - mouse
    ; Save old handler
    mov ax, 3509h ; AH - 35h, AL - 09h - keyboard
    int 21h
    mov word ptr old_handler, bx
    mov word ptr old_handler+2, es
    ; Setup custom handler
    mov ax, 2509h ; AH - 25h, AL - 09h - keyboard
    mov dx, seg keyboard_handler
    mov ds, dx
    mov dx, offset keyboard_handler ; ds:dx - handler address
    int 21h
    ; Program
    ;
    ; Restore old handler
    ; mov ax, 2509h ; AH - 25h, AL - 09h - keyboard
    ; lds dx, word ptr old_handler+2
    ; mov ds, dx
    ; mov dx, word ptr cs:old_handler ; ds:dx - handler address
    ; int 21h
    ; ;
    ; call exit
start endp

keyboard_handler proc far
    ; Handler
    push ax
    xor ax, ax
    in al, 60h  ; read from port
    cmp al, 1ch ; enter key - source: https://wiki.osdev.org/PS/2_Keyboard#Scan_Code_Sets - Scan Code Set 1
    pop ax
    jne skip
    push ax
    xor ax, ax
    mov al, "Y"
    call println_text
    pop ax
    call exit

skip:
    pushf              ;
    call old_handler   ;
    ; or
    ; jmp dword ptr cs:old_handler ;
    iret ; popf + retf - end of handler
keyboard_handler endp

exit proc
    ; Restore old handler
    lds dx, old_handler ; Segment address to DS and offset to DX
    mov ax, 2509h ; AH = 25h, AL - 09h Keyboard
    int 21h ; DOS interrupt
    ;
    mov ax, 4C00h ; stop program
    int 21h ; dos interrupt
exit endp


end start