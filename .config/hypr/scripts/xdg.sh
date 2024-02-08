#! /bin/sh
if [ $(uname -s) = Linux ]
then
    PREFIX=/usr/libexec
else
    PREFIX=/usr/local/libexec
fi

sleep 1
killall xdg-desktop-portal-hyprland
killall xdg-desktop-portal-wlr
killall xdg-desktop-portal

if [ -f $PREFIX/xdg-desktop-portal-hyprland ]
then
    $PREFIX/xdg-desktop-portal-hyprland &
else
    $PREFIX/xdg-desktop-portal-wlr &
fi

sleep 2
$PREFIX/xdg-desktop-portal &
