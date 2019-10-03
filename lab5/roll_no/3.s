.text

main:
 # 2 stage
 ddiv $2,$3,$4
 ddiv $5,$3,$2
 halt
 
 # 3 stage
 ddiv $2,$3,$4
 ddiv $5,$3,$2
 ddiv $6,$5,$2
