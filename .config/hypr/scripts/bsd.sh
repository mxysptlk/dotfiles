#! /bin/sh 

/usr/local/libexec/xdg-desktop-portal-hyprland &
sleep 1
/usr/local/lib/libexec/polkit-kde-authentication-agent-1 &
sleep 2
/usr/local/lib/libexec/pam_kwallet_init &
