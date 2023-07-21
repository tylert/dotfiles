#!/usr/bin/env bash

# Yank down a local copy of the Canadian HAM callsign database

# See more details at https://www.ic.gc.ca/eic/site/025.nsf/eng/h_00004.html
# or https://apc-cap.ic.gc.ca/pls/apc_anon/query_avail_cs$callsign.actionquery

callsigns_dir="${HOME}/git/tylert/canadian-callsigns"
date="$(date +%Y-%m-%d)"

source_file='https://apc-cap.ic.gc.ca/datafiles/amateur.zip'
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
    git push hub
    git push lab
    # git push bit
popd > /dev/null 2>&1
