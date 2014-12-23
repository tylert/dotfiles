#!/usr/bin/env bash

# Fetch the latest version of Xcode appropriate for your current OS X release
# Visit https://developer.apple.com/downloads

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew doctor

brew install macvim
brew install git
brew install awscli

sudo easy_install pip
