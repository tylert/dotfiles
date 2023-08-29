#!/usr/bin/env bash

# https://xkcd.com/1654/


pacman_upgrade() {
    # Arch Linux, EndeavourOS, PiKVM, etc.
    pacman --noconfirm --refresh --sync archlinux-keyring  # -Sy
    pacman --noconfirm --refresh --sync --sysupgrade  # -Syu
    pacman --clean --noconfirm --sync  # -Sc

    # XXX FIXME TODO  Do a better job of cleaning up orphaned packages
    # pacman --nosave --recursive --remove \  # -Rns
    #     $(pacman --deps --query --quiet --unrequired)  # -Qtdq
    # rm -rf /var/cache/pacman/pkg/*

    # XXX FIXME TODO  Do a better job of managing foreign packages
    # Show foreign packages with --query --foreign / -Qm
    # Search for new packages with --sync --search / -Ss

    # If there's Raspberry Pi hardware, try to upgrade the firmware to latest
    if [ -f /proc/device-tree/model ]; then
        rpi-eeprom-update -a -d
    fi

    # pacman -Q | column -t
}


apt_upgrade() {
    # Debian, Ubuntu, Raspberry Pi OS (former Raspbian), etc.
    apt-get update
    apt-get --yes dist-upgrade
    apt-get --yes autoremove
    apt-get autoclean
    apt-get clean

    # If there's Raspberry Pi hardware, try to upgrade the firmware to latest
    if [ -f /proc/device-tree/model ]; then
        rpi-eeprom-update -a -d
    fi

    # dpkg-query -W | column -t
}


brew_upgrade() {
    # macOS (and apparently others too although not sure why)
    if [ '0' == $(id -u) ]; then
        echo 'Do not run this with sudo.'
        exit 3
    fi

    brew update
    brew upgrade --formulae
    brew upgrade --casks
    brew cleanup

    # brew list --versions | column -t
}


upgrade_everything() {
    case $(uname -s) in
        'Linux')
            # XXX FIXME TODO  Find a nice(r) way to determine your Linux distro!!!
            case 'Arch' in
                'Arch') pacman_upgrade ;;
                'Debian') apt_upgrade ;;
                *) echo 'I do not recognize your Linux distribution.' ; exit 2 ;;
            esac ;;
        'Darwin') brew_upgrade ;;
        *) echo 'I do not recognize your operating system.' ; exit 1 ;;
    esac
}


upgrade_everything
