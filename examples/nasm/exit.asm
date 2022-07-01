section .text

global _start:

_start:
	mov al, 1
	mov bx, 333
	int 80h

