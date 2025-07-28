# process transversions

source activate bcftools

rm *_Z.subset.vcf
rm *_4A.subset.vcf

grep "^#CHROM" cossypha_25.subset.vcf > cossypha.vcf

for i in $( ls cossypha_*.subset.vcf ); do grep -v "^#" $i >> cossypha.vcf; done


grep "^#CHROM" cristrio_25.subset.vcf > cristrio.vcf

for i in $( ls cristrio_*.subset.vcf ); do grep -v "^#" $i >> cristrio.vcf; done


grep "^#CHROM" critrist_25.subset.vcf > critrist.vcf

for i in $( ls critrist_*.subset.vcf ); do grep -v "^#" $i >> critrist.vcf; done


grep "^#CHROM" melaenornis_25.subset.vcf > melaenornis.vcf

for i in $( ls melaenornis_*.subset.vcf ); do grep -v "^#" $i >> melaenornis.vcf; done


grep "^#CHROM" nectarinia_25.subset.vcf > nectarinia.vcf

for i in $( ls nectarinia_*.subset.vcf ); do grep -v "^#" $i >> nectarinia.vcf; done


grep "^#CHROM" sylvia_25.subset.vcf > sylvia.vcf

for i in $( ls sylvia_*.subset.vcf ); do grep -v "^#" $i >> sylvia.vcf; done


grep "^#CHROM" turdus_25.subset.vcf > turdus.vcf

for i in $( ls turdus_*.subset.vcf ); do grep -v "^#" $i >> turdus.vcf; done


grep "^#CHROM" zosterops_25.subset.vcf > zosterops.vcf

for i in $( ls zosterops_*.subset.vcf ); do grep -v "^#" $i >> zosterops.vcf; done



# filter for genetic distances

vcftools --vcf cossypha.vcf --thin 5000 --max-missing 1.00 --recode --recode-INFO-all --out cossypha

vcftools --vcf cristrio.vcf --thin 5000 --max-missing 1.00 --recode --recode-INFO-all --out cristrio

vcftools --vcf critrist.vcf --thin 5000 --max-missing 1.00 --recode --recode-INFO-all --out critrist

vcftools --vcf melaenornis.vcf --thin 5000 --max-missing 1.00 --recode --recode-INFO-all --out melaenornis

vcftools --vcf nectarinia.vcf --thin 5000 --max-missing 1.00 --recode --recode-INFO-all --out nectarinia

vcftools --vcf sylvia.vcf --thin 5000 --max-missing 1.00 --recode --recode-INFO-all --out sylvia

vcftools --vcf turdus.vcf --thin 5000 --max-missing 1.00 --recode --recode-INFO-all --out turdus

vcftools --vcf zosterops.vcf --thin 5000 --max-missing 1.00 --recode --recode-INFO-all --out zosterops


# remove individual scaffolds
rm *subset*






