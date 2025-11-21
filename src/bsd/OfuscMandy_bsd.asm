global _start
; OfuscMandy - BSD x86_64
; Advanced polymorphic shellcode by Antonela E. Arenas

section .text
_start:
    ; polymorphic stub placeholder (BSD syscalls differ)
    mov rax, 4      ; write syscall on BSD
    mov rdi, 1
    lea rsi, [rel msg]
    mov rdx, msglen
    syscall

    mov rax, 1
    xor rdi, rdi
    syscall

section .data
    msg db "OFUSCMANDY BSD", 10
    msglen equ $ - msg
