This directory contains the Build 36.1 finished human genome assembly
(hg18, Mar. 2006) in one gzip-compressed FASTA file per chromosome.
The chromosomal sequences were assembled by the International Human
Genome Project sequencing centers. 

Files included in this directory:

  - chr*.fa.gz: compressed FASTA sequence of each chromosome.
    Repeats from RepeatMasker and Tandem Repeats Finder (with period
    of 12 or less) are shown in lower case; non-repeating sequence is
    shown in upper case. Repeat masking was done using the following
    RepeatMasker/RepBase versions: RepBase Update 9.11, RM database 
    version 20050112. The main assembly is found in the chrN.fa
    files, where N is the name of the chromosome. The chrN_random.fa
    files contain clones that are not yet finished or cannot be placed
    with certainty at a specific place on the chromosome. In some
    cases, including the human HLA region on chromosome 6, the
    chrN_random.fa files also contain haplotypes that differ from the
    main assembly.

------------------------------------------------------------------
If you plan to download a large file or multiple files from this 
directory, we recommend that you use ftp rather than downloading the 
files via our website. To do so, ftp to hgdownload.cse.ucsc.edu, then 
go to the directory goldenPath/hg18/chromosomes. To download multiple 
files, use the "mget" command:

    mget <filename1> <filename2> ...
    - or -
    mget -a (to download all the files in the directory)

Alternate methods to ftp access.
    
Using an rsync command to download the entire directory:
    rsync -avzP rsync://hgdownload.cse.ucsc.edu/goldenPath/hg18/chromosomes/ .
For a single file, e.g. chrM.fa.gz
    rsync -avzP 
        rsync://hgdownload.cse.ucsc.edu/goldenPath/hg18/chromosomes/chrM.fa.gz .
    
Or with wget, all files:
    wget --timestamping 
        'ftp://hgdownload.cse.ucsc.edu/goldenPath/hg18/chromosomes/*'
With wget, a single file:
    wget --timestamping 
        'ftp://hgdownload.cse.ucsc.edu/goldenPath/hg18/chromosomes/chrM.fa.gz' 
        -O chrM.fa.gz
    
To uncompress the fa.gz files:
    gunzip <file>.fa.gz

All the files in this directory are freely available for public use.
