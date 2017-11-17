# Enable 'ls' colours on macOS
alias ls='ls -G'

# Turn off some dumb stuff
export HOMEBREW_NO_ANALYTICS=1
export CHECKPOINT_DISABLE=1
export VAGRANT_CHECKPOINT_DISABLE=1

# Python Virtualenv Switcher
function nv {
    local venv="${1}"

    if [ -d ~/.venv/${venv} ]; then
        source ~/.venv/${venv}/bin/activate
    else
        echo "~/.venv/${venv} doesn't exist"
    fi
}

# Python Virtualenv Creator
function nvc {
    local venv="${1}"

    if [ ! -d ~/.venv/${venv} ]; then
        virtualenv --python=$(which python3) ~/.venv/${venv}
    else
        echo "~/.venv/${venv} already exists"
    fi
}
