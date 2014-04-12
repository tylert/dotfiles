#!/usr/bin/env bash

app_path='/Volumes/Data/install/macosx'
app_name='Install OS X Mavericks.app'

target='/Volumes/UNTITLED'

sudo "${app_path}/${app_name}/Contents/Resources/createinstallmedia" \
    --volume "${target}" \
    --applicationpath "${app_path}/${app_name}" \
    --nointeraction
