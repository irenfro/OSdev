all: bootloader

bootloader: boot.asm
	nasm -felf32 -o boot.o boot.asm
