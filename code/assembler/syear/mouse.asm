.model small 
.stack 100h     ;стек размером 256 бай

.data
    msg1 db 'Hello$', 0
    msg2 db 'World$', 0
    msg3 db '!!!!$', 0
    prompt db 'Click on the left, right or middle mouse button. $' 
    new1 db 0Dh, 0Ah, ' $'  
    new2 db ' $'   
    prev_button db 0           ;хранение последней нажатой кнопки мыши

.code

main proc
    mov ax, @data
    mov ds, ax

    ;ИНИЦИАЛИЗАЦИЯ МЫШИ 
    mov ax, 0
    int 33h

    ;ПЕЧАТЬ ПРИГЛАШЕНИЯ
    mov dx, offset prompt
    mov ah, 9
    int 21h
    mov dx, offset new1
    mov ah, 9
    int 21h

main_1:
    ;ПРОВЕРКА, нажата ли клавиша Enter
    mov ah, 1
    int 16h
    jz mouse

    cmp al, 13              ;код клавиши Enter
    je exit

mouse:
    ;ПОЛУЧЕНИЕ состояния кнопок мыши
    mov ax, 3
    int 33h

    ;ПРОВЕРКА состояния кнопок
    cmp bx, 1               ;левая кнопка
    je left_click

    cmp bx, 2               ;правая кнопка
    je right_click

    cmp bx, 4               ;средняя кнопка
    je middle_click

    jmp check             

;ПРОВЕРКА ОТПУСКАНИЯ КНОПОК
check:
    cmp bx, 0  
    jne main_1               ;если нажата, продолжаем цикл
    mov prev_button, 0       ;если не нажата, сбрасываем состояние кнопки
    jmp main_1               ;переход в основной цикл

;ОБРАБОТКА ЛЕВОГО КЛИКА МЫШИ
left_click:
    cmp prev_button, 1
    je main_1  
    mov prev_button, 1
    mov dx, offset msg1
    jmp print

;ОБРАБОТКА ПРАВОГО КЛИКА МЫШИ
right_click:
    cmp prev_button, 2
    je main_1  
    mov prev_button, 2
    mov dx, offset msg2
    jmp print

;ОБРАБОТКА СРЕДНЕГО КЛИКА МЫШИ
middle_click:
    cmp prev_button, 4
    je main_1 
    mov prev_button, 4
    mov di,1000 ; 1000 Герц     
	mov cx,18   ; 1 секунда     
	call sound 
    mov dx, offset msg3
    jmp print

;ПЕЧАТЬ СООБЩЕНИЯ
print:
    mov ah, 9
    int 21h
    mov dx, offset new2
    mov ah, 9
    int 21h
    jmp main_1

exit:
    mov ax, 4c00h
    int 21h

sound:   
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
retf

main endp
end main