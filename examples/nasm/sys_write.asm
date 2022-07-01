section .text
global _start

_start:
	mov eax, 4
	mov ebx, 1
	mov ecx, tekst
	mov edx, len
	int 80h

	mov eax, 1
	int 80h

section .data
	tekst dd 'tekst', 0ah
	len equ $ - tekst
