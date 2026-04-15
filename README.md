# RNA-seq Analysis Pipeline

## Overview

This repository contains a complete bulk RNA-seq analysis workflow, from raw sequencing data preprocessing to downstream statistical analysis and visualization using DESeq2 in R.

The pipeline is divided into:
* Bash scripts for preprocessing (fastQC and fastp), genome indexing and alignment (HISAT2) and quantification (featureCounts)
* An R script for exploratory analysis, visualization, and differential gene expression analysis.
-----------------------------------------------------------------------------------
## Workflow Summary
1. **Preprocessing**
   * Quality control and preparation of raw sequencing reads using fastQC for the quality control, and fastp for dapter trimming and filtering of low-quality reads
2. **Indexing**
   * Reference genome indexing for the subsequent alignment
3. **Alignment**
   * Mapping reads to the reference genome
4. **Quantification**
   * Counting reads per gene using featureCounts
5. **Downstream Analysis (R)**
   * Data normalization
   * PCA and exploratory analysis
   * Differential expression analysis
   * Gene Ontology and KEGG pathway analysis
   * Visualization and interpretation
----------------------------------------------------------------------------------
## Repository Structure

```bash
.
├── preprocessing.sh        # Raw data preprocessing
├── indexing.sh             # Genome indexing
├── alignment.sh            # Read alignment
├── featureCounts.sh        # Gene-level quantification
└── analysis.R              # DESeq2 analysis and visualization
```
## Requirements
### Bash tools
* Quality control tools (FastQC)
* Trimming tool (fastp)
* Aligner (HISAT2)
* featureCounts (from Subread)

### R packages
* DESeq2
* ggplot2
* biomaRt
* clusterProfiler
--------------------------------------------------------------------------------

## Usage
### 1. Run preprocessing
```bash
bash 1.preprocessing.sh
```
### 2. Index the reference genome
```bash
bash 2.hisat2_indexing.sh
```
### 3. Align reads
```bash
bash 3.hisat2_alignment.sh
```
### 4. Count reads per gene
```bash
bash 4.featureCounts.sh
```
### 5. Perform statistical analysis in R
```r
source("analysis.R")
```
--------------------------------------------------------------------------------

## Analysis Highlights

The R workflow includes:
* Data transformation
* Principal Component Analysis (PCA)
* Differential expression analysis
* MA plots and visualization of results
* Biological interpretation of gene expression changes

--------------------------------------------------------------------------------

## Notes
* Ensure consistency between reference genome, annotation files, and alignment step.
* Sample metadata must match count matrix columns for DESeq2 analysis.
* Proper experimental design is critical for valid statistical results.
--------------------------------------------------------------------------------

## Author

Christos Tsoukas
