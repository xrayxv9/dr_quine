section .text

extern printf
global main

; My foo function
foo:
	mov rax, 1
	ret

main:
	;call foo
	call foo
	push str
	push 34
	push str
	push 34
	call printf
	add rsp, 32    ; nettoyer la pile (4 push × 8 bytes)
	mov eax, 0     ; code retour
	ret
section .note.GNU-stack

section .data
	str: db "section .text", 10, 10,  "extern printf", 10, "global main", 10, 10, "; My foo function", 10, "foo:", 10, 9, "mov rax, 1", 10, 9, "ret", 10, 10, "main:", 10, 9, ";call foo", 10, 9,"push str", 10, 9, "push 34", 10, 9, "push str", 10, 9, "push 34", 10, 9, "call printf", 10, 9, "ret", 10, "section .note.GNU-stack", 10, 10, "section .data", 10, 9, "str: db %s", 10, 0
