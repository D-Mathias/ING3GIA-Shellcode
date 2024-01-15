section .data
    prompt db "Rentrez un nombre : ", 0
    pair db "Pair", 0
    impair db "Impair.", 0

section .text
    global _start

_start:
    mov edx, 19
    mov ecx, prompt
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, num
    mov edx, 64
    int 0x80

    mov rax, [num]
    and rax, 1
    jz ispair

    mov edx, 21
    mov ecx, impair
    mov ebx, 1
    mov eax, 4
    int 0x80

    jmp fin

ispair:
    mov edx, 19
    mov ecx, pair
    mov ebx, 1
    mov eax, 4
    int 0x80

fin:
    mov eax, 1
    xor ebx, ebx
    int 0x80

section .bss
    num resq 1