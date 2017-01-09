#!/bin/bash
BIN=./nrgrep-1.1.2/nrgrep
DATA=../hg18/chr1_nonl.fa

for i in {0..5}; do
  echo -n $i ' '
  /usr/bin/time -f "%e" $BIN -c -k "${i}s" "TGCAAGCGTTAAT" \
    $DATA > /dev/null
  # extract number of matches: | cut -d ' ' -f 2
done &> nrgrep_short.out

for i in {0..5}; do
  echo -n $i ' '
  /usr/bin/time -f "%e" $BIN -c -k "${i}s" "GCCCAGAGAACTTTCAGGATGACACCAGCAAGG" \
    $DATA > /dev/null
done &> nrgrep_long.out

for i in {0..5}; do
  echo -n $i ' '
  /usr/bin/time -f "%e" $BIN -c -k "${i}s" "GCCCAGAGA|ACTTTCAGGA" \
    $DATA > /dev/null
done &> nrgrep_alternation.out

# repetitions does not appear to be supported by NR-grep so the pattern
#   /GGGTGCAAGCGTTAAT/<k>{50,350} /AGCGTGGGGAGCAAAC/<k>
# is highly inconvenient to run with NR-grep
