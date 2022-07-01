section .text
global _start

_start
	mov rax, 4
	mov rbx, 1
	mov ecx, pytanie
	mov edx, pytanie_dlugosc
	syscall

	mov rax, 3
	mov rbx, 0
	mov rcx, imie
	mov rdx, imie_dlugosc
	syscall

	mov rax, 4
	mov rbx, 1
	mov rcx, czesc
	mov rdx, czesc_dlugosc
	syscall

	mov rax, 4
	mov ebx, 1
	mov ecx, imie
	mov edx, imie_dlugosc
	syscall

	mov rax, 1
	xor rbx, rbx
	syscall

section .data

pytanie 		db 	"Jak masz na imie?"
pytanie_dlugosc		equ	$ - pytanie

imie:			times	20 	db	0
imie_dlugosc		equ	$ - imie

czesc			db	"Witaj "
czesc_dlugosc		equ	$ - czesc

