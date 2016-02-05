#!/usr/bin/env bash

# Install homebrew (requires Xcode and Xcode command-line tools)
# https://developer.apple.com/downloads
# http://brew.sh
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install git
brew install macvim
brew install rename
brew install wget

# Install pip/virtualenv
sudo easy_install pip
sudo -H pip install virtualenv

# Install rvm
# http://rvm.io
brew install gpg
gpg --keyserver hkp://keys.gnupg.net --recv-key 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable --ruby
#\curl -O https://raw.githubusercontent.com/rvm/rvm/master/binscripts/rvm-installer
#\curl -O https://raw.githubusercontent.com/rvm/rvm/master/binscripts/rvm-installer.asc
#gpg --verify rvm-installer.asc && bash rvm-installer stable

# Install bundle(r)
# http://bundler.io
gem install bundler
