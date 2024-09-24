CC=gcc
CFLAGS=-O1 -static

all: syscalls.o list.o

syscalls.o: asm/syscalls.asm
	nasm -f elf64 -o syscalls.o asm/syscalls.asm

printbuf.o: asm/printbuf.asm
	nasm -f elf64 -o printbuf.o asm/printbuf.asm

argshandler.o: asm/argshandler.asm
	@#@echo "Not implemented" 
	nasm -f elf64 -o argshandler.o asm/argshandler.asm

list.o: src/list.c incl/list.h
	$(CC) $(CFLAGS) -nostdlib -o list.o -c src/list.c 

format.o: #src/format.c incl/format.h
	@echo "Not implemented" 
	@#$(CC) $(CFLAGS) -o format.o -c src/format.c 

test: syscalls.o argshandler.o printbuf.o list.o test.c
	$(CC) $(CFLAGS) -c test.c -nostdlib -o main.o
	$(CC) $(CFLAGS) main.o list.o printbuf.o argshandler.o syscalls.o -o test

.PHONY: test all list.o format.o argshandler.o syscalls.o
