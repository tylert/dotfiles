#!/usr/bin/env bash

# Yank down a local copy of the Canadian HAM callsign database

# Execute the following in your git repo to enable inline gzip unified diffs:
#     echo -e "[diff \"gzip\"]\n\ttextconv = gzip -d -c" >> ${callsigns_dir}/.git/config
#     echo -e "*.gz diff=gzip" >> ${callsigns_dir}/.git/info/attributes

# See details at http://www.ic.gc.ca/eic/site/025.nsf/eng/h_00004.html

callsigns_dir="${HOME}/git/callsigns"
date="$(date +%Y-%m-%d)"

source_file='http://apc-cap.ic.gc.ca/datafiles/amateur.zip'
output_file='amateur.txt'

if [ ! -d "${callsigns_dir}" ]; then
    mkdir -p "${callsigns_dir}"
fi

pushd "${callsigns_dir}" > /dev/null 2>&1
    wget "${source_file}"
    unzip -o "$(basename ${source_file})" "${output_file}"
    rm -fv "$(basename ${source_file})"
    git add "${output_file}"
    git commit -m "Snapshot for ${date}"
popd > /dev/null 2>&1
