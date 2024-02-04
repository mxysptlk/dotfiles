#!/bin/sh
hyprctl hyprpaper preload $1
hyprctl hyprpaper wallpaper "eDP-1,$1"
wal -i $1
