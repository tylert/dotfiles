#!/usr/bin/env bash

# Search for a given string in git comments

if [ -z "${1}" ]; then
    echo "Must provide string to search for"
    exit 1
fi

git log --all -g --grep="${1}"
