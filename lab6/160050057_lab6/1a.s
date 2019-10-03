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

 add.d f14,f0,f1
 add.d f15,f2,f3
 add.d f16,f4,f5
 add.d f17,f6,f7
 add.d f18,f8,f9
 add.d f19,f10,f11

 add.d f20,f14,f15
 add.d f21,f16,f17
 add.d f22,f18,f19
 
 add.d f23,f20,f21
 add.d f24,f23,f22

 s.d f24, 96(r1)
 halt

