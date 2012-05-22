#!/bin/bash

/usr/bin/xmodmap ~/.xmodmap &
/usr/bin/xrdb -merge ~/.Xdefaults &
if /usr/bin/xrandr -q | grep -q VGA1
then
    /usr/bin/xrandr --fb 2720x1024 --output LVDS1 --mode 1440x900 --output VGA1 --mode 1280x1024 --right-of LVDS1
fi
/usr/bin/xsetroot -solid black &
/bin/sh ~/.fehbg &
/usr/bin/xscreensaver -no-splash &
/usr/bin/xcompmgr -c &
/usr/bin/stalonetray &

if [ -e ~/synergy.conf ]
then
    /usr/bin/synergys --config ~/synergy.conf
else
    /usr/bin/synergyc aleph1
fi

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
/usr/bin/ibus-daemon --xim &

exec /usr/bin/xmonad
