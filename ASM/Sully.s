%define	O_WRONLY	1
%define	O_CREAT		0x40
%define	O_TRUNC		0x200
%define	X			5

section	.data
	filename:			db "Sully_", (X - 1) + '0', ".s", 0
	access_filename:	db "Sully_5.s", 0
	command_minus:		db "/usr/bin/nasm -f elf64 Sully_", (X - 1) + '0', ".s; /usr/bin/gcc Sully_", (X - 1) + '0', ".o; ./a.out", 0
	command:			db "/usr/bin/nasm -f elf64 Sully_", X + '0', ".s; /usr/bin/gcc Sully_", X + '0', ".o; ./a.out", 0
	str:				db "%%define	O_WRONLY	1%1$c%%define	O_CREAT		0x40%1$c%%define	O_TRUNC		0x200%1$c%%define	X			%5$d%1$c%1$csection	.data%1$c%2$cfilename:			db %4$cSully_%4$c, (X - 1) + '0', %4$c.s%4$c, 0%1$c%2$caccess_filename:	db %4$cSully_5.s%4$c, 0%1$c%2$ccommand_minus:		db %4$c/usr/bin/nasm -f elf64 Sully_%4$c, (X - 1) + '0', %4$c.s; /usr/bin/gcc Sully_%4$c, (X - 1) + '0', %4$c.o; ./a.out%4$c, 0%1$c%2$ccommand:			db %4$c/usr/bin/nasm -f elf64 Sully_%4$c, X + '0', %4$c.s; /usr/bin/gcc Sully_%4$c, X + '0', %4$c.o; ./a.out%4$c, 0%1$c%2$cstr:				db %4$c%3$s%4$c, 0%1$csection	.text%1$c%1$cextern	dprintf%1$cextern	open%1$cextern	close%1$cextern	system%1$cextern	access%1$cglobal	main%1$c%1$cmain:%1$c%2$cpush	rbp%1$c%2$cmov		rbp, rsp%1$c%1$c%2$cpush	r12%1$c%2$cpush	r13%1$c%2$cpush	r14%1$c%1$c%2$cmov		r14, X%1$c%2$csub		rsp, 8%1$c%2$clea		rdi, [rel access_filename]%1$c%2$cxor		rsi, rsi%1$c%2$ccall	access wrt ..plt%1$c%2$cjne		.file_doesnt_exit%1$c%2$clea		rdi, [rel filename]%1$c%2$clea		r12, [rel command_minus]%1$c.feur:%1$c%2$cmov		esi, O_CREAT | O_TRUNC | O_WRONLY%1$c%2$cmov		rdx, 0644o%1$c%2$cxor		rax, rax%1$c%2$ccall	open wrt ..plt%1$c%2$ccmp		rax, -1%1$c%2$cje		.exit%1$c%2$csub		rsp, 8%1$c%2$cmov		r13, rax%1$c%2$cmov		rdi, rax%1$c%2$cadd		rsp, 8%1$c%2$clea		rsi, [rel str]%1$c%2$cmov		rdx, 10%1$c%2$cmov		rcx, 9%1$c%2$clea		r8, [rel str]%1$c%2$cmov		r9, 34%1$c%2$csub		r14, 1%1$c%2$cpush	r14%1$c%2$cmov		rax, 1%1$c%2$ccall	dprintf wrt ..plt%1$c%2$cpop		r14%1$c%2$cadd		rsp, 8%1$c%2$ccmp		r14, 0%1$c%2$cje		.exit%1$c%2$clea		rdi, [rel command]%1$c%2$csub		rsp, 8%1$c%2$ccall	system wrt ..plt%1$c%2$cmov		rdi, r13%1$c%2$ccall	close wrt ..plt%1$c%2$cadd		rsp, 8%1$c.exit:%1$c%2$cpop		r14%1$c%2$cpop		r13%1$c%2$cpop		rbp%1$c%2$cret%1$c.file_doesnt_exit:%1$c%2$clea		rdi, [rel access_filename]%1$c%2$clea		r12, [rel command]%1$c%2$cjmp		.feur%1$c", 0
section	.text

extern	dprintf
extern	open
extern	close
extern	system
extern	access
global	main

main:
	push	rbp
	mov		rbp, rsp

	push	r12
	push	r13
	push	r14

	mov		r14, X
	sub		rsp, 8
	lea		rdi, [rel access_filename]
	xor		rsi, rsi
	call	access wrt ..plt
	jne		.file_doesnt_exit
	lea		rdi, [rel filename]
	lea		r12, [rel command_minus]
.feur:
	mov		esi, O_CREAT | O_TRUNC | O_WRONLY
	mov		rdx, 0644o
	xor		rax, rax
	call	open wrt ..plt
	mov		r13, rax
	mov		rdi, rax
	cmp		rax, -1
	je		.exit
	sub		r14, 1
	add		rsp, 8
	mov		rdi, rax
	lea		rsi, [rel str]
	mov		rdx, 10
	mov		rcx, 9
	lea		r8, [rel str]
	mov		r9, 34
	push	r14
	mov		rax, 1
	call	dprintf wrt ..plt
	pop		r14
	cmp		r14, 0
	je		.exit
	mov		rdi, r12
	sub		rsp, 8
	call	system wrt ..plt
	mov		rdi, r13
	call	close wrt ..plt
	add		rsp, 8
.exit:
	pop		r14
	pop		r13
	pop		r12
	pop		rbp
	ret
.file_doesnt_exit:
	lea		rdi, [rel access_filename]
	lea		r12, [rel command]
	jmp		.feur
