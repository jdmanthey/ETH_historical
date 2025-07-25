#!/bin/bash
#SBATCH --chdir=./
#SBATCH --job-name=align_stat
#SBATCH --partition nocona
#SBATCH --nodes=1 --ntasks=2
#SBATCH --time=48:00:00
#SBATCH --mem-per-cpu=8G
#SBATCH --array=1-106

source activate bcftools

threads=2

# define main working directory
workdir=/lustre/scratch/jmanthey/04_ethiopia_historical

# base name of fastq files, intermediate files, and output files
basename_array=$( head -n${SLURM_ARRAY_TASK_ID} ${workdir}/basenames.txt | tail -n1 )

# alignment stats
echo ${basename_array} > ${basename_array}.stats

# samtools depth sum of aligned sites
samtools depth  ${workdir}/01b_bam_files/${basename_array}_final.bam  |  awk '{sum+=$3} END { print sum }' >> ${basename_array}.stats

