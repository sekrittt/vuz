.model small
.stack 100h

.data
    msgANumber db "Enter 'a' number: ", "$"
    msgBNumber db "Enter 'b' number: ", "$"
    msgCNumber db "Enter 'c' number: ", "$"
    msgIncorectNumber db "Incorrect number", "$"
    msgDivisionbyZero db "Division by zero", "$"
    msgNoRoots db "No roots", "$"
    msgAShouldBeMoreZero db "'a' number should be more 0"
    msgBShouldBeMoreZero db "'b' number should be more 0"
    msgCShouldBeMoreZero db "'c' number should be more 0"
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
    mov bx, ax

    mov si, offset cNumber + 2
    call string_to_number
    mov cx, ax
    pop ax

    call calculate

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
    ret

two_roots:
    pop bx
    pop ax
    call calcRoots ; Calculate roots
    ret

zero_roots: ; No roots
    pop bx
    pop ax
    xor ax, ax
    mov ax, offset msgNoRoots
    call println
    ret

a_is_zero:
    xor ax, ax
    mov ax, offset msgAShouldBeMoreZero
    call println
    ret

b_is_zero:
    xor ax, ax
    mov ax, offset msgBShouldBeMoreZero
    call println
    ret

c_is_zero:
    xor ax, ax
    mov ax, offset msgCShouldBeMoreZero
    call println
    ret
calculate endp

; Input: ax - number
; Output: ax - root
sqrt proc
    push bx
    push cx
    push dx

    cmp ax, 0
    je sqrt_skip
    mov bx, ax ; bx = res
    mov cx, ax ; cx = n
    mov dx, -1

sqrt_loop:
    cwd
    inc dx
    mov ax, cx ; restore
    idiv bx ; ax = ax / bx
    add ax, bx
    ; idiv dx ; ax = ax / 2
    shr ax, 1 ; -> ax = ax / 2
    mov bx, ax
    mov ax, cx ; restore ax = n
    idiv bx ; ax = ax / bx
    cmp ax, dx
    jg sqrt_loop
    mov ax, bx ; ax = bx = res

sqrt_skip:
    pop dx
    pop cx
    pop bx
    ret
sqrt endp

; ax - 'a' number
; bx - 'b' number
; dx - D
calcRoots proc

    ret
calcRoots endp

; ax - first number
; bx - second number
_add proc
    add ax, bx
    call print_int
    jmp continue
_add endp

; ax - first number
; bx - second number
_sub proc
    sub ax, bx
    call print_int
    jmp continue
_sub endp

; ax - first number
; bx - second number
_mul proc
    imul bx ; ax = ax * bx
    call print_int
    jmp continue
_mul endp

; ax - first number
; bx - second number
_div proc
    cmp bx, 0
    je _div_division_by_zero

    cwd ; заполним DX знаковым битом из AX
    idiv bx
    call print_int

    jmp continue
_div_division_by_zero:
    mov ax, offset msgDivisionbyZero
    call println
    jmp continue
_div endp

exit proc
    mov ax, 4C00h
    int 21h
exit endp

end main