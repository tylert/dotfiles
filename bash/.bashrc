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
# if ! pgrep -u ${USER} ssh-agent > /dev/null; then
#     mkdir -m 0700 -p ${HOME}/.ssh
#     ssh-agent > "${HOME}/.ssh/agent"
# fi
# if [[ ! "${SSH_AUTH_SOCK}" ]]; then
#     source "${HOME}/.ssh/agent" > /dev/null
# fi

# Go stuff
export PATH="${HOME}/go/bin:${PATH}"

# HashiCorp stuff
export CHECKPOINT_DISABLE=1
export VAGRANT_CHECKPOINT_DISABLE=1
