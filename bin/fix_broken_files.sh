#!/usr/bin/env bash

# XXX FIXME TODO  Force all files to have Linux/Unix line endings
# XXX FIXME TODO  Strip trailing whitespace from all lines

# Ensure all files have an EOF delimiter (only process committed files)
git ls-files -z |\
    while IFS= read -rd '' f; do
        if file --mime-encoding "${f}" | grep -qv binary; then
            tail -c1 < "${f}" | read -r _ || echo >> "${f}"
        fi
    done
