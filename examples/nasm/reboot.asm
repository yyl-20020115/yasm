section .text

global _start

_start:
	mov eax, 88
	mov ebx, 0FEE1DEADh
	mov ecx, 672274793
	mov edx, 01234567
	int 80h

	mov eax, 1
	mov ebx, 0
	int 80h
