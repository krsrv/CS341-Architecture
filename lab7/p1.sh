#!/bin/bash
ROOT=~/Arch/lab7/dineroIV
SRC=$ROOT/d4-7
INPDIR=$ROOT/traces
OUTDIR=$ROOT/outputs/cache

for bsize in {8,16,32,64,128};
do
  for csize in {4096,8192,16384,32768};
  do
	$SRC/dineroIV -informat d -l1-usize $csize -l1-ubsize $bsize -maxcount 500000 <$INPDIR/cc1.din >$OUTDIR/$bsize-$csize.out
	cat $OUTDIR/$bsize-$csize.out | head -36 | tail -1 | awk '{print $4;}'
  done
done
