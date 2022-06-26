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

# SSH agent stuff (procps-ng for pgrep)
if [ -z "$(pgrep -u ${USER} ssh-agent)" ]; then
    rm "${HOME}/.ssh/agent"
    eval ssh-agent -a "${HOME}/.ssh/agent" > /dev/null
fi
export SSH_AGENT_PID="$(pgrep -u ${USER} ssh-agent)"
export SSH_AUTH_SOCK="${HOME}/.ssh/agent"

# Python stuff
if false; then
    export PATH="${HOME}/.pyenv/bin:${HOME}/.pyenv/shims:${PATH}"
    eval "$(pyenv init --path)"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

# Go stuff
export PATH="${HOME}/go/bin:${PATH}"

# HashiCorp stuff
export CHECKPOINT_DISABLE=1
export VAGRANT_CHECKPOINT_DISABLE=1
