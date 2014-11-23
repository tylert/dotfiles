#!/usr/bin/env bash

app_path="${HOME}/install/macosx"
app_name='Install OS X Yosemite.app'

target='/Volumes/UNTITLED'

sudo "${app_path}/${app_name}/Contents/Resources/createinstallmedia" \
  --volume "${target}" \
  --applicationpath "${app_path}/${app_name}" \
  --nointeraction
