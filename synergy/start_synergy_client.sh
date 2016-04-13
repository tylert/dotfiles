#!/usr/bin/env bash

server="${1}"
client_name="${2}"
port="24800"

if [ -z "${server}" ]; then
    echo "Need to specify server hostname/ipaddress"
    exit
fi

if [ -z "${client_name}" ]; then
    echo "Need to specify name for the client"
    exit
fi

PIDS="$(pgrep -u ${USER} synergyc)"
kill "${PIDS}"

# Establish ssh tunnel to server
ssh -f -N -L localhost:${port}:${server}:${port} ${server}

# Point client at the ssh tunnel
synergyc --no-daemon --no-tray --debug INFO --name ${client_name} \
    localhost:${port}
