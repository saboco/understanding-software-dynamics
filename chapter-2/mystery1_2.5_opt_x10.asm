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
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	xorl	%edi, %edi
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$16, %rsp
	.cfi_def_cfa_offset 64
	call	time@PLT
	movq	%rax, %r12
	movzbl	%al, %eax
	movl	%eax, 12(%rsp)
	rdtsc
	movl	$100000000, %esi
	xorl	%ebx, %ebx
	movq	%rax, %rcx
	salq	$32, %rdx
	orq	%rdx, %rcx
	.p2align 4,,10
	.p2align 3
.L2:
	movslq	12(%rsp), %rdx
	movslq	12(%rsp), %r14
	movslq	12(%rsp), %r13
	movslq	12(%rsp), %rbp
	addq	%r14, %rdx
	movslq	12(%rsp), %r11
	movslq	12(%rsp), %rax
	addq	%r13, %rdx
	movl	12(%rsp), %r10d
	movl	12(%rsp), %r9d
	addq	%rbp, %rdx
	movl	12(%rsp), %r8d
	movl	12(%rsp), %edi
	addq	%r11, %rdx
	addq	%rdx, %rax
	movslq	%r10d, %rdx
	addq	%rdx, %rax
	movslq	%r9d, %rdx
	addq	%rdx, %rax
	movslq	%r8d, %rdx
	addq	%rdx, %rax
	movslq	%edi, %rdx
	addq	%rdx, %rax
	addq	%rax, %rbx
	subl	$1, %esi
	jne	.L2
	rdtsc
	movq	stdout(%rip), %rdi
	pxor	%xmm0, %xmm0
	movl	$1, %esi
	salq	$32, %rdx
	orq	%rdx, %rax
	leaq	.LC1(%rip), %rdx
	subq	%rcx, %rax
	movl	$1000000000, %ecx
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
	addq	$16, %rsp
	.cfi_def_cfa_offset 48
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
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
