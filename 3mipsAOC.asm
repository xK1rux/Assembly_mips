.data
	msg1: .asciiz "\nDigite as horas trabalhadas: "
	msg2: .asciiz "\nDigite as horas extras trabalhadas: "
	msg3: .asciiz "\nDigite o valor de desconto do salário: "
	msg4: .asciiz "\nO salário bruto é de: R$"
	msg5: .asciiz "\nO salário liquído é de: R$"

.text
main:
	li $v0, 4
	la $a0, msg1
	syscall
	li $v0, 5
	syscall
	add $t1, $v0, 0 	#horas trabalhadas
	
	li $v0, 4
	la $a0, msg2
	syscall
	li $v0, 5
	syscall
	add $t2, $v0, 0		#horas extras trabalhadas
	
	li $v0, 4
	la $a0, msg3
	syscall
	li $v0, 5
	syscall
	add $t3, $v0, 0 	#valor de desconto
	
	mul $t4, $t1, 10
	mul $t5, $t2, 15
	add $t0, $t4, $t5	#salário bruto
	
	li $v0, 4
	la $a0, msg4
	syscall
	li $v0, 1
	add $a0, $t0, 0
	syscall
	
	sub $t0, $t0, $t3	#salário liquído
	
	li $v0, 4
	la $a0, msg5
	syscall
	li $v0, 1
	add $a0, $t0, 0
	syscall
