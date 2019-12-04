#!/usr/bin/env bash

printf "==> Freezing kernel upgrades.\n"
sudo apt-mark hold linux-image-* linux-headers-* linux-base linux-firmware linux-generic

sudo apt-get update
sudo apt-get install build-essential

printf "==> Trying to remove '/etc/X11/xorg.conf'.\n"
sudo rm /etc/X11/xorg.conf 

printf "==> Creating '/etc/modprobe.d/blacklist-nouveau.conf'.\n"
sudo tee /etc/modprobe.d/blacklist-nouveau.conf <<< "blacklist nouveau"
sudo tee -a /etc/modprobe.d/blacklist-nouveau.conf <<< "options nouveau modeset=0"

sudo update-initramfs -u

printf "==> Done. Please reboot.\n"
