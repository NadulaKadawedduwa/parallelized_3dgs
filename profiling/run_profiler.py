import cProfile
import pstats
from pstats import SortKey
import sys
import os
import re
import importlib
import importlib.util
from glob import glob
from typing import List

def get_py_files(filename: str) -> List[str]:
	base_directory = os.path.dirname(filename)
	python_files = glob(os.path.join(base_directory, "**/*.py"), recursive=True)
	return python_files

# Get the script name from command line arguments
if len(sys.argv) < 2:
    print("Usage: python run_profiler.py your_script.py")
    sys.exit(1)

script_name = sys.argv[1]
script_path = os.path.abspath(script_name)
script_basename = os.path.basename(script_name).split('.')[0]

# Directory for results
os.makedirs('profiling_results', exist_ok=True)
prof_file = f'profiling_results/{script_basename}.prof'

# Run the profiler
cProfile.run(f'exec(open("{script_name}").read())', prof_file)

# Load and filter the stats
p = pstats.Stats(prof_file)
p.sort_stats(SortKey.CUMULATIVE)

py_files = get_py_files(script_name)
py_files_escape = [re.escape(f) for f in py_files]

# Sort by cumulative time and filter to only show functions from *.py files
p.print_stats("|".join(py_files_escape))
