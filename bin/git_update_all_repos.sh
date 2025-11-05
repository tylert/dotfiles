#!/usr/bin/env bash

# Update a whole bunch of git repos recursively.
# Required tools:  find, git

find . -name '.git' -type d \
    -exec git -C '{}/..' rev-parse --show-toplevel \; \
    -exec git -C '{}/..' fetch --all --prune --tags \; \
    -exec git -C '{}/..' merge --ff-only \; \
    -exec git -C '{}/..' status --ignored \;
