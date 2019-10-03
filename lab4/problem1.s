.data
  .align 2
  array: .space 200
#  space: .asciiz " "
#  newline: .asciiz "\n"

.text
  main:
	li $v0 5
	syscall
	move $a0 $v0

	jal input

	li $v0 5
	syscall
	move $a1 $v0

	li $a2 0
	li $a3 0
	jal count

	move $a0 $v0
	li $v0 1
	syscall

	li $v0 10
	syscall

  input:
	la $t0 array
	li $t1 0
	j inputloop

  inputloop:
	li $v0 5
	syscall
	sw $v0 ($t0)
	add $t0 $t0 4
	add $t1 $t1 1
	blt $t1 $a0 inputloop
	jr $ra

##
# Recursive count function
# a0 - size of array
# a1 - number to be counted
# a2 - current index in array
# a3 - count value
##
  count:
	blt $a2 $a0 continue
	move $v0 $a3			  # index == size : return count value
	jr $ra

  continue:					  # index != size : continue function logic
	li $t1 4
	mult $a2 $t1
	mflo $t1
	lw $t2 array($t1)		  # load array element

	bne $t2 $a1 noincrease
	add $a3 $a3 1			  # array element = query number : increase count value

  noincrease:
	add $a2 $a2 1			  # increase index

	add $sp $sp -4			  # store return value in stack
	sw $ra 0($sp)

	jal count				  # call next iteration, keep return value unchanged

	lw $ra 0($sp)			  # reset the stack pointer
	add $sp $sp 4

	jr $ra					  # return
