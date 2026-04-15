#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

#Indicate the directories for the input files (usually the processed, trimmed and filtered files, as well as the reference index)
INPUT=/choose/your/path #set the path to your desire
INDEX=/choose/your/path/Genome_Prefix #set the path to your desire
OUTPUT_DIR=/choose/your/path/ #indicate the output directory, where you will save the mapped reads

#Do some sanity checks before starting the alignment
echo "Checking input directory:"
ls "$INPUT" #lists all the files in the INPUT directory

mkdir -p "$OUTPUT_DIR" #create the directory where you will save the mapped reads

for r1 in $INPUT/*_1_trimmed.fastq; do
    sample=$(basename "$r1" _1_trimmed.fastq)
    r2=$INPUT/${sample}_2_trimmed.fastq

    echo "Processing sample: $sample"

    if [[ ! -f "$r2" ]]; then
        echo "ERROR: missing pair for $sample" >&2
        continue
    fi

    hisat2 -p 8 \
        -x "$INDEX" \
        -1 "$r1" \
        -2 "$r2" | \
		
	samtools sort -o "$OUTPUT_DIR/${sample}_sorted.bam"
	
	#Index BAM files and create the .bai file
    samtools index "$OUTPUT_DIR/${sample}_sorted.bam"
	
done
