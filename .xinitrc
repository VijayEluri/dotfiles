#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

# export WINDOW_MANAGER=xmonad
# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice

# exec xterm

# xrdb -load ~/.Xresources &
xrdb -merge ~/.Xdefaults &
xmodmap ~/.xmodmap &
# exec ratpoison
# exec stumpwm
exec xmonad
# exec awesome
