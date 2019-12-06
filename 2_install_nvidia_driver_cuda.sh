#!/usr/bin/env bash

# wget http://us.download.nvidia.com/XFree86/Linux-x86_64/384.130/NVIDIA-Linux-x86_64-384.130.run

CUDA_VER=${1:-'10.2'}
CUDA_RUNFILE=${2:-'cuda_10.2.89_440.33.01_linux.run'}
printf "\n==> NOTE: Installing CUDA ${CUDA_VER} from ${CUDA_RUNFILE}, alternatively pass in the desired version and runfile\n"

chmod -R a+x .

printf "\n==> Stopping lightdm service.\n"
sudo service lightdm stop

printf "\n==> Executing CUDA runfile.\n"
# sudo apt-get -y install nvidia-384 nvidia-modprobe
# sudo apt-get install linux-headers-$(uname -r)
sudo bash cuda/"${CUDA_RUNFILE}"

printf "\n==> Exporting environment variables.\n"
export PATH=/usr/local/cuda-${CUDA_VER}/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda-${CUDA_VER}/lib64:$LD_LIBRARY_PATH


printf "\n==> Checking for nvidia files.\n"
if ls /dev/nvidia* >/dev/null 2>&1;
then
    printf "==>     /dev/nvidia* files exist.\n"
else
    sudo modprobe nvidia
fi

printf "\n==> Checking NVIDIA driver version.\n"
cat /proc/driver/nvidia/version

printf "\n==> Checking NVIDIA CUDA version.\n"
nvcc -V

printf "\n==> Editing ~/.profile.\n"
sudo tee -a ~/.profile <<< ''
sudo tee -a ~/.profile <<< "export CUDA_HOME=/usr/local/cuda-${CUDA_VER}"
sudo tee -a ~/.profile <<< 'export LD_LIBRARY_PATH=${CUDA_HOME}:${CUDA_HOME}/lib64:${CUDA_HOME}/extras/CUPTI/lib64'
sudo tee -a ~/.profile <<< 'export PATH=${CUDA_HOME}/bin:${PATH}'

