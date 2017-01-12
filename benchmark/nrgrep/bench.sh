#!/bin/bash
BIN=./nrgrep-1.1.2/nrgrep
DATA=../hg18/chr1.fa

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

# It seems nrgrep doesnot support specifying the length range of pattern
# A possible solution could be using the pattern (...|....) to denote /./{3,4}
# But looks weird, may be done by some scripts 

# incr-length
for ((i=0;i<=50;i=$i+10)); do
  for k in {0..5}; do
    echo -n $i $k ' '
    a=$(printf '.%.0s' $(seq 0 $i))
    b="TGCAAGCGTTAAT"
    pat=${a::-1}$b
    /usr/bin/time -f "%e" $BIN -c -k "${k}s" $pat $DATA  > /dev/null
  done
done &> nrgrep_incr-length.out
