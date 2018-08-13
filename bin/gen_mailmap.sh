#!/usr/bin/env bash

# Create a new stub mailmap file for use in git repos.  Type 'man git-shortlog'
# and look at the .mailmap section for details.

if [ -z "${1}" ]; then
    domain="example.com"
else
    domain="${1}"
fi

# Don't do anything if we're not inside an existing git repo
if $(git rev-parse --quiet --git-dir &> /dev/null); then
    top_level="$(git rev-parse --show-toplevel 2> /dev/null)"

    # XXX FIXME TODO Allow force option?
    # Don't do anything to mess up an existing mailmap file
    # if [ -e "${top_level}/.mailmap" ]; then
    #     echo 'There is already a mailmap for this repo'
    #     exit 1
    # fi

    # XXX FIXME XXX Make this stuff idempotent!
    # echo 'Creating mailmap for this repo'
    git shortlog --email --summary |\
        awk -F '\t' '{print tolower($2) "\t" $2}' |\
        awk -F '\t' '{sub(/@.*>/, '\"\@${domain}\>\"', $1); print $1 "\t" $2}' |\
        awk -F '\t' '{print toupper(substr($1, 1, 1)) substr($1, 2) "\t" $2}' |\
        awk -F '\t' '{split($1, a, " "); print a[1] " " toupper(substr(a[2], 1, 1)) substr(a[2], 2) " " a[3] "\t" $2}' |\
        tr '\t' ' ' |\
        sort | uniq
    #     sort | uniq > "${top_level}/.mailmap"

    # XXX FIXME XXX Make this stuff idempotent!
    # echo '.mailmap export-ignore' >> "${top_level}/.gitattributes"
else
    echo 'This is not a git repo'
fi
