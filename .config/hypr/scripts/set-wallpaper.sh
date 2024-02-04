#!/bin/sh
hyprctl hyprpaper preload $1
hyprctl hyprpaper wallpaper ",$1"
wal -i $1
