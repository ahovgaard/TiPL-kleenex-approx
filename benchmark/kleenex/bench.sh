#!/bin/bash
BIN=./msc-peter/.stack-work/dist/x86_64-linux/Cabal-1.22.4.0/build/kexc/kexc
OUT=kleenex.out

echo "Compilling approximate kleenex programs..."
for i in {0..2}
do
  [ -f "pat$i" ] || $BIN compile pat$i.kex --metric Hamming --out pat$i
  #echo -n "$i "
done
echo

echo "Running..."
for i in {0..2}
do
  echo -n $i ' '
  #/usr/bin/time -f "%e" cat ../hg18/chr1.fa | ./pat$i > /dev/null
  /usr/bin/time -f "%e" ./pat$i < ../hg18/chr1.fa > /dev/null
done &> $OUT
