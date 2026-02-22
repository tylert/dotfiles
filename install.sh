#!/usr/bin/env bash

# Tools required:  bash, GNU coreutils (chmod, dirname, ln, mkdir, readlink, rm)

this="$(readlink --canonicalize ${BASH_SOURCE[0]})"

# Short optons vs. long options (for when they're way too long):
#   'ln -sfv -t' = 'ln --symbolic --force --verbose --target-directory'
#   'rm -rfv' = 'rm --recursive --force --verbose'

#  _               _
# | |__   __ _ ___| |__
# | '_ \ / _` / __| '_ \
# | |_) | (_| \__ \ | | |
# |_.__/ \__,_|___/_| |_|
ln -sfv -t "${HOME}" "$(dirname ${this})/bash/.bash_profile"
ln -sfv -t "${HOME}" "$(dirname ${this})/bash/.bash_logout"

#                   __ _
#   ___ ___  _ __  / _(_) __ _
#  / __/ _ \| '_ \| |_| |/ _` |
# | (_| (_) | | | |  _| | (_| |
#  \___\___/|_| |_|_| |_|\__, |
#                        |___/
if [ ! -d "${HOME}/.config" ]; then
    mkdir --mode=0700 --parents --verbose "${HOME}/.config"
else
    chmod --changes 0700 "${HOME}/.config"
fi
ln -sfv -t "${HOME}/.config" "$(dirname ${this})/config/user-dirs.dirs"

#   __ _  ___
#  / _` |/ _ \
# | (_| | (_) |
#  \__, |\___/
#  |___/
if [ -d "${HOME}/.config/go/telemetry" ]; then
    rm -rfv "${HOME}/.config/go/telemetry"
    touch "${HOME}/.config/go/telemetry"
else
    if [ ! -d "${HOME}/.config/go" ]; then
        mkdir --mode=0755 --parents --verbose "${HOME}/.config/go"
        touch "${HOME}/.config/go/telemetry"
    fi
fi

#          _
#  ___ ___| |__
# / __/ __| '_ \
# \__ \__ \ | | |
# |___/___/_| |_|
if [ ! -d "${HOME}/.ssh" ]; then
    mkdir --mode=0700 --parents --verbose "${HOME}/.ssh"
else
    chmod --changes 0700 "${HOME}/.ssh"
fi
ln -sfv -t "${HOME}/.ssh" "$(dirname ${this})/ssh/config"

#  _
# | |_ _ __ ___  _   ___  __
# | __| '_ ` _ \| | | \ \/ /
# | |_| | | | | | |_| |>  <
#  \__|_| |_| |_|\__,_/_/\_\
rm -fv "${HOME}/.tmux.conf"
if [ ! -d "${HOME}/.config/tmux" ]; then
    mkdir --mode=0755 --verbose "${HOME}/.config/tmux"
else
    chmod --changes 0755 "${HOME}/.config/tmux"
fi
ln -sfv -t "${HOME}/.config/tmux" "$(dirname ${this})/config/tmux/tmux.conf"

#        _                           _
# __   _(_)_ __ ___       __ ___   _(_)_ __ ___
# \ \ / / | '_ ` _ \     / _` \ \ / / | '_ ` _ \
#  \ V /| | | | | | |_  | (_| |\ V /| | | | | | |
#   \_/ |_|_| |_| |_( )  \__, | \_/ |_|_| |_| |_|
#                   |/   |___/
rm -fv "${HOME}/.vimrc" "${HOME}/.gvimrc"
if [ ! -d "${HOME}/.config/vim" ]; then
    mkdir --mode=0755 --verbose "${HOME}/.config/vim"
else
    chmod --changes 0755 "${HOME}/.config/vim"
fi
ln -sfv -t "${HOME}/.config/vim" "$(dirname ${this})/config/vim/vimrc"
ln -sfv -t "${HOME}/.config/vim" "$(dirname ${this})/config/vim/gvimrc"
