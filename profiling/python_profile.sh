#!/bin/bash
#SBATCH --job-name=profile_python
#SBATCH --output=profiling_results/python_profile_%j.out
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

# Run profiling with both Python cProfile and NVIDIA Nsight Compute
#python -m cProfile -s cumulative zz.py
python run_profiler.py train.py

