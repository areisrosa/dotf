#!/bin/bash

if (( $EUID != 0 )); then
    sudo bash $HOME/.dotf/bash/update_debian.sh
    exit
fi

apt-get update
apt-get -y upgrade
apt-get -y dist-upgrade --no-remove
apt-get -y autoremove
