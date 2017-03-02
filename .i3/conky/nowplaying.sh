#!/bin/sh

mpcQuery(){
   mpc --host="127.0.0.1" --port=6601 current
}

if cmus-remote -Q 2> /dev/null; then

    file=$(cmus-remote -Q | grep 'file' | awk -F '/' '{print $NF}')

else

    if [ mpcQuery 2> /dev/null ]; then

        file=$(mpcQuery | awk -F - {'print $2'})

    else
        file="Nothing"

    fi

fi

echo $file
