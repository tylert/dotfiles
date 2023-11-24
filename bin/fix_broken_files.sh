#!/usr/bin/env bash

# Process all committed files to apply the desired fixes
git ls-files -z |\
    while IFS= read -rd '' f; do
        # Ensure all lines have the appropriate line endings
        # XXX FIXME TODO

        # Ensure all lines don't have useless trailing whitespace
        sed -i '' -E 's/[ '$'\t'']+$//' "${f}"

        # Ensure all files have an EOF delimiter at the end
        if file --mime-encoding "${f}" | grep -qv binary; then
            tail -c1 < "${f}" | read -r _ || echo >> "${f}"
        fi
    done
