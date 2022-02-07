#!/usr/bin/env bash

# After installing https://brew.sh

# brew list --formulae | tr ' ' '\n' | sort | tr '\n' ' '
# ... and then cull everything but the packages you actually want/need
# to create the list below...
brew_formulae='
awscli bash consul curl ditaa fdupes ffmpeg figlet git git-filter-repo git-gui
git-lfs git-subrepo gnu-sed go gomplate govc graphviz imagemagick jq k3sup
macvim mr nomad packer pandoc putty pwgen pyenv pyenv-virtualenv rename ruby
rust sshpass terraform tflint tree vault waypoint wget
'

# brew list --casks | tr ' ' '\n' | sort | tr '\n' ' '
brew_casks='
firefox gotomeeting iterm2 karabiner-elements keepassxc meld microsoft-office
microsoft-remote-desktop microsoft-teams ringcentral sourcetree
vmware-horizon-client vscodium zoom
'

for package in ${brew_fomulae}; do
    brew install --formulae ${package}
done
for package in ${brew_casks}; do
    brew install --casks ${package}
done

# Other things that are nice to have that aren't very install-y for $reasons:
# amazon-chime vagrant virtualbox virtualbox-extension-pack
# https://rancherdesktop.io
# hashi-up --help && hashi-up boundary get --help
# hashi-up --help && hashi-up ${tool} get --help

# If installing brew for the first time, let your shell know about it:
# bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ${HOME}/.whatever_you_use_for_your_shell
# eval "$(/opt/homebrew/bin/brew shellenv)"

# If you want to install brew things that haven't paid the macOS ransom:
# sudo spctl --master-disable

# If you experience unexplained crashy-crashy on a slightly-bloated M1:
# /usr/sbin/softwareupdate --install-rosetta --agree-to-license

# If you find Rancher Desktop (beta) not running nicely:
# sudo dseditgroup -o edit -a $(whoami) -t user admin  # add me to 'admin' group
# sudo dseditgroup -o edit -a $(whoami) -t user wheel  # add me to 'wheel' group
# sudo chmod g+w /usr/local/bin  # give 'wheel' group write permissions
