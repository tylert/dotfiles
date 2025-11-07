#!/usr/bin/env bash

# Do stuff in a whole bunch of git repos recursively.
# Required tools:  find, git

# Invocation examples:
#   $0 clean -dfnx
#   $0 reflog -1
#   $0 remote -v

git_action="${@}"
if [ -z "${git_action}" ]; then
    find . -name '.git' -type d \
        -exec git -C '{}/..' rev-parse --show-toplevel \; \
        -exec git -C '{}/..' fetch --all --prune --tags \; \
        -exec git -C '{}/..' merge --ff-only \; \
        -exec git -C '{}/..' status --ignored \;
else
    find . -name '.git' -type d \
        -exec git -C '{}/..' rev-parse --show-toplevel \; \
        -exec git -C '{}/..' ${git_action} \;
fi
