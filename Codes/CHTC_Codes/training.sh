#!/bin/bash

# untar your R installation
tar -xzf R363.tar.gz
tar -xzf packages.tar.gz

# make sure the script will use your R installation,
# and the working directory as its home location
export PATH=$PWD/R/bin:$PATH
export RHOME=$PWD/R
export R_LIBS=$PWD/packages

tar -xzf spec.tar
tar -xzf label.tar

Rscript --vanilla training.R
