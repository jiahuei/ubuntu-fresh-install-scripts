#!/usr/bin/env bash
### This script installs Docker for Ubuntu using the repository
# https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-using-the-repository

#DOCKER_CRED_VER='0.6.3'

printf "\n==> Installing Docker\n"
# Update the apt package index
sudo apt-get -y update

# Install packages to allow apt to use a repository over HTTPS
sudo apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common \
    pass

# Add Docker’s official GPG key and verify
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88

# Set up the stable repository
sudo add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"

# Update the apt package index
sudo apt-get -y update

# Install the latest version of Docker Engine - Community and containerd
sudo apt-get -y install docker-ce docker-ce-cli containerd.io

# Verify installation
sudo docker run hello-world


### Docker Credential Helper
# https://github.com/docker/docker-credential-helpers/issues/102#issuecomment-388974092
#wget "https://github.com/docker/docker-credential-helpers/releases/download/v${DOCKER_CRED_VER}/docker-credential-pass-v${DOCKER_CRED_VER}-amd64.tar.gz" && tar -xf "docker-credential-pass-v${DOCKER_CRED_VER}-amd64.tar.gz" && chmod +x docker-credential-pass && sudo mv docker-credential-pass /usr/local/bin/
#gpg2 --gen-key
#pass init "<Your Name>"
#sed -i '0,/{/s/{/{\n\t"credsStore": "pass",/' ~/.docker/config.json


### This script installs Nvidia Container Toolkit for Docker for Ubuntu
# https://github.com/NVIDIA/nvidia-docker/blob/f65beafbfa8734328af38a4dd8270687f6507abb/README.md

printf "\n==> Installing Nvidia Container Toolkit for Docker\n"

distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list

sudo apt-get update && sudo apt-get install -y nvidia-container-toolkit
sudo systemctl restart docker

### Add user to Docker group
# https://www.digitalocean.com/community/questions/how-to-fix-docker-got-permission-denied-while-trying-to-connect-to-the-docker-daemon-socket
printf "\n==> Adding user to Docker group\n"
sudo groupadd docker
sudo usermod -aG docker $USER


