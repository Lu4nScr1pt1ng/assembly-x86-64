section .data
  text db "Hello, World!", 0xA
  msglen equ $ - text

section .text
  global _start

_start:
  mov rax, 1
  mov rdi, 1 
  mov rsi, text
  mov rdx, msglen 
  ; int 0x80 ;syscall
  syscall

  mov rax, 60
  mov rdi, 0
  syscall
