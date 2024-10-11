.model small
.186
.stack 100h


.data
    msg db "Yes"
    msg1 db 'Hello'
    msg2 db 'World'
    msg3 db '!!!!!!!!!!'

    msg_curr dd ?
    msg_curr_len dw 3
    msg_len dw 3
    msg1_len dw 5
    msg2_len dw 5
    msg3_len dw 10

.code
include libs\io.asm
clearScreen proc
    mov ax, 0003h
    int 10h
    ret
clearScreen endp
start proc
    mov ax, @data
    mov ds, ax

    mov word ptr [msg_curr], offset msg
    push ax
    mov ax, msg_len
    mov msg_curr_len, ax
    pop ax

    call clearScreen
    ; Init
    mov ax, 0000h
    int 33h
    ; Show
    mov ax, 0001h
    int 33h
    ; Set position
    mov ax, 0004h
    mov cx, 0
    mov dx, 0
    int 33h
    ; Setup custom handler
    mov ax, 000Ch
    mov cx, 00101011b
    push cs
    pop es
    mov dx, offset mouse_handler
    int 33h

    mov ah, 0
    int 16h
    call exit
start endp

mouse_handler proc far ; dx, cx - coords
    push bx
    call clearScreen
    mov ax, 0001h
    int 33h

    push ds
    pop es


    mov ax, dx
    mov bl, 8
    idiv bl
    mov dh, al

    mov ax, cx
    mov bl, 8
    idiv bl
    mov dl, al

    mov ah, 13h
    mov al, 0
    mov bl, 00001111b
    mov cx, word ptr [msg_curr_len]
    mov bp, word ptr [msg_curr]
    int 10h


    ; Sound Effect
    pop bx
    cmp bx, 00000001b
    je left_click
    cmp bx, 00000010b
    je right_click
    cmp bx, 00000100b
    je middle_click
    jmp m_Exit


;ОБРАБОТКА ЛЕВОГО КЛИКА МЫШИ
left_click:
    mov word ptr [msg_curr], offset msg1
    push ax
    mov ax, msg1_len
    mov msg_curr_len, ax
    pop ax
    jmp m_Exit

;ОБРАБОТКА ПРАВОГО КЛИКА МЫШИ
right_click:
    mov word ptr [msg_curr], offset msg2
    push ax
    mov ax, msg2_len
    mov msg_curr_len, ax
    pop ax
    jmp m_Exit

;ОБРАБОТКА СРЕДНЕГО КЛИКА МЫШИ
middle_click:
    mov word ptr [msg_curr], offset msg3
    push ax
    mov ax, msg3_len
    mov msg_curr_len, ax
    pop ax
    mov di,1000 ; 1000 Герц    
	mov cx,18   ; 1 секунда    
	call sound
    jmp m_Exit

m_Exit:
    retf
mouse_handler endp

sound proc
    mov al,0B6h    
    out 43h,al    
    mov dx, 14h   ; freq=1331000 Hz    
    mov ax, 4f38h    
    div di    
    out 42h,al    
    mov al,ah    
    out 42h,al    
    in al,61h    
    mov ah,al    
    mov al, 61h    
    or al,3  ; speaker on    
    out 61h,al ; задержка звука    
    push es    
    push ax    
    mov  ax,0    
    mov  es,ax

wt0:   
    mov  ax,es:[46Ch] ; счётчик системного таймера (18 тиков в секунду)

wt1:   
    push ax    
    mov  ah,1 ; выход, если нажата клавиша    
    int 16h    
    jnz ex    
    pop  ax    
    cmp  ax,es:[46Ch]    
    jz   wt1    
    loop wt0    
    pop  ax    
    pop  es    
    mov al,ah    
    out 61h,al ; speaker off         
    ret
ex:
    mov al, 61h    
    out 61h,al ; speaker off    
    mov ah,0    
    int 16h  
    ret
sound endp



exit proc
    ;
    mov ax, 000Ch
    mov cx, 0000h
    int 33h
    ;

    mov ax, 0003h
    int 10h

    mov ax, 4C00h ; stop program
    int 21h ; dos interrupt
    ret
exit endp
end start