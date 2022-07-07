#!/usr/bin/env bash

# https://xkcd.com/1654/


pacman_upgrade() {
    # Should work on Arch Linux, EndeavourOS, PiKVM, etc.
    pacman --sync --refresh --noconfirm
    pacman --sync --sysupgrade --noconfirm
    pacman --sync --clean --noconfirm
    # rm -rf /var/cache/pacman/pkg
    # XXX FIXME TODO  Make sure we do the right thing on PiKVM too!!!
}


apt_upgrade() {
    # Should work on Debian, Ubuntu, Raspberry Pi OS (former Raspbian), etc.
    apt-get update
    apt-get --yes dist-upgrade
    apt-get --yes autoremove
    apt-get autoclean
    apt-get clean
    # XXX FIXME TODO  How much other cleanup should we do here???
    # sudo rpi-eeprom-update -a -d
}


brew_upgrade() {
    # Should work with macOS (and apparently others too although not sure why)
    if [ '0' == $(id -u) ]; then
        echo 'Do not run this with sudo.'
        exit 3
    fi
    brew update
    brew upgrade --formulae
    brew upgrade --casks
    brew cleanup
}


upgrade_everything() {
    # XXX FIXME TODO  Find a nice(r) way to determine your Linux distro!!!
    case $(uname -s) in
        'Linux')
            case 'Arch' in
                'Arch') pacman_upgrade ;;
                'Debian') apt_upgrade ;;
                *) echo 'I do not recognize your Linux distribution.' ; exit 1 ;;
            esac ;;
        'Darwin') brew_upgrade ;;
        *) echo 'I do not recognize your operating system.' ; exit 2 ;;
    esac
}


upgrade_everything
