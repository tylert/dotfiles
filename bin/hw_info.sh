#!/usr/bin/env bash

if $(inxi --version &> /dev/null); then
    inxi -c0 -Mxxx  # machine/motherboard/model info
    inxi -c0 -Cxxx  # cpu info
    inxi -c0 -mxxx  # memory info
    inxi -c0 -ixxx  # network info
    inxi -c0 -dxxx  # drive info
    inxi -c0 -Bxxx  # battery info
fi
