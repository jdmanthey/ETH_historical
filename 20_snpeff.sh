#!/bin/sh
#SBATCH --chdir=./
#SBATCH --job-name=snpeff1
#SBATCH --nodes=1 --ntasks=2
#SBATCH --partition quanah
#SBATCH --time=48:00:00
#SBATCH --mem-per-cpu=8G
#SBATCH --array=1-30

# define main working directory
workdir=/lustre/scratch/jmanthey/04_ethiopia_historical

# define input files from helper file during genotyping
region_array=$( head -n${SLURM_ARRAY_TASK_ID} ${workdir}/scaffolds.txt | tail -n1 )


# run snpEff for this chromosome for this species
java -Xmx16g -jar ~/snpEff/snpEff.jar FicAlb1.5.105 \
${workdir}/08_load/cossypha_load_${region_array}.recode.vcf > \
${workdir}/08_load/cossypha_load_${region_array}.ann.vcf

# keep only changes with low, moderate, or high impact
grep '|LOW|\||MODERATE|\||HIGH|' ${workdir}/08_load/cossypha_load_${region_array}.ann.vcf \
> ${workdir}/08_load/cossypha_load_${region_array}.ann2.vcf


# run snpEff for this chromosome for this species
java -Xmx16g -jar ~/snpEff/snpEff.jar FicAlb1.5.105 \
${workdir}/08_load/cristrio_load_${region_array}.recode.vcf > \
${workdir}/08_load/cristrio_load_${region_array}.ann.vcf

# keep only changes with low, moderate, or high impact
grep '|LOW|\||MODERATE|\||HIGH|' ${workdir}/08_load/cristrio_load_${region_array}.ann.vcf \
> ${workdir}/08_load/cristrio_load_${region_array}.ann2.vcf


# run snpEff for this chromosome for this species
java -Xmx16g -jar ~/snpEff/snpEff.jar FicAlb1.5.105 \
${workdir}/08_load/critrist_load_${region_array}.recode.vcf > \
${workdir}/08_load/critrist_load_${region_array}.ann.vcf

# keep only changes with low, moderate, or high impact
grep '|LOW|\||MODERATE|\||HIGH|' ${workdir}/08_load/critrist_load_${region_array}.ann.vcf \
> ${workdir}/08_load/critrist_load_${region_array}.ann2.vcf


# run snpEff for this chromosome for this species
java -Xmx16g -jar ~/snpEff/snpEff.jar FicAlb1.5.105 \
${workdir}/08_load/melaenornis_load_${region_array}.recode.vcf > \
${workdir}/08_load/melaenornis_load_${region_array}.ann.vcf

# keep only changes with low, moderate, or high impact
grep '|LOW|\||MODERATE|\||HIGH|' ${workdir}/08_load/melaenornis_load_${region_array}.ann.vcf \
> ${workdir}/08_load/melaenornis_load_${region_array}.ann2.vcf


# run snpEff for this chromosome for this species
java -Xmx16g -jar ~/snpEff/snpEff.jar FicAlb1.5.105 \
${workdir}/08_load/nectarinia_load_${region_array}.recode.vcf > \
${workdir}/08_load/nectarinia_load_${region_array}.ann.vcf

# keep only changes with low, moderate, or high impact
grep '|LOW|\||MODERATE|\||HIGH|' ${workdir}/08_load/nectarinia_load_${region_array}.ann.vcf \
> ${workdir}/08_load/nectarinia_load_${region_array}.ann2.vcf


# run snpEff for this chromosome for this species
java -Xmx16g -jar ~/snpEff/snpEff.jar FicAlb1.5.105 \
${workdir}/08_load/sylvia_load_${region_array}.recode.vcf > \
${workdir}/08_load/sylvia_load_${region_array}.ann.vcf

# keep only changes with low, moderate, or high impact
grep '|LOW|\||MODERATE|\||HIGH|' ${workdir}/08_load/sylvia_load_${region_array}.ann.vcf \
> ${workdir}/08_load/sylvia_load_${region_array}.ann2.vcf


# run snpEff for this chromosome for this species
java -Xmx16g -jar ~/snpEff/snpEff.jar FicAlb1.5.105 \
${workdir}/08_load/turdus_load_${region_array}.recode.vcf > \
${workdir}/08_load/turdus_load_${region_array}.ann.vcf

# keep only changes with low, moderate, or high impact
grep '|LOW|\||MODERATE|\||HIGH|' ${workdir}/08_load/turdus_load_${region_array}.ann.vcf \
> ${workdir}/08_load/turdus_load_${region_array}.ann2.vcf


# run snpEff for this chromosome for this species
java -Xmx16g -jar ~/snpEff/snpEff.jar FicAlb1.5.105 \
${workdir}/08_load/zosterops_load_${region_array}.recode.vcf > \
${workdir}/08_load/zosterops_load_${region_array}.ann.vcf

# keep only changes with low, moderate, or high impact
grep '|LOW|\||MODERATE|\||HIGH|' ${workdir}/08_load/zosterops_load_${region_array}.ann.vcf \
> ${workdir}/08_load/zosterops_load_${region_array}.ann2.vcf
