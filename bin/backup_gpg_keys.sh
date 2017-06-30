#!/usr/bin/env bash

# Spit out a local file containing a GPG public (and, possibly, secret) key

keyid="${1}"

# Yank down the latest
gpg --keyserver pgp.mit.edu --recv-key ${keyid}

# Export the public key
gpg --export --armor ${keyid} > ${keyid}.gpg.pub.asc

# Export the private key
umask 0077
gpg --export-secret-key --armor ${keyid} > ${keyid}.gpg.sec.asc

# Get rid of empty husks
if [ $(stat -c %s ${keyid}.gpg.pub.asc) -eq 0 ]; then
    rm ${keyid}.gpg.pub.asc
fi

if [ $(stat -c %s ${keyid}.gpg.sec.asc) -eq 0 ]; then
    rm ${keyid}.gpg.sec.asc
fi
