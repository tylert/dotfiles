#!/usr/bin/env bash

# Amnesiac SSH

ssh \
    -o StrictHostKeyChecking=no \
    -o UserKnownHostsFile=/dev/null \
    ${@}
