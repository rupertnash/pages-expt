#!/bin/bash
#
#PBS -N cuda_intro
#PBS -q gpu-teach
#PBS -l select=1:ncpus=10:ngpus=1
#PBS -l walltime=0:01:00

# Budget: use either your default or the reservation
#PBS -A d167

# Load the required modules
module load gcc
module load cuda
module load pgi

# Pick a random device as PBS on Cirrus not yet configured to control
# GPU visibility
r=$RANDOM; let "r %= 4";
export CUDA_VISIBLE_DEVICES=$r

cd $PBS_O_WORKDIR

./intro
