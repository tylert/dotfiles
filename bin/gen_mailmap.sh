#!/usr/bin/env bash

# Create a new stub mailmap file for use in git repos.  Dump the output to
# .mailmap and edit the file to correct all the left-hand entries.  Cull any
# entries where left = right and be sure to sort|uniq to remove duplicate
# lines.  Move .mailmap to a temp location if regenerating and append to it.

git shortlog --email --summary | awk -F '\t' '{print $2,$2}' | sort | uniq
