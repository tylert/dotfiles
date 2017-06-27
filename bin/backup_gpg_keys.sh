#!/usr/bin/env bash

keyid="${1}"

# Yank down the latest
gpg --recv-key ${keyid} --keyserver pgp.mit.edi

# Export the public key
gpg --export --armor ${keyid} > ${keyid}.gpg.pub.asc

# Export the private key
umask 0077
gpg --export-secret-key --armor ${keyid} > ${keyid}.gpg.sec.asc

# Usually there is no secret key if this is someone else's key
if [ $(stat -c %s ${keyid}.gpg.sec.asc) -eq 0 ]; then
    rm ${keyid}.gpg.sec.asc
fi
