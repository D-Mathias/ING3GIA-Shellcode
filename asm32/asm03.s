section .data

message db "1337", 0
secret db '42',0
secretlen equ $-secret

section .bss
    input resd 1

section .text
global _start

_start:
    mov eax,3
    mov ebx, 0
    mov ecx, input
    mov edx, 2
    int 0x80

    lea esi, [input]
    lea edi, [secret]
    mov ecx, secretlen
    rep cmpsb
    mov eax, 4
    mov ebx, 1
    jne ifWrong

ifRight:
    mov eax, 4
    mov ebx, 1
    mov ecx, message
    mov edx, 4
    int 0x80
    mov ebx, 0
    jmp exit
ifWrong:
    mov ebx, 1
exit:
    mov eax, 1
    int 0x80