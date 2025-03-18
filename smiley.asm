; smiley.asm
; A minimal assembly program for macOS that prints an ASCII smiley.

global _start

section .data
msg db "   .-''''-.   ", 0xa
    db "  /        \  ", 0xa
    db " (  O    O  ) ", 0xa
    db " |          | ", 0xa
    db " | .-------. | ", 0xa
    db " | |       | | ", 0xa
    db " | '-------' | ", 0xa
    db "  \        /  ", 0xa
    db "   '-....-'   ", 0xa, 0
len equ $ - msg

section .text
_start:
    ; -----------------------------
    ; 1) Write the ASCII-art to stdout
    ; -----------------------------
    mov rax, 0x2000004    ; sys_write on macOS
    mov rdi, 1            ; file descriptor (stdout)
    mov rsi, msg          ; address of msg
    mov rdx, len          ; length of msg
    syscall

    ; -----------------------------
    ; 2) Exit with status 0
    ; -----------------------------
    mov rax, 0x2000001    ; sys_exit on macOS
    xor rdi, rdi          ; exit code 0
    syscall