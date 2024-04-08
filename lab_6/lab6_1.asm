.data
prompt:      .asciiz "Digite um número: "
resultMsg:   .asciiz "O fatorial é: "

.text
main:
    # Exibe prompt para o usuário
    li $v0, 4
    la $a0, prompt
    syscall
    
    # Lê o número inserido pelo usuário
    li $v0, 5
    syscall
    
    # Move o valor de entrada para o registrador $t0
    move $t0, $v0

    # Inicializa o registrador $t1 (que manterá o resultado) com 1
    li $t1, 1

    # Loop para calcular o fatorial
calcula_fatorial:
    # Condição de saída do loop
    beq $t0, $zero, result

    # Multiplica o resultado pelo valor atual de $t0
    mul $t1, $t1, $t0

    # Decrementa $t0
    sub $t0, $t0, 1

    # Repetir o loop
    j calcula_fatorial

result:
    # Exibe mensagem do resultado
    li $v0, 4
    la $a0, resultMsg
    syscall

    # Exibe o resultado
    li $v0, 1
    move $a0, $t1
    syscall
    
    # Termina o programa
    li $v0, 10
    syscall

    


		
		
	
