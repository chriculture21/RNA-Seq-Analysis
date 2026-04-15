#This script runs through all the fasta files generated from an RNA-Seq Illumina run, 
#and creates html files to assess the quality of the reads, as well as the final filtered and clean files for analysis. 

#!/bin/bash
set -euo pipefail

#Install FastQC and Fastp if not previously installed
#sudo apt install fastqc
#sudo apt install fastp
#if you don't have space in your local computer and you want to save your results in an external disk drive, 
#then you have to specify the path with /mnt/.....otherwise you use -p and you do it in your parent location

#Create directories for the output
mkdir /choose/your/path #mkdir creates a folder in your specified path
cd /choose/your/path #with cd you move to the folder of interest
mkdir FastQC_Results Preprocessed_FASTQ #Create the two folders

#Loop through all FASTQ files in the input directory
for file in /choose/your/path/*.fq.gz; do #the star here represents the basename, and the path is the input folder
    #Extract the file name without the path and extension
    filename=$(basename $file .fq.gz)
    
    #Run FastQC
    fastqc $file --outdir=FastQC_Results #the results are stored in the FastQC_Results folder created previously with mkdir
    
    #Run Fastp to trimm and filter adapters and low-quality sequences
    fastp \
    -i $file \
    -o Preprocessed_FASTQ/${filename}_trimmed.fastq \
    -h Preprocessed_FASTQ/${filename}_fastp.html \
    -j Preprocessed_FASTQ/${filename}_fastp.json #all these files are stored in the Preprocessed_FASTQ folder created with mkdir

done

echo "Preprocessing complete. fastQC results are in FastQC_Results folder and processed files are stored in the Preprocessed_FASTQ directory." 
