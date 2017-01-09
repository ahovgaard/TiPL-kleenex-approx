#!/bin/bash
BIN=./approx_match.py
BIN_RANGE=./range_pattern.py

for i in {0..5}
do
  echo -n $i ' '
  /usr/bin/time -f "%e" $BIN $i ../hg18/chr1.fa
done


# range the length of pattern
for i in {0..5}
do
  echo -n $i ' '
  /usr/bin/time -f "%e" $BIN_RANGE $i ../hg18/chr1.fa
done

# increased length of pattern
./gen_incr-length.sh
prog=incr-length
for i in {0..5}
do
    for((l=0;l<=50;l+=10)) do
       echo -n $
       /usr/bin/time -f "%e" ${prog}-${l}.py $i ../hg18/chr1.fa
    done
done
