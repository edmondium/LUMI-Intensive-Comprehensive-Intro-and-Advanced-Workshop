#!/bin/bash

#SBATCH -J deadlock
#SBATCH -A project_465001098
#SBATCH -p standard
#SBATCH -t 10
#SBATCH -N 1
#SBATCH -n 2
#SBATCH --exclusive

srun -n 2 ./deadlock
