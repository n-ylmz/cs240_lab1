	.file	"GCD.c"
	.option nopic
	.attribute arch, "rv32i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0_zcf1p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	1
	.globl	GCD
	.type	GCD, @function
GCD:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	sw	a1,-24(s0)
	lw	a5,-24(s0)
	bne	a5,zero,.L2
	lw	a5,-20(s0)
	j	.L3
.L2:
	lw	a4,-20(s0)
	lw	a5,-24(s0)
	rem	a5,a4,a5
	mv	a1,a5
	lw	a0,-24(s0)
	call	GCD
	mv	a5,a0
.L3:
	mv	a0,a5
	lw	ra,28(sp)
	lw	s0,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	GCD, .-GCD
	.section	.rodata
	.align	2
.LC0:
	.string	"%d\n"
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	addi	s0,sp,32
	lui	a5,%hi(a.1)
	lw	a4,%lo(a.1)(a5)
	lui	a5,%hi(b.0)
	lw	a5,%lo(b.0)(a5)
	mv	a1,a5
	mv	a0,a4
	call	GCD
	sw	a0,-20(s0)
	lw	a1,-20(s0)
	lui	a5,%hi(.LC0)
	addi	a0,a5,%lo(.LC0)
	call	printf
	li	a5,0
	mv	a0,a5
	lw	ra,28(sp)
	lw	s0,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	main, .-main
	.section	.sdata,"aw"
	.align	2
	.type	a.1, @object
	.size	a.1, 4
a.1:
	.word	48
	.align	2
	.type	b.0, @object
	.size	b.0, 4
b.0:
	.word	18
	.ident	"GCC: (g6afcc4f6d) 16.1.0"
	.section	.note.GNU-stack,"",@progbits
