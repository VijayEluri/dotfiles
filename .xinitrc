#!/bin/bash

# ln -sf .xsession .xinitrc

/usr/bin/xrdb -merge ~/.Xdefaults &

/usr/bin/xmodmap ~/.xmodmap &
# xmodmap -e "remove Lock = Caps_Lock"
# xmodmap -e "remove Control = Control_L"
# xmodmap -e "keysym Control_L = Caps_Lock"
# xmodmap -e "keysym Caps_Lock = Control_L"
# xmodmap -e "add Lock = Caps_Lock"
# xmodmap -e "add Control = Control_L"

/usr/bin/xsetroot -solid black
xscreensaver --no-splash &

/usr/bin/trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --width 10 --transparent true --tint 0x191970 --height 23 &

exec /usr/bin/xmonad
