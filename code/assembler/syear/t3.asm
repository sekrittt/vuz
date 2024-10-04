.model small
.386
.stack 100h

.data
    msgANumber db "Enter 'a' number: ", "$"
    msgBNumber db "Enter 'b' number: ", "$"
    msgCNumber db "Enter 'c' number: ", "$"
    msgIncorectNumber db "Error! Incorrect number", "$"
    msgDivisionbyZero db "Error! Division by zero", "$"
    msgNoRoots db "No roots", "$"
    msgAShouldBeNEZero db "Error! 'a' number should be not equal 0!", "$"
    msgBShouldBeNEZero db "Error! 'b' number should be not equal 0!", "$"
    msgCShouldBeNEZero db "Error! 'c' number should be not equal 0!", "$"
    msgResultRoots db "Roots: ", "$"
    msgResultRoot db "Root: ", "$"
    msgContinueQuestion db "Continue (y/n): ", "$"
    newLine db 0Dh, 0Ah, "$"
    aNumber db 254, 0, 254 dup("$")
    bNumber db 254, 0, 254 dup("$")
    cNumber db 254, 0, 254 dup("$")
    continueQuestionAnswer db 254, 0, 254 dup("$")

.code
include libs\io.asm ; input-output lib
include libs\s2n.asm ; string to number lib
main proc
    mov ax, @data ;
    mov ds, ax

    mov ax, 0003h
    int 10h

main_loop:
    mov ax, 64
    call sqrt
    call print_int
    call exit
main endp

; Input: ax - number ; ax = n
; Output: ax - root
sqrt proc
    push bx
    push cx
    push dx
    push si
    xor dx, dx

    cmp ax, 0
    je sqrt_skip
    mov bx, ax ; bx = res
    mov cx, ax ; cx = n
    mov si, -1

sqrt_loop:
    add si, 1
    mov ax, cx ; restore
    cwd
    idiv bx ; ax = ax / bx = n / res
    add ax, bx ; res + (n / res)
    shr ax, 1 ; -> ax = ax / 2 = (res + (n / res)) / 2
    mov bx, ax ; bx = res
    mov ax, cx ; restore ax = n
    cwd
    idiv bx ; ax = ax / bx
    cmp ax, si
    jg sqrt_loop ; ax > dx
    mov ax, bx ; ax = bx = res

sqrt_skip:
    pop si
    pop dx
    pop cx
    pop bx
    ret
sqrt endp


exit proc
    mov ax, 4C00h
    int 21h
exit endp

end main