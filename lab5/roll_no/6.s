.text
main:
 bnez $0,j1

j1:
 bnez $0,j2

j2:
 bnez $0,j3

j3:
 beqz $0,j4

j4:
 beqz $0,j5

j5:
 beqz $0,j6

j6:
 halt
