#!/usr/bin/env python

# Cull useless and annoying dotfiles in a user's home directory for stuff that
# does not honour the XDG Desktop specifications for where to leave their
# droppings.

# https://github.com/lahwaacz/Scripts/blob/master/rmshit.py

import os
import sys
import shutil


turdfiles = [
    '~/.adobe/',               # Macromedia Flash crap
    '~/.android/',             # Android crap
    '~/.ansible/',             # Ansible crap
    '~/.ansible_async/',       # Ansible crap
    '~/.ansible_galaxy',       # Ansible crap
    '~/.arduino15/',           # Arduino crap
    '~/Arduino/',              # Arduino crap
    '~/.arduino/',             # Arduino crap
    '~/.atom/',                # Atom crap
    '~/.audacity-data/',       # Audacity crap
    '~/.bash_history',         # Bash crap
    '~/.bash_sessions/',       # iTerm2 crap
    '~/.cache/',               # Gnome-ish crap
    '~/Calibre Library/',      # Calibre crap
    '~/.chirp/',               # CHIRP crap
    '~/credstash.log',         # Credstash crap
    '~/.DS_Store',             # macOS crap
    '~/.foxtrotgps/',          # FoxtrotGPS crap
    '~/.gconf/',               # Gnome-ish crap not using .{config,cache,local}
    '~/.gimp-2.8/',            # GIMP crap
    '~/.gitflow_export',       # Sourcetree crap
    '~/.gitignore_global',     # Sourcetree crap
    '~/.gnome2/',              # Gnome-ish crap not using .{config,cache,local}
    '~/.gnome2_private/',      # Gnome-ish crap not using .{config,cache,local}
    '~/.gnuradio/',            # GNURadio crap
    '~/.govmomi/',             # VMware crap
    '~/.gr_fftw_wisdom',       # GNURadio crap
    '~/.gr_fftw_wisdom.lock',  # GNURadio crap
    '~/.hgignore_global',      # Sourcetree crap
    '~/.icons/',               # Gnome-ish crap not using .{config,cache,local}
    '~/.java/',                # Java crap
    '~/.knownPackages',        # Android crap
    '~/.lesshsQ',              # Less crap
    '~/.lesshst',              # Less crap
    '~/.macromedia/',          # Macromedia Flash crap
    '~/Maps/',                 # FoxtrotGPS crap
    '~/.openMSX/',             # RetroPie crap
    '~/.oracle_jre_usage/',    # Java crap
    '~/.ovftool.ssldb',        # VMware crap
    '~/.packer.d/',            # Hashicorp crap
    '~/.pki/',                 # Firefox crap
    '~/.platformio/',          # Platformio crap
    '~/.purple/',              # Pidgin crap
    '~/.putty/',               # Puttygen crap
    '~/__pycache__/',          # Python crap
    '~/.python_history',       # Python crap
    '~/.python-version',       # Python crap
    '~/.qjoypad3/',            # RetroPie crap
    '~/sketchbook/',           # Arduino crap
    '~/.sqlite_history',       # SQLite crap
    '~/.terraform.d/',         # Hashicorp crap
    '~/.themes/',              # Gnome-ish crap not using .{config,cache,local}
    '~/.thumbnails/',          # Gnome-ish crap not using .{config,cache,local}
    '~/.tkremindrc',           # Remind crap
    '~/.vagrant.d/',           # Hashicorp crap
    '~/.vault-token',          # Hashicorp crap
    '~/.viminfo',              # Vim crap
    '~/.vim/',                 # Vim crap
    '~/.VisualIDs/',           # FoxtrotGPS crap
    '~/.vmware/',              # VMware crap
    '~/.vscode-oss/',          # VSCodium crap
    '~/.vscode/',              # VSCode crap
    '~/.wget-hsts',            # Wget crap
    '~/.xournal/',             # Xournal crap
    '~/.xsession-errors.old',  # X crap
    '~/.xsession-errors',      # X crap
    '~/.zoom/',                # Zoom crap
]
#   '~/.emulationstation',     # RetroPie crap (symlink)
#   '~/.lr-atari800.cfg',      # RetroPie crap (symlink)


def yesno(question, default='n'):
    ''' Asks the user for YES or NO, always case insensitive.
        Returns True for YES and False for NO.
    '''

    prompt = '{} (y/[n]) '.format(question)
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
        absf = os.path.expanduser(f)
        if os.path.exists(absf):
            found.append(absf)

    if len(found) == 0:
        print('No shitty files found :)')
        return
    else:
        print('Found shitty files:')
        for f in found:
            print('    {}'.format(f))

    if yesno('Remove all?', default='n'):
        for f in found:
            if os.path.isfile(f):
                os.remove(f)
            else:
                shutil.rmtree(f)
        print('All cleaned')
    else:
        print('No file removed')


if __name__ == '__main__':
    main()
