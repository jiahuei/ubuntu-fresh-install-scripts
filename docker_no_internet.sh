#!/usr/bin/env bash
# This script fixes the issue: Docker cannot resolve DNS on private network / No internet
# https://stackoverflow.com/questions/39400886/docker-cannot-resolve-dns-on-private-network

printf "\n==> NOTE: Check via 'ifconfig', is 'docker0' using IP '172.17.0.1'? If not pass in the IP as argument.\n"

DOCKER_IP=${1:-'172.17.0.1'}

FILE=/etc/NetworkManager/dnsmasq.d/docker.conf
if ! test -f ${FILE};
then
    printf "\n==> Creating docker.conf\n"
    sudo tee ${FILE} <<< "interface=lo"
    sudo tee -a ${FILE} <<< "interface=docker0"
fi

FILE=/etc/resolvconf/resolv.conf.d/tail
if ! test -f ${FILE};
then
    printf "\n==> Creating docker.conf\n"
    sudo tee ${FILE} <<< "nameserver ${DOCKER_IP}"
fi

# Restart networking, update resolv.conf, restart docker
sudo service network-manager restart
sudo resolvconf -u
sudo service docker restart


