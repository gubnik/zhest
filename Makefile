CC=gcc
CC_FLAGS=-O1 -static

all: 

llalloc.a: asm/llalloc.asm 
	nasm -f elf64 -o llalloc.a asm/llalloc.asm 

list.a: src/list.c headers/list.h
	$(CC) $(CC_FLAGS) -nostdlib -o list.a -c src/list.c 

test: llalloc.a list.a test.c
	$(CC) $(CC_FLAGS) -c test.c -nostdlib -o main.a
	$(CC) $(CC_FLAGS) main.a list.a llalloc.a -o test

.PHONY: test all list.a llalloc.a
