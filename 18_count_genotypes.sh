#!/bin/sh
#SBATCH --chdir=./
#SBATCH --job-name=het
#SBATCH --nodes=1 --ntasks=1
#SBATCH --partition quanah
#SBATCH --time=48:00:00
#SBATCH --mem-per-cpu=8G
#SBATCH --array=1-8


# define variables
input=$( head -n${SLURM_ARRAY_TASK_ID} input_vcf_files.txt | tail -n1 )
output=${input%.vcf}_het.txt

# count number of columns in vcf
number=$( awk '{print NF; exit}' $input )

# loop to get genotypes for each individual
for i in $(seq 10 $number); do 
sampname=$( head -n1 $input | cut -f $i );
echo "${sampname}" >> $output;
cut -f $i $input | cut -c 1-3 | grep "0/0" | wc -l >> $output;
cut -f $i $input | cut -c 1-3 | grep "0/1" | wc -l >> $output;
cut -f $i $input | cut -c 1-3 | grep "1/1" | wc -l >> $output;
cut -f $i $input | cut -c 1-3 | grep "\\./\\." | wc -l >> $output;
done

