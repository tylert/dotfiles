#!/usr/bin/env bash

for branch in develop master; do
    git checkout "${branch}"
    mr merge "qmk/${branch}"
    git push hub
    git push lab
done

# qmk setup
# qmk compile -kb durgod/k310 -km chimera
# qmk compile -kb durgod/k320 -km chimera
# qmk compile -kb durgod/k320 -km typhon
# qmk compile -kb ploopyco/trackball_nano -km default
