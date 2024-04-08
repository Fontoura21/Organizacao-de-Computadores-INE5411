.data

	valor: .word

.text
	
	la $s0, valor
	li $t0, 16
	
	li $t1, 0 #coluna
	loop_coluna:
	beq $t1, $t0, fim_coluna
		
		move $t3, $s0
		
		li $t2, 0 #linha
		loop_linha:
		beq $t2, $t0, fim_linha
			
			sw  $s1, ($t3)
			addi $t3, $t3, 64
			
		addi $s1, $s1, 1
		addi $t2, $t2, 1
		j loop_linha
		fim_linha:
		
		addi $s0, $s0, 4
		
	addi $t1, $t1, 1
	j loop_coluna
	fim_coluna:
	
		
	 
