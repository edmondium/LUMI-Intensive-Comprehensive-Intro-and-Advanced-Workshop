Load the environment

   module load PrgEnv-cray craype-accel-amd-gfx90a craype-x86-trento rocm
   export LD_LIBRARY_PATH=${CRAY_LD_LIBRARY_PATH}:${LD_LIBRARY_PATH}

Compile

   make clean; make

Submit the job on compute node

   sbatch job.slurm

The result should be a segfault  and a core file

Get an interactive session

   salloc -N 1 -n 1 --gres=gpu:1 --time=00:20:00 --exclusive

Set environmrnt and start gdb4hpc

   module load gdb4hpc
   export HIP_ENABLE_DEFERRED_LOADING=0
   export CTI_SLURM_DAEMON_GRES="gpu:1"
   gdb4hpc

Launch the appication inside gdb4hpc

   dbg all > launch $p{1} --gpu --launcher-args="--ntasks-per-node=1" ./hip.x

Proceed debugging
   dbg all > break HIPStream.cpp:118
   dbg all > c
   dbg all > list
   dbg all > info threads
   dbg all > thread 5
   dbg all > print initA
   dbg all > print initB
   dbg all > print a[1]
   dbg all > print b[1000]
   dbg all > c

Analyse the given error and exit

   dbg all > quit

Correction of the bug : look for malloc array a on device (d_a) in HIPStream.cpp and modify. Then, recompile

   make clean;make

Rerun the corrected binary 

   sbatch job.slum
