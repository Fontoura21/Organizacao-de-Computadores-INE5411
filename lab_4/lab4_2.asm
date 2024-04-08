.data
	bufferN:.asciiz "\nInsira o número N de elementos:\n"
	.align 2
	bufferA:.asciiz "\n\nInsira os elementos de A:\n"
	.align 2
	bufferB:.asciiz "\n\nInsira os elementos de B:\n"
	.align 2
	bufferMA:.asciiz "\nMedia de A: "
	.align 2
	bufferMB:.asciiz "\nMedia de B: "
	.align 2

.text

main:
	# RECEBE N
	li $v0, 4
	la $a0, bufferN
	syscall
	li $v0, 5
	syscall
	move $s0, $v0
	
	# CONVERTE N PARA FLOAT
	mtc1 $s0, $f3
	cvt.s.w $f3, $f3
	
	# OPERA CADA UM DOS VETORES
	la $a1, bufferA
	la $a2, bufferMA
	jal calcula_media
	
	la $a1, bufferB
	la $a2, bufferMB
	jal calcula_media
	
	# ENCERRA O PROGRAMA
	li $v0, 10
	syscall
	
calcula_media:

	li $v0, 4
	move $a0, $a1
	syscall
	
	mtc1 $zero, $f2
	
	li $t0, 0
	loop_input:
	beq $t0, $s0, fim_input
	
		li $v0, 6
		syscall
		mov.s $f1, $f0
		
		add.s $f2, $f2, $f1
	
	addi $t0, $t0, 1
	j loop_input
	fim_input:
	
	li $v0, 4
	move $a0, $a2
	syscall
	
	div.s $f2, $f2, $f3
	li $v0, 2
	mov.s $f12, $f2
	syscall
	jr $ra