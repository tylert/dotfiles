#!/usr/bin/env bash

# Universal upgrade script
# https://xkcd.com/1654

# Tools required:  bash, coreutils (cut, echo, id, tr), findutils (xargs)


rpi_eeprom_upgrade() {

    :
    # XXX FIXME TODO  Find a better way to check if this is a Raspberry Pi
    # If there's Raspberry Pi hardware, try to upgrade the firmware to latest
    # if [ -f /proc/device-tree/model ]; then
    #     rpi-eeprom-update -a -d
    # fi
}


apk_upgrade() {
    # Alpine

    apk update
    apk add --upgrade apk-tools
    apk upgrade --available

    rpi_eeprom_upgrade

    # List packages:
    # apk list --installed          # -I   with version numbers
    # apk list --installed --quiet  # -Iq  without version numbers
}


apt_upgrade() {
    # Debian, Devuan, Raspberry Pi OS (former Raspbian), etc.

    apt-get update
    apt-get --yes dist-upgrade
    apt-get --yes autoremove
    apt-get autoclean
    apt-get clean

    rpi_eeprom_upgrade

    # List packages:
    # dpkg-query --show --showformat '${binary:Package} ${Version}\n'  # -Wf '...'  with version numbers
    # dpkg-query --show --showformat '${binary:Package}\n'             # -Wf '...'  without version numbers
}


brew_upgrade() {
    # macOS

    if [ '0' == $(id -u) ]; then
        echo 'Do not run this with sudo.'
        exit 3
    fi

    brew update
    brew upgrade --greedy
    brew cleanup

    # List packages:
    # brew list --versions  # with version numbers
    # brew list             # without version numbers
}


pacman_upgrade() {
    # Arch, Artix, EndeavourOS, PiKVM, etc.

    pacman --noconfirm --refresh --sync archlinux-keyring  # -Sy
    pacman --noconfirm --refresh --sync --sysupgrade  # -Syu
    pacman --clean --noconfirm --sync  # -Sc

    # Try to get rid of packages which are not actually needed anymore
    excess="$(pacman --deps --query --quiet --unrequired | tr '\n' ' ')"  # -Qtdq
    if [ ! -z "${excess}" ]; then
        pacman --nosave --recursive --remove "${excess}"  # -Rns
    fi

    # XXX FIXME TODO  Do a better job of managing foreign packages
    # foreign="$(pacman --foreign --query --quiet)"  # -Qmq
    # yay --aur --refresh --sudo su --sync --sysupgrade

    # Clean out local package cache
    rm -rf /var/cache/pacman/pkg/*

    rpi_eeprom_upgrade

    # List packages:
    # pacman --query          # -Q   with version numbers
    # pacman --query --quiet  # -Qq  without version numbers
}


opkg_upgrade() {
    # OpenWRT

    opkg update
    opkg list-upgradable | cut -d ' ' -f 1 | xargs -r opkg upgrade

    rpi_eeprom_upgrade

    # XXX FIXME TODO  Just list all the installed package versions
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
