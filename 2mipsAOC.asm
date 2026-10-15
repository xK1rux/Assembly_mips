.data
	msg1: .asciiz "\nDigite a quantidade de camisetas pequenas: "
	msg2: .asciiz "\nDigite a quantidade de camisetas médias: "
	msg3: .asciiz "\nDigite a quantidade de camisetas grandes: "
	msg4: .asciiz "\nO valor que será arrecadado é de R$"
.text
main:
	li $v0, 4
	la $a0, msg1
	syscall
	li $v0, 5
	syscall
	add $t1, $v0, 0		#quantidade pequenas
	
	li $v0, 4
	la $a0, msg2
	syscall
	li $v0, 5
	syscall
	add $t2, $v0, 0		#quantidade médias
	
	li $v0, 4
	la $a0, msg3
	syscall
	li $v0, 5
	syscall
	add $t3, $v0, 0		#quantidade grandes
	
	mul $t4, $t1, 10
	mul $t5, $t2, 12
	mul $t6, $t3, 15
	add $t0, $t4, $t5
	add $t0, $t0, $t6	#valor arrecadado
	
	li $v0, 4
	la $a0, msg4
	syscall
	li $v0, 1
	add $a0, $t0, 0
	syscall