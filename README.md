# Installation scripts for fresh Ubuntu
Some scripts to automate installation of NVIDIA drivers, CUDA, other softwares.

Tested on Ubuntu 16.04.3

## Instructions
1. Download your relevant NVIDIA CUDA `run` file and place it inside `cuda` directory
2. Run `bash 1_disable_nouveau.sh` and reboot as instructed
3. At the login screen, type `Ctrl + Alt + F1` to switch into text mode
4. Login to your user, `cd` to the base directory containing the scripts
5. Run `bash 2_install_nvidia_driver_cuda.sh`
    1. At the CUDA installation screen, under "Driver", 
    select "Do not install OpenGL" and verify that the "X config" option is not selected.
    For prompts, say "no" to "OpenGL" and "NVIDIA Xserver"
    2. After installation, verify that both driver and CUDA versions are correct
    3. Optional: Run CUDA demos.
        1. Go to your `NVIDIA_CUDA-x.x_Samples` folder and issue `make`
        2. Go to `NVIDIA_CUDA-x.x_Samples/bin/x86_64/linux/release/`, 
        and run `./deviceQuery` and `./bandwidthTest`, both should output "PASS"
6. Either reboot or issue `sudo service lightdm start` to go back to GUI mode
7. Run `bash 3_install_essential_softwares.sh`

---
JAVA 8 installation:

*Based on [this repo](https://github.com/chrishantha/install-java/tree/63997dc81aaf9184ffe715d7381fa822bd39f357)*
1. Download the required `tar.gz` files from Oracle, place them at the base directory:
    - [JDK 8](https://www.oracle.com/technetwork/es/java/javase/downloads/jdk8-downloads-2133151.html)
    - [JCE 8](https://www.oracle.com/technetwork/java/javase/downloads/jce8-download-2133166.html)
2. Run `yes | sudo bash /install-java/install-java.sh -f /jdk-8u231-linux-x64.tar.gz`
3. Verify by running `java -version`

---
NOTES:

- `1_disable_nouveau.sh` will freeze any upgrades to kernels.

- `2_install_nvidia_driver_cuda.sh` assumes CUDA version `10.2` with `cuda_10.2.89_440.33.01_linux.run`, 
otherwise pass in your CUDA version and `run` file name:
`bash 2_install_nvidia_driver_cuda.sh 9.0 cuda_9.0.176_384.81_linux.run`
    - For Ubuntu kernel mismatch issues, install standalone NVIDIA graphics driver prior to installing CUDA. 

- `3_install_essential_softwares.sh` will install the following:
    - Python 2 PIP
    - openssh-server
    - Google Chrome
    - Dropbox
    - AnyDesk v5.1.1-1
    - Docker and NVIDIA Container Toolkit
    - TexStudio (with TexLive)
    - PyCharm

- To only install Docker and NVIDIA Container Toolkit, run `bash docker_with_nvidia.sh`

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
+-- {java tar.gz files for java installation}
```

## Misc
The scripts contain comments and links for reference.

