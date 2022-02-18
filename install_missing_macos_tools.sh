#!/usr/bin/env bash

# Turn a MacBook/Mac into something more useful.  Visit https://brew.sh and do
# whatever they tell you to do, no matter how weird it sounds.  Then run the
# following script below.

# brew list --formulae | tr ' ' '\n' | sort | tr '\n' ' ' ; echo
# ... and then cull everything but the packages you actually want/need
# to create the list below...
brew_formulae='
awscli bash consul curl ditaa fdupes ffmpeg figlet git git-filter-repo git-gui
git-lfs git-subrepo gnu-sed go gomplate govc graphviz imagemagick jhead jq
k3sup macvim mr nomad packer pandoc putty pwgen pyenv pyenv-virtualenv rename
ruby rust sshpass terraform tflint tree vault waypoint wget wireguard-tools
'

# brew list --casks | tr ' ' '\n' | sort | tr '\n' ' ' ; echo
brew_casks='
firefox gotomeeting iterm2 karabiner-elements keepassxc meld
microsoft-auto-update microsoft-office microsoft-remote-desktop microsoft-teams
ringcentral sourcetree vmware-horizon-client vscodium zoom
'

for package in ${brew_fomulae}; do
    brew install --formulae ${package}
done
for package in ${brew_casks}; do
    brew install --casks ${package}
done

# Other things that are nice to have but aren't very install-y for $reasons:
# amazon-chime vagrant virtualbox virtualbox-extension-pack
# https://rancherdesktop.io
# hashi-up --help && hashi-up boundary get --help
# hashi-up --help && hashi-up ${tool} get --help

# If installing brew for the first time, let your shell know about it:
# bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# eval "$(/opt/homebrew/bin/brew shellenv)"
# echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ${HOME}/.whatever_you_use_for_your_shell

# If you want to run open-source things that haven't paid the Apple ransom yet:
# sudo spctl --master-disable  # Oh for the love of Dog!!!

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
