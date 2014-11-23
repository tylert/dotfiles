
# http://chtaube.eu/computers/freedos/bootable-usb/

# Use a pre-built one:

# dd if=freedos.img of=/dev/sdz bs=512k


# Build your own:

file="${1}"

dd if=/dev/zero of=${file} bs=1M count=100

parted -s ${file} mklabel msdos
parted -s ${file} mkpart primary fat32 0 100MB
parted -s ${file} set 1 boot on

# mount -o loop ${file} /mntpoint
# mkfs.fat -F 32 -n FREEDOS /dev/mapper/loop0
syslinux -i ${file}
