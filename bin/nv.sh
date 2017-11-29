#!/usr/bin/env bash

# XXX FIXME TODO

# Get the name of the desired venv
name="${1}"
if [ -z "${name}" ]; then
    echo 'Must have a name'
    exit 1
fi

# Can kinda trust $VIRTUAL_ENV, however, this way works even if calling bin
# direclty
# if python -c 'import sys; sys.real_prefix' 2>/dev/null; then
#     oldvenv=$(python -c 'import sys; print(sys.real_prefix)')
#     echo "Deactivating venv ${oldvenv}"
#     deactivate
# fi

# Create the venv if it is missing
if [ ! -d ~/.venv/${name} ]; then
    virtualenv --python=$(which python3) ~/.venv/${name}
    # python3 -m venv ~/.venv/${name}
fi

# Switch to the new venv
echo "Activating venv ${name}"
source ~/.venv/${name}/bin/activate
