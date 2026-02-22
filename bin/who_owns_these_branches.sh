#!/usr/bin/env bash

# Print out a list of branches along with the last committer on each.

# Tools required:  bash, GNU coreutils (echo, head, sort), git, GNU grep

# Don't do anything if we're not inside an existing git repo
if $(git rev-parse --quiet --git-dir &> /dev/null); then
    # Dump out current list of remotes and which branch is currently active
    git remote -v
    git branch

    echo '-----===[ NOT MERGED ]===-----'

    # Show info for unmerged remote branches
    for branch in $(git branch --remotes --no-merged | grep --invert-match HEAD); do
        echo -e $(git show --format='%h\t%cd\t%cN' --date=format:%Y-%m-%d ${branch} | head -n 1) \\t${branch}
    done | sort -k2

    echo '-----===[ MERGED ]===-----'

    # Show info for merged remote branches
    for branch in $(git branch --remotes --merged | grep --invert-match HEAD); do
        echo -e $(git show --format='%h\t%cd\t%cN' --date=format:%Y-%m-%d ${branch} | head -n 1) \\t${branch}
    done | sort -k2
else
    echo 'This is not a git repo'
fi
