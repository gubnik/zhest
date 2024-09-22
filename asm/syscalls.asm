section .text
  global sysexit
  global alloc
  global dealloc

sysexit:
  mov rax, 60
  mov rdi, rdi
  syscall
  ret

alloc:
  ; exit if alloc size is 0
  cmp rdi, 0
  je .mmap_fail
  mov rax, rdi
  mov [alloc_size], rax
  xor rdi, rdi
  mov rsi, [alloc_size]
  mov rdx, 3
  mov r10, 34
  xor r8, r8
  xor r9, r9
  ; mmap syscall
  mov rax, 9
  syscall
  js .mmap_fail
  ret
  .mmap_fail:
  mov rax, 0
  ret

dealloc:
  mov rax, 11
  mov rdi, rdi
  mov rsi, rsi
  syscall
  ret

section .data
  alloc_size dq 0
