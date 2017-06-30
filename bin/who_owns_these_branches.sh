#!/usr/bin/env bash

# Print out a list of branches along with the last committer on each

for branch in $(git branch --remotes | grep --invert-match HEAD); do
    echo -e $(git show --format='%h %aN' ${branch} | head -n 1) \\t${branch}
done | sort
