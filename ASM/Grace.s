section .text

extern	printf
extern	open
extern	dprintf
extern	close
global	_start

%define	O_WRONLY	1
%define	O_CREAT		0x40
%define	O_TRUNC		0x200

_start:
	push	rbp
	mov		rbp, rsp
	lea		rdi, [rel filename]
	mov		esi, O_WRONLY | O_CREAT | O_TRUNC
	mov		rdx, 0644o
	mov		rsi, O_CREAT 
	call	open
	mov		rdi, rax
	mov		rsi, str
	call	dprintf
	mov		rdi, rax
	call	close
	pop		rbp
	ret

section .data:
	filename: db "Grace_kid.s"
	str: db "coucou"

section .not.GNU-stack

