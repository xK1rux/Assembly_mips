.data
	msg1: .asciiz "\nDigite o valor do primeiro cateto: "
	msg2: .asciiz "\nDigite o valor do segundo cateto: "
	msg3: .asciiz "\nO valor da hipotenusa é: "
	msg4: .asciiz "\nO valor da hipotenusa não é exato, ele está entre: "
	msg5: .asciiz " e "
.text
main:
	li $v0, 4
	la $a0, msg1
	syscall
	li $v0, 5
	syscall
	add $t1, $v0, 0		#primeiro cateto
	
	li $v0, 4
	la $a0, msg2
	syscall
	li $v0, 5
	syscall
	add $t2, $v0, 0		#segundo cateto
	
	mul $t3, $t1, $t1	#quadrado do primeiro cateto
	mul $t4, $t2, $t2	#quadrado do segundo cateto
	add $t5, $t3, $t4	#soma dos quadrados
	
	li $t6, 1	#numeros impares
	li $t7, 0	#contador de subtrações e resultado da raíz quadrada
	
enquanto:
	sub $t5, $t5, $t6
	add $t7, $t7, 1		#adicionando ao contador 
	add $t6, $t6, 2		#transformando o numero no proximo impar
	
	bge $t5, $t6, enquanto		#se a soma ainda for maior ou igual que o numero impar, volta no laço
fimenquanto:
	bgt $t5, 0, se		#se soma for menor que o numero impar e ainda é maior que 0
	
	li $v0, 4
	la $a0, msg3
	syscall
	li $v0, 1
	add $a0, $t7, 0
	syscall
	j fimse
	
se:	#se a raiz não for exata
	add $t8, $t7, 1		#proximo numero do contador
	
	li $v0 4
	la $a0, msg4		#esta entre
	syscall
	li $v0, 1
	add $a0, $t7, 0		#numero do contador 
	syscall
	li $v0, 4
	la $a0, msg5		#e 
	syscall
	li $v0, 1
	add $a0, $t8, 0		#proximo numero
	syscall
	
fimse:	
	