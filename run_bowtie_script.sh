#!/bin/bash
#SBATCH --job-name=kaiju_test
#SBATCH -p sched_mit_chisholm               # partition selection
#SBATCH -c 5                              # tasks (essentially threads)
#SBATCH --mem 100G
#SBATCH --time 1:00:00
#SBATCH --array=1-1%1
#SBATCH --exclude=node290
#SBATCH --output=logs/slurm-%x-%A-%a.out
#SBATCH --error=logs/slurm-%x-%A-%a.err

##### SET PATH VARIABLES #####
NAMESFILE=sample_names.lst

##### PARSE ARRAY ID #####
GENOMENAME=$(cat ${NAMESFILE} | awk -v LINENUMBER=${SLURM_ARRAY_TASK_ID} '{if ( NR == LINENUMBER ) {print $1}}')

mkdir results
mkdir results/index
mkdir results/bowtie2

##### Optional Bowtie script if kaiju does not work #####
bowtie2-build test_data/MED4_IMG_2606217259.fna results/index/MED4

##### Loop Through Samples - comment everything except echo ${sample} to ensure samples are loading correctly #####
for sample in ${GENOMENAME}
  do 
    ### Run Read Trimming ###
    bbduk.sh threads=1 in1=test_data/${sample}_1_sequence.fastq in2=test_data/${sample}_2_sequence.fastq out1=results/trimmed_reads/${sample}_1_trimmed.fastq.gz out2=results/trimmed_reads/${sample}_2_trimmed.fastq.gz minlen=25 qtrim=rl trimq=10 ref=/nfs/chisholmlab001/chisholmlab/genomic_resources/references/illumina/all_illumina_adapters.fa ktrim=r k=23 mink=11 hdist=1
    
    ### Run bowtie2 ###
    bowtie2 -p 16 -x results/index/MED4 -1 results/trimmed_reads/${sample}_1_trimmed.fastq.gz -2 results/trimmed_reads/${sample}_2_trimmed.fastq.gz -S results/bowtie2/${sample}.sam && samtools view -bS results/bowtie2/${sample}.sam | samtools sort -o results/bowtie2/${sample}_sorted_output.bam
    echo ${sample}
done
