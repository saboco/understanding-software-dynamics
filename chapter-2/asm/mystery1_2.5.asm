	.file	"mystery1_2.5.cc"
	.text
	.section	.text._Z9GetCyclesv,"axG",@progbits,_Z9GetCyclesv,comdat
	.weak	_Z9GetCyclesv
	.type	_Z9GetCyclesv, @function
_Z9GetCyclesv:
.LFB4271:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	rdtsc
	salq	$32, %rdx
	orq	%rdx, %rax
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4271:
	.size	_Z9GetCyclesv, .-_Z9GetCyclesv
	.section	.rodata
	.align 4
	.type	_ZL11kIterations, @object
	.size	_ZL11kIterations, 4
_ZL11kIterations:
	.long	1000000000
	.align 8
.LC1:
	.string	"%d iterations, %lu cycles, %4.2f cycles/iteration\n"
.LC2:
	.string	"%lu %lu\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB4274:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movl	%edi, -52(%rbp)
	movq	%rsi, -64(%rbp)
	movq	$0, -40(%rbp)
	movl	$0, %edi
	call	time@PLT
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movzbl	%al, %eax
	movl	%eax, -48(%rbp)
	call	_Z9GetCyclesv
	movq	%rax, -24(%rbp)
	movl	$0, -44(%rbp)
.L6:
	cmpl	$999999999, -44(%rbp)
	jg	.L5
	movl	-48(%rbp), %eax
	cltq
	addq	%rax, -40(%rbp)
	addl	$1, -44(%rbp)
	jmp	.L6
.L5:
	call	_Z9GetCyclesv
	subq	-24(%rbp), %rax
	movq	%rax, -16(%rbp)
	cvtsi2sdq	-16(%rbp), %xmm0
	movsd	%xmm0, -8(%rbp)
	movsd	-8(%rbp), %xmm0
	movsd	.LC0(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movq	stdout(%rip), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, %rcx
	movl	$1000000000, %edx
	leaq	.LC1(%rip), %rsi
	movq	%rax, %rdi
	movl	$1, %eax
	call	fprintf@PLT
	movq	stdout(%rip), %rax
	movq	-40(%rbp), %rcx
	movq	-32(%rbp), %rdx
	leaq	.LC2(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4274:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC0:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.2) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
