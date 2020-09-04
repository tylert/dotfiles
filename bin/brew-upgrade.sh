#!/usr/bin/env bash

# Brew-upgrade

brew update
brew upgrade --formula
brew upgrade --cask
brew cleanup
