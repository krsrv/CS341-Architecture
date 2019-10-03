#!/bin/bash
ROOT=~/Arch/lab7/dineroIV
SRC=$ROOT/d4-7
INPDIR=$ROOT/traces
OUTDIR=$ROOT/outputs/table

for file in $(ls $INPDIR);
do
  echo $file
  output=${file/%din/out}
  $SRC/dineroIV -informat d -l1-usize 8192 -l1-ubsize 16 -l1-uccc -maxcount 500000 <$INPDIR/$file >$OUTDIR/1-$output
  $SRC/dineroIV -informat d -l1-usize 16384 -l1-ubsize 16 -l1-uccc -maxcount 500000 <$INPDIR/$file >$OUTDIR/2-$output
  $SRC/dineroIV -informat d -l1-uassoc 2 -l1-usize 16384 -l1-ubsize 16 -l1-uccc -maxcount 500000 <$INPDIR/$file >$OUTDIR/3-$output
  $SRC/dineroIV -informat d -l1-uassoc 2 -l1-usize 16384 -l1-ubsize 32 -l1-uccc -maxcount 500000 <$INPDIR/$file >$OUTDIR/4-$output
  $SRC/dineroIV -informat d -l1-dassoc 2 -l1-dsize 8192 -l1-dbsize 32 -l1-iassoc 2 -l1-isize 8192 -l1-ibsize 32 -l1-iccc -l1-dccc -maxcount 500000 <$INPDIR/$file >$OUTDIR/5-$output
  $SRC/dineroIV -informat d -l1-dassoc 2 -l1-dsize 8192 -l1-dbsize 32 -l1-iassoc 2 -l1-isize 8192 -l1-ibsize 32 -l1-iccc -l1-dccc -l2-usize 131072 -l2-ubsize 32 -l2-uassoc 2 -l2-uccc -maxcount 500000 <$INPDIR/$file >$OUTDIR/6-$output
done
