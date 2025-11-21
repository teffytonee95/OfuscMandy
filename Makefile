all:
	@nasm -felf64 src/linux/OfuscMandy_linux.asm -o OfuscMandy_linux.o
	@ld OfuscMandy_linux.o -o OfuscMandy_linux

clean:
	rm -f OfuscMandy_linux.o OfuscMandy_linux
