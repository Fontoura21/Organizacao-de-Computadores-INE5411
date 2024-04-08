.data

	valor: .word
	
.text

	la $s1, valor
	li $t2, 16
	
	li $t0, 0 #linha
	loop_linha:
	beq $t0, $t2, fim_linha
	
		li $t1, 0 #coluna
		loop_coluna:
		beq $t1, $t2, fim_coluna
		
			sw $s0, ($s1)
			addi $s1, $s1, 4
			addi $s0, $s0, 1
			
		addi $t1, $t1, 1
		j loop_coluna
		fim_coluna:
		
	addi $t0, $t0, 1
	j loop_linha
	fim_linha:
	
	li $v0, 10
	syscall
			
			
			
			
	
