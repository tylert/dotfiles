#!/usr/bin/env python

# https://github.com/lahwaacz/Scripts/blob/master/rmshit.py

from __future__ import print_function

import os
import sys
import shutil


shittyfiles = [
    '~/.adobe',                # Macromedia Flash crap
    '~/.ansible',
    '~/.bash_history',
#   '~/.gconf',                # Gnome-ish crap not using .{config,cache,local}
    '~/.gimp-2.8',
#   '~/.gnome2',               # Gnome-ish crap not using .{config,cache,local}
#   '~/.gnome2_private',       # Gnome-ish crap not using .{config,cache,local}
    '~/.icons',
    '~/.java',
    '~/.lesshst',
    '~/.macromedia',           # Macromedia Flash crap
    '~/.packer.d',             # Hashicorp Checkpoint crap
    '~/.pki',                  # Firefox crap
    '~/.terraform.d',          # Hashicorp Checkpoint crap
    '~/.themes',
    '~/.vim',
    '~/.viminfo',
    '~/.xsession-errors',
    '~/.xsession-errors.old',
]


def yesno(question, default='n'):
    ''' Asks the user for YES or NO, always case insensitive.
        Returns True for YES and False for NO.
    '''
    prompt = '{} (y/[n]) '.format(question)

    ans = raw_input(prompt).strip().lower()

    if not ans:
        ans = default

    if ans == 'y':
        return True
    return False


def rmshit():
    print('Found shitty files:')
    found = []
    for f in shittyfiles:
        absf = os.path.expanduser(f)
        if os.path.exists(absf):
            found.append(absf)
            print('    {}'.format(f))

    if len(found) == 0:
        print('No shitty files found :)')
        return

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
    rmshit()
