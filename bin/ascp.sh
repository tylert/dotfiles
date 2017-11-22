#!/usr/bin/env bash

# Amnesiac SCP

scp \
    -o StrictHostKeyChecking=no \
    -o UserKnownHostsFile=/dev/null \
    "${@}"
