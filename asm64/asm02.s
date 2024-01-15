section .data
    message db "1337", 0

section .text
    global _start

_start:
    mov edi, 1
    mov rsi, message
    mov rdx, 4
    mov eax, 1
    syscall

    mov eax, 60
    xor rdi, rdi
    syscall 