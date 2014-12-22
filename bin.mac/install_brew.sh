#!/usr/bin/env bash

# Visit https://developer.apple.com/downloads
# Fetch the latest version of Xcode appropriate for your current OS X release

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew doctor
