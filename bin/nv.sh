#!/usr/bin/env bash

# This script will switch into Python Virtual Environments, creating them if
# missing.

# Invocation examples:
#     . ${0} ${name}
#     source ${0} ${name}

location="${HOME}/.venv"

# Get the name of the desired venv
name="${1}"
if [ -z "${name}" ]; then
    echo 'Must have specify a venv name'
    return 1
else
    echo "Switching to venv '${name}'"
fi

# Deactivate the current venv
if python -c 'import sys; sys.exit(0) if hasattr(sys, "real_prefix") else sys.exit(1)'; then
    echo "Deactivating venv '$(basename ${VIRTUAL_ENV})'" \
        && deactivate
else
    echo 'Not inside a venv'
fi

# Create the venv if it is missing
if [ ! -d "${location}/${name}" ]; then
    # python3 -m venv ${location}/${name}
    virtualenv --python=$(which python3) ${location}/${name}
else
    echo "Already created venv '${name}'"
fi

# Activate the new venv
echo "Activating venv '${name}'"
source ${location}/${name}/bin/activate
