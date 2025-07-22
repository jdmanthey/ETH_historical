#!/bin/sh
#SBATCH --chdir=./
#SBATCH --job-name=filt_2b
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --partition=nocona
#SBATCH --time=48:00:00
#SBATCH --mem-per-cpu=8G
#SBATCH --array=1-30

source activate bcftools

# define main working directory
workdir=/lustre/scratch/jmanthey/04_ethiopia_historical

# define variables
region_array=$( head -n${SLURM_ARRAY_TASK_ID} ${workdir}/scaffolds.txt | tail -n1 )

# max missing = none for PCA and SplitsTree
vcftools --vcf ${workdir}/04b_vcf/${region_array}.vcf --keep cossypha.txt \
--max-missing 1.0 --min-alleles 2 --max-alleles 2 --max-maf 0.49 --mac 2 \
--recode --recode-INFO-all --out ${workdir}/05b_pca/cossypha_pca_${region_array}

vcftools --vcf ${workdir}/04b_vcf/${region_array}.vcf --keep cristrio.txt \
--max-missing 1.0 --min-alleles 2 --max-alleles 2 --max-maf 0.49 --mac 2 \
--recode --recode-INFO-all --out ${workdir}/05b_pca/cristrio_pca_${region_array}

vcftools --vcf ${workdir}/04b_vcf/${region_array}.vcf --keep critrist.txt \
--max-missing 1.0 --min-alleles 2 --max-alleles 2 --max-maf 0.49 --mac 2 \
--recode --recode-INFO-all --out ${workdir}/05b_pca/critrist_pca_${region_array}

vcftools --vcf ${workdir}/04b_vcf/${region_array}.vcf --keep melaenornis.txt \
--max-missing 1.0 --min-alleles 2 --max-alleles 2 --max-maf 0.49 --mac 2 \
--recode --recode-INFO-all --out ${workdir}/05b_pca/melaenornis_pca_${region_array}

vcftools --vcf ${workdir}/04b_vcf/${region_array}.vcf --keep nectarinia.txt \
--max-missing 1.0 --min-alleles 2 --max-alleles 2 --max-maf 0.49 --mac 2 \
--recode --recode-INFO-all --out ${workdir}/05b_pca/nectarinia_pca_${region_array}

vcftools --vcf ${workdir}/04b_vcf/${region_array}.vcf --keep sylvia.txt \
--max-missing 1.0 --min-alleles 2 --max-alleles 2 --max-maf 0.49 --mac 2 \
--recode --recode-INFO-all --out ${workdir}/05b_pca/sylvia_pca_${region_array}

vcftools --vcf ${workdir}/04b_vcf/${region_array}.vcf --keep turdus.txt \
--max-missing 1.0 --min-alleles 2 --max-alleles 2 --max-maf 0.49 --mac 2 \
--recode --recode-INFO-all --out ${workdir}/05b_pca/turdus_pca_${region_array}

vcftools --vcf ${workdir}/04b_vcf/${region_array}.vcf --keep zosterops.txt \
--max-missing 1.0 --min-alleles 2 --max-alleles 2 --max-maf 0.49 --mac 2 \
--recode --recode-INFO-all --out ${workdir}/05b_pca/zosterops_pca_${region_array}


# max missing = two individuals for load; only biallelic sites
vcftools --vcf ${workdir}/04b_vcf/${region_array}.vcf --keep cossypha.txt \
--max-missing 0.85 --min-alleles 2 --max-alleles 2 --max-maf 0.49 --recode --recode-INFO-all \
--out ${workdir}/08b_load/cossypha_load_${region_array}

vcftools --vcf ${workdir}/04b_vcf/${region_array}.vcf --keep cristrio.txt \
--max-missing 0.81 --min-alleles 2 --max-alleles 2 --max-maf 0.49 --recode --recode-INFO-all \
--out ${workdir}/08b_load/cristrio_load_${region_array}

vcftools --vcf ${workdir}/04b_vcf/${region_array}.vcf --keep critrist.txt \
--max-missing 0.87 --min-alleles 2 --max-alleles 2 --max-maf 0.49 --recode --recode-INFO-all \
--out ${workdir}/08b_load/critrist_load_${region_array}

vcftools --vcf ${workdir}/04b_vcf/${region_array}.vcf --keep melaenornis.txt \
--max-missing 0.83 --min-alleles 2 --max-alleles 2 --max-maf 0.49 --recode --recode-INFO-all \
--out ${workdir}/08b_load/melaenornis_load_${region_array}

vcftools --vcf ${workdir}/04b_vcf/${region_array}.vcf --keep nectarinia.txt \
--max-missing 0.84 --min-alleles 2 --max-alleles 2 --max-maf 0.49 --recode --recode-INFO-all \
--out ${workdir}/08b_load/nectarinia_load_${region_array}

vcftools --vcf ${workdir}/04b_vcf/${region_array}.vcf --keep sylvia.txt \
--max-missing 0.80 --min-alleles 2 --max-alleles 2 --max-maf 0.49 --recode --recode-INFO-all \
--out ${workdir}/08b_load/sylvia_load_${region_array}

vcftools --vcf ${workdir}/04b_vcf/${region_array}.vcf --keep turdus.txt \
--max-missing 0.87 --min-alleles 2 --max-alleles 2 --max-maf 0.49 --recode --recode-INFO-all \
--out ${workdir}/08b_load/turdus_load_${region_array}

vcftools --vcf ${workdir}/04b_vcf/${region_array}.vcf --keep zosterops.txt \
--max-missing 0.85 --min-alleles 2 --max-alleles 2 --max-maf 0.49 --recode --recode-INFO-all \
--out ${workdir}/08b_load/zosterops_load_${region_array}

# copy load files for transversions conversion in transversions directory
cp ${workdir}/08b_load/cossypha_load_${region_array}.recode.vcf ${workdir}/07b_transversions/cossypha_${region_array}.recode.vcf

cp ${workdir}/08b_load/cristrio_load_${region_array}.recode.vcf ${workdir}/07b_transversions/cristrio_${region_array}.recode.vcf

cp ${workdir}/08b_load/critrist_load_${region_array}.recode.vcf ${workdir}/07b_transversions/critrist_${region_array}.recode.vcf

cp ${workdir}/08b_load/melaenornis_load_${region_array}.recode.vcf ${workdir}/07b_transversions/melaenornis_${region_array}.recode.vcf

cp ${workdir}/08b_load/nectarinia_load_${region_array}.recode.vcf ${workdir}/07b_transversions/nectarinia_${region_array}.recode.vcf

cp ${workdir}/08b_load/sylvia_load_${region_array}.recode.vcf ${workdir}/07b_transversions/sylvia_${region_array}.recode.vcf

cp ${workdir}/08b_load/turdus_load_${region_array}.recode.vcf ${workdir}/07b_transversions/turdus_${region_array}.recode.vcf

cp ${workdir}/08b_load/zosterops_load_${region_array}.recode.vcf ${workdir}/07b_transversions/zosterops_${region_array}.recode.vcf


# extract header for transversions subset
grep "^#" ${workdir}/07b_transversions/cossypha_${region_array}.recode.vcf > \
${workdir}/07b_transversions/cossypha_${region_array}.subset.vcf

# extract transversions
Rscript _extract_transversions.r ${workdir}/07b_transversions/cossypha_${region_array}.recode.vcf \
${workdir}/07b_transversions/cossypha_${region_array}.subset.vcf

# remove intermediate unneeded vcfs 
rm ${workdir}/07b_transversions/cossypha_${region_array}.recode.vcf










