#The keys

if [ -s /home/maotora/.Xmodmap ]; then
    xmodmap $HOME/.Xmodmap
if

#The x-resources.. like xterm and rvxt

if [ -s $HOME/.Xresources ]; then
    xrdb -merge $HOME/.Xresources
fi
