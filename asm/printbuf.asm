section .text
  global printbuf

printbuf:
  test rdi, rdi
  jz .done
  mov rsi, rdi
  xor rcx, rcx

  .len:
  cmp byte [rsi + rcx], 0
  je .write
  inc rcx
  jmp .len
  
  .write:
  mov rax, 1
  mov rdi, 1
  mov rdx, rcx
  syscall
  
  .done:
  ret
