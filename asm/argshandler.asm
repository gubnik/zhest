section .text
  global handleargs
  extern alloc

handleargs:
  ; set up stack frame
  push rbp
  mov rbp, rsp

  xor r11, r11
  xor r12, r12 ; pointer
  xor r13, r13 ; amount
  xor r14, r14 ; current value
  mov r15, 1

  ; handle null pointer case
  cmp qword [rdi], 0
  jle .make_head
  jmp .body

  .body:

  ; save ptr
  mov r12, [rdi]
  ; save args amount
  mov r13, rsi
  ; skip 4 args for rdx, rcx, r8 and r9 registers
  sub r13, 4
  
  ; save arguments into an array to avoid them being corrupted
  mov [args], rdx
  mov [args + 8], rcx
  mov [args + 16], r8
  mov [args + 24], r9

  mov r11, 1

  ; going over arguments in an array and making nodes from them
  .main_loop:
  mov r14, [args + 8 * r11 - 8]
  inc r11
  jmp .make_node

  ; unreachable

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
  ; alloc 16 bytes for [stddata | aptr] struct
  mov rdi, 16
  call alloc
  mov qword [r12 + 8], rax
  mov r12, rax
  mov qword [r12], r14
  mov qword [r12 + 8], 0
  pop r11
  cmp r11, 5
  jne .main_loop
  jmp .stack_loop

  .make_head:
  push r8
  push r9
  push rcx
  push rdx
  push rsi
  push rdi
  mov rdi, 16
  call alloc
  pop rdi
  pop rsi
  mov qword [rax], rsi
  mov qword [rdi], rax
  pop rdx
  pop rcx
  pop r9
  pop r8
  jmp .body

section .bss
  args resb 32
