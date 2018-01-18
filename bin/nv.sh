#!/usr/bin/env bash

# This script will switch into Python Virtual Environments, creating them if
# missing.

# Invocation examples:
#     source ${0} ${name}
#     . ${0} ${name}
#     . ${0} ${name} 2     # Set it to use python2.x rather than python3.x

location="${HOME}/.venv"

# Get the name of the desired venv
name="${1}"
if [ -z "${name}" ]; then
    echo 'Must specify a venv name'
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
    # Get the major version of python to use
    version="${2}"
    if [ '2' == "${version}" ]; then
        echo 'Creating venv for python2'
        virtualenv --python=$(which python2) "${location}/${name}"
    else
        echo 'Creating venv for python3'
        python3 -m venv "${location}/${name}"
    fi
else
    echo "Already created venv '${name}'"
fi

# Activate the new venv
echo "Activating venv '${name}'"
source "${location}/${name}/bin/activate"
"${VIRTUAL_ENV}/bin/python" --version
