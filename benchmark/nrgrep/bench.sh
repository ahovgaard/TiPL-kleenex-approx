#!/bin/bash
BIN=./nrgrep-1.1.2/nrgrep

for i in {0..5}
do
  echo -n $i ' '
  /usr/bin/time -f "%e" $BIN -c -k "${i}s" "TGCAAGCGTTAAT" ../hg18/chr1.fa \
    > /dev/null
  # extract number of matches: | cut -d ' ' -f 2
done &> nrgrep_short.out

# repetitions does not appear to be supported by NR-grep so the pattern
#   /GGGTGCAAGCGTTAAT/<k>{50,350} /AGCGTGGGGAGCAAAC/<k>
# is highly inconvenient to run with NR-grep
