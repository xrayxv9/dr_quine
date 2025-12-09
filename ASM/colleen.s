section	.text

extern	printf
global	main

; My foo function
foo:
	push	rbp
	mov		rbp, rsp
	mov		rax, 1
	pop		rbp
	ret

main:
	;call	foo
	push	rbp
	mov		rbp, rsp
	call	foo
	mov		rdi, str
	mov		rsi, 10
	mov		rdx, 9
	mov		rcx, 34
	mov		r8, str
	call	printf wrt ..plt
	pop		rbp
	ret
section .note.GNU-stack

section .data
	str: db "section	.text%1$c%1$cextern	printf%1$cglobal	main%1$c%1$c; My foo function%1$cfoo:%1$c%2$cpush	rbp%1$c%2$cmov		rbp, rsp%1$c%2$cmov		rax, 1%1$c%2$cpop		rbp%1$c%2$cret%1$c%1$cmain:%1$c%2$c;call	foo%1$c%2$cpush	rbp%1$c%2$cmov		rbp, rsp%1$c%2$ccall	foo%1$c%2$cmov		rdi, str%1$c%2$cmov		rsi, 10%1$c%2$cmov		rdx, 9%1$c%2$cmov		rcx, 34%1$c%2$cmov		r8, str%1$c%2$ccall	printf wrt ..plt%1$c%2$cpop		rbp%1$c%2$cret%1$csection .note.GNU-stack%1$c%1$csection .data%1$c%2$cstr: db %3$c%4$s%3$c, 0%1$c", 0
