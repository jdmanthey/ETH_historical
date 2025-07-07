#!/bin/bash
#SBATCH --chdir=./
#SBATCH --job-name=cat
#SBATCH --partition nocona
#SBATCH --nodes=1 --ntasks=1
#SBATCH --time=48:00:00
#SBATCH --mem-per-cpu=8G
#SBATCH --array=1-51

# define main working directory
workdir=/lustre/scratch/jmanthey/04_ethiopia_historical

basename_array=$( head -n${SLURM_ARRAY_TASK_ID} ${workdir}/cat_hist.txt | tail -n1 )


cat ${workdir}/Novaseq1/${basename_array}_*R1*.fastq.gz >> \
${workdir}/00_fastq_h/${basename_array}_R1.fastq.gz

cat ${workdir}/ethiopia_historical_run2/${basename_array}_*R1*.fastq.gz >> \
${workdir}/00_fastq_h/${basename_array}_R1.fastq.gz

cat ${workdir}/ethiopia_historical_run3/${basename_array}_*R1*.fastq.gz >> \
${workdir}/00_fastq_h/${basename_array}_R1.fastq.gz

cat ${workdir}/Novaseq1/${basename_array}_*R2*.fastq.gz >> \
${workdir}/00_fastq_h/${basename_array}_R2.fastq.gz

cat ${workdir}/ethiopia_historical_run2/${basename_array}_*R2*.fastq.gz >> \
${workdir}/00_fastq_h/${basename_array}_R2.fastq.gz

cat ${workdir}/ethiopia_historical_run3/${basename_array}_*R2*.fastq.gz >> \
${workdir}/00_fastq_h/${basename_array}_R2.fastq.gz

