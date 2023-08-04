indir=/scratch/Users/sharonfan2015/day5/fastq/for_loops_fastq/
outdir=/scratch/Users/sharonfan2015/day5/output/

#make a new directory if it does not exist
mkdir -p $outdir

#llps through each file that end in .end1.fastq 
for pathandfilename in $(ls ${indir}*.end1.fastq)
do 
#pulls the path and .end1.fatq off of the file name
rootname=$(basename $pathandfilename .end1.fastq)
echo $rootname

#runs sbatch giving the script d5-fastq-to-bam.sbatch these vaibles
sbatch --export=indir=$indir,rootname=$rootname,outdir=$outdir d5-fastq-to-tdf.sbatch
done



