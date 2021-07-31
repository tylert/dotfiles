#!/usr/bin/env bash

mr fetch -f
mr merge
mr status 2>&1 | egrep -v '^mr ' | egrep -v '^$'
