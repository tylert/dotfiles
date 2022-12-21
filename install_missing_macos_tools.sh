#!/usr/bin/env bash

# Turn a MacBook/Mac into something more useful.  Visit https://brew.sh and do
# whatever they tell you to do, no matter how weird it sounds.  Then run the
# following script below.

# If installing brew for the first time, let your shell know about it:
# bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# eval "$(/opt/homebrew/bin/brew shellenv)"
# echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ${HOME}/.whatever_you_use_for_your_shell

# brew list --formulae | tr ' ' '\n' | sort | tr '\n' ' ' ; echo
# ... and then cull everything but the packages you actually want/need
# to create the list below...
brew_formulae='
aws-nuke awscli azure-cli bash consul curl d2 ditaa fdupes ffmpeg figlet git
git-filter-repo git-gui git-lfs git-subrepo gnu-getopt gnu-sed gnupg go
gomplate govc graphviz helm hugo imagemagick jhead jq k3sup kubernetes-cli
macvim mr nomad packer pandoc putty pwgen pyenv pyenv-virtualenv qemu rename
ruby rust skopeo sqlite terraform tmux tree trzsz-go vault vcluster waypoint
wget wireguard-go wireguard-tools
'

# brew list --casks | tr ' ' '\n' | sort | tr '\n' ' ' ; echo
brew_casks='
1password 1password-cli firefox iterm2 karabiner-elements keepassxc meld
microsoft-auto-update microsoft-office microsoft-remote-desktop microsoft-teams
rancher sourcetree vscodium
'

for package in ${brew_formulae}; do
    brew install --formulae ${package}
done
for package in ${brew_casks}; do
    brew install --casks ${package}
done

# Other things that are nice to have but aren't very install-y for $reasons:
# amazon-chime vagrant virtualbox virtualbox-extension-pack
# hashi-up --help && hashi-up boundary get --help
# hashi-up --help && hashi-up ${tool} get --help

# If you want to run open-source things that haven't paid the Apple ransom yet:
# sudo spctl --global-disable  # Oh for the love of Dog!!!
# sudo spctl --master-disable  # This used to be the command pre 13.x.x

# If you find Rancher Desktop (beta) not running nicely:
# sudo dseditgroup -o edit -a $(whoami) -t user admin  # add me to 'admin' group
# sudo dseditgroup -o edit -a $(whoami) -t user wheel  # add me to 'wheel' group
# sudo chmod g+w /usr/local/bin  # give 'wheel' group write permissions

# If you experience unexplained crashy-crashy on a slightly-bloated M1:
# /usr/sbin/softwareupdate --install-rosetta --agree-to-license

# If your MacBook M1 goes :boom: and you need to get into "Safe Mode"...
# Shut 'er off, wait 10 seconds, hold down power until it says "Loading :poop:"
# then use "Shift" and select your drive to "Continue in Safe Mode".
# You may have to use this ^^^ before/after every blessed macOS update!!!
# This has been the case, so far, for:  12.2, 12.2.1

# Fix xcode after an OS upgrade hoses your entire machine:
# sudo xcodebuild -license  # accept the nag-ware yet again
# sudo xcode-select --reset  # give the patient electroshock treatment
# xcode-select --install  # <-- use only as a last resort!!!
# xcodebuild -runFirstLaunch  # <-- 12.6 borks things yet again!!!

# https://danmackinlay.name/notebook/macos_hacks.html
