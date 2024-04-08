.data
	bufferN:.asciiz "\nInsira o número N de elementos:\n"
	.align 2
	bufferA:.asciiz "\nInsira os elementos de A:\n"
	.align 2
	bufferB:.asciiz "\nInsira os elementos de B:\n"
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
	
	# RECEBE CADA UM DOS VETORES
	jal inputA
	jal inputB
	
	# CONVERTE N PARA FLOAT
	mtc1 $s0, $f1
	cvt.s.w $f1, $f1

	# PRINTA CADA UMA DAS MEDIAS
	jal outputA
	jal outputB
	
	# TERMINA O PROGRAMA
	li $v0, 10
	syscall
	
inputA: # RECEBE N INPUTS DE A
	li $v0, 4
	la $a0, bufferA
	syscall
	
	mtc1 $zero, $f2
	
	li $t0, 0
	loop_inputA:
	beq $t0, $s0, fim_inputA
	
		li $v0, 6
		syscall
		mov.s $f1, $f0
		
		add.s $f2, $f2, $f1
	
	addi $t0, $t0, 1
	j loop_inputA
	fim_inputA:
	jr $ra
	
inputB: # RECEBE N INPUTS DE B
	li $v0, 4
	la $a0, bufferB
	syscall
	
	mtc1 $zero, $f2
	
	li $t0, 0
	loop_inputB:
	beq $t0, $s0, fim_inputB
	
		li $v0, 6
		syscall
		mov.s $f1, $f0
		
		add.s $f3, $f3, $f1
	
	addi $t0, $t0, 1
	j loop_inputB
	fim_inputB:
	jr $ra
	
outputA:# CALCULA E PRINTA MEDIA A
	li $v0, 4
	la $a0, bufferMA
	syscall
	
	div.s $f2, $f2, $f1
	li $v0, 2
	mov.s $f12, $f2
	syscall
	jr $ra
	
outputB:# CALCULA E PRINTA MEDIA B
	li $v0, 4
	la $a0, bufferMB
	syscall
	
	div.s $f3, $f3, $f1
	li $v0, 2
	mov.s $f12, $f3
	syscall
	jr $ra
	
	