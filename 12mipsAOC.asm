.data
	msg1: .asciiz "\nDigite a altura em cm de 15 pessoas, uma por vez: "
	msg2: .asciiz "\nA maior altura foi de: "
	msg3: .asciiz "\nA menor altura foi de: "

.text
main:
	li $v0, 4
	la $a0, msg1
	syscall
	li $v0, 5
	syscall
	add $t0, $v0, 0
	
	add $t9, $t9, 1		#adiciona mais 1 no contador
	beq $t9, 1, se		#se contador estiver zerado, ou seja, primeiro numero
	beq $t9, 15, fim	#quando o contador chegar a 15 acaba
	blt $t9, 15, senao	#enquanto o contador for menor que 15, o algoritmo continua 
	
se:
	add $t1, $t0, 0		#maior
	add $t2, $t0, 0		#menor
	j main
	
senao:
	bge $t0, $t1, maior
	ble $t0, $t2, menor
	j main
	
maior:
	add $t1, $t0, 0		#troca a maior altura
	j main
	
menor: 
	add $t2, $t0, 0		#troca a menor altura
	j main

fim:
	li $v0, 4
	la $a0, msg2
	syscall
	li $v0 1
	add $a0, $t1, 0
	syscall
	
	li $v0, 4
	la $a0, msg3
	syscall
	li $v0, 1
	add $a0, $t2, 0
	syscall
	
	
	
	
