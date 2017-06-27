#!/usr/bin/env bash

if [ -z "${1}" ]; then
    echo "Must provide string to search for"
    exit 1
fi

git log --all -g --grep="${1}"
