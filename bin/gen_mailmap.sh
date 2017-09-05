#!/usr/bin/env bash

# Create a new stub mailmap file for use in git repos.

git shortlog -se | awk -F'\t' '{print $2,$2}' | sort | uniq
