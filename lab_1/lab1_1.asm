#Questao1
.data
	#Declaração de variáveis
	A: .word 1
	B: .word 2
	C: .word 3
	D: .word 4
	E: .word 5
.text
	#Início do programa
	lw $t0, B #Carregamento do endereço B de memória
	addi $t0, $t0, 35 #b+35 armazenado em $t0 (a)
	lw $t1, D #Carregamento do endereço D de memória
	sub $t0, $t1, $t0 #d-a armazenado em $t0
	lw $t1, E #Carregamento do endereço E de memória
	add $t0, $t0, $t1 #$t0+e armazenado em $t0
	sw $t0, C #Armazenamento do resultado no endereço C de memória
	
	lw $a0, C #Print para evidenciar o resultado
	li $v0, 1
	syscall