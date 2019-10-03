.data

#array: .space 104
array: .double 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13

.text

main:
  ori r3, r0, 0x58

loop:
  l.d f0, array(r1)
  beq r1, r3, jexit
  add.d f1, f1, f0
  j loop
  daddi r1, r1, 8

jexit:
  daddi r1, r1, 8
  s.d f0, array(r1)
  halt
