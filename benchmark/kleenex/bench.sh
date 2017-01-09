#!/bin/bash
BIN=./msc-peter/.stack-work/dist/x86_64-linux/Cabal-1.22.4.0/build/kexc/kexc
DATA=../hg18/chr1_nonl.fa
K=2

declare -a progs=("short" "long" "alternation" "repetitions" "ranges" "incr-length")

echo "Generating approximate kleenex programs..."
for prog in "${progs[@]}"; do
  echo "  $prog"
  for ((i=0;i<=K;i++)); do
    ./gen_kleenex.sh template_$prog.txt $i > $prog$i.kex
  done
done

echo "Compilling approximate kleenex programs..."
for prog in "${progs[@]}"; do
  for ((i=0;i<=K;i++)); do
    echo "$prog$i.kex"
    [ -f "$prog$i" ] || $BIN compile $prog$i.kex --metric Hamming --out $prog$i
  done
done

echo "Running..."
for prog in "${progs[@]}"; do
  echo "  $prog"
  for ((i=0;i<=K;i++)); do
    echo -n $i ' '
    /usr/bin/time -f "%e" ./$prog$i < $DATA > /dev/null
  done &> kleenex_$prog.out
done
