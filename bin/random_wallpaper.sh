#!/usr/bin/env bash


cinnamon_random_wallpaper() {
    wallpaper="$(find ~/.wallpapers -type f | sort -R | head -1)"

    # existing=$(gsettings get org.cinnamon.desktop.background picture-uri)
    gsettings set org.cinnamon.desktop.background picture-uri \
        "file://${wallpaper}"

    # xprop -root -notype _NET_CURRENT_DESKTOP   # show current workspace index
    # xprop -root -notype _NET_DESKTOP_GEOMETRY  # show desktop (X, Y) pixels
    # xprop -root -notype _NET_DESKTOP_NAMES     # list names of workspaces
}


osx_random_wallpaper() {
    wallpaper="$(find ~/.wallpapers -type f | sort -R | head -1)"

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
