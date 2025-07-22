#!/bin/sh
#SBATCH --chdir=./
#SBATCH --job-name=merge2
#SBATCH --nodes=1
#SBATCH --ntasks=4
#SBATCH --partition=nocona
#SBATCH --time=48:00:00
#SBATCH --mem-per-cpu=8G
#SBATCH --array=1-30

source activate bcftools

# define main working directory
workdir=/lustre/scratch/jmanthey/04_ethiopia_historical

# define variables
region_array=$( head -n${SLURM_ARRAY_TASK_ID} ${workdir}/scaffolds.txt | tail -n1 )

# run bcftools to merge the vcf files
bcftools merge -m id --regions ${region_array} ${workdir}/03b_vcf/*vcf.gz > ${workdir}/04b_vcf/${region_array}.vcf

bcftools merge -m id --regions ${region_array} ${workdir}/03c_vcf/*vcf.gz > ${workdir}/04c_vcf/${region_array}.vcf

# max missing = two individuals for heterozygosity; keep invariant
vcftools --vcf ${workdir}/04b_vcf/${region_array}.vcf --keep cossypha.txt \
--max-missing 0.85 --max-alleles 2 --max-maf 0.49 --recode --recode-INFO-all \
--out ${workdir}/06b_stats/cossypha_het_${region_array}

vcftools --vcf ${workdir}/04b_vcf/${region_array}.vcf --keep cristrio.txt \
--max-missing 0.83 --max-alleles 2 --max-maf 0.49 --recode --recode-INFO-all \
--out ${workdir}/06b_stats/cristrio_het_${region_array}

vcftools --vcf ${workdir}/04b_vcf/${region_array}.vcf --keep critrist.txt \
--max-missing 0.87 --max-alleles 2 --max-maf 0.49 --recode --recode-INFO-all \
--out ${workdir}/06b_stats/critrist_het_${region_array}

vcftools --vcf ${workdir}/04b_vcf/${region_array}.vcf --keep melaenornis.txt \
--max-missing 0.83 --max-alleles 2 --max-maf 0.49 --recode --recode-INFO-all \
--out ${workdir}/06b_stats/melaenornis_het_${region_array}

vcftools --vcf ${workdir}/04b_vcf/${region_array}.vcf --keep nectarinia.txt \
--max-missing 0.85 --max-alleles 2 --max-maf 0.49 --recode --recode-INFO-all \
--out ${workdir}/06b_stats/nectarinia_het_${region_array}

vcftools --vcf ${workdir}/04b_vcf/${region_array}.vcf --keep sylvia.txt \
--max-missing 0.80 --max-alleles 2 --max-maf 0.49 --recode --recode-INFO-all \
--out ${workdir}/06b_stats/sylvia_het_${region_array}

vcftools --vcf ${workdir}/04b_vcf/${region_array}.vcf --keep turdus.txt \
--max-missing 0.87 --max-alleles 2 --max-maf 0.49 --recode --recode-INFO-all \
--out ${workdir}/06b_stats/turdus_het_${region_array}

vcftools --vcf ${workdir}/04b_vcf/${region_array}.vcf --keep zosterops.txt \
--max-missing 0.85 --max-alleles 2 --max-maf 0.49 --recode --recode-INFO-all \
--out ${workdir}/06b_stats/zosterops_het_${region_array}


vcftools --vcf ${workdir}/04c_vcf/${region_array}.vcf --keep cossypha.txt \
--max-missing 0.85 --max-alleles 2 --max-maf 0.49 --recode --recode-INFO-all \
--out ${workdir}/06c_stats/cossypha_het_${region_array}

vcftools --vcf ${workdir}/04c_vcf/${region_array}.vcf --keep cristrio.txt \
--max-missing 0.83 --max-alleles 2 --max-maf 0.49 --recode --recode-INFO-all \
--out ${workdir}/06c_stats/cristrio_het_${region_array}

vcftools --vcf ${workdir}/04c_vcf/${region_array}.vcf --keep critrist.txt \
--max-missing 0.87 --max-alleles 2 --max-maf 0.49 --recode --recode-INFO-all \
--out ${workdir}/06c_stats/critrist_het_${region_array}

vcftools --vcf ${workdir}/04c_vcf/${region_array}.vcf --keep melaenornis.txt \
--max-missing 0.83 --max-alleles 2 --max-maf 0.49 --recode --recode-INFO-all \
--out ${workdir}/06c_stats/melaenornis_het_${region_array}

vcftools --vcf ${workdir}/04c_vcf/${region_array}.vcf --keep nectarinia.txt \
--max-missing 0.85 --max-alleles 2 --max-maf 0.49 --recode --recode-INFO-all \
--out ${workdir}/06c_stats/nectarinia_het_${region_array}

vcftools --vcf ${workdir}/04c_vcf/${region_array}.vcf --keep sylvia.txt \
--max-missing 0.80 --max-alleles 2 --max-maf 0.49 --recode --recode-INFO-all \
--out ${workdir}/06c_stats/sylvia_het_${region_array}

vcftools --vcf ${workdir}/04c_vcf/${region_array}.vcf --keep turdus.txt \
--max-missing 0.87 --max-alleles 2 --max-maf 0.49 --recode --recode-INFO-all \
--out ${workdir}/06c_stats/turdus_het_${region_array}

vcftools --vcf ${workdir}/04c_vcf/${region_array}.vcf --keep zosterops.txt \
--max-missing 0.85 --max-alleles 2 --max-maf 0.49 --recode --recode-INFO-all \
--out ${workdir}/06c_stats/zosterops_het_${region_array}
