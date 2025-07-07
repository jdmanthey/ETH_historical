# in interactive mode

cd /lustre/scratch/jmanthey/04_ethiopia_historical/00_fastq_h

while read -r name1 name2; do
	mv $name1 $name2
done < rename_h.txt

cd ../00_fastq_m

while read -r name1 name2; do
	mv $name1 $name2
done < rename_m.txt

