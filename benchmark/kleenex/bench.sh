#!/bin/bash
BIN=./msc-peter/.stack-work/dist/x86_64-linux/Cabal-1.22.4.0/build/kexc/kexc
K=2

echo "Generating approximate kleenex programs..."
for ((i=0;i<K;i++)); do
  ./gen_kleenex.sh template_short.txt $i > short$i.kex
  ./gen_kleenex.sh template_repetitions.txt $i > repetitions$i.kex
done

echo "Compilling approximate kleenex programs..."
for ((i=0;i<K;i++)); do
  echo "short$i.kex"
  [ -f "short$i" ] || $BIN compile short$i.kex --metric Hamming --out short$i

  echo "repetitions$i.kex"
  [ -f "repetitions$i" ] || $BIN compile repetitions$i.kex --metric Hamming --out repetitions$i
done

echo "Running..."
for ((i=0;i<K;i++)); do
  echo -n $i ' '
  /usr/bin/time -f "%e" ./short$i < ../hg18/chr1.fa > /dev/null
done &> short.out

for ((i=0;i<K;i++)); do
  echo -n $i ' '
  /usr/bin/time -f "%e" ./repetitions$i < ../hg18/chr1.fa > /dev/null
done &> repetitions.out
