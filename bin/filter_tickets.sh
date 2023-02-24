#!/usr/bin/env bash

# This script will try to find and extract only the Jira ticket numbers from
# input text.  Print any string with at least one letter, one hyphen and some
# digits in it.

# Invocation examples:
#     git log oldtag...HEAD | ${0}
#     git log oldcommit...newcommit | ${0}
#     ${0} textfile

sed -n 's/\([a-zA-Z]\{1,\}\)-\([0-9]\{1,\}\)/XXX&YYY/gp' ${@} |\
tr 'XXX' '\n' | tr 'YYY' '\n' |\
sed -n '/\([a-zA-Z]\{1,\}\)-\([0-9]\{1,\}\)/ p' |\
tr '[a-z]' '[A-Z]' | sort | uniq
