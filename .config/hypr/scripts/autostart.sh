#!/bin/sh
# run different scripts for BSD and Linux
if [ "$(uname -s)" = FreeBSD ]
then
    /usr/local/libexec/xdg-desktop-portal-hyprland &
    sleep 1
    /usr/local/lib/libexec/polkit-kde-authentication-agent-1 &
    /usr/local/lib/libexec/kf5/kiod5 &
    sleep 2
    /usr/local/lib/libexec/pam_kwallet_init &
else

    /usr/lib/x86_64-linux-gnu/libexec/polkit-kde-authentication-agent-1 &
    swaybg -i ~/.local/share/wallpapers/148117-afterglow-cloud-horizon-sky-evening-1920x1080-3.jpg &
    bitwarden &
fi

sleep 3
kwalletd5 &
#kded5 &
sleep 2
nextcloud --background
