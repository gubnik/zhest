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
  cmp rdi, 0
  je .invalid_size
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

.invalid_size:
  mov eax, 4
  mov ebx, 1
  mov ecx, invsz
  mov edx, 26
  int 0x80
  mov eax, 1
  xor ebx, ebx
  int 0x80
  ret

.mmap_fail:
  mov eax, 4
  mov ebx, 1
  mov ecx, memerr
  mov edx, 26
  int 0x80
  mov eax, 1
  xor ebx, ebx
  int 0x80
  ret

dealloc:
  mov rax, 11
  mov rdi, rdi
  mov rsi, rsi
  syscall
  ret

section .data
  alloc_size dq 0
  invsz db "Cannot allocate 0 bytes",
  memerr db "Mmap failed",
