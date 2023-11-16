#!/usr/bin/env bash

# Process all committed files to apply the desired fixes
git ls-files -z |\
    while IFS= read -rd '' f; do
        # Ensure all lines have the appropriate line endings
        # XXX FIXME TODO

        # Ensure all files have an EOF delimiter at the end
        if file --mime-encoding "${f}" | grep -qv binary; then
            tail -c1 < "${f}" | read -r _ || echo >> "${f}"
        fi

        # Ensure all lines don't have useless space characters at the ends
        # sed -i 's/[ \t][ \t]*$//' "${f}"
    done
