#!/bin/sh

# export WINDOW_MANAGER=xmonad
# exec gnome-session
# exec startkde
# exec startxfce4

xrdb -merge ~/.Xdefaults &
xmodmap ~/.xmodmap &
# exec ratpoison
# exec stumpwm
# exec awesome
exec xmonad
