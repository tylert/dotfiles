#!/usr/bin/env bash

# Print out a list of branches along with the last committer on each

git branch

echo '-----===[ NOT MERGED ]===-----'

for branch in $(git branch --remotes --no-merged | grep --invert-match HEAD); do
    echo -e $(git show --format='%h %aN' ${branch} | head -n 1) \\t${branch}
done | sort

echo '-----===[ MERGED ]===-----'

for branch in $(git branch --remotes --merged | grep --invert-match HEAD); do
    echo -e $(git show --format='%h %aN' ${branch} | head -n 1) \\t${branch}
done | sort
