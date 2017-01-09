#!/bin/bash
BIN=./msc-peter/.stack-work/dist/x86_64-linux/Cabal-1.22.4.0/build/kexc/kexc
DATA=../hg18/chr1_nonl.fa
K=2

declare -a progs=("short" "long" "alternation" "repetitions" "ranges")

echo "Generating approximate kleenex programs..."
for prog in "${progs[@]}"; do
  echo "  $prog"
  for ((i=0;i<=K;i++)); do
    ./gen_kleenex.sh template_$prog.txt $i > $prog$i.kex
  done
done

# The increasing length case is different because it generates many more kex files.
# Note that the length of patterns also increases the compiling time dramatically
incrprog="incr-length"
echo incrprog
for ((i=0;i<=K;i++)); do
    for((l=0;l<=50;l+=10)) do  
       ./gen_kleenex_${incrprog}.sh template_${incrprog}.txt $i $l > ${incrprog}-${l}_$i.kex
    done
done       


echo "Compilling approximate kleenex programs..."
for prog in "${progs[@]}"; do
  for ((i=0;i<=K;i++)); do
    echo "$prog$i.kex"
    [ -f "$prog$i" ] || $BIN compile $prog$i.kex --metric Hamming --out $prog$i
  done
done

# incr-length case
for ((i=0;i<=K;i++)); do
    for((l=0;l<=50;l+=10)) do  
       echo "${incrprog}-${l}_${i}.kex"
       [ -f "${incrprog}-${l}_${i}" ] || $BIN compile ${incrprog}-${l}_$i.kex --metric Hamming --out ${incrprog}-${l}_${i}
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


# incr-length case
for ((i=0;i<=K;i++)); do
    for((l=0;l<=50;l+=10)) do
       echo -n $i ' '
       /usr/bin/time -f "%e" ./${incrprog}-${l}_$i < $DATA > /dev/null
    done &> kleenex_${incrprog}-${l}$_${i}.out
done       
