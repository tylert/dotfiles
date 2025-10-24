#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# If this is an xterm set the titlebar to user@host:dir
case "${TERM}" in
xterm*|rxvt*)
    PS1="\[\e]0;\u@\h:\w\a\]${PS1}"
    ;;
*)
    ;;
esac

# Prevent stupid empty ~/.bash_history-?????.tmp turd files
export HISTSIZE=10000

# Git stuff
export GIT_EDITOR=vim

# Go stuff
export PATH="${HOME}/go/bin:${PATH}"

# Python stuff
export PATH="${HOME}/.local/bin:${PATH}"

# HashiCorp stuff
export CHECKPOINT_DISABLE=1
export VAGRANT_CHECKPOINT_DISABLE=1

alias pbcopy='xsel --primary --input'
alias pbpaste='xsel --primary --output'
