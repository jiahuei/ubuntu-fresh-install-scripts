# Installation scripts for fresh Ubuntu
Some scripts to automate installation of NVIDIA drivers, CUDA, other softwares

## Instructions
1. Download your relevant NVIDIA CUDA `run` file and place it inside `cuda` directory
2. Run `bash 1_disable_nouveau.sh` and reboot as instructed
3. Run `bash 2_install_nvidia_driver_cuda.sh`, 
and verify that both driver and CUDA versions are correct
4. Run `bash 3_install_essential_softwares.sh`

---
NOTES:

- `2_install_nvidia_driver_cuda.sh` assumes CUDA version `10.2` with `cuda_10.2.89_440.33.01_linux.run`, 
otherwise pass in your CUDA version and `run` file name:
`bash 2_install_nvidia_driver_cuda.sh 9.0 cuda_9.0.176_384.81_linux.run`

- `3_install_essential_softwares.sh` will install the following:
  - Python 2 PIP
  - openssh-server
  - Google Chrome
  - Dropbox
  - AnyDesk v5.1.1-1
  - Docker and Nvidia Container Toolkit
  - TexStudio (with TexLive)
  - PyCharm

- If your docker has no internet access (perhaps due to DNS issue), 
run `bash docker_no_internet.sh`


## Directory structure
```
.
+-- cuda
|   +-- {CUDA `run` files, eg: cuda_10.2.89_440.33.01_linux.run}
+-- install-java
|   +-- install-java.sh
|   +-- {other files}
+-- others
|   +-- anydesk_5.1.1-1_amd64.deb
+-- 1_disable_nouveau.sh
+-- 2_install_nvidia_driver_cuda.sh
+-- 3_install_essential_softwares.sh
+-- docker_with_nvidia.sh
+-- docker_no_internet.sh
```

## Misc
The scripts contain comments and links for reference.

