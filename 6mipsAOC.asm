.data
	msg1: .asciiz "\nDigite o valor de a: "
	msg2: .asciiz "\nDigite o valor de b: "
	msg3: .asciiz "\nO valor de C é: "
	
.text
main:
	li $v0, 4
	la $a0, msg1
	syscall
	li $v0, 5
	syscall
	add $t1, $v0, 0		#variavel a
	
	li $v0, 4
	la $a0, msg2
	syscall
	li $v0, 5
	syscall
	add $t2, $v0, 0		#variavel b
	
	beq $t1, $t2, se	#se for igual pula pro se
	j senao			#se não for igual pula para o senao
se:
	add $t0, $t1, $t2	#resultado na variavel c
	j fimse			#pula o senao 

senao:
	mul $t0, $t1, $t2	#resultado na variavel c
	
fimse:
	li $v0, 4
	la $a0, msg3
	syscall
	li $v0, 1
	add $a0, $t0, 0
	syscall