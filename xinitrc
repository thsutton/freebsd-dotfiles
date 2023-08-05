#!/bin/sh

set -eu

if [ -d /usr/local/etc/X11/xinit/xinitrc.d ] ; then
	for f in /usr/local/etc/X11/xinit/xinitrc.d/?*.sh ; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

# Disable bell
xset -b

system_xinit=/usr/local/etc/X11/xinit

if [ -x "$(which xrdb)" ]; then
[ -r "$system_xinit/.Xresources" ] && xrdb -merge "$system_xinit/.Xresources"
[ -r "$HOME/.config/Xresources" ] && xrdb -merge "$HOME/.config/Xresources"
fi

if [ -x "$(which xmodmap)" ]; then
[ -r "$system_xinit/.Xmodmap" ] && xmodmap "$system_xinit/.Xmodmap"
[ -r "$HOME/.config/Xmodmap" ] && xmodmap "$HOME/.config/Xmodmap"
fi

run() {
	if [ -x "$(which $1)" ]; then
		$* &
	else
		echo "xinit: Not found: $1" > /dev/stderr
	fi
}

run xscreensaver --no-splash &

run srandrd "$HOME/.config/srandrd/script.sh"

run sctd --latitude -33.868820 --longitude 151.209290

run picom --vsync --backend glx --no-fading-openclose

exec awesome
