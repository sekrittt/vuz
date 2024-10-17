.model tiny
.386
.stack 100h

.data
    commonMsg db '�������� �� FPU', '$'
    exitMsg db '��� �த������� ������ Enter', '$'
    msgUnknownOperator db "��������� ������", "$"
    msgDivisionbyZero db "������� �� ����!", "$"
    msgOperators db "�롨�� ������ (+, -, *, /): ", "$"
    msgIncorectNumber db "���ࠢ��쭮� �᫮", "$"

    firstOperandMsg db '���� ���࠭� = ', '$' ; ᮮ�饭�� ��� ����� �
    secondOperandMsg db '��ன ���࠭� = ', '$' ; ᮮ�饭�� ��� ����� b
    resultMsg db '�������: ', '$' ;
    operand1 db 254, 0, 254 dup("$")
    operand2 db 254, 0, 254 dup("$")
    operator db 254, 0, 254 dup("$")

    firstOperand dd ?
    secondOperand dd ?
    result dd ?

    ten equ word ptr [bp-2] ; �����-� ॣ���� ��� �뢮��      ; for fpu-io lib
    temp equ word ptr [bp-4] ; �� �����-� ॣ���� ��� �뢮�� ; for fpu-io lib

.code
include libs\io.asm
include libs\fpu\s2f.asm
include libs\fpu\io.asm
main proc
    mov ax, @data
    mov ds, ax

    finit
    xor eax,eax ; ���㫥��� ॣ���஢
    xor edx,edx

    call clear_screen

    mov ax, offset commonMsg
    call println

    mov ax, offset firstOperandMsg
    mov bx, offset operand1
    call input
    ; call float_input;���� � � �⥪
    ; FSTP firstOperand ; ��⠫������ � �� �⥪� � ॣ���� �

    mov ax, offset secondOperandMsg
    mov bx, offset operand2
    call input
    ; call print
    ; call float_input ; ���� B � �⥪
    ; FSTP secondOperand ; ��⠫������ � �� �⥪� � ॣ���� �

    mov si, offset operand1 + 2
    call string_to_float
    FSTP firstOperand ; ��⠫������ � �� �⥪� � ॣ���� �

    fld [firstOperand]
    call print_float

    mov ax, 4C00h
    int 21h
main endp

clear_screen proc
    mov ax, 0003h
    int 10h
    ret
clear_screen endp

end main