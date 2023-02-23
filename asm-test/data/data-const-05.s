	.file	"data-const-05.c"
	.text
	.globl	calc
	.type	calc, @function
calc:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)
	movl	$10, -4(%rbp)
	movl	-20(%rbp), %eax
	cmpl	$5, %eax
	je	.L3
	cmpl	$5, %eax
	jg	.L4
	cmpl	$1, %eax
	je	.L5
	jmp	.L2
.L4:
	cmpl	$10, %eax
	je	.L6
	cmpl	$20, %eax
	je	.L7
	jmp	.L2
.L5:
	movl	$10, -4(%rbp)
	jmp	.L8
.L3:
	movl	$50, -4(%rbp)
	jmp	.L8
.L6:
	movl	$100, -4(%rbp)
	jmp	.L8
.L7:
	movl	$200, -4(%rbp)
	jmp	.L8
.L2:
	movl	$300, -4(%rbp)
.L8:
	movl	-20(%rbp), %eax
	addl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	calc, .-calc
	.section	.rodata
.LC0:
	.string	"%d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$10, %edi
	call	calc
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
