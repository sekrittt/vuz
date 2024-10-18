.model tiny
.386
.stack 100h

.data
    common_msg db 'Square levels', '$'
    msgContinueQuestion db "Continue? (y/n): ", "$"
    msgIncorectNumber db "Incorrect number!", "$"
    operand1 db 254, 0, 254 dup("$")
    operand2 db 254, 0, 254 dup("$")
    operand3 db 254, 0, 254 dup("$")
    continueQuestionAnswer db 254, 0, 254 dup("$")

    msg1 db 'No roots', '$'
    msg2 db 'X1 = $'
    msg3 db 'X2 = $'

    input_a db 'Operand a = $' ; ᮮ�饭�� ��� ����� �
    input_b db 'Operand b = $' ; ᮮ�饭�� ��� ����� b
    input_c db 'Operand c = $' ; ᮮ�饭�� ��� ����a c
    input_r db 'Result: $' ;

    a dd ?
    b dd ?
    c dd ?
    d dd ?
    x1 dd ?
    x2 dd ?


    aa dd ?
    bb dd ?
    sqrtd dd ?
    ten equ word ptr [bp-2] ; �����-� ॣ���� ��� �뢮��
    temp equ word ptr [bp-4] ; �� �����-� ॣ���� ��� �뢮��

.code
include libs\io.asm
include libs\fpu\io.asm
include libs\fpu\s2f.asm
main proc
    mov ax, @data
    mov ds, ax

    finit
    xor eax,eax ; ���㫥��� ॣ���஢
    xor edx,edx

main_loop:
    call clear_screen

    mov ax, offset common_msg
    call println

    mov ax, offset input_a
    mov bx, offset operand1
    call input

    mov si, offset operand1 + 2
    call string_to_float
    FSTP a ; ��⠫������ � �� �⥪� � ॣ���� �

    mov ax, offset input_b
    mov bx, offset operand2
    call input

    mov si, offset operand2 + 2
    call string_to_float
    FSTP b ; ��⠫������ � �� �⥪� � ॣ���� �

    mov ax, offset input_c
    mov bx, offset operand3
    call input

    mov si, offset operand3 + 2
    call string_to_float
    FSTP c ; ��⠫������ � �� �⥪� � ॣ���� �

    cmp a,0 ; �ࠢ����� a � �㫥�
    je nul

    fld [b] ; ����頥� � � �⥪
    fmul st(0),st(0) ; �������� � � ������
    FSTP bb ; ��⠫������ b^2 � bb
    fld [a] ; ..a..
    fmul [c] ; ..c*a..

    fadd st(0), st(0) ; ..2*c*a..
    fadd st(0), st(0) ; ..4*c*a..
    fld [bb] ; ����娢��� b^2 � ��� ..b^2.. ..4*c*a..
    fsub ; ..b^2-4*a*c.. ����⠫� ���ਬ�����, �� �������� �� �����誥 �⥪�
    fchs ; ���塞 ����, ����砥� ���ਬ����� � �ࠢ���� ������

    ftst ; �ࠢ����� � �㫥�
    fstsw ax ; �����㥬 ॣ���� ���ﭨ� SWR � ॣ���� AX
    sahf ; "�����㥬" 䫠�� C0, C2, C3 � ����訩 ���� ॣ���� EFLAGS/FLAGS

    jc j1 ; ���ਬ����� < 0
    jz j2 ; ���ਬ����� = 0

        ; D > 0
        ; X1 = (-b-sqrt(D))/(2*a)
        ; X2 = (-b+sqrt(D))/(2*a)

    ;���� ��७�
    fsqrt ; ..sqrt(d)..
    FSTP sqrtd ; ����頥� ��७� ���ਬ����� � ᮮ�ᢥ�����騩 ॣ����
    fld a ; ..a..
    fadd st(0), st(0) ; ..2*a..
    FSTP aa ; ����頥� 2*� � ॣ���� ��

    fld [b] ; ..b..
    fchs ; ..-b..
    fld sqrtd ; ��ᮢ뢠�� � �⥪ ��७� ���ਬ����� ..sqrt(d).. ..-b..
    fsub ; ..-b-sqrt(d)..

    fld aa ; ����頥� � �⥪ 2*a ..2*a.. ..-b-sqrt(d)..
    fdiv ; �����, ����砥� ���� ��७�
    fstp [x1] ; ��⠫������ ���� ��७� � ॣ����

    ; ��ன ��७�
    fld [b] ; ..b..
    fchs ; ..-b..
    fld sqrtd ; ��ᮢ뢠�� � �⥪ ��७� ���ਬ����� ..sqrt(d).. ..-b..
    fadd ; ..-b-sqrt(d)..

    fld aa ; ����頥� � �⥪ 2*a ..2*a.. ..-b+sqrt(d)..
    fdiv ; �����, ����砥� ��ன ��७�
    fstp [x2] ; ��⠫������ ��ன ��७� � ॣ����

    ;�뢮� ��୥�

    mov ax, offset input_r
    call println

    mov ax, offset msg2
    call print

    fld [x1];��⠢�塞 x1 � �⥪
    call print_float
    call print_newline

    mov ax, offset msg3
    call print

    fld [x2];��⠢�塞 x2 � �⥪
    call print_float
    call print_newline

    jmp main_exit

nul:
    cmp b,0 ; �ࠢ����� � '+'
    je j1

    fld [b] ; ����頥� � �⥪ b
    fld [c] ; ����頥� � �⥪ c
    fchs ; ���塞 ���� � c
    fdiv st(0), st(1)
    fstp [x1]

    mov ax, offset msg2
    call print

    fninit
    fld [x1]
    mov ax, 5
    push ax
    call print_float
    jmp main_exit

j1:

    mov ax, offset input_r
    call print

    mov ax, offset msg1
    call print

    jmp main_exit

j2:
    fld [b]
    fchs
    fld [a]
    fadd st(0),st(0)
    fdiv

    mov ax, offset msg2
    call print

    call print_float
main_exit:
    call print_newline
    mov ax, offset msgContinueQuestion
    mov bx, offset continueQuestionAnswer
    call input

    mov cl, continueQuestionAnswer + 2
    cmp cx, "n"
    jne main_loop

    mov ax, 4C00h
    int 21h
main endp

clear_screen proc
    mov ax, 0003h
    int 10h
    ret
clear_screen endp

end main