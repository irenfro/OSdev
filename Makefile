all: bootloader kernelNoLink link iso

bootloader: boot.asm
	nasm -felf32 -o boot.o boot.asm

kernelNoLink: kernel.c
	i686-elf-gcc -c kernel.c -o kernel.o -std=gnu99 -ffreestanding -O2 -Wall -Werror 

link: boot.o kernel.o linker.ld
	i686-elf-gcc -T linker.ld -o myos.bin -ffreestanding -O2 -nostdlib boot.o kernel.o

iso: myos.bin
	cp myos.bin isodir/boot/myos.bin; grub-mkrescue -o myos.iso isodir

clean:
	rm *.o *.bin *.iso isodir/boot/*.bin
