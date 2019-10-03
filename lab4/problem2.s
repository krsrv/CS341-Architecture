.data
  .align 2
  array: .space 200
  space: .asciiz " "
  newline: .asciiz "\n"

.text
  main:
	li $v0 5
	syscall
	move $a0 $v0

	jal input

	move $a1 $a0
	sub $a1 $a1 1
	li $a0 0
	jal mergesort

	move $a0 $a1
	add $a0 $a0 1
	jal print

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
# Recursive mergesort
# a0 - left index
# a1 - right index
##
  mergesort:
	sub $t0 $a1 $a0
	bgt $t0 1 continue
	beq $t0 0 trivial		  # Trivial case: single array element
	sll $t0 $a0 2			  # Trivial case: consecutive array elements
	sll $t1 $a1 2			  #	Swap elements if necessary and return
	lw $t2 array($t0)
	lw $t3 array($t1)
	blt $t2 $t3 trivial
	sw $t2 array($t1)
	sw $t3 array($t0)
  trivial:
	jr $ra

  continue:					  # index != size : continue function logic
	add $s0 $a0 $a1
	srl $s0 $s0 1
	
	add $sp $sp -16			  # recursively mergesort left sub-array
	sw $ra 0($sp)
	sw $a0 4($sp)
	sw $a1 8($sp)
	sw $s0 12($sp)
	move $a1 $s0
	jal mergesort
	lw $ra 0($sp)
	lw $a0 4($sp)
	lw $a1 8($sp)
	lw $s0 12($sp)
	add $sp $sp 16

	add $sp $sp -16			  # recursively mergesort right sub-array
	sw $ra 0($sp)
	sw $a0 4($sp)
	sw $a1 8($sp)
	sw $s0 12($sp)
	move $a0 $s0
	add $a0 $a0 1
	jal mergesort
	lw $ra 0($sp)
	lw $a0 4($sp)
	lw $a1 8($sp)
	lw $s0 12($sp)
	add $sp $sp 16

	move $a2 $s0			  # merge two sorted sub-arrays using merge()
	add $sp $sp -4
	sw $ra 0($sp)
	jal merge
	lw $ra 0($sp)
	add $sp $sp 4
	jr $ra					  # return

##
# merge sub-routine
# a0 - left index
# a1 - right index
# a2 - mid index
#
# Temporary variables:
#   t0 - left sub-array index
#   t1 - right sub-array index
#   s0 - left sub-array boundary
#   s1 - right sub-array boundary
##
  merge:
	add $s0 $a2 1				# initialise boundary variables
	add $s1 $a1 1
	
	add $t0 $a0 0				# initialise running indices
	add $t1 $a2 1

  mergeloop:
	bge $t0 $s0 mergedone		# if t0 == s0 || t1 == s1
	bge $t1 $s1 mergedone		#	  then merging complete
	sll $t8 $t0 2				# else
	sll $t9 $t1 2
	lw $t2 array($t8)
	lw $t3 array($t9)

	bgt $t2 $t3 shift			# if arr[t0] > arr[t1], then shift elements
	add $t0 $t0 1				# otherwise, increment t0
	j mergeloop

  shift:
	move $t4 $t1
	sll $t8 $t4 2
	lw $t6 array($t8)

  shiftloop:
	sub $t5 $t4 1
	sll $t8 $t5 2
	lw $t7 array($t8)
	sll $t8 $t4 2
	sw $t7 array($t8)
	sub $t4 $t4 1
	bgt $t4 $t0 shiftloop

	sll $t8 $t0 2
	sw $t6 array($t8)

	add $t0 $t0 1
	add $s0 $s0 1
	add $t1 $t1 1

	j mergeloop

  mergedone:
	jr $ra

  print:
	li $t0 0
	sll $t1 $a0 2
	
  printloop:
	li $v0 1
	lw $a0 array($t0)
	syscall

	li $v0 4
	la $a0 newline
	syscall

	add $t0 $t0 4
	blt $t0 $t1 printloop

	jr $ra
	
