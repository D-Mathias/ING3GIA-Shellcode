section .data

message db "1337", 0
str1 db '42', 10
str1len equ $-str1

segment .bss
    input resd 1

section .text
global _start

_start: 
    mov rax, 0
    mov rdi, 0
    mov rsi, input
    mov rdx, str1len
    syscall


    lea rsi, [str1]
    lea rdi, [input]
    mov rcx, str1len
    rep cmpsb
    jne ifWrong

ifRight:
    mov edi, 1
    mov rsi, message
    mov rdx, 4
    mov eax, 1
    syscall
    mov rdi, 0
    jmp exit
ifWrong:
    mov rdi, 1
exit:
    mov rax, 60
    syscall
