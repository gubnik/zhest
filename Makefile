CC=gcc
CC_FLAGS=-O1 -static

all: 

syscalls.a: asm/syscalls.asm
	nasm -f elf64 -o syscalls.a asm/syscalls.asm

list.a: src/list.c incl/list.h
	$(CC) $(CC_FLAGS) -nostdlib -o list.a -c src/list.c 

test: syscalls.a llalloc.a list.a test.c
	$(CC) $(CC_FLAGS) -c test.c -nostdlib -o main.a
	$(CC) $(CC_FLAGS) main.a list.a syscalls.a -o test

.PHONY: test all list.a llalloc.a syscalls.a
