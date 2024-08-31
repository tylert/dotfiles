#!/usr/bin/env bash

# Required tools:  date, ffmpeg, nohup/setsid, xdg-open

date="$(date +%Y-%m-%d)"

# Start spooling stuff
nohup ffmpeg \
    -i http://fr.ah.fm:8000/192k \
    -map_metadata 0:s:0 \
    "~/Desktop/ah_fm_${date}.mp3" 2>&1 \
    | tee "~/Desktop/ah_fm_${date}.log" &
# XXX FIXME TODO disown/nohup/setsid + log to file + keep quiet about it (current pty)

# Build up the buffer a bit
sleep 30

# Start playing stuff
xdg-open "~/Desktop/ah_fm_${date}.mp3"
