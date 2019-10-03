.data

array: .double 1,2,3,4,5,6,7,8,9,10,11,12,13

.text

main:
 daddi r1, r0, array
 l.d f0, 0(r1)
 l.d f1, 8(r1)
 l.d f2, 16(r1)
 l.d f3, 24(r1)
 l.d f4, 32(r1)
 l.d f5, 40(r1)
 l.d f6, 48(r1)
 l.d f7, 56(r1)
 l.d f8, 64(r1)
 l.d f9, 72(r1)
 l.d f10, 80(r1)
 l.d f11, 88(r1)

 add.d f0,f0,f1
 add.d f2,f2,f3
 add.d f4,f4,f5
 add.d f6,f6,f7
 add.d f8,f8,f9
 add.d f10,f10,f11

 add.d f0,f0,f2
 add.d f1,f4,f6
 add.d f2,f8,f10
 
 add.d f3,f0,f1
 add.d f4,f3,f2

 s.d f4, 96(r1)
 halt

