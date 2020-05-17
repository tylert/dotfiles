# Enable 'ls' colours on macOS
alias ls='ls -G'

# Turn off some dumb Hashicorp stuff
export CHECKPOINT_DISABLE=1
export VAGRANT_CHECKPOINT_DISABLE=1

# Fix some more dumb macOS stuff
export HOMEBREW_NO_ANALYTICS=1
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
export VAGRANT_OLD_ENV_OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# Enable pyenv stuff
export PATH="${HOME}/.pyenv/bin:${PATH}"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
