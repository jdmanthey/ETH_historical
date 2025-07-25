#!/bin/sh
#SBATCH --chdir=./
#SBATCH --job-name=snpeff_t
#SBATCH --nodes=1 --ntasks=1
#SBATCH --partition nocona
#SBATCH --time=48:00:00
#SBATCH --mem-per-cpu=8G
#SBATCH --array=1-8

# define main working directory
workdir=/lustre/scratch/jmanthey/04_ethiopia_historical

# define variables
input=$( head -n${SLURM_ARRAY_TASK_ID} input_vcf_files.txt | tail -n1 )
output1=${input%.vcf}.ann.vcf
output2=${input%.vcf}.ann2.vcf


# run snpEff for this chromosome for this species
java -Xmx16g -jar ~/snpEff/snpEff.jar FicAlb1.5.105 \
${workdir}/07_transversions/${input} > \
${workdir}/07_transversions/${output1}

# keep only changes with low, moderate, or high impact
grep '|LOW|\||MODERATE|\||HIGH|' ${workdir}/07_transversions/${output1} \
> ${workdir}/07_transversions/${output2}



