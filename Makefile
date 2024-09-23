CC=gcc
CFLAGS=-O1 -static

all: syscalls.o list.o

syscalls.o: asm/syscalls.asm
	nasm -f elf64 -o syscalls.o asm/syscalls.asm

printbuf.o: asm/printbuf.asm
	nasm -f elf64 -o printbuf.o asm/printbuf.asm

list.o: src/list.c incl/list.h
	$(CC) $(CFLAGS) -nostdlib -o list.o -c src/list.c 

test: syscalls.o printbuf.o list.o test.c
	$(CC) $(CFLAGS) -c test.c -nostdlib -o main.o
	$(CC) $(CFLAGS) main.o list.o printbuf.o syscalls.o -o test

.PHONY: test all list.o llalloc.o syscalls.o
