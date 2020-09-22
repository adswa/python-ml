#!/bin/sh

set -e

# Generate a singularity recipe with Neurodocker
# requires the Python package neurodocker (pip install neurodocker)

# Usage: bash code/generate_simg.sh <version-number>

neurodocker generate singularity \
--base=neurodebian:buster-non-free \
--pkg-manager=apt  \
--install datalad \
--run-bash 'pip install numpy pandas scikit-learn scikit-image' \
> envs/Singularity.$1
