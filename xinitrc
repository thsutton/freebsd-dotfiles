#!/bin/sh

set -eu

xset -b

[ -f ~/.config/Xresources ] && xrdb -merge ~/.config/Xresources

if [ -x "$(which srandrd)" ]; then
    srandrd "$HOME/.config/srandrd/script.sh"
fi

if [ -x /usr/local/bin/mozc -a -x /usr/local/bin/fcitx ]; then
    GTK_IM_MODULE=fcitx
    QT_IM_MODULE=xim
    XMODIFIERS=@im=fcitx
    export GTK_IM_MODULE QT_IM_MODULE XMODIFIERS
    # /usr/local/bin/mozc start
    #/usr/local/bin/fcitx -r -d
fi

if [ -x "$(which musicpd)"]; then
    MPD_HOST=$HOME/.mpd/socket
    export MPD_HOST
    musicpd
fi

[ -x "$(which picom)" ] && picom --vsync --backend glx --no-fading-openclose &

exec awesome
