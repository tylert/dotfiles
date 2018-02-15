#!/usr/bin/env bash

# Print out a list of branches along with the last committer on each

# Don't do anything if we're not inside an existing git repo
if $(git rev-parse --quiet --git-dir &> /dev/null); then
    git remote -v
    git branch

    echo '-----===[ NOT MERGED ]===-----'

    for branch in $(git branch --remotes --no-merged | grep --invert-match HEAD); do
        echo -e $(git show --format='%h\t%aN\t%cN' ${branch} | head -n 1) \\t${branch}
    done | sort -k2

    echo '-----===[ MERGED ]===-----'

    for branch in $(git branch --remotes --merged | grep --invert-match HEAD); do
        echo -e $(git show --format='%h\t%aN\t%cN' ${branch} | head -n 1) \\t${branch}
    done | sort -k2
else
    echo 'This is not a git repo'
fi
