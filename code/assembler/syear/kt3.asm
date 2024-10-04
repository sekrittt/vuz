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
    mov ax, offset msgANumber
    mov bx, offset aNumber
    call input

    mov ax, offset msgBNumber
    mov bx, offset bNumber
    call input

    mov ax, offset msgCNumber
    mov bx, offset cNumber
    call input

    mov si, offset aNumber + 2
    call string_to_number ; result in ax
    cmp ax, 0
    je a_is_zero
    push ax

    mov si, offset bNumber + 2
    call string_to_number
    cmp ax, 0
    je b_is_zero
    mov bx, ax

    mov si, offset cNumber + 2
    call string_to_number
    cmp ax, 0
    je c_is_zero
    mov cx, ax
    pop ax

    call calculate

a_is_zero:
    xor ax, ax
    mov ax, offset msgAShouldBeNEZero
    call println
    jmp continue

b_is_zero:
    xor ax, ax
    mov ax, offset msgBShouldBeNEZero
    call println
    jmp continue

c_is_zero:
    xor ax, ax
    mov ax, offset msgCShouldBeNEZero
    call println
    jmp continue

continue:
    mov ax, offset msgContinueQuestion
    mov bx, offset continueQuestionAnswer
    call input

    mov cl, continueQuestionAnswer + 2
    cmp cx, "n"
    jne main_loop

    pop dx ; restore dx
    call exit
main endp

; ax - 'a' number
; bx - 'b' number
; cx - 'c' number
calculate proc
    push ax ; save ax in stack
    push bx ; save bx in stack
    ; Squaring 'b' number
    mov ax, bx ; ax = bx
    imul bx ; ax = ax * bx ; may be ebx for 32 bit number
    mov bx, ax ; bx = bx * bx ; previouse line
    pop ax ; restore ax from stack

    push dx ; save dx because I don't know what's in it
    push ax

    mov dx, 4
    imul dx ; ax -> 'a' number ; ax * 4 = a * 4
    imul cx ; ax = a * 4 ; ax = a * 4 * cx ; cx -> c

    ; Now ax = 4ac -> (4 * ax * cx)

    sub ax, bx ; b^2 - 4ac = D -> ax = D
    mov dx, ax ; Now dx = ax = D
    cmp ax, 0
    je one_root ; D = 0
    jl zero_roots ; D < 0
    jg two_roots ; D > 0

one_root:
    pop bx
    pop ax
    call calcRoots ; Calculate roots ; ax - 'a', bx - 'b', dx - 'D' ; ax - first root, bx - second root
    push ax
    mov ax, offset msgResultRoot
    call println
    pop ax
    call print_int
    ret

two_roots:
    pop bx
    pop ax
    call calcRoots ; Calculate roots ; ax - 'a', bx - 'b', dx - 'D' ; ax - first root, bx - second root
    push ax
    mov ax, offset msgResultRoots
    call println
    pop ax
    call print_int
    mov ax, bx
    call print_int
    ret

zero_roots: ; No roots
    pop bx
    pop ax
    xor ax, ax
    mov ax, offset msgNoRoots
    call println
    ret
calculate endp

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

; Input: ax - 'a' number
; Input: bx - 'b' number
; Input: dx - D
; Output: ax - first root
; Output: bx - second root
calcRoots proc
    cmp dx, 0
    je calcRoots_skip

    push ax
    mov ax, dx
    call sqrt
    mov dx, ax
    pop ax

calcRoots_skip:
    neg bx ; -b
    push bx
    push dx
    ; first root
    add ax, ax ; 2a = a + a
    sub bx, dx ; b - sqrt(D)
    mov cx, bx ; cx = - b - sqrt(D)
    mov bx, ax ; bx = 2a
    xor eax, eax
    mov ax, cx ; ax = cx = - b - squrt(D)
    cwd
    push ax
    mov al, 'C'
    call println_text
    pop ax
    div bx    ; ax = (-b-sqrt(D)) / 2a
    mov cx, bx ; cx = 2a
    pop bx     ; restore -b
    pop dx
    push ax    ; Save first root in stack
    ; Second root
    mov ax, cx
    add bx, dx ; - b + sqrt(D)
    mov cx, bx ; cx = - b + sqrt(D)
    mov bx, ax ; bx = 2a
    mov ax, cx ; ax = cx = - b + squrt(D)
    cwd
    idiv bx    ; ax = (-b+sqrt(D)) / 2a
    mov bx, ax ; Save second root in bx
    pop ax     ; Restore first root from stack
    ret
calcRoots endp

exit proc
    mov ax, 4C00h
    int 21h
exit endp

end main