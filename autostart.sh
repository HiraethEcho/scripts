#!/bin/sh

picom -b

~/scripts/wallpapers.sh &

killall fcitx5
fcitx5 &

killall blueman-applet 
blueman-applet &
#
# killall blueberry-tray
# blueberry-tray &

killall nm-applet 
nm-applet &

# onedrivegui &

# killall pa-applet 
# pa-applet &

# killall slstatus 
# slstatus &
sleep 2
# ~/.dwm/dwm_bar.sh &
~/scripts/dwm_bar_colored.sh &
