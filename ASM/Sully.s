
section .data
	filename: db "Sully_%d.s", 0
	command: db "cc %s; ./a.out", 0
	filename_size equ 16

section .text

extern sprintf
extern dprintf
extern open
extern close
extern exit
global _start

_start:
	push	rbp
	mov		rbp, rsp
	push	r15
	mov		r15, 5
	cmp		r15, -1
	jle		.exit
	sub		rsp, filename_size + 8
	lea		rdi, [rsp]
	lea		rsi, [rel filename]
	mov		rdx, r15
	xor		rax, rax
	call	sprintf
	add		rsp, filename_size
.exit:
	pop		r15
	pop		rbp
	xor		rdi, rdi
	call	exit
