#!/usr/bin/env bash

app_path="${HOME}/file/data/software/macosx"
app_name='Install_OS_X_Yosemite.app'

target='/dev/sdb'

sudo "${app_path}/${app_name}/Contents/Resources/createinstallmedia" \
  --volume "${target}" \
  --applicationpath "${app_path}/${app_name}" \
  --nointeraction
