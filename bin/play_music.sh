#!/usr/bin/env bash

# Required tools:  date, ffmpeg, nohup/setsid, xdg-open

suffix="$(date +%Y-%m-%d)"

# Start spooling stuff
ffmpeg \
    -i http://fr.ah.fm:8000/192k \
    -map_metadata 0:s:0 \
    "${HOME}/Desktop/ah_fm_${suffix}.mp3"
# XXX FIXME TODO disown/nohup/setsid + log to file + keep quiet about it (current pty)

# Build up the buffer a bit
# sleep 30

# Start playing stuff
# xdg-open "~/Desktop/ah_fm_${suffix}.mp3"
