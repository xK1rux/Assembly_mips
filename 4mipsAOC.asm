.data
	msg1: .asciiz "\nDigite o valor da base maior do trapézio: "
	msg2: .asciiz "\nDigite o valor da base menor do trapézio: "
	msg3: .asciiz "\nDigite o valor da altura do trapézio: "
	msg4: .asciiz "\nO valor da área do trapézio é: "
	msg5: .asciiz " cm²"
.text
main:
	li $v0, 4
	la $a0, msg1
	syscall
	li $v0, 5
	syscall
	add $t1, $v0, 0		#base maior
	
	li $v0, 4
	la $a0, msg2
	syscall
	li $v0, 5
	syscall
	add $t2, $v0, 0		#base menor
	
	li $v0, 4
	la $a0, msg3
	syscall
	li $v0, 5
	syscall
	add $t3, $v0, 0		#altura
	
	add $t0, $t1, $t2
	mul $t0, $t0, $t3
	div $t0, $t0, 2
	
	li $v0, 4
	la $a0, msg4
	syscall
	li $v0, 1
	add $a0, $t0, 0
	syscall
	
	li $v0, 4
	la $a0, msg5
	syscall