#!/bin/sh
# run different scripts for BSD and Linux
AUTHAGENT=$(find /usr -name polkit-kde-authentication-agent-1 2>/dev/null)
KWINIT=$(find /usr -name pam_kwallet_init 2>/dev/null)
KIOD5=$(find /usr -name kiod5 2>/dev/null)

$AUTHAGENT &
sleep 1
$KWINIT &
sleep 1
$KIOD5 &
sleep 3
kwalletd5 &
kded5 &
sleep 2
nextcloud --background
