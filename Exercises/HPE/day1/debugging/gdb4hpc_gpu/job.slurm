#!/bin/bash -l
 
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --ntasks-per-node=1
##SBATCH --cpus-per-task=1
#SBATCH --time=00:10:00
#SBATCH --exclusive
#SBATCH --gres=gpu:1

module load PrgEnv-cray craype-accel-amd-gfx90a craype-x86-trento rocm

export LD_LIBRARY_PATH=${CRAY_LD_LIBRARY_PATH}:${LD_LIBRARY_PATH}

time srun ./hip.x
