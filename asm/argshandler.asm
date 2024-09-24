section .text
  global handleargs
  extern alloc
  extern printbuf

handleargs:
  ; set up stack frame
  push rbp
  mov rbp, rsp

  xor r11, r11
  xor r12, r12 ; pointer
  xor r13, r13 ; amount
  xor r14, r14 ; current value
  mov r15, 1

  ; save original ptr
  mov r12, rdi
  ; save original size
  mov r13, rsi
  ; skip values in registers
  sub r13, 4
  
  mov [args], rdx
  mov [args + 8], rcx
  mov [args + 16], r8
  mov [args + 24], r9

  mov r11, 1

  .main:
  mov r14, [args + 8 * r11 - 8]
  inc r11
  jmp .make_node

  xor r11, r11

  .stack_loop:
  cmp r13, r15
  jl .done
  mov qword r14, [rbp + 8 + 8 * r15] ; get values from stack
  inc r15
  jmp .make_node
  
  .done:
  mov rsp, rbp
  pop rbp
  ret

  .make_node:
  push r11
  mov rdi, 16
  call alloc
  mov qword [r12 + 8], rax
  mov r12, rax
  mov qword [r12], r14
  mov qword [r12 + 8], 0
  pop r11
  cmp r11, 5
  jne .main
  jmp .stack_loop

share_buffer:
  mov qword [r12], r14
  mov qword [r12 + 8], rdi
  mov r12, rdi
  add rdi, 8
  mov qword [r12 + 8], 0
  mov rax, rdi
  ret

section .bss
  args resb 1600
