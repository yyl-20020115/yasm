section .text
	global _start

_start:
	nop
s:
	mov edx, len
	mov ecx, msg
	mov ebx, 1
	mov eax, 4
	int 80h

	mov eax, 1
	xor ebx, ebx
	int 80h

section .data

msg db 'Hello world!', 0ah
len equ $ - msg
