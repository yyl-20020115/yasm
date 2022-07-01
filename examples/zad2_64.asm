; Lukasz Sliwa
; lukasz.sliwa@ii.uj.edu.pl

section .text
global _start

_start:
	mov rax, 2		; sys_open
	mov rdi, filename	; nazwa pliku
	mov rsi, 200		; otwarcie do zapisu
	mov rdx, 200|400|40|20	; zapis i czytanie przez wlasciciela, czytanie i zapis przez grupe
	syscall

	mov rax, 2		; otworz pliku
	mov rdi, filename
	mov rsi, 1		; do zapisu
	mov rdx, 200|400|40|20	; z prawami
	syscall

	mov rdi, rax		; w rax jest deskryptor pliku
	mov rax, 1		; sys_write
	mov rsi, text
	mov rdx, text_len
	syscall

	mov rax, 3		; w rdi jest deskryptor pliku
	syscall

	mov rax, 60
	syscall


section .data
	filename db "./email.txt", 0
	text db "lukasz.sliwa@ii.uj.edu.pl", 0ah
	text_len equ $ - text
