;
; Lukasz Sliwa
; lukasz.sliwa@ii.uj.edu.pl
;
section .text
global _start

_start:
	mov eax, 4
	mov ebx, 1
	mov ecx, question
	mov edx, question_len
	int 80h

	mov eax, 3
	mov ebx, 0
	mov ecx, name
	mov edx, name_len
	int 80h

	mov eax, 4
	mov ebx, 1
	mov ecx, text
	mov edx, text_len
	int 80h

	mov eax, 4
	mov ebx, 1
	mov ecx, name
	mov edx, name_len
	int 80h

	mov eax, 1
	mov ebx, 0
	int 80h

section .data

	question db "Podaj swoje imie: "
	question_len equ $ - question

	name:	times 20 db 0
	name_len equ $ - name

	text db "Czesc "
	text_len equ $ - text

