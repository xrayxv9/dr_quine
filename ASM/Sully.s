%define	O_WRONLY	1
%define	O_CREAT		0x40
%define	O_TRUNC		0x200
%define	X			5

section	.data
	filename:		db "Sully_", X + '0', ".s", 0
	command:		db "nasm -f elf64 Sully_", X + '0', ".s; gcc Sully_", X + '0', ".o; /a.out", 0
	str:			db "%5$cdefine	O_WRONLY	1%1$c%5$cdefine	O_CREAT		0x40%1$c%5$c	O_TRUNC		0x200%1$c%5$cdefine	X			%6$c%1$c%1$csection	.data%1$c%2$cfilename:		db %4$cSully_%4$c, X + '0', %4$c.s%4$c, 0%1$c%2$ccommand:		db %4$cnasm -f elf64 Sully_%4$c, X + '0', %4$c.s; gcc Sully_%4$c, X + '0', %4$c.o; ./a.out%4$c, 0%1$c%2$cstr:			%4$c%3$c%4$c%1$c%1$csection	%1$c%1$c%2$cextern	dprintf%1$cextern	open%1$cextern	close%1$cextern	exit%1$cextern	system%1$cglobal	main%1$c%1$cmain:%1$c%2$cpush	rbp%1$c%2$cmov		rbp, rsp%1$c%1$c%2$cpush	r13%1$c%2$cpush	r14%1$c%1$c%2$cmov		r14, X%1$c%2$ccmp		r14, -1%1$c%2$cjle		.exit%1$c%2$clea		[rdi, rel filename]%1$c%2$cmov		esi, O_CREAT | O_WRONLY | O_TRUNC%1$c%2$cmov		rdx, 0644o%1$c%2$cxor		rax, rax%1$c%2$ccall	open wrt ..plt%1$c%2$ccmp		rax, -1%1$c%2$cje		.exit%1$c%2$cmov		r13, rax%1$c%2$cmov		rdi, rax%1$c%2$clea		rsi, [rel str]%1$c%2$cmov		rdx, 10%1$c%2$cmov		rcx, 9%1$c%2$clea		r8, [rel str]%1$c%2$cmov		r9, 34%1$c%2$cpush	37%1$c%2$csub		r14, 1%1$c%2$cpush	r14%1$c%2$cmov		rax, 2%1$c%2$ccall	dprintf wrt ..plt%1$c%2$clea		rdi, [rel command]%1$c%2$ccall	system wrt ..plt%1$c%2$cmov		rdi, r13%1$c%2$csub		rsi, 8%1$c%2$ccall	close wrt ..plt%1$c%2$cadd		rsi, 8%1$c.exit:%1$c%2$cpop		r14%1$c%2$cpop		r13%1$c%2$cpop		rbp%1$c%2$cret"

section	.text

extern	dprintf
extern	open
extern	close
extern	exit
extern	system
global	main

main:
	push	rbp
	mov		rbp, rsp

	push	r13
	push	r14

	mov		r14, X
	cmp		r14, -1
	jle		.exit
	lea		rdi, [rel filename]
	mov		esi, O_CREAT | O_WRONLY | O_TRUNC 
	mov		rdx, 0644o
	xor		rax, rax
	call	open wrt ..plt
	cmp		rax, -1
	je		.exit
	mov		r13, rax
	mov		rdi, rax
	lea		rsi, [rel str]
	mov		rdx, 10
	mov		rcx, 9
	lea		r8, [rel str]
	mov		r9, 34
	push	37
	sub		r14, 1
	push	r14
	mov		rax, 2
	call	dprintf wrt ..plt
	lea		rdi, [rel command]
	call	system wrt ..plt
	mov		rdi, r13
	sub		rsi, 8
	call	close wrt ..plt
	add		rsi, 8
.exit:
	pop		r14
	pop		r13
	pop		rbp
	ret
