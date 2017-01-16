#!/usr/bin/python
# Based on code by Rasmus Fonseca from B.Sc. thesis of Maibom et. al.
import regex
import sys

re   = ""
prog = sys.argv[1]
k    = sys.argv[2]
data = sys.argv[3]
l    = ""
if len(sys.argv) > 4:
    l = sys.argv[4]  # only needed for incr-length

if prog == "short":
    re = r"(?:TGCAAGCGTTAAT){s<=" + k + "}"
elif prog == "long":
    re = r"(?:GCCCAGAGAACTTTCAGGATGACACCAGCAAGG){s<=" + k + "}"
elif prog == "alternation":
    re = r"(?:GCCCAGAGA|ACTTTCAGGA){s<=" + k + "}"
elif prog == "ranges":
    re = r"(?:([ACGT]{5,15}TGCAAGCGTTAAT)){s<=" + k + "}"
elif prog == "repetitions":
    re = r"((GGGTGC){s<=" + k + "}){10,50}(AGCGT){s<=" + k + "}"
elif prog == "incr-length":
    re = r"((.){" + l + "}TGCAAGCGTTAAT){s<=" + k + "}"
else:
    print("unknown program: " + prog)
    sys.exit(1)

with open(data) as myfile:
    sequence = myfile.read().replace('\n','').upper()
p = regex.compile(re)
print(p.findall(sequence, overlapped=False))
