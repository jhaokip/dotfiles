#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

## Compositing
/usr/bin/picom -f &

## Nitrogen restore background
/usr/bin/nitrogen --restore &

## Make Cap Locks an additional Ctrl and Press both Shifts to toggle CapsLock
setxkbmap -option caps:ctrl_modifier,shift:both_capslock_cancel &

## Merge .Xresources file at startup
xrdb -merge ~/.config/X11/.Xresources &

## Start thunar daemon at startup
## /usr/bin/thunar --daemon &

## Start pcmanfm daemon at startup
/usr/bin/pcmanfm -d &

## Start Urxvt daemon at startup
urxvtd -o -q -f &
 
## Start powerline-daemon at startup
/usr/bin/powerline-daemon -q &

## Start st terminal
/usr/local/bin/st &
## Start i3-gaps
exec i3

