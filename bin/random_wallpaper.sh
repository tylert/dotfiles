#!/usr/bin/env bash

# Tools required:  bash, GNU coreutils (echo, head, id, sort), GNU findutils (find)


cinnamon_random_wallpaper() {
    wallpaper="$(find ~/.local/share/wallpapers -maxdepth 1 -type f | sort -R | head -1)"

    # existing=$(gsettings get org.cinnamon.desktop.background picture-uri)
    gsettings set org.cinnamon.desktop.background picture-uri \
        "file://${wallpaper}"
    # gsettings set org.cinnamon.desktop.background picture-options "spanned"

    # xprop -root -notype _NET_CURRENT_DESKTOP   # show current workspace index
    # xprop -root -notype _NET_DESKTOP_GEOMETRY  # show desktop (X, Y) pixels
    # xprop -root -notype _NET_DESKTOP_NAMES     # list names of workspaces

    # https://github.com/rarsamx/Scripts/blob/master/bash/wmSetMultimonitorBkgrnd.sh
}


osx_random_wallpaper() {
    wallpaper="$(find ~/.local/share/wallpapers -maxdepth 1 -type f | sort -R | head -1)"

    osascript -e 'tell application "Finder" to set desktop picture to POSIX file "'${wallpaper}'"'

    # sqlite3 ~/Library/Application Support/Dock/desktoppicture.db
    # update data set value = "${wallpaper}"
    # killall Dock
}


random_wallpaper() {
    case $(uname -s) in
        'Linux')
            # XXX FIXME TODO  Find a nicer way to determine your window manager on Linux!!!
            case 'cinnamon' in
                'cinnamon') cinnamon_random_wallpaper ;;
                *) echo 'I do not recognize your window manager.' ; exit 3 ;;
            esac ;;
        'Darwin') osx_random_wallpaper ;;
        *) echo 'I do not recognize your operating system.' ; exit 2 ;;
    esac
}


if [ '0' == $(id -u) ]; then
    echo 'Do not run this with sudo.'
    exit 1
fi

random_wallpaper
