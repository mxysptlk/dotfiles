#!/bin/sh
# start asic components
waybar &
hyprpaper &
dunst &
wal -R

# run different scripts for BSD and Linux
if [ "$(uname -s)" = FreeBSD ]
then
    $HOME/.config/hypr/scripts/bsd.sh &
else
    $HOME/.config/hypr/scripts/linux.sh &
fi

sleep 3
kwalletd5 &
sleep 2
nextcloud --background
swayidle -w timeout 300 'swaylock -f' lock 'swaylock -f' before-sleep 'swaylock -f'
