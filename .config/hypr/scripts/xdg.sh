#! /bin/sh
if [ "$(uname -s)" = Linux ]
then
    PREFIX=/usr/libexec
    exit
else
    PREFIX=/usr/local/libexec
fi

sleep 1
killall xdg-desktop-portal-hyprland
killall xdg-desktop-portal-wlr
killall xdg-desktop-portal

$PREFIX/xdg-desktop-portal-hyprland &

sleep 2
$PREFIX/xdg-desktop-portal &
