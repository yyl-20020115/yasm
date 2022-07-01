section .data

tekst db "Hello World", 0ah
dlugosc equ $ - tekst

section .text
global _start

_start
	mov eax, 4
	mov ebx, 1
	mov ecx, tekst
	mov edx, dlugosc
	int 80h
	mov eax, 1
	int 80h
