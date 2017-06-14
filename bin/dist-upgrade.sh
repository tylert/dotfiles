#!/usr/bin/env bash

apt-get update
apt-get --yes dist-upgrade
apt-get --yes autoremove
apt-get autoclean
apt-get clean
