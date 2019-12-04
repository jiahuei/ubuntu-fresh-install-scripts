#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cd ${DIR}

CUDA_VER=$1
CUDNN_VER=$2

printf "\nChanging CUDA to version ${CUDA_VER}...\n"

sudo ln -sfn /usr/local/cuda-${CUDA_VER} /usr/local/cuda


printf "\nChanging cuDNN to version ${CUDNN_VER}...\n"

cd ${DIR}/cudnn_${CUDNN_VER}

sudo cp lib64/* /usr/local/cuda/lib64/
sudo cp include/* /usr/local/cuda/include/
sudo chmod a+r /usr/local/cuda/include/cudnn.h /usr/local/cuda/lib64/libcudnn*


printf "Done.\n\n"


