#!/usr/bin/env bash

for branch in $(git branch --remotes | grep --invert-match HEAD); do
    echo -e $(git show --format='%h %aN' ${branch} | head -n 1) \\t${branch}
done | sort
