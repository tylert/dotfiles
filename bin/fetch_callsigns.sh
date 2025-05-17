#!/usr/bin/env bash

# Yank down a local copy of the Canadian amateur radio callsign database.
# Required tools:  bash, date, git, unzip, wget

# See more details at
# https://ised-isde.canada.ca/site/amateur-radio-operator-certificate-services/en/downloads

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
