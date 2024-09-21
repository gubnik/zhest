; llalloc.asm
section .text
global llalloc
global llfree

llalloc:
    ; syscall: mmap
    mov rax, 9          ; syscall number for mmap
    xor rdi, rdi        ; addr = NULL
    mov rsi, 8          ; length = size of Node (adjust as necessary)
    mov rdx, 3          ; prot = PROT_READ | PROT_WRITE
    mov r10, 34         ; flags = MAP_PRIVATE | MAP_ANONYMOUS
    xor r8, r8          ; fd = -1
    xor r9, r9          ; offset = 0
    syscall
    js .error           ; If negative, jump to error handling
    ret

.error:
  ; Write the message to stdout
    mov eax, 4           ; syscall number for sys_write
    mov ebx, 1           ; file descriptor 1 is stdout
    mov ecx, msg         ; pointer to message
    mov edx, 13          ; message length
    int 0x80             ; call kernel

    ; Exit the program
    mov eax, 1           ; syscall number for sys_exit
    xor ebx, ebx         ; exit code 0
    int 0x80             ; call kernel
    ret

llfree:
    ; syscall: munmap
    ; int munmap(void *addr, size_t length);
    mov rax, 11         ; syscall number for munmap
    mov rdi, rdi        ; addr = pointer to Node
    mov rsi, 16         ; length = size of Node (adjust as necessary)
    syscall
    ret

section .data
    msg db 'Fuck you!\n',
  
