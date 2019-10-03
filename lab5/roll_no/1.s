.text

main:
 jal initialise
 nop
 jal imultiply
 nop
 jal idivide
 nop
 jal fadd
 nop
 jal fmultiply
 nop
 jal fdivide
 nop
 halt

# Initialise variables in a subroutine
initialise:
 daddi $1,$0,1
 daddi $2,$0,1
 mtc1 $1,f0
 mtc1 $1,f1
 jr $ra
 nop
 
# Integer multiplication
# 7 stage pipeline
imultiply:
 dmul $1,$1,$1
 dmul $2,$2,$2
 dmul $3,$3,$3
 dmul $4,$4,$4
 dmul $5,$5,$5
 dmul $6,$6,$6
 dmul $7,$7,$7
 dmul $8,$8,$8
 jr $ra
 nop

# Integer division
# Not pipelined, 24 cycles
idivide:
 ddiv $1,$1,$1
 ddiv $2,$2,$2
 jr $ra
 nop

# Floating addition
# 4 stage pipeline
fadd:
 add.d f0,f0,f0
 add.d f1,f1,f1
 add.d f2,f2,f2
 add.d f3,f3,f3
 add.d f4,f4,f4
 jr $ra
 nop

# Floating multiplication
# 7 stage pipeline
fmultiply:
 mul.d f0,f0,f0
 mul.d f1,f1,f1
 mul.d f2,f2,f2
 mul.d f3,f3,f3
 mul.d f4,f4,f4
 mul.d f5,f5,f5
 mul.d f6,f6,f6
 mul.d f7,f7,f7
 jr $ra
 nop

# Floating division
# Not pipelined, 24 cycles
fdivide:
 div.d f0,f0,f0
 div.d f1,f1,f1
 jr $ra
 nop
