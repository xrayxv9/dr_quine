section	.text

extern	printf
extern	exit
global	main

;My main
main:
	push	rbp
	mov		rbp, rsp
	lea		rdi, [rel str]
	mov		rsi, 10
	mov		rdx, 9
	mov		rcx, 34
	lea		r8, [rel str]
	xor		rax, rax
	call	printf wrt ..plt
	;call	exit
	call	_exit
_exit:
	pop		rbp
	xor		edi, edi
	call	exit wrt ..plt
section .note.GNU-stack

section .data
	str: db "section	.text%1$c%1$cextern	printf%1$cextern	exit%1$cglobal	main%1$c%1$c;My main%1$cmain:%1$c%2$cpush	rbp%1$c%2$cmov		rbp, rsp%1$c%2$clea		rdi, [rel str]%1$c%2$cmov		rsi, 10%1$c%2$cmov		rdx, 9%1$c%2$cmov		rcx, 34%1$c%2$clea		r8, [rel str]%1$c%2$cxor		rax, rax%1$c%2$ccall	printf wrt ..plt%1$c%2$c;call	exit%1$c%2$ccall	_exit%1$c_exit:%1$c%2$cpop		rbp%1$c%2$cxor		edi, edi%1$c%2$ccall	exit wrt ..plt%1$csection .note.GNU-stack%1$c%1$csection .data%1$c%2$cstr: db %3$c%4$s%3$c, 0%1$c", 0
