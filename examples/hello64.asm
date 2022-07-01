
section .text

global _start

_start:
	mov	rax, 1
	mov	rdi, 1
	mov	rsi, tekst
	mov	rdx, dlugosc
	syscall

	mov	rax, 60
	syscall

section .data
	tekst 	db 	"Czesc", 0ah
	dlugosc equ 	$-tekst
