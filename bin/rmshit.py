#!/usr/bin/env python

# Cull useless and annoying dotfiles in a user's home directory for stuff that
# does not honour the XDG Desktop specifications for where to leave their
# droppings.

# https://github.com/lahwaacz/Scripts/blob/master/rmshit.py

from os import path, remove
from shutil import rmtree


turdfiles = [
    '~/.adobe/',                                   # Macromedia Flash crap
    '~/.android/',                                 # Android crap
    '~/.ansible/',                                 # Ansible crap
    '~/.ansible_async/',                           # Ansible crap
    '~/.ansible_galaxy',                           # Ansible crap
    '~/.arduino15/',                               # Arduino crap
    '~/Arduino/',                                  # Arduino crap
    '~/.arduino/',                                 # Arduino crap
    '~/.atom/',                                    # Atom crap
    '~/.audacity-data/',                           # Audacity crap
    '~/.bash_history',                             # Bash crap
    '~/.bash_sessions/',                           # iTerm2 crap
    '~/.cache/',                                   # GNOME-ish crap
    '~/Calibre Library/',                          # Calibre crap
    '~/.cargo/',                                   # Rust crap
    '~/.CFUserTextEncoding',                       # macOS crap
    '~/.chirp/',                                   # CHIRP crap
    '~/.cisco/',                                   # Cisco log crap
    '~/credstash.log',                             # Credstash crap
    '~/.docker/',                                  # Docker (Rancher) crap
    '~/Downloads/',                                # oh, for the love of Dog, why!?!
    '~/.DS_Store',                                 # macOS crap
    '~/.dvdcss/',                                  # libdvdcss crap
    '~/.eos-wallpaper-set.history-of-wallpapers',  # EndeavourOS crap
    '~/.foxtrotgps/',                              # FoxtrotGPS crap
    '~/.gconf/',                                   # GNOME-ish crap not using .{cache,config,local}
    '~/.ghoto/',                                   # gPhoto crap
    '~/.gimp-2.8/',                                # GIMP crap
    '~/.gitflow_export',                           # Sourcetree crap
    '~/.gitignore_global',                         # Sourcetree crap
    '~/.gnome2/',                                  # GNOME-ish crap not using .{cache,config,local}
    '~/.gnome2_private/',                          # GNOME-ish crap not using .{cache,config,local}
    '~/.gnuradio/',                                # GNURadio crap
    '~/.govmomi/',                                 # VMware crap
    '~/.gphoto/',                                  # GNOME photo crap
    '~/.gr_fftw_wisdom',                           # GNURadio crap
    '~/.gr_fftw_wisdom.lock',                      # GNURadio crap
    '~/.hgignore_global',                          # Sourcetree crap
    '~/.hplip/',                                   # HP Linux Imaging and Printing crap
    '~/.icons/',                                   # GNOME-ish crap not using .{cache,config,local}
    '~/.java/',                                    # Java crap
    '~/.knownPackages',                            # Android crap
    '~/.lesshsQ',                                  # Less crap
    '~/.lesshst',                                  # Less crap
    '~/.macromedia/',                              # Macromedia Flash crap
    '~/Maps/',                                     # FoxtrotGPS crap
    '~/Movies/',                                   # oh, for the love of Dog, why!?!
    '~/Music/',                                    # oh, for the love of Dog, why!?!
    '~/.nomadnetwork/',                            # Reticulum crap not using .{cache,config,local}
    '~/.oracle_jre_usage/',                        # Java crap
    '~/.ovftool.ssldb',                            # VMware crap
    '~/.packer.d/',                                # HashiCorp crap
    '~/Pictures/',                                 # oh, for the love of Dog, why!?!
    '~/.pki/',                                     # Firefox crap
    '~/.platformio/',                              # Platformio crap
    '~/Public/',                                   # oh, for the love of Dog, why!?!
    '~/.purple/',                                  # Pidgin crap
    '~/.putty/',                                   # Puttygen crap
    '~/__pycache__/',                              # Python crap
    '~/.python_history',                           # Python crap
    '~/.python-version',                           # Python crap
    '~/.reticulum/',                               # Reticulum crap not using .{cache,config,local}
    '~/.sane/',                                    # Scanner Access Now Easy crap
    '~/sketchbook/',                               # Arduino crap
    '~/.sqlite_history',                           # SQLite crap
    '~/.stCommitMsg',                              # Sourcetree crap
    '~/.swiftpm/',                                 # macOS crap
    '~/Templates/',                                # oh, for the love of Dog, why!?!
    '~/.terraform.d/',                             # HashiCorp crap
    '~/.themes/',                                  # GNOME-ish crap not using .{cache,config,local}
    '~/.thumbnails/',                              # GNOME-ish crap not using .{cache,config,local}
    '~/.tintin/',                                  # Tintin++ crap
    '~/.tkremindrc',                               # Remind crap
    '~/.vagrant.d/',                               # HashiCorp crap
    '~/.vault-token',                              # HashiCorp crap
    '~/Videos/',                                   # oh, for the love of Dog, why!?!
    '~/.viminfo',                                  # Vim crap
    '~/.vim/',                                     # Vim crap
    '~/.VisualIDs/',                               # FoxtrotGPS crap
    '~/.vmware/',                                  # VMware crap
    '~/.vscode-oss/',                              # VSCodium crap
    '~/.vscode/',                                  # VSCode crap
    '~/.wget-hsts',                                # Wget crap
    '~/.xournal/',                                 # Xournal crap
    '~/.xsession-errors.old',                      # Xorg crap
    '~/.xsession-errors',                          # Xorg crap
    '~/.zoom/',                                    # Zoom crap
]
#   '~/.bash_history-?????.tmp',                   # Bash crap
#   '~/Documents/',                                # oh, for the love of Dog, why!?!
#   '~/.face',                                     # Debian crap
#   '~/.face.icon',                                # Debian crap
#   '~/go/',                                       # Go crap (use "go clean -modcache ; rm -rf ~/go/")
#   '~/.kube/',                                    # Rancher Desktop crap
#   '~/.kuberlr/',                                 # Rancher Desktop crap
#   '~/.rd/',                                      # Rancher Desktop crap


def yesno(question, default='n'):
    ''' Asks the user for YES or NO, always case insensitive.
        Returns True for YES and False for NO.
    '''

    prompt = f'{question} (y/[n]) '
    ans = input(prompt).strip().lower()

    if not ans:
        ans = default

    if ans == 'y':
        return True
    return False


def main():
    ''' Actually cull the shitty files we find.
    '''

    found = []
    for f in turdfiles:
        absf = path.expanduser(f)
        if path.exists(absf):
            found.append(absf)

    if len(found) == 0:
        print('No shitty files found :)')
        return
    else:
        print('Found shitty files:')
        for f in found:
            print(f'    {f}')

    if yesno('Remove all?', default='n'):
        for f in found:
            if path.isfile(f):
                remove(f)
            else:
                rmtree(f)
        print('All cleaned')
    else:
        print('No file removed')


if __name__ == '__main__':
    main()
