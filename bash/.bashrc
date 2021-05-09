#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# If this is an xterm set the titlebar to user@host:dir
case "${TERM}" in
xterm*|rxvt*)
    PS1="\[\e]0;\u@\h:\w\a\]${PS1}"
    ;;
*)
    ;;
esac

# Python stuff
if [ 0 ]; then
    export PATH="${HOME}/.pyenv/bin:${PATH}"
    eval "$(pyenv init -)"
    eval "$(pyenv init --path)"
    eval "$(pyenv virtualenv-init -)"
fi

# Golang stuff
export PATH="${PATH}:/usr/local/go/bin"

# HashiCorp stuff
export CHECKPOINT_DISABLE=1
export VAGRANT_CHECKPOINT_DISABLE=1
