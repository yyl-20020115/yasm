section .text

global _start

_start:

	mov ecx, 10
skok:
	mov [licznik], ecx

	mov eax, 4
	mov ebx, 1
	mov ecx, znak
	mov edx, 1
	int 0x80
	
	mov eax, 4
	mov ebx, 1
	mov ecx, nl
	mov edx, 1
	int 0x80

	mov dx, 1
	add [znak], dx
	
	mov ecx, [licznik]

	loop skok

	mov eax, 1
	xor ebx, ebx
	int 0x80

section .data

licznik dd 0

znak db '0'
len equ $ - znak

nl db 0xa
