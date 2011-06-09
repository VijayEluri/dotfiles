#!/bin/bash

/usr/bin/xmodmap ~/.xmodmap
/usr/bin/xrdb -merge ~/.Xdefaults &
/usr/bin/xsetroot -solid black
/bin/sh ~/.fehbg &
/usr/bin/xscreensaver --no-splash &
/usr/bin/xcompmgr -c &

/usr/bin/trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --width 10 --transparent true --tint 0x191970 --height 23 &

exec /usr/bin/xmonad
