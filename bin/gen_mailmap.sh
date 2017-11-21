#!/usr/bin/env bash

# Create a new stub mailmap file for use in git repos.  Dump the output to
# .mailmap and edit the file to correct all the left-hand entries.  Cull any
# entries where left = right and be sure to sort|uniq to remove duplicate
# lines.  Move .mailmap to a temp location if regenerating and append to it.

# Don't do anything if we're not inside an existing git repo
if $(git rev-parse --quiet --git-dir &> /dev/null); then
    top_level="$(git rev-parse --show-toplevel 2> /dev/null)"

    # Don't do anything to mess up an existing mailmap file
    if [ -e "${top_level}/.mailmap" ]; then
        echo "There is already a mailmap for this repo"
        exit 1
    fi

    echo "Creating mailmap for this repo"
    git shortlog --email --summary | awk -F '\t' '{print $2, $2}' | sort | uniq > "${top_level}/.mailmap"

    # XXX FIXME TODO Make this line idempotent
    echo ".mailmap export-ignore" >> "${top_level}/.gitattributes"
else
    echo "This is not a git repo"
fi
