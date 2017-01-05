#!/bin/bash
BIN=./scan_for_matches/scan_for_matches

for i in {0..3}
do
  echo -n $i ' '
  /usr/bin/time -f "%e" $BIN pat$i.txt < ../hg18/chr1.fa > /dev/null
done
