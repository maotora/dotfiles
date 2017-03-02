#!/bin/bash
vol=$(pacmd info | grep "volume: front-left" | head -n 2 | tail -n 1 | awk -F ' ' '{print $5}' ) 

if [ $vol == '0%' ]; then
    vol="Mute"
fi

echo "$vol"
