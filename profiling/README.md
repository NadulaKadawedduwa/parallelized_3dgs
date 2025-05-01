
# How to run profiling:
1. 3 important files for profiling: `cuda_profile.sh`, `python_profile.sh`, and `run_profiler.py`.
    - You may want to change path of conda environment in those `*.sh` files
1. Place those files in `gaussian-splatting/`, same level as `train.py`, `render.py`, etc.
1. All results will be stored in `profiling_results/` directory with name as `cuda_profile_<jobID>.out` or `python_profile_<jobID>.out`

## Cuda profiling:
```bash
sbatch cuda_profile.sh
```

## Python profiling:
```bash
sbatch python_profile.sh
```
1. Currently, I set CPython to filter those functions included in `*.py` files. Otherwise, there are a lot of func calls
