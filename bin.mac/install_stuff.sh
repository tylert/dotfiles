#!/usr/bin/env bash

# Fetch the latest version of Xcode appropriate for your current OS X release
# Visit https://developer.apple.com/downloads

# homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install git
brew install macvim

# pip/virtualenv
sudo easy_install pip
sudo -H pip install virtualenv

# rvm
brew install gpg
gpg --keyserver hkp://keys.gnupg.net --recv-key 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable --ruby

#\curl -O https://raw.githubusercontent.com/rvm/rvm/master/binscripts/rvm-installer
#\curl -O https://raw.githubusercontent.com/rvm/rvm/master/binscripts/rvm-installer.asc
#gpg --verify rvm-installer.asc && bash rvm-installer stable
