#!/bin/sh

#current_brig=`pkexec /usr/lib/gnome-settings-daemon/gsd-backlight-helper --get-brightness`
current_brig=`xbacklight -get`
#max_brig=`pkexec /usr/lib/gnome-settings-daemon/gsd-backlight-helper --get-max-brightness`
max_brig=100.00
percent=`echo $current_brig*100/$max_brig| bc`

case "$1" in
    "get")
        echo "$percent%"
        ;;
    "set")
        #pkexec /usr/lib/gnome-settings-daemon/gsd-backlight-helper --set-brightness $2
        xbacklight -set +10
        ;;
    *)
        echo "Usage: $0 {set|get}"
        exit 2
esac

exit 0
