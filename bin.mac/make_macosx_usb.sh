#!/usr/bin/env bash

app_path='/Applications'
app_name='Install OS X El Capitan.app'

target='/Volumes/foo'

sudo "${app_path}/${app_name}/Contents/Resources/createinstallmedia" \
  --volume "${target}" \
  --applicationpath "${app_path}/${app_name}" \
  --nointeraction
