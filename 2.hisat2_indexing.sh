#!/bin/bash
set -euo pipefail

#Give the path to the reference genome (fasta file), downloaded from an appropriate database such as Ensembl
REFERENCE=/choose/your/path/genome.fa

#Output index prefix (NOT a directory)
INDEX_PREFIX=/choose/your/path/Genome_Index/Genome_Prefix #this is the prefix of the files that will be generated after indexing

mkdir -p /choose/your/path/Genome_Index #create a folder to store the files after the genome indexing

echo "Building HISAT2 index..."
hisat2-build "$REFERENCE" "$INDEX_PREFIX" #the hisat2-build command takes the reference genome as input and generates the files with the prefix that we gave before

echo "HISAT2 index build complete."

