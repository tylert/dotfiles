Dotfiles
========

* http://dotfiles.github.io
* https://iamdan.me/better-dotfiles
* https://github.com/queer/boxxy
* https://0x46.net/thoughts/2019/02/01/dotfile-madness
* https://cheatsheets.stephane.plus/admin/avoid_dotfile_madness
* https://wiki.archlinux.org/title/XDG_user_directories
* https://xdgbasedirectoryspecification.com
* https://www.anand-iyer.com/blog/2018/a-simpler-way-to-manage-your-dotfiles.html
* https://dev.to/spacerockmedia/how-i-manage-my-dotfiles-using-gnu-stow-4l59
* https://www.gnu.org/software/stow/manual/stow.html
* https://rednafi.com/misc/pesky_little_scripts
* https://medium.com/@todariasova/managing-your-dotfiles-59e13e8ab2d6  git work-tree manipulation?


Annoyances
----------

* https://bugzilla.mozilla.org/show_bug.cgi?id=259356  Firefox support for XDG base directories;  open since 2004
* https://bugzilla.mozilla.org/show_bug.cgi?id=735285  Thunderbird support for XDG base directories;  open since 2012
* https://issues.apache.org/jira/browse/SVN-4599  name of ~/.subversion/ directory is hard-coded;  open since 2015
* https://github.com/markqvist/Reticulum/discussions/732  hard-coded paths to Reticulum/LXMF config files

::

    $ touch ~/.face
    $ ln -sf ~/.face ~/.face.icon
    $ ~/bin/rmshit.py
    Found shitty files:
        /home/meh/.face
        /home/meh/.face.icon
    Remove all? (y/[n]) y
    Traceback (most recent call last):
      File "/home/meh/bin/rmshit.py", line 158, in <module>
        main()
      File "/home/meh/bin/rmshit.py", line 151, in main
        rmtree(f)
      File "/usr/lib/python3.12/shutil.py", line 759, in rmtree
        _rmtree_safe_fd(stack, onexc)
      File "/usr/lib/python3.12/shutil.py", line 703, in _rmtree_safe_fd
        onexc(func, path, err)
      File "/usr/lib/python3.12/shutil.py", line 674, in _rmtree_safe_fd
        topfd = os.open(name, os.O_RDONLY | os.O_NONBLOCK, dir_fd=dirfd)
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    FileNotFoundError: [Errno 2] No such file or directory: '/home/meh/.face.icon'


macOS
-----

If you encounter silly DNS problems in macOS, you may need the following command::

    sudo dscacheutil -flushcache ; sudo killall -HUP mDNSResponder

Occasionally, you will run into a file in your home directory that you aren't
allowed to execute or delete.  This is caused by macOS trying to be "helpful".
You can fix this on a case-by-case basis by typing::

    xattr -d com.apple.quarantine /path/to/file
    xattr -d com.apple.macl /path/to/file  # might not be needed

Fix a bunch of them in bulk perhaps using::

    find /path/to/directory -exec xattr -d com.apple.quarantine {} \;
    find /path/to/directory -exec xattr -d com.apple.macl {} \;  # might not be needed

You can also fix this behaviour permanently for all files using::

    sudo defaults write com.apple.LaunchServices LSQuarantine -bool NO
    sudo reboot

* https://superuser.com/questions/28384/what-should-i-do-about-com-apple-quarantine
* https://apple.stackexchange.com/questions/373176/disable-the-use-of-the-com-apple-quarantine-extended-attribute-on-mojave
* https://www.brunerd.com/blog/2020/01/07/track-and-tackle-com-apple-macl
* https://www.arno.org/on-the-origins-of-ds-store
* https://danmackinlay.name/notebook/macos_hacks.html
* https://www.freecodecamp.org/news/how-to-flush-dns-on-mac-macos-clear-dns-cache
