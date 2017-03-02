#!/bin/sh

mpcQuery(){
   mpc --host="127.0.0.1" --port=6601 current
}

if cmus-remote -Q 2> /dev/null; then

    artist=$(cmus-remote -Q | grep -w 'artist' | awk '{$1=$2=""; print $0}')

else

    if [ mpcQuery 2> /dev/null ]; then

        artist=$(mpcQuery | awk -F - {'print $1'})

    else

        artist="None"

    fi
fi
        
    echo $artist
