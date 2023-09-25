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

# Go stuff
export PATH="${HOME}/go/bin:${PATH}"

# HashiCorp stuff
export CHECKPOINT_DISABLE=1
export VAGRANT_CHECKPOINT_DISABLE=1
