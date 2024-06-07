; ax - placeholder
; bx - buffer
input proc

    mov dx, ax
    mov ah, 09h
    int 21h

    mov ah, 0Ah
    mov dx, bx
    int 21h

    mov dx, offset newLine
    mov ah, 09h
    int 21h

    ret
input endp

; ax - text
print proc
    mov dx, ax
    mov ah, 09h
    int 21h
    ret
print endp

; ax - text
println proc
    mov dx, ax
    mov ah, 09h
    int 21h
    mov dx, offset newLine
    mov ah, 09h
    int 21h
    ret
println endp