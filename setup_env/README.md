
# Install using miniConda:
[Installing Miniconda](https://www.anaconda.com/docs/getting-started/miniconda/install#linux-terminal-installer):
1. Download latest ver.:
    ```bash
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
    ```
1. Install Miniconda:
    ```bash
    bash ~/Miniconda3-latest-Linux-x86_64.sh
    ```
1. Follow the instructions. Activate conda:
    ```bash
    source ~/.bashrc
    ```
    In my case, it's `source /home/nguyqu03/miniconda3/bin/activate`.

# Install repo dependencies
1. Load cuda from Zaratan:
    ```bash
    module load cuda/11.6.2
    ```
    It also loads `gcc/9.4.0` automatically.
1. Install dependencies:
    ```bash
    conda env create -f environment_1.yml
    ```
    Using `environment_1.yml` from this folder. It's added with `mkl=2024.0.0` and changed env name to `gaussian_splatting_1` in comparison to author's [environment.yml](https://github.com/graphdeco-inria/gaussian-splatting/blob/main/environment.yml).
1. Activate env:
    ```bash
    source /path/miniconda3/bin/activate gaussian_splatting_1
    ```
    In my case, it's `source /home/nguyqu03/miniconda3/bin/activate gaussian_splatting_1`.