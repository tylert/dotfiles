#!/usr/bin/env bash

# Brew-upgrade

brew update
brew upgrade --formulae
brew upgrade --casks
brew cleanup
