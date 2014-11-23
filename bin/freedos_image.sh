#!/usr/bin/env bash

# http://chtaube.eu/computers/freedos/bootable-usb/

# dd if=freedos.img of=/dev/sdz bs=512k

file="${1}"

size_in_mb='96'

dd if=/dev/zero of=${file} bs=512k count=$((2 * ${size_in_mb}))

parted -s ${file} mklabel msdos
parted -s ${file} mkpart primary fat32 1 100%
parted -s ${file} set 1 boot on

mkfs.fat -F 32 -n FREEDOS ${file}
syslinux -i ${file}

mcopy -i ${file} SYSLINUX.CFG ::
mcopy -i ${file} AUTOEXEC.BAT ::
mcopy -i ${file} CONFIG.SYS ::

# pushd FREEDOS/PACKAGES/BASE
# for i in *.ZIP ; do unzip -o -d tmp $i ; done
# mcopy -i ${file} FREEDOS/PACKAGES/BASE/tmp/{bin,BIN}/* ::
