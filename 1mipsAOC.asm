.data
	msg1: .asciiz "\nDigite o comprimento do terreno: "
	msg2: .asciiz "\nDigite a largura do terreno: "
	msg3: .asciiz "\nA área do terreno é de "
	msg4: .asciiz " m²"
.text
main:
	li $v0, 4
	la $a0, msg1
	syscall
	li $v0, 5
	syscall
	add $t1, $v0, 0		#comprimento
	
	li $v0, 4
	la $a0, msg1
	syscall
	li $v0, 5
	syscall
	add $t2, $v0, 0		#largura
	
	mul $t0, $t1, $t2	#area
	
	li $v0, 4
	la $a0, msg3
	syscall
	li $v0, 1
	add $a0, $t0, 0
	syscall
	
	li $v0, 4
	la $a0, msg4
	syscall
	
	
	