section .data
  text db "Hello marilene", 10, 0
  text2 db "Vinho e sexo", 0xA, 0
  
section .text
  global _start

_start: 
  mov rax, text
  call _print

  mov rax, text2
  call _print



  ; mov rax, 1
  ; mov rdi, 1
  ; mov rsi, text
  ; mov rdx, 15
  ; syscall



;exit syscall
  mov rax, 60
  mov rdi, 0
  syscall

_print:
  push rax
  mov rbx, 0

_printCounterLoop:
  inc rax
  inc rbx
  mov cl, [rax]
  cmp cl, 0
  jne _printCounterLoop

  mov rax, 1
  mov rdi, 1
  pop rsi
  mov rdx, rbx
  syscall

  ret
