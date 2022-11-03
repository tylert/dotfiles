Dotfiles
========

* http://dotfiles.github.io/
* https://0x46.net/thoughts/2019/02/01/dotfile-madness/
* https://cheatsheets.stephane.plus/admin/avoid_dotfile_madness/
* https://wiki.archlinux.org/title/XDG_user_directories
* https://xdgbasedirectoryspecification.com/


macOS
-----

Occasionally, you will run into a file in your home directory that you aren't
allowed to "rm".  This is caused by macOS trying to be "helpful".  You can fix
this on a case-by-case basis by typing::

    xattr -d com.apple.quarantine /path/to/file

Fix a bunch of them in bulk perhaps using::

    find /path/to/directory -exec xattr -d com.apple.quarantine {} \;

You can also fix this behaviour permanently for all files using::

    sudo defaults write com.apple.LaunchServices LSQuarantine -bool NO
    sudo reboot

* https://superuser.com/questions/28384/what-should-i-do-about-com-apple-quarantine
* https://apple.stackexchange.com/questions/373176/disable-the-use-of-the-com-apple-quarantine-extended-attribute-on-mojave
