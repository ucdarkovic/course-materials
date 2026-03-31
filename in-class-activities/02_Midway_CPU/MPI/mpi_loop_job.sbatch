#!/bin/bash

#SBATCH --job-name=mpi_loop_job
#SBATCH --output=mpi_loop.out
#SBATCH --error=mpi_loop.err
#SBATCH --account=macs30113
#SBATCH --partition=caslake
#SBATCH --ntasks=5
#SBATCH --nodes=1 # Run ntasks on same single node
#SBATCH --mem=4G # Can explicitly request more RAM if necessary (4GB here)

# Load Python and MPI modules
module load python/anaconda-2022.05 mpich/3.2.1

# Use bash loop to incrementally increase the number of MPI processes and
# time different configurations
for i in {1..5}
  do
    mpirun -n $i python mpi_rand_walk.py >> mpi_loop.out
  done
