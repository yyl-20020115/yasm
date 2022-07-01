%include "asm_io.inc"    ;odpowiednik dyrektywy #include z C
segment .data

segment .text
global _asm_main
_asm_main:
enter 0,0         ; setup
pusha

;
; Właściwy kod wstawiamy tu.
; Nie należy modyfikować kodu przed i po tym komentarzu
;

popa
mov eax, 0 ; powrót do C
leave
ret