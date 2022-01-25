bits 64

section .data
    message db 'Bonjour', 10
    good db 'good', 10
    error db 'error', 10
    value1 equ 50
    value2 equ 60

section .text
    global _start
    _start:
        mov rax, 1
        mov rdi, 1
        mov rsi, message
        mov rdx, 8
        syscall
        mov rax, value1
        mov rbx, value2
        add rbx, rax
        cmp rbx, 110
        je .exit
        jmp .exit_err


    .exit:
        mov rax, 1
        mov rdi, 1
        mov rsi, good
        mov rdx, 5
        syscall
        mov rax, 60
        mov rdi, 0
        syscall

    .exit_err:
        mov rax, 1
        mov rdi, 2
        mov rsi, error
        mov rdx, 6
        syscall
        mov rax, 60
        mov rdi, 1
        syscall