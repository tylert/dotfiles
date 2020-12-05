# Python stuff
export PATH="${HOME}/.pyenv/bin:${PATH}"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Golang stuff
export PATH="${PATH}:/usr/local/go/bin"

# Hashicorp stuff
export CHECKPOINT_DISABLE=1
export VAGRANT_CHECKPOINT_DISABLE=1

# Enable standard 'ls' colourization on macOS
alias ls='ls -G'

# Fix some more dumb macOS stuff
export HOMEBREW_NO_ANALYTICS=1
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
export VAGRANT_OLD_ENV_OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

