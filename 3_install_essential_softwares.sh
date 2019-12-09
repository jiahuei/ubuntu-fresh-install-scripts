#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cd ${DIR}

if ! ls ./others/anydesk*.deb >/dev/null 2>&1;
then
    printf "\nPlease download the .deb files for AnyDesk\n"
    exit 1
fi

###
printf "\n==> Installing Python PIP\n"
sudo apt -y update
sudo apt -y install python-pip python-dev
sudo pip install -U pip

###
printf "\n==> Installing openssh-server\n"
sudo apt -y update
sudo apt -y install openssh-server

###
printf "\n==> Installing Chrome\n"
FILE="google-chrome-stable_current_amd64.deb"
wget --directory-prefix=./others "https://dl.google.com/linux/direct/${FILE}"
sudo apt -y install ./others/${FILE}

#printf "\n==> Installing Chrome from repo\n"
#wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
#sudo echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list
#sudo apt -y update
#sudo apt -y install google-chrome-stable

###
printf "\n==> Installing Dropbox\n"
FILE="dropbox_2019.02.14_amd64.deb"
sudo apt -y update
sudo apt -y install python3-gpgme
#wget "https://www.dropbox.com/download?dl=packages/ubuntu/${FILE}" -O ./others/${FILE}
sudo apt -y update
sudo apt -y install ./others/${FILE}
nautilus --quit

#printf "\n==> Installing Dropbox from repo\n"
#sudo tee /etc/apt/sources.list.d/dropbox.list <<< "deb [arch=amd64] https://linux.dropbox.com/ubuntu xenial main"
#sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 1C61A2656FB57B7E4DE0F4C1FC918B335044912E
#sudo apt -y update
#sudo apt -y install python3-gpgme dropbox
#nautilus --quit

###
printf "\n==> Installing AnyDesk v5.1.1-1\n"
sudo apt -y update
sudo apt -y install ./others/anydesk_5.1.1-1_amd64.deb

###
# Install Docker and Nvidia Container Toolkit
sudo bash ./docker_with_nvidia.sh

###
printf "\n==> Installing TexStudio\n"
sudo add-apt-repository -y ppa:sunderme/texstudio
sudo apt -y update
sudo apt -y install texlive-full texstudio

###
printf "\n==> Installing PyCharm\n"
sudo apt -y update
sudo apt -y install snapd
sudo snap install pycharm-community --classic

###
printf "\n==> All done !!!\n"

# printf "\nInstalling Java 8\n"
# sudo bash install-java/install-java.sh -f others/jdk-8u231-linux-x64.tar.gz






