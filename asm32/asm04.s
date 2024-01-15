global _start

section .bss
    buf resb 16

section .text

_start:
    mov eax, 3
    mov ebx, 0
    mov ecx, buf
    mov edx, 16
    int 0x80

    mov ecx, 16
.loop:
    mov al, [buf + ecx]
    je check_if_pair
    dec ecx
    cmp ecx, 0
    je end
    jmp .loop

check_if_pair:
    mov eax, buf
    add eax, ecx
    dec eax
    mov bl, [eax]
    and bl, 1

end: 
    mov eax, 1
    int 0x80