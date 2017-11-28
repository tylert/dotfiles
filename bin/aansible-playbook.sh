#!/usr/bin/env bash

# Amnesiac ansible-playbook

ansible-playbook \
    "${@}" \
    --ssh-common-args='-o StrictHostKeyChecking=no
        -o UserKnownHostsFile=/dev/null'
