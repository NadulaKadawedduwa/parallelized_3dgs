#!/bin/bash
#SBATCH --job-name=profile_cuda
#SBATCH --output=profiling_results/cuda_profile_%j.out
#SBATCH --time=01:00:00
#SBATCH -N 1
#SBATCH -p gpu
#SBATCH --gres=gpu:a100_1g.5gb:2

# Load CUDA module
module load cuda/11.6.2

# Activate conda environment
source /home/nguyqu03/miniconda3/bin/activate gaussian_splatting_1

# Create profiling directory
mkdir -p profiling_results

# Run test
ncu \
    --target-processes all \
    --metrics achieved_occupancy,sm_efficiency,flop_count_dp,flop_count_sp,kernel_launch_count,kernel_launch_overhead,kernel_execution_time,sm__cycles_elapsed.sum \
    --csv \
    python train.py
