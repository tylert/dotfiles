#!/usr/bin/env bash

# Tools required:  bash, coreutils (chmod, dirname, ln, mkdir, readlink, rm)

self="$(readlink --canonicalize ${BASH_SOURCE[0]})"

# Short optons vs. long options (for when they're way too long)
#   'ln -sfv -t' = 'ln --symbolic --force --verbose --target-directory'
#   'rm -fv' = 'rm --force --verbose'

#                   __ _       
#   ___ ___  _ __  / _(_) __ _ 
#  / __/ _ \| '_ \| |_| |/ _` |
# | (_| (_) | | | |  _| | (_| |
#  \___\___/|_| |_|_| |_|\__, |
#                        |___/ 
if [ ! -d "~/.config" ]; then
    mkdir --mode=0700 --parents --verbose "~/.config"
else
    chmod --changes 0700 "~/.config"
fi
ln -sfv -t "~/.config" "$(dirname ${self})/config/user-dirs.dirs"

#  _               _     
# | |__   __ _ ___| |__  
# | '_ \ / _` / __| '_ \ 
# | |_) | (_| \__ \ | | |
# |_.__/ \__,_|___/_| |_|
ln -sfv -t "~" "$(dirname ${self})/bash/.bash_profile"
ln -sfv -t "~" "$(dirname ${self})/bash/.bash_logout"

#  _
# | |_ _ __ ___  _   ___  __
# | __| '_ ` _ \| | | \ \/ /
# | |_| | | | | | |_| |>  <
#  \__|_| |_| |_|\__,_/_/\_\
rm -fv "~/.tmux.conf"
if [ ! -d "~/.config/tmux" ]; then
    mkdir --mode=0755 --verbose "~/.config/tmux"
else
    chmod --changes 0755 "~/.config/tmux"
fi
ln -sfv -t "~/.config/tmux" "$(dirname ${self})/config/tmux/tmux.conf"

#        _                           _
# __   _(_)_ __ ___       __ ___   _(_)_ __ ___
# \ \ / / | '_ ` _ \     / _` \ \ / / | '_ ` _ \
#  \ V /| | | | | | |_  | (_| |\ V /| | | | | | |
#   \_/ |_|_| |_| |_( )  \__, | \_/ |_|_| |_| |_|
#                   |/   |___/
rm -fv "~/.vimrc" "~/.gvimrc"
if [ ! -d "~/.config/vim" ]; then
    mkdir --mode=0755 --verbose "~/.config/vim"
else
    chmod --changes 0755 "~/.config/vim"
fi
ln -sfv -t "~/.config/vim" "$(dirname ${self})/config/vim/vimrc"
ln -sfv -t "~/.config/vim" "$(dirname ${self})/config/vim/gvimrc"

#          _
#  ___ ___| |__
# / __/ __| '_ \
# \__ \__ \ | | |
# |___/___/_| |_|
if [ ! -d "~/.ssh" ]; then
    mkdir --mode=0700 --parents --verbose "~/.ssh"
else
    chmod --changes 0700 "~/.ssh"
fi
ln -sfv -t "~/.ssh" "$(dirname ${self})/ssh/config"
