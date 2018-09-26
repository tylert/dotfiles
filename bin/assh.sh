#!/usr/bin/env bash

# Amnesiac SSH

ssh \
    -o StrictHostKeyChecking=no \
    -o UserKnownHostsFile=/dev/null \
    "${@}"

# Do it through a jump host with:
#   -o ProxyJump=foo@bar \
