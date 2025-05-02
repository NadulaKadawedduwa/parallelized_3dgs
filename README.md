# cmsc714-group-prj-Spring25
## How to set up environment
Check `./setup_env/README.md`

## How to set up batching
Replace files in gaussian_splatting directory with the ones in modified.

Request a 20 minute bash session with 2 gpus:

srun --partition=dpart --qos=medium --gres=gpu:2 --time 0:20:0 --pty bash

run the following to train with two gpus:

python multi-run.py -s ./bicycle/ --iterations 200 -r 8 --num_gpu=2

TODO: Fix bugs in call to rasterize c file in line 102 of gaussian_renderer/__init__.py

## How to run profiling:
Check `./profiling/README.md`
