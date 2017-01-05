#!/bin/bash
BIN=./nrgrep-1.1.2/nrgrep

for i in {0..5}
do
  echo -n $i ' '
  /usr/bin/time -f "%e" $BIN -c -k "${i}s" "TGCAAGCGTTAAT" ../hg18/chr1.fa \
    > /dev/null
  # extract number of matches: | cut -d ' ' -f 2
done &> nrgrep.out
