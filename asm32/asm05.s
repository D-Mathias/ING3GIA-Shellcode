section .text
    global _start
_start:
   
shellcode:
    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx
    xor edx, edx
    mov al, 11

    push ebx
    push `2`
    push `asm0`

    mov ebx, esp
    int 0x80

    mov al, 1
    xor ebx, ebx
    int 0x80
