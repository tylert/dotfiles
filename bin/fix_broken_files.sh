#!/usr/bin/env bash

# Correct weird file/line endings in text files.
# Required tools:  file, git, grep, perl, tail

# Process all committed files to apply the desired fixes
if $(git rev-parse --git-dir &> /dev/null); then
    git ls-files -z |\
        while IFS= read -rd '' f; do
            # Ensure text files have the appropriate line endings
            # XXX FIXME TODO

            # Ensure text files don't have useless trailing whitespace on lines
            if file --mime-encoding "${f}" | grep -qv binary; then
                perl -pi -e 's/[ \t]+$//' "${f}"
                # XXX FIXME TODO  Make this work on both Linux/Unix and macOS
                # sed -i '' -E 's/[ '$'\t'']+$//' "${f}"  # BSD sed?
                # sed -iE 's/[ \t]+$//' "${f}"  # GNU sed?
            fi

            # Ensure text files have an EOF delimiter at the end
            if file --mime-encoding "${f}" | grep -qv binary; then
                tail -c1 < "${f}" | read -r _ || echo >> "${f}"
            fi
        done
else
    echo 'This is not a git repo'
fi
