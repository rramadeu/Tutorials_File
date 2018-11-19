#!/bin/bash
#SBATCH --job-name=MyJob    # Job name
#SBATCH --mail-type=END,FAIL          # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=rramadeu@ufl.edu     # Where to send mail   
#SBATCH --nodes=1                     # Run on a single node
#SBATCH --ntasks=1                    # Run on a single task (single R file)
#SBATCH --cpus-per-task=5             # number of threads per node (MAX=32)
#SBATCH --mem=16gb                     # Job memory request per node (MAX=128gb)
#SBATCH --time=1:00:00               # Time limit hrs:min:sec (MAX=96h)
#SBATCH --output=%j.log   # Standard output and error log
#SBATCH --account=munoz
#SBATCH --qos=munoz

date
 
module load R/3.5.1
 
Rscript MyScript.R

date
