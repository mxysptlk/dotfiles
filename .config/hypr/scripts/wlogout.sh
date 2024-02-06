#! /bin/sh
if [ $(which systemd) ]
then
    exec wlogout -l ~/.config/wlogout/layout.linux
else
    exec wlogout
fi
