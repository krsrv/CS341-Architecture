.text

main:
 # RAW hazard
 # Line 7 has to wait for WB for Line 6 when forwarding is disabled
 daddi $1,$0,1
 dadd $2,$1,$0

 # RAW hazard
 # Line 13 still has to wait for WB for Line 11 when forwarding is disabled
 daddi $3,$0,1
 daddi $4,$0,1
 dadd $5,$3,$0

 # No RAW hazard
 # Line 20 starts executing after WB for Line 11 has been done
 daddi $6,$0,1
 daddi $7,$0,1
 daddi $8,$0,1
 dadd $9,$6,$0

 halt
