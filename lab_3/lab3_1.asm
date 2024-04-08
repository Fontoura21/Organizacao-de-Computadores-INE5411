.data

	estimativa: .double 1  # ESTIMATIVA INICIAL = 1

	bufferX: .asciiz "\nInforme o valor a ser aplicada a raiz:\n"
	.align 2
	bufferN: .asciiz "\nInforme o número de iterações desejado:\n"
	.align 2
	bufferR: .asciiz "\nResultado: "
	.align 2
	bufferRes: .asciiz "\nResiduo: "
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
	
	# RECEBENDO N
	li $v0, 4
	la $a0, bufferN
	syscall
	
	li $v0, 5
	syscall
	move $s0, $v0
	
	# CHAMANDO PROCEDIMENTO
	jal raiz_quadrada
	
	# PRINTAR O RESULTADO
	li $v0, 4
	la $a0, bufferR
	syscall
	
	li $v0, 3
	mov.d $f12, $f4
	syscall
	
	# RESIDUO
	sqrt.d $f2, $f2
	sub.d $f2, $f2, $f4
	
	li $v0, 4
	la $a0, bufferRes
	syscall
	
	li $v0, 3
	mov.d $f12, $f2
	syscall
	
	li $v0, 10
	syscall
	
raiz_quadrada:
	
	# INICIANDO ESTIMATIVA
	l.d $f4, estimativa
	
	# CRIANDO UM 2
	add.d $f6, $f4, $f4
	
	# REALIZAR ITERAÇÕES
	li $t0, 0
	loop:
	beq $t0, $s0, fim
	
		div.d $f8, $f2, $f4
		add.d $f8, $f8, $f4
		div.d $f4, $f8, $f6
	
	addi $t0, $t0, 1
	j loop
	fim:
	jr $ra


	