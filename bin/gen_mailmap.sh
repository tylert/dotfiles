#!/usr/bin/env bash

# Create a new stub mailmap file for use in git repos.  Type 'man git-shortlog'
# and look at the .mailmap section for details.

if [ -z "${1}" ]; then
    domain="example.com"
else
    domain="${1}"
fi

# Don't do anything if we're not inside an existing git repo
if $(git rev-parse --git-dir &> /dev/null); then
    top_level="$(git rev-parse --show-toplevel 2> /dev/null)"

    # XXX FIXME TODO Allow force option?
    # Don't do anything to mess up an existing mailmap file
    # if [ -e "${top_level}/.mailmap" ]; then
    #     echo 'There is already a mailmap for this repo'
    #     exit 1
    # fi

    # XXX FIXME TODO Make this stuff fully idempotent!
    git shortlog --email --summary |\
        awk -F '\t' '{print tolower($2) "\t" $2}' |\
        awk -F '\t' '{sub(/@.*>/, '\"\@${domain}\>\"', $1); print $1 "\t" $2}' |\
        awk -F '\t' '{print toupper(substr($1, 1, 1)) substr($1, 2) "\t" $2}' |\
        awk -F '\t' '{split($1, a, " "); print a[1] " " toupper(substr(a[2], 1, 1)) substr(a[2], 2) " " a[3] "\t" $2}' |\
        LC_ALL=C tr '\t' ' ' |\
        LC_ALL=C tr -s ' ' |\
        LC_ALL=C sort | uniq

    if [ ! -f "${top_level}/.gitattributes" ]; then
        echo '.mailmap export-ignore' > "${top_level}/.gitattributes"
    fi

    if [ ! -f "${top_level}/.gitignore" ]; then
        echo '.DS_Store' > "${top_level}/.gitignore"  # macOS
        echo '.*.sw?' >> "${top_level}/.gitignore"  # Vi(m)
        echo '*.py[coz]' >> "${top_level}/.gitignore"  # Python
        echo '__pycache__/' >> "${top_level}/.gitignore"  # Python
        echo '*.retry' >> "${top_level}/.gitignore"  # Ansible
        echo '.idea/' >> "${top_level}/.gitignore"  # PyCharm
    fi
else
    echo 'This is not a git repo'
fi
