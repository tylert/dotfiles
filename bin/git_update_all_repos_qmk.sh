#!/usr/bin/env bash

for branch in develop master; do
    git checkout "${branch}"
    git merge --ff-only "qmk/${branch}"
    git push hub
    git push lab
done
