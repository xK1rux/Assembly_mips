.data
	msg1: .asciiz "\nDigite um número: "
	msg2: .asciiz "\nO resultado da soma é de: "

.text
main:
	li $v0, 4
	la $a0, msg1
	syscall
	li $v0, 5
	syscall
	add $t1, $v0, 0
	
	rem $t0, $t1, 2
	
	beq $t0, 0, se
	j senao
se:
	add $t1, $t1, 5		#somando 5 por ser par 
	j fimse
senao:
	add $t1, $t1, 8		#somando 8 por ser impar

fimse:
	li $v0, 4
	la $a0, msg2
	syscall
	li $v0, 1
	add $a0, $t1, 0
	syscall