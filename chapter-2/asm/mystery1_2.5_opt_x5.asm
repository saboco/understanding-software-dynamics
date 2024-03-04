	.file	"mystery1_2.5.cc"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.string	"%d iterations, %lu cycles, %4.2f cycles/iteration\n"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"%lu %lu\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB5566:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	xorl	%edi, %edi
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$24, %rsp
	.cfi_def_cfa_offset 48
	call	time@PLT
	movq	%rax, %r12
	movzbl	%al, %eax
	movl	%eax, 12(%rsp)
	rdtsc
	movl	$200000000, %r8d
	xorl	%ebx, %ebx
	movq	%rax, %rsi
	salq	$32, %rdx
	orq	%rdx, %rsi
	.p2align 4,,10
	.p2align 3
.L2:
	movslq	12(%rsp), %rax
	movslq	12(%rsp), %r9
	movslq	12(%rsp), %rdi
	movslq	12(%rsp), %rcx
	addq	%r9, %rax
	movslq	12(%rsp), %rdx
	addq	%rdi, %rax
	addq	%rcx, %rax
	addq	%rdx, %rax
	addq	%rax, %rbx
	subl	$1, %r8d
	jne	.L2
	rdtsc
	movq	stdout(%rip), %rdi
	pxor	%xmm0, %xmm0
	movl	$1000000000, %ecx
	salq	$32, %rdx
	orq	%rdx, %rax
	leaq	.LC1(%rip), %rdx
	subq	%rsi, %rax
	movl	$1, %esi
	movq	%rax, %r8
	cvtsi2sdq	%rax, %xmm0
	movl	$1, %eax
	divsd	.LC0(%rip), %xmm0
	call	__fprintf_chk@PLT
	movq	%rbx, %r8
	movq	%r12, %rcx
	movl	$1, %esi
	movq	stdout(%rip), %rdi
	leaq	.LC2(%rip), %rdx
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	addq	$24, %rsp
	.cfi_def_cfa_offset 24
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE5566:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
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
