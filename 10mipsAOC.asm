.data
	msg1: .asciiz "\nDigite um número: "
	msg2: .asciiz "\nDigite um segundo número: "
	msg3: .asciiz "\nO resto da sua divisão é: "
.text
main:
	li $v0, 4
	la $a0, msg1
	syscall
	li $v0, 5
	syscall
	add $t1, $v0, 0		#primeiro numero
	
	li $v0, 4
	la $a0, msg2
	syscall
	li $v0, 5
	syscall
	add $t2, $v0, 0		#segundo numero
	
	bgt $t1, $t2, se	#verificando qual o maior
	j senao
	
se:				#primeiro numero maior
	div $t3, $t1, $t2
	mul $t0, $t3, $t2
	sub $t0, $t1, $t0	#resto da divisão
	j fimse
		
senao:				#segundo numero maior
	div $t3, $t2, $t1
	mul $t0, $t3, $t1
	sub $t0, $t2, $t0	#resto da divisão
	
fimse:

	li $v0, 4
	la $a0, msg3
	syscall
	li $v0, 1
	add $a0, $t0, 0
	syscall