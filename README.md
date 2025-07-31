# ETH_historical
shifts in diversity and differentiation through time in several Ethiopian highland bird species

# ethiopia_historical

Collection of scripts to analyze a set of historical and modern genomic sequencing datasets from eight species of Ethiopian highland birds. 


00_setup.sh – Reference genome info, indexing the reference, and setting up directory structure.

01_cat_files.sh – Concatenate input reads for each individual (if needed).

02_rename.sh – Rename any files as needed.

03_split_hist.sh – Splits up historical fastq files for parallelized processing.

04_dedup_hist1.sh – Remove duplicates (round 1) from split historical fastq files.

05_cat_hist.sh – Concatenate the output of the previous step for each individual.

06_dedup_hist2.sh – Remove duplicates (round 2) from the concatenated fastq files for each individual.

07_merge_hist.sh – Adapter trimming and merging pairs of reads that had small insert sizes.

06_qualtrim_hist.sh – Quality trimming and removal of low complexity reads. 

07_align_hist.sh – Align the historical fastq sequences to the reference genome, process the alignment file, and run mapdamage to correct quality scores in bam files.

08_qualtrim_hist.sh – quality trimming and low complexity removal for historical reads.

09_align_hist.sh – Align the historical fastq sequences to the reference genome and process the sam/bam files.

10_align_modern.sh – Align the modern fastq sequences to the reference genome and process the sam/bam files.

11_genotype.sh – Genotype with bcftools (Full dataset).

12_mapdamage_rescale.sh – Run mapdamage for all bam files (MD dataset).

13_downsample.sh – Downsample all bam files (DS dataset).

13.5_genotype2.sh - Genotype with bcftools (MD and DS datasets).

14_merge_filter(#).sh – Merge and filter the Full, MD, and DS datasets’ VCF files.

15_filter_more(#).sh – More filtering for additional downstream analyses.

16_cat_het_files.sh – Concatenate all the VCF files for counting genotypes.

17_count_genotypes.sh – Count genotypes in VCF files (for estimating heterozygosity).

18_pca.sh – Running PCA in PLINK for genetic structure analyses.

19_process_transversions.sh – Process the transversions VCF files.

20_snpeff.sh – Run SnpEff to estimate functional impacts of SNPs.

21_snpeff_transversions.sh – Run SnpEff to estimate functional impacts of SNPs in transversions datasets.

22_cat_snpeff_output.sh – Concatenate vcf files from SnpEff output and keep only variants that have low, moderate, or high impacts.

23_coverage.sh – estimate coverage in all samples.

All other, non-numbered files are helper files in functions used in above scripts.
