# run in each directory where load was calculated

grep "^#C" cossypha_load_24.ann.vcf > cossypha.load.vcf

for i in $( ls cossypha_load_*.ann2.vcf ); do grep -v "^#" $i >> cossypha.load.vcf; done


grep "^#C" cristrio_load_24.ann.vcf > cristrio.load.vcf

for i in $( ls cristrio_load_*.ann2.vcf ); do grep -v "^#" $i >> cristrio.load.vcf; done


grep "^#C" critrist_load_24.ann.vcf > critrist.load.vcf

for i in $( ls critrist_load_*.ann2.vcf ); do grep -v "^#" $i >> critrist.load.vcf; done


grep "^#C" melaenornis_load_24.ann.vcf > melaenornis.load.vcf

for i in $( ls melaenornis_load_*.ann2.vcf ); do grep -v "^#" $i >> melaenornis.load.vcf; done


grep "^#C" nectarinia_load_24.ann.vcf > nectarinia.load.vcf

for i in $( ls nectarinia_load_*.ann2.vcf ); do grep -v "^#" $i >> nectarinia.load.vcf; done


grep "^#C" sylvia_load_24.ann.vcf > sylvia.load.vcf

for i in $( ls sylvia_load_*.ann2.vcf ); do grep -v "^#" $i >> sylvia.load.vcf; done


grep "^#C" turdus_load_24.ann.vcf > turdus.load.vcf

for i in $( ls turdus_load_*.ann2.vcf ); do grep -v "^#" $i >> turdus.load.vcf; done


grep "^#C" zosterops_load_24.ann.vcf > zosterops.load.vcf

for i in $( ls zosterops_load_*.ann2.vcf ); do grep -v "^#" $i >> zosterops.load.vcf; done

