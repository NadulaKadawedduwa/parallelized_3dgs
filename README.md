# cmsc714-group-prj-Spring25
## How to set up batching
Replace files in gaussian_splatting directory with the ones in modified.

run the following to train with two gpus:

python multi-run.py -s ./bicycle/ --iterations 200 -r 8 --num_gpu=2
TODO: Fix bugs in call to rasterize c file in line 102 of gaussian_renderer/__init__.py

## How to run profiling:
1. 3 important files for profiling: `cuda_profile.sh`, `python_profile.sh`, and `run_profiler.py`.
    - You may want to change path of conda environment in those `*.sh` files
1. Place those files in `gaussian-splatting/`, same level as `train.py`, `render.py`, etc.
1. All results will be stored in `profiling_results/` directory with name as `cuda_profile_<jobID>.out` or `python_profile_<jobID>.out`

### Cuda profiling:
```bash
sbatch cuda_profile.sh
```

### Python profiling:
```bash
sbatch python_profile.sh
```
1. Currently, I set CPython to filter those functions included in `*.py` files. Otherwise, there are a lot of func calls
