section .text

global _start

_start:
	mov cl, 10
skok:
	mov al, 4
	mov bl, 1
	push ecx
	mov ecx, text
	mov dl, len
	int 80h
	pop ecx
	loop skok

	mov al, 1
	xor ebx, ebx
	int 80h

section .data
	text db "text", 10, 0
	len equ $ - text
