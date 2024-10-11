.model tiny
.186
.stack 100h

.data
    ;

.code
include libs\fpu\s2f.asm
main proc near
    finit
main endp

exit proc
    mov ax, 4C00h ; stop program
    int 21h ; dos interrupt
exit endp

end main