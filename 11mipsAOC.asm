.data
	msg1: .asciiz "\nDigite números de 0 a 100, um por vez, e por último um número negativo: "
	msg2: .asciiz "\nQuantidade de números entre 0 e 25: "
	msg3: .asciiz "\nQuantidade de números entre 26 e 50: "
	msg4: .asciiz "\nQuantidade de números entre 51 e 75: "
	msg5: .asciiz "\nQuantidade de números entre 76 e 100: "
.text
main:
	li $v0, 4
	la $a0, msg1
	syscall
	li $v0, 5
	syscall
	add $t0, $v0, 0		#captura de numeros
	
	blt $t0, 0, fim		#acaba com numero negativo
	bgt $t0, 100, main	#pede outro numero se for maior q 100
	bge $t0, 76, setentaseis	#numero entre 76 e 100
	bge $t0, 51, cinquentaum	#numero entre 51 e 75
	bge $t0, 26, vinteseis		#numero entre 26 e 50
	bge $t0, 0, zero	#numero entre 0 e 25
zero:  	
	add $t2, $t2, 1		#contador entre 0 e 25
	j main
vinteseis:
	add $t3, $t3, 1		#contador entre 26 e 50
	j main
cinquentaum:
	add $t4, $t4, 1		#contador entre 51 e 75
	j main
setentaseis:
	add $t5, $t5, 1		#contador entre 76 e 100
	j main
fim:
	li $v0, 4
	la $a0, msg2
	syscall
	li $v0, 1
	add $a0, $t2, 0		
	syscall
	
	li $v0, 4
	la $a0, msg3
	syscall
	li $v0, 1
	add $a0, $t3, 0
	syscall
	
	li $v0, 4
	la $a0, msg4
	syscall
	li $v0, 1
	add $a0, $t4, 0
	syscall
	
	li $v0, 4
	la $a0, msg5
	syscall
	li $v0, 1
	add $a0, $t5, 0
	syscall
	