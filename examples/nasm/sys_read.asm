section .text
global _start:

_start:
	mov eax, 3
	mov ebx, 0
	mov ecx, text
	mov edx, len
	int 80h

	mov eax, 4
	int 80h

	mov eax, 1
	int 80h
section .data
	text db 0
	len equ 10
