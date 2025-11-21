global _start
; OfuscMandy - Linux x86_64
; Advanced polymorphic shellcode by Antonela E. Arenas

section .data
    message db "OFUSCMANDY", 10
    msglen  equ $ - message
    key db 0x42
    encrypted_msg times msglen db 0

section .text
_start:
    rdtsc
    xor eax, edx
    mov [key], al

    mov rcx, msglen
    lea rsi, [rel encrypted_msg]
    mov bl, [key]

decoder_loop:
    ; Advanced polymorphic mutations
    ror bl, 1
    add bl, 7
    xor bl, 0x5A
    rol bl, 2

    mov al, [rsi]
    xor al, bl
    mov [rsi], al

    inc rsi
    loop decoder_loop

    mov rax, 1
    mov rdi, 1
    lea rsi, [rel encrypted_msg]
    mov rdx, msglen
    syscall

    mov rax, 60
    xor rdi, rdi
    syscall
