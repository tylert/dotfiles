#!/usr/bin/env bash

# https://xkcd.com/1654/


pacman_upgrade() {
    # Should work on Arch Linux and PiKVM
    pacman --sync --refresh --noconfirm
    pacman --sync --sysupgrade --noconfirm
    pacman --sync --clean --noconfirm
    # rm -rf /var/cache/pacman/pkg
    # XXX FIXME TODO  Make sure we do the right thing on PiKVM too!!!
}


apt_upgrade() {
    # Should work on Debian, Ubuntu and Raspberry Pi OS (former Raspbian)
    apt-get update
    apt-get --yes dist-upgrade
    apt-get --yes autoremove
    apt-get autoclean
    apt-get clean
    # XXX FIXME TODO  How much other cleanup should we do here???
}


brew_upgrade() {
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
    case $(uname) in
        'Linux')
            case 'Debian' in
                'Arch') pacman_upgrade ;;
                'Debian') apt_upgrade ;;
                *) echo 'I do not recognize your distribution.' ; exit 1 ;;
            esac ;;
        'Darwin') brew_upgrade ;;
        *) echo 'I do not recognize your operating system.' ; exit 2 ;;
    esac
}


upgrade_everything


# import platform
# if '2' == platform.python_version()[0]:
#     print(platform.dist()[0])
# else:
#     print(platform.freedesktop_os_release()['ID'])

# python -c 'import platform ; print(platform.system())' -> Linux or Darwin
