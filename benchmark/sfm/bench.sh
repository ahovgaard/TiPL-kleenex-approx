#!/bin/bash
BIN=./scan_for_matches/scan_for_matches
DATA=../hg18/chr1.fa
K=5

#for i in {0..3}
#do
#  echo -n $i ' '
#  /usr/bin/time -f "%e" $BIN pat$i.txt < ../hg18/chr1.fa > /dev/null
#done


declare -a progs=("short" "long" "alternation" "ranges")

echo "Generating scan_for_matches pattern files..."
for prog in "${progs[@]}"; do
  echo "  $prog"
  for ((i=0;i<=K;i++)); do
    ./gen.sh template_$prog.txt $i > $prog$i
  done
done
