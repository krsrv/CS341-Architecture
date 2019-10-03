.text
main:
 daddi r1,r0,array
 daddi r2,r1,3904

subset:
 l.d f0,0(r1)
 l.d f1,8(r1)
 l.d f2,16(r1)
 l.d f3,24(r1)
 l.d f4,32(r1)
 l.d f5,40(r1)
 l.d f6,48(r1)
 l.d f7,56(r1)

 add.d f8,f0,f1
 add.d f9,f2,f3
 add.d f10,f4,f5
 add.d f11,f6,f7

 add.d f12,f12,f8
 add.d f13,f13,f9
 add.d f14,f14,f10
 add.d f15,f15,f11

 bne r1,r2,subset
 daddi r1, r1, 64

 l.d f0,64(r2)
 l.d f1,72(r2)
 l.d f2,80(r2)
 l.d f3,88(r2)

 add.d f12,f12,f0
 add.d f13,f13,f1
 add.d f14,f14,f2
 add.d f15,f15,f3
  
 add.d f12,f12,f13
 add.d f14,f14,f15
 add.d f15,f12,f14
 s.d f15, 96(r2)
 halt

.data

array: .double 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 2.0, 2.0, 2.0, 2.0, 1.0, 1.0
