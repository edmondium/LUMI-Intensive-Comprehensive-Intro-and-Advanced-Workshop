#!/bin/bash

#SBATCH -J himeno

#SBATCH -t 30
#SBATCH -N 1
#SBATCH --ntasks-per-node=8
#SBATCH --exclusive

#NOW=$(date +"%S-%M-%H-%m-%d-%Y")

# Change the name of the perftools experiment file/directory
export PAT_RT_EXPDIR_NAME=trace_exp.${SLURM_JOBID}
export PAT_RT_PERFCTR=1

time srun -n 8 himeno.exe+pat > my_output.trace_exp.${SLURM_JOBID}  2>&1
