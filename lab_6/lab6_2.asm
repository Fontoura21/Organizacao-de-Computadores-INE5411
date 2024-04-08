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
    
    # Move o valor de entrada para o argumento da função fatorial
    move $a0, $v0
    
    # Inicializa o registrador $s0 com 1
    li $s0, 1

    # Chamar a função fatorial
    jal fatorial
    
    # Exibe mensagem do resultado
    li $v0, 4
    la $a0, resultMsg
    syscall
    
    # Exibe o resultado
    li $v0, 1
    move $a0, $s0
    syscall
    
    # Termina o programa
    li $v0, 10
    syscall

fatorial:
    # Salva o conteúdo dos registradores no stack
    addi $sp, $sp, -8
    sw $ra, 4($sp)
    sw $a0, 0($sp)

    # Condição base (fatorial de 0 ou 1 é 1)
    beq $a0, $zero, end_fatorial
    beq $a0, 1, end_fatorial

    # Chamada recursiva (fatorial(n - 1))
    subi $a0, $a0, 1
    jal fatorial
    
    # Restaura o valor original de $a0 e o endereço de retorno
    lw $a0, 0($sp)
    
    # Calcula o fatorial atual
    mul $s0, $s0, $a0

end_fatorial:
    # Libera o espaço na pilha
    lw $ra, 4($sp)
    addi $sp, $sp, 8

    jr $ra   # Retorna para o chamador
