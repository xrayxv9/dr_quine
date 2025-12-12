section	.data
	filename:		db "Sully_%d.s", 0
	command:		db "cc %s; ./a.out", 0
	str:			db "section	.data%1$c%2$cfilename:		db %4$cSully_%5$cd.s, 0%1$c%2$ccommand: db		%4$ccc %5$cs; ./a.out%4$c, 0%1$c%2$cstr: db			%4$c%3$c%4$c%1$c%2$cfilename_size	equ 24%1$c%2$ccommand_size	equ 24%1$c%1$csection .text%1$c%1$cextern	sprintf%1$cextern	dprintf%1$cextern	close%1$cextern	exit%1$cextern	system%1$cglobal	main%1$c%5$cdefine O_WRONLY	1%1$c%5$cdefine O_CREAT		0x40%1$c%5$cdefine O_TRUNC		0x200%1$c%1$cmain:%1$c%2$cpush	rbp%1$c%2$cmov		rbp, rsp%1$c%1$c%2$cpush r12%1$c%2$cpush	r13%1$c%2$cpush	r14%1$c%1$c%2$cmov		r14, %6$d%1$c%2$ccmp		r14, -1%1$c%2$cjle		.exit%1$c%2$csub		rsp, filename_size%1$c%2$clea		rdi, [rsp]%1$c%2$clea		rsi, [rel filename]%1$c%2$cmov		rdx, r14%1$c%2$cxor		rax, rax%1$c%2$ccall	sprintf wrt ..plt%1$c%2$csub		rdi, 9%1$c%2$cmov		r12, rdi%1$c%2$cmov		rsi, O_CREAT | O_WRONLY | O_TRUNC%1$c%2$cmov		rcx, 0644o%1$c%2$ccall	open wrt ..plt%1$c%2$ccmp		rax, -1%1$c%2$cje		.exit_file%1$c%2$cmov		r13, rax%1$c%2$cmov		rdi, rax%1$c%2$clea		rsi, [rel str]%1$c%2$cmov		rdx, 10%1$c%2$cmov		rcx, 9%1$c%2$cmov		r9, 34%1$c%2$cpush	37%1$c%2$csub		r14, 1%1$c%2$cpush	r14%1$c%2$cmov		rax, 2%1$c%2$ccall	dprintf wrt ..plt%1$c%2$csub		rsp, command_size%1$c%2$clea		rdi, [rsp]%1$c%2$clea		rsi, [rel command]%1$c%2$cmov		rdx, r12%1$c%2$cxor		rax, rax%1$c%2$ccall	sprintf wrt ..plt%1$c%2$cadd		rsi, command_size%1$c%2$ccall	system wrt ..plt%1$c%2$cmov		rdi, r12%1$c%2$ccall	close wrt ..plt%1$c.exit_file:%1$c%2$cadd		rsp, filename_size%1$c.exit:%1$c%2$cpop		r14%1$c%2$cpop		r13%1$c%2$cpop		r12%1$c%2$cpop		rbp%1$c%2$cret"
	filename_size	equ 24
	command_size	equ 32

section .text

extern	sprintf
extern	dprintf
extern	open
extern	close
extern	exit
extern	system
global	main

%define O_WRONLY	1
%define O_CREAT		0x40
%define O_TRUNC		0x200

main:
	push	rbp
	mov		rbp, rsp

	push	r12
	push	r13
	push	r14

	mov		r14, 5
	cmp		r14, -1
	jle		.exit
	sub		rsp, filename_size
	lea		rdi, [rsp]
	lea		rsi, [rel filename]
	mov		rdx, r14
	xor		rax, rax
	call	sprintf wrt ..plt
	sub		rdi, 9
	mov		r12, rdi
	mov		rsi, O_CREAT | O_WRONLY | O_TRUNC 
	mov		rcx, 0644o
	call	open wrt ..plt
	cmp		rax, -1
	je		.exit_file
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
	sub		rsp, command_size
	lea		rdi, [rsp]
	lea		rsi, [rel command]
	mov		rdx, r12
	xor		rax, rax
	call	sprintf wrt ..plt
	add		rsi, command_size
	call	system wrt ..plt
	mov		rdi, r13
	call	close wrt ..plt
.exit_file:
	add		rsp, filename_size
.exit:
	pop		r14
	pop		r13
	pop		r12
	pop		rbp
	ret
