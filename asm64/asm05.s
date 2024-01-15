global _start
    _start:
        mul esi
        push rax
        mov rdi, "asm02"
        push rdi
        mov rdi, rsp
        mov al, 59
        syscall