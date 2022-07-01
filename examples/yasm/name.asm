section .text
global _start

_start:

	mov eax, 4
	mov ebx, 1
	mov ecx, pytanie
	mov edx, pytanie_l
	int 0x80

	mov eax, 3
	mov ebx, 0
	mov ecx, imie
	mov edx, imie_l
	int 0x80

	mov eax, 4
	mov ebx, 1
	mov ecx, witaj
	mov edx, witaj_l
	int 0x80

	mov eax, 4
	mov ebx, 1
	mov ecx, imie
	mov edx, imie_l
	int 0x80

	mov eax, 1
	xor ebx, ebx
	int 0x80

section .data
pytanie db "Jak masz na imie? "
pytanie_l equ $ - pytanie

imie: times 20 db 0
imie_l equ $ - imie

witaj db "Witaj "
witaj_l equ $ - witaj

