#!/usr/bin/env bash

# Amnesiac ansible

ansible \
    "${@}" \
    --ssh-common-args='-o StrictHostKeyChecking=no
        -o UserKnownHostsFile=/dev/null'
