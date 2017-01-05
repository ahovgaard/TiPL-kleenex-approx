#!/bin/bash
BIN=./approx_match.py

for i in {0..5}
do
  echo -n $i ' '
  /usr/bin/time -f "%e" $BIN $i ../hg18/chr1.fa
done
