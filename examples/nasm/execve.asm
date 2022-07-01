section .text
global _start

_start:
	mov eax, 11
	mov ebx, path
	mov ecx, 0
	mov edx, 0
	int 80h
	
	mov eax, 1
	mov ebx, 0
	int 80h

section .data
	path db "/bin/sh", 0
