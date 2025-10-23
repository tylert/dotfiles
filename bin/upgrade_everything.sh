#!/usr/bin/env bash

# https://xkcd.com/1654


pacman_upgrade() {
    # Arch Linux, EndeavourOS, PiKVM, etc.
    pacman --noconfirm --refresh --sync archlinux-keyring  # -Sy
    pacman --noconfirm --refresh --sync --sysupgrade  # -Syu
    pacman --clean --noconfirm --sync  # -Sc

    # Try to get rid of packages which are not actually needed anymore
    excess="$(pacman --deps --query --quiet --unrequired | tr '\n' ' ')"  # -Qtdq
    if [ ! -z "${excess}" ]; then
        pacman --nosave --recursive --remove "${excess}"  # -Rns
    fi

    # XXX FIXME TODO  Do a better job of managing foreign packages
    # Show foreign packages with --foreign --query / -Qm
    # Search for new packages with --search --sync / -Ss

    # XXX FIXME TODO  Actually clean up old packages cached locally
    # rm -rf /var/cache/pacman/pkg/*

    # XXX FIXME TODO  Find a better way to check if this is a Raspberry Pi
    # If there's Raspberry Pi hardware, try to upgrade the firmware to latest
    # if [ -f /proc/device-tree/model ]; then
    #     rpi-eeprom-update -a -d
    # fi

    # pacman --query
}


apt_upgrade() {
    # Debian, Ubuntu, Raspberry Pi OS (former Raspbian), etc.
    apt-get update
    apt-get --yes dist-upgrade
    apt-get --yes autoremove
    apt-get autoclean
    apt-get clean

    # XXX FIXME TODO  Find a better way to check if this is a Raspberry Pi
    # If there's Raspberry Pi hardware, try to upgrade the firmware to latest
    # if [ -f /proc/device-tree/model ]; then
    #     rpi-eeprom-update -a -d
    # fi

    # dpkg-query --show | tr '\t' ' '
}


apk_upgrade() {
    # Alpine
    #   https://wiki.alpinelinux.org/wiki/Upgrading_Alpine_Linux_to_a_new_release_branch
    apk update
    apk add --upgrade apk-tools
    apk upgrade --available

    # XXX FIXME TODO  Just list all the installed package versions
}


opkg_upgrade() {
    # OpenWRT
    #   https://openwrt.org/docs/guide-user/additional-software/opkg#upgrading_packages
    opkg update
    opkg list-upgradable | cut -f 1 -d ' ' | xargs -r opkg upgrade

    # XXX FIXME TODO  Just list all the installed package versions
}


brew_upgrade() {
    # macOS (and apparently others too although not sure why)
    if [ '0' == $(id -u) ]; then
        echo 'Do not run this with sudo.'
        exit 3
    fi

    brew update
    brew upgrade --greedy
    brew cleanup

    # brew list --versions
}


upgrade_everything() {
    case $(uname -s) in
        'Linux')
            # XXX FIXME TODO  Find a nice(r) way to determine your Linux distro!!!
            case 'Arch' in
                'Alpine') apk_upgrade ;;
                'Arch') pacman_upgrade ;;
                'Debian') apt_upgrade ;;
                'OpenWRT') opkg_upgrade ;;
                *) echo 'I do not recognize your Linux distribution.' ; exit 2 ;;
            esac ;;
        'Darwin') brew_upgrade ;;
        *) echo 'I do not recognize your operating system.' ; exit 1 ;;
    esac
}


upgrade_everything
