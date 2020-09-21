#!/bin/sh

set -e

# Generate a singularity recipe with Neurodocker
# requires the Python package neurodocker (pip install neurodocker)

# Usage: bash code/generate_simg.sh <version-number>

neurodocker generate singularity \
--base=neurodebian:buster-non-free \
--pkg-manager=apt  \
--install datalad \
--miniconda create_env=ml \
            conda_install='python=3.8 scikit-learn scikit-image pandas numpy' \
            activate=true \
--entrypoint='/neurodocker/startup.sh' \
> envs/Singularity.$1
