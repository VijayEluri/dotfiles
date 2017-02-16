#!/bin/sh

# if [ -d /etc/X11/xinit/xinitrc.d ]; then
#     for f in /etc/X11/xinit/xinitrc.d/*; do
#         [ -x "$f" ] && . "$f"
#     done
#     unset f
# fi

if /usr/bin/xrandr -q | grep -q VGA1
then
    /usr/bin/xrandr --fb 2720x1024 --output LVDS1 --mode 1440x900 --output VGA1 --mode 1280x1024 --right-of LVDS1
fi

/usr/bin/xrdb -merge ~/.Xresources
/usr/bin/xsetroot -solid black &
/bin/sh ~/.fehbg &
/usr/bin/xscreensaver -no-splash &
/usr/bin/xcompmgr -c &
/usr/bin/stalonetray &
/usr/bin/xmodmap ~/.Xmodmap &
# /usr/bin/xautolock -time 10 -locker slock &

# if [ $HOSTNAME == "aleph1" ]
# then
#     /usr/bin/synergys --config ~/synergy.conf
# else
#     /usr/bin/synergyc aleph1
# fi

# /usr/bin/VBoxClient-all

exec /usr/bin/xmonad
