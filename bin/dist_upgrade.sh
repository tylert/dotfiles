#!/usr/bin/env bash

apt-get update
apt-get --yes dist-upgrade
apt-get --yes autoremove
apt-get autoclean
apt-get clean

# pacman --sync --refresh --noconfirm
# pacman --sync --sysupgrade --noconfirm
# pacman --sync --clean --noconfirm

# import platform
# if '2' == platform.python_version()[0]:
#     print(platform.dist()[0])
# else:
#     print(platform.freedesktop_os_release()['ID'])
