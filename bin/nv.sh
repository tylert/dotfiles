#!/usr/bin/env bash

# XXX FIXME TODO

# Get the name of the desired venv
name="${1}"
if [ -z "${name}" ]; then
    echo 'Must have a name'
    exit 1
fi

# Can also use $VIRTUAL_ENV if not calling into venv/bin/* directly
if python -c 'import sys; sys.exit(0) if hasattr(sys, "real_prefix") else sys.exit(1)'; then
    echo 'in a venv'
    # deactivate
else
    echo 'not in a venv'
fi

# Create the venv if it is missing
if [ ! -d ~/.venv/${name} ]; then
    virtualenv --python=$(which python3) ~/.venv/${name}
    # python3 -m venv ~/.venv/${name}
fi

# Switch to the new venv
# echo "Activating venv ${name}"
# source ~/.venv/${name}/bin/activate
