#!/usr/bin/env bash

# Amnesiac Ansible

ansible \
    "${@}" \
    --ssh-common-args='-o StrictHostKeyChecking=no
        -o UserKnownHostsFile=/dev/null'
