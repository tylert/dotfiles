#!/usr/bin/env bash

apt-get update
apt-get --yes dist-upgrade
apt-get --yes autoremove
apt-get autoclean
apt-get clean

# pacman --sync --refresh --noconfirm
# pacman --sync --sysupgrade --noconfirm
# pacman --sync --clean --noconfirm
