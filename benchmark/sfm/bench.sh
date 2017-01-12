#!/bin/bash
BIN=./scan_for_matches/scan_for_matches
DATA=../hg18/chr1.fa
K=5

declare -a progs=("short" "long" "alternation" "ranges")

echo "Generating scan_for_matches pattern files..."
for prog in "${progs[@]}"; do
  echo "  $prog"
  for ((k=0;k<=K;k++)); do
    ./gen.sh template_$prog.txt $k > $prog$k
  done
done

# incr-length
echo "  incr-length"
for ((i=0;i<=50;i=$i+10)); do
  for ((k=0;k<=K;k++)); do
    ./gen_incr-length.sh template_incr-length.txt $k $i > incr-length${k}_${i}
  done
done
echo

echo "Running..."
for prog in "${progs[@]}"; do
  echo "  $prog"
  for ((k=0;k<=K;k++)); do
    echo -n $k ' '
    /usr/bin/time -f "%e" $BIN $prog$k < $DATA > /dev/null
  done &> sfm_$prog.out
done

# incr-length case
echo "  incr-length"
for ((i=0;i<=50;i=$i+10)); do
  for ((k=0;k<=K;k++)); do
    echo -n $i $k ' '
    /usr/bin/time -f "%e" $BIN incr-length${k}_${i} < $DATA > /dev/null
  done
done &> sfm_incr-length.out
