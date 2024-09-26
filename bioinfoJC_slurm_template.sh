#!/usr/bin/env bash
#SBATCH --job-name=JOB_NAME  # name that will appear on queue
#SBATCH --time=HH:MM:SS  # time limit
#SBATCH --partition=PARTITION_NAME  # name of partition to submit jobs to 
#SBATCH --nodes=1  # number of nodes (1 is good)
#SBATCH --cpus-per-task=NUMBER_OF_CPUS  # number of cores/CPUs
#SBATCH -o %j.out  # std out file   
#SBATCH -e %j.err  # std err file 

eval "$(conda shell.bash hook)"
conda activate kaiju 

#codes
kaiju -help
