section .text
  global printbuf
  global charout

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

charout:
  push rdi
  mov rsi, rsp
  mov rax, 1
  mov rdi, 1
  mov rdx, 1
  ; не работает блять
  syscall
  add rsp, 8
  ret
