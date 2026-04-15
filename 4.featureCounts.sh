#!/bin/bash

#Activate your conda environment with featureCounts installed 
#sudo apt install subread

#Paths to the input BAM files, the genome annotation file, and the output directory
BAM_DIR=/choose/your/path
ANNOTATION_FILE=/choose/your/path/genome.gtf
OUTPUT_DIR=/choose/your/path/Results

#Create output directory if it does not exist
mkdir -p $OUTPUT_DIR

# Run featureCounts for paired-end reads
featureCounts -p \
			  -s 2 \
			  -T 8 \
			  -t exon \
			  -g gene_id \
			  -a $ANNOTATION_FILE \
			  -o $OUTPUT_DIR/countsFV.txt $BAM_DIR/*_sorted.bam

#Process the FeatureCounts Matrix to keep only the columns needed in downstream analysis. The mod_counts.txt file is the modified.
cut -f1,7- $OUTPUT_DIR/counts.txt > $OUTPUT_DIR/mod_counts.txt

# Additional processing to clean up the column names (optional)
# You can edit the file manually using a text editor or further automate the process if needed

echo "Read counting complete. Results are in the Counts directory."
