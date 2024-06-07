; ax - string
str2num proc
    mov si, ax
    cmp byte ptr [si], '-'

str2num endp

_loop proc
    mov cl, [si]
    cmp cl, 0dh

_loop endp

_loop_end proc

_loop_end endp