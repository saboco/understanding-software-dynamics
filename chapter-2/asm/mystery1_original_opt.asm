	.file	"mystery1_original.cc"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.string	"%d iterations, %lu cycles, %4.2f cycles/iteration\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB5566:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	xorl	%edi, %edi
	call	time@PLT
	rdtsc
	movq	%rax, %rcx
	salq	$32, %rdx
	orq	%rdx, %rcx
	rdtsc
	movq	stdout(%rip), %rdi
	pxor	%xmm0, %xmm0
	movl	$1, %esi
	salq	$32, %rdx
	orq	%rdx, %rax
	leaq	.LC1(%rip), %rdx
	subq	%rcx, %rax
	movl	$1000000000, %ecx
	cvtsi2sdq	%rax, %xmm0
	movq	%rax, %r8
	movl	$1, %eax
	divsd	.LC0(%rip), %xmm0
	call	__fprintf_chk@PLT
	xorl	%eax, %eax
	addq	$8, %rsp
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
