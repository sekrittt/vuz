from PIL import Image
import numpy as np
import os


def x(color: str, count: int) -> str:
    return color + str(count) + "-"


def form(name: str) -> str:
    pic = Image.open(name)
    thresh = 200

    fn = lambda x: 255 if x > thresh else 0

    pic = pic.convert("L").point(fn, mode="1")

    matrix = np.array(pic)
    matrix1: list[list[bool]] = matrix.tolist()

    pic = ""

    for i in matrix1:
        one_counter_status = True
        white_counter = 0
        black_counter = 0
        for j in i:
            if j:
                if black_counter != 0:
                    pic += x("b", black_counter)
                    black_counter = 0

                    one_counter_status = False

                white_counter += 1
            else:
                if white_counter != 0:
                    pic += x("w", white_counter)
                    white_counter = 0

                    one_counter_status = False

                black_counter += 1

        if one_counter_status:
            if white_counter > black_counter:
                pic += x("w", white_counter)
            else:
                pic += x("b", black_counter)

        else:
            if white_counter > black_counter:
                pic += x("w", white_counter)
            else:
                pic += x("b", black_counter)

        pic += "n-"

    return pic


def asm_build(s: str) -> str:
    BASE_START = """
.model small
.386
.stack 100h
.code
clearScreen proc
    mov ax, 0011h
    int 10h
clearScreen endp

delay proc ; 33 миллисекунды = 30 fps
    ; mov cx, 0fh
    ; mov dx, 4240h
    mov cx, 00h
    mov dx, 8235h
    mov ax, 8600h
    int 15h
    ret
delay endp

drawWhiteLine proc

    push ax
    push dx
    mov dx, ax ; y

    push cx
    mov cx, cx ; x

    mov bh, 0

    mov ah, 0Ch
    mov al, 1

    int 10h

    pop cx
    pop dx
    pop ax

    inc cx
    cmp cx, dx
    jna drawWhiteLine
    ret
drawWhiteLine endp

_wait proc
    mov ah, 01h ; Function 01h Read character from stdin with echo
    int 21h
    cmp al, 1Bh ; Check is Escape
    je exit
    jne _wait ; Continue read
    ret
_wait endp

exit proc
    mov ax, 0003h
    int 10h
    mov ax, 4C00h
    int 21h
exit endp

start proc
    mov ax, @data
    mov ds, ax

    call clearScreen

"""

    BASE_END = """
    jmp _wait
start endp

end start
"""
    return BASE_START + s + BASE_END


def asm_create(form: str) -> str:
    data = form.split("-")
    data.pop(len(data) - 1)

    old_x = 0
    x = 0
    y = 0

    code = ""

    for i in data:
        if i[0] == "n":
            y += 1
            old_x = 0
            x = 0

        elif i[0] == "w":
            x = int(i[1:])
            if abs(old_x - (x + old_x)) < 10 and old_x == 0:
                print(f"{old_x=}", f"{x+old_x=}")

            code += f"""
    mov ax, {y}
    mov cx, {old_x}
    mov dx, {x+old_x}
    call drawWhiteLine
"""
            old_x += x

        elif i[0] == "b":
            old_x += int(i[1:])

    frameText = (
        "call clearScreen\n"
        + code
        + """
    call delay
"""
    )

    return frameText


if __name__ == "__main__":
    # f = form("t.jpg")
    f = form("yTogR9yLc.png")
    # data: str = ""
    # j = 0
    # for i in sorted(os.listdir("./frames")):
    #     if j >= 320:
    #         break
    #     j += 1
    #     if j < 300:
    #         continue
    #     print(f'Processing frame "{i}"')
    #     f = form(os.path.join(".", "frames", i))
    #     data += f"; {i}\n" + asm_create(f)

    # print(f)
    data = asm_create(f)

    with open("smth.asm", "w", encoding="utf-8") as f:
        f.write(asm_build(data))
