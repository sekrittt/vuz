section .bss
    buffer resb 16

section .text
    global _start

_start:
    ; Read from console
    mov eax, 3
    mov ebx, 0
    lea ecx, [buffer]
    mov edx, 16
    int 0x80

    ; Convert string to number
    xor eax, eax
    lea esi, [buffer]

    mov eax, 4
    mov ebx, 1
    lea ecx, [buffer]
    mov edx, 13
    int 0x80

convert:
    movzx edx, byte [esi]
    cmp dl, 0x0A   ; newline character
    je done
    imul eax, 10
    sub edx, '0'
    add eax, edx
    inc esi
    jmp convert

done:
    ; Exit
    mov eax, 1
    xor ebx, ebx
    int 0x80