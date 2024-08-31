#!/usr/bin/env bash

# Required tools:  grep, myrepos

mr fetch -f
mr merge
mr status 2>&1 | grep -E -v '^mr ' | grep -E -v '^$'
