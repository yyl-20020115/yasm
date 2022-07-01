; Lukasz Sliwa
; lukasz.sliwa@ii.uj.edu.pl
section .text
global _start

_start:
	mov rax, 1
	mov rdi, 1
	mov rsi, question
	mov rdx, question_len
	syscall

	mov rax, 0
	mov rdi, 1
	mov rsi, name
	mov rdx, name_len
	syscall

	mov rax, 1
	mov rdi, 1
	mov rsi, text
	mov rdx, text_len
	syscall

	mov rax, 1
	mov rdi, 1
	mov rsi, name
	mov rdx, name_len
	syscall

	mov rax, 60
	syscall

section .data

	question db "Podaj swoje imie: "
	question_len equ $ - question

	name:	times 20 db 0
	name_len equ $ - name

	text db "Czesc "
	text_len equ $ - text

