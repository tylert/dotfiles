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

mmd -i ${file} FDOS
mcopy -i ${file} SYSLINUX.CFG ::
mcopy -i ${file} AUTOEXEC.BAT ::
mcopy -i ${file} CONFIG.SYS ::

# pushd ~/Desktop/fd11src/FREEDOS/PACKAGES/BASE
# for i in *.ZIP ; do unzip -o -d tmp $i ; done
# popd
# pushd ~/Desktop/fd11src/FREEDOS/PACKAGES/BOOT
# for i in *.ZIP ; do unzip -o -d tmp $i ; done
# popd

mcopy -i ${file} ~/Desktop/fd11src/FREEDOS/PACKAGES/BASE/tmp/{bin,BIN}/* ::FDOS
mcopy -i ${file} ~/Desktop/fd11src/FREEDOS/PACKAGES/BOOT/tmp/{bin,BIN}/chain.c32 ::FDOS
