#!/usr/bin/python
import regex
import sys

with open(sys.argv[2]) as myfile:
    sequence = myfile.read().replace('\n',' ').upper()
p = regex.compile(" (?:TGCAAGCGTTAAT){s<=" + sys.argv[1] + "}")
print(len(p.findall(sequence, overlapped=True)))
