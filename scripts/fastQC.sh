#!/bin/bash
#SBATCH --job-name=fastQC                      #Job name
#SBATCH --mail-type=ALL                        #Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=fanxiying@gmail.com        #where to send mail
#SBATCH --nodes=1                              #Number of nodes requested
#SBATCH --ntasks=1                             #Number of CPUs (processor cores/tasks)
#SBATCH --mem=10gb                             #Memory limit
#SBATCH --time=01:00:00                        #Time limit hrs:min:sec
#SBATCH --partition=compute                       #Patition/queue requested on server
#SBATCH --output=/Users/sharonfan2015/sr2023/day02/e_and_o/%x.%j.out  #standared output
#SBATCH --error=/Users/sharonfan2015/sr2023/day02/e_and_o/%x.%j.err  #standard error log

###Displays the job context
echo Job: $SLURM_JOB_NAME with ID $SLURM_JOB_ID
echo Running on host 'hostname'
echo Job stared at 'date + "%T %a %d %Y"'
echo Directory is 'pwd'
echo Using $SLURM_NTASKS processors across $SLURM_NODES nodes

### Assigan path variables
DIRECTORY=/Users/sharonfan2015/sr2023/day02

### Loads modules
module load fastqc/0.11.5

### Runs fastQC
fastqc \
--format fastq \
--threads 1 \
--outdir $DIRECTORY/fastQC/ \
$DIRECTORY/fastq/*.fastq

###Final time stamp
echo job finshed at 'date + "%T %a %d %Y"'

