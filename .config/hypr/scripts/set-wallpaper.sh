#!/bin/sh
CMD='hyprctl hyprpaper'
wallpaper=$1
$CMD preload $wallpaper
$CMD wallpaper "eDP-1,$wallpaper"
wal -i $wallpaper
echo preload = $wallpaper > ~/.config/hypr/hyprpaper.conf
echo wallpaper = eDP-1,$wallpaper" >> ~/.config/hypr/hyprpaper.conf
doas cp $wallpaper /usr/local/share/sddm/themes/Custom/background.png
