.data
	msg1: .asciiz "\nDigite um número positivo ou negativo: "
	msg2: .asciiz "\nO dobro do seu número posivito é: "
	msg3: .asciiz "\nO triplo do seu número negativo é: "
.text
main:
	li $v0, 4
	la $a0, msg1
	syscall
	li $v0, 5
	syscall
	add $t1, $v0, 0
	
	bgt $t1, 0, se		#se ele for positivo ele pula pro se
	j senao			#se ele for negativo ele pula pro senao
	
se:
	mul $t0, $t1, 2
	li $v0, 4
	la $a0, msg2
	syscall
	li $v0, 1
	add $a0, $t0, 0
	syscall
	j fimse
	
senao:
	mul $t0, $t1, 3
	li $v0, 4
	la $a0, msg3
	syscall
	li $v0, 1
	add $a0, $t0, 0
	syscall
	
fimse:
	