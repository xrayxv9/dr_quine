%define	O_WRONLY	1
%define	O_CREAT		0x40
%define	O_TRUNC		0x200

%macro STR 0
	str: db "%5$cdefine	O_WRONLY	1%1$c%5$cdefine	O_CREAT		0x40%1$c%5$cdefine	O_TRUNC		0x200%1$c%1$c%5$cmacro STR 0%1$c%2$cstr: db %3$c%4$s%3$c, 0%1$c%5$cendmacro%1$c%1$c%5$cmacro DATA 0%1$csection .data:%1$c%2$cfilename: db %3$cGrace_kid.s%3$c, 0%1$c%2$cSTR%1$c%5$cendmacro%1$c%1$c%5$cmacro MAIN 0%1$cDATA%1$csection	.text%1$c%1$cextern	printf%1$cextern	open%1$cextern	dprintf%1$cextern	close%1$cextern	exit%1$cglobal	main%1$c%1$cmain:%1$c%2$cpush	rbp%1$c%2$cmov		rbp, rsp%1$c%2$clea		rdi, [rel filename]%1$c%2$cmov		esi, O_WRONLY | O_CREAT | O_TRUNC%1$c%2$cmov		rdx, 0644o%1$c%2$ccall	open wrt ..plt ; open the file%1$c%2$cpush	r15%1$c%2$cmov		r15, rax%1$c%2$cmov		rdi, rax%1$c%2$clea		rsi, [rel str]%1$c%2$cpush	37%1$c%2$cmov		rdx, 10%1$c%2$cmov		rcx, 9%1$c%2$cmov		r8, 34%1$c%2$clea		r9, [rel str]%1$c%2$cmov		rax, 1%1$c%2$ccall	dprintf wrt ..plt%1$c%2$cmov		rdi, r15%1$c%2$cpop		r15%1$c%2$ccall	close wrt ..plt%1$c%2$cpop		rbp%1$c%2$cxor		rdi, rdi%1$c%2$ccall	exit wrt ..plt%1$c%5$cendmacro%1$c%1$cMAIN%1$c", 0
%endmacro

%macro DATA 0
section .data:
	filename: db "Grace_kid.s", 0
	STR
%endmacro

%macro MAIN 0
DATA
section	.text

extern	printf
extern	open
extern	dprintf
extern	close
extern	exit
global	main

main:
	push	rbp
	mov		rbp, rsp
	lea		rdi, [rel filename]
	mov		esi, O_WRONLY | O_CREAT | O_TRUNC
	mov		rdx, 0644o
	call	open wrt ..plt ; open the file
	push	r15
	mov		r15, rax
	mov		rdi, rax
	lea		rsi, [rel str]
	push	37
	mov		rdx, 10
	mov		rcx, 9
	mov		r8, 34
	lea		r9, [rel str]
	mov		rax, 1
	call	dprintf wrt ..plt
	mov		rdi, r15
	pop		r15
	call	close wrt ..plt
	pop		rbp
	xor		rdi, rdi
	call	exit wrt ..plt
%endmacro

MAIN
