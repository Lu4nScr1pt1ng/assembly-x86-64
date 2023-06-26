section .data
  ;0xA = 10, breakline
  text db "Hello, World!", 0xA, 0
  text2 db "World?", 0xA, 0
  ;0 is used to know when the string end 

  msglen equ $ - text

section .text
  global _start

_start:
  mov rax, text
  call _print

  mov rax, text2
  call _print


  ;mov rdi, 1 
  ;mov rsi, text
  ;mov rdx, msglen 
  ; int 0x80 ;syscall
  ;syscall

  mov rax, 60
  mov rdi, 0
  syscall

;input: rax as pointer to string
;output: print string at rax
_print:
    push rax
    mov rbx, 0

_printLoop:
  inc rax
  inc rbx
  mov cl, [rax]
  cmp cl, 0
  jne _printLoop

  mov rax, 1
  mov rdi, 1
  pop rsi
  mov rdx, rbx
  syscall

  ret


