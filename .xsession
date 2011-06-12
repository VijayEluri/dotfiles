#!/bin/bash

/usr/bin/xmodmap ~/.xmodmap &
/usr/bin/xrdb -merge ~/.Xdefaults &
/usr/bin/xrandr --fb 2720x1024 --output LVDS1 --mode 1440x900 --output VGA1 --mode 1280x1024 --right-of LVDS1 &
/usr/bin/xsetroot -solid black &
/bin/sh ~/.fehbg &
/usr/bin/xscreensaver &
/usr/bin/xcompmgr -c &

# /usr/bin/trayer --edge bottom --align right --width 10 --height 23 --SetDockType true --SetPartialStrut true --tint 0x191970 --distance 1280 --expand true &
/usr/bin/stalonetray &

exec /usr/bin/xmonad
