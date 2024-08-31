#!/usr/bin/env bash

#set -x

# Shows you the largest objects in your repo's pack file.
# See http://stubbisms.wordpress.com/2009/07/10/git-script-to-show-largest-pack-objects-and-trim-your-waist-line
# @author Antony Stubbs
# echo 'All sizes are in kB's. The pack column is the size of the object, compressed, inside the pack file.'

if [ ! -z "${1}" ]; then
    count="${1}"
else
    count=10
fi

# Don't do anything if we're not inside an existing git repo
if $(git rev-parse --quiet --git-dir &> /dev/null); then
    top_level="$(git rev-parse --show-toplevel 2> /dev/null)"

    # set the internal field spereator to line break, so that we can iterate easily over the verify-pack output
    IFS=$'\n';

    # list all objects including their size, sort by size, take top 10
    objects="$(git verify-pack --verbose ${top_level}/.git/objects/pack/pack-*.idx | grep --invert-match chain | sort -k3rn | head -n ${count})"

    output="size,packed_size,SHA,file"
    for object in ${objects}; do
        # extract the SHA
        sha="$(echo ${object} | cut -d ' ' -f 1)"

        # extract the sizes in bytes
        size="$(echo ${object} | cut -d ' ' -f 5)"
        compressedSize="$(echo ${object} | cut -d ' ' -f 6)"

        # find the objects location in the repository tree
        other="$(git rev-list --all --objects | grep ${sha})"
        output="${output}\n${size},${compressedSize},${other}"
    done

    echo -e ${output} | column -t -s ', '
else
    echo 'This is not a git repo'
fi
