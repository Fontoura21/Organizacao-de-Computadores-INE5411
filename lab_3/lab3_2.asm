.data

	um: .double 1
	.align 3
	
	bufferX: .asciiz "\nInforme o valor cujo seno será calculado:\n"
	.align 2
	bufferR: .asciiz "\nResultado: "
	.align 2
	
.text

main:
	# RECEBENDO X
	li $v0, 4
	la $a0, bufferX
	syscall
	
	li $v0, 7
	syscall
	mov.d $f2, $f0
	
	# CHAMANDO PROCEDIMENTO
	jal seno
	
	# PRINTAR O RESULTADO
	li $v0, 4
	la $a0, bufferR
	syscall
	
	li $v0, 3
	mov.d $f12, $f26
	syscall
	
	li $v0, 10
	syscall
	
seno:
	l.d $f6, um
	sub.d $f10, $f30, $f6
		
	# REALIZAR ITERAÇÕES
	loop_iteracao:
	beq $t0, 20, fim_iteracao
	
		mtc1 $t0, $f4
		cvt.w.d $f4, $f4
		
		# (-1) ** n
		move $t1, $zero
		mov.d $f16, $f6
		loop_m1:
		beq $t1, $t0, fim_m1
		
			mul.d $f16, $f16, $f10
		
		addi  $t1, $t1, 1
		j loop_m1
		fim_m1:
		
		# (2n + 1)
		add.d $f18, $f4, $f4
		add.d $f18, $f18, $f6
		
		# (2n + 1)
		add $t2, $t0, $t0
		addi $t2, $t2, 1
		
		# x ** (2n + 1)
		move $t1, $zero
		mov.d $f20, $f6
		loop_x:
		beq $t1, $t2, fim_x
		
			mul.d $f20, $f20, $f2	
	
		addi  $t1, $t1, 1
		j loop_x
		fim_x:
		
		# (2n + 1)!
		mov.d $f22, $f6
		add.d $f14, $f6, $f6
		li $t1, 2
		
		loop_f:
		bgt $t1, $t2, fim_f
			
			mul.d $f22, $f22, $f14
			add.d  $f14, $f14, $f6
			
		addi $t1, $t1, 1
		j loop_f
		fim_f:
		
		mul.d $f24, $f16, $f20
		div.d $f24, $f24, $f22
		
		add.d $f26, $f26, $f24
	
	addi  $t0, $t0, 1
	j loop_iteracao
	fim_iteracao:
	jr $ra


	