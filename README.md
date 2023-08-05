Dotfiles
========

These repository contains the dotfiles for a FreeBSD install on a new laptop.
This is the first time I've run a desktop system on anything but macOS since
around 2007 (though that was a mixture of FreeBSD and APT-flavoured Linux
distributions).

Packages
--------

- u2f-devd
- nvim
- awesome
- picom
- srandrd
- firefox
- dejavu - fonts

Install
-------

```
$ git clone git@github.com:thsutton/freebsd-dotfiles .config
$ ln -s .config/xinitrc .xinitrc
```
