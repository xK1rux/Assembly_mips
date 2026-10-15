.data
	msg1: .asciiz "\nDigite seu numerador: "
	msg2: .asciiz "\nDigite seu denominador (não pode ser 0): "
	msg3: .asciiz "\nO resultado da sua divisão é: "


.text
main:
	li $v0, 4
	la $a0, msg1
	syscall
	li $v0, 5
	syscall
	add $t1, $v0, 0		#numerador
	
enquanto:	
	li $v0, 4
	la $a0, msg2
	syscall
	li $v0, 5
	syscall
	add $t2, $v0, 0		#denominador
	
	bne $t2, 0, fimenquanto
	j enquanto 
	
fimenquanto:
	div $t0, $t1, $t2
	
	li $v0, 4
	la $a0, msg3
	syscall
	li $v0, 1
	add $a0, $t0, 0
	syscall
