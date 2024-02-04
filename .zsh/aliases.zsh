WG_CONF=~/.config/wireguard/wg0.conf
alias wgup="nmcli connection import type wireguard file $WG_CONF"
alias wgdown="nmcli connection delete wg0"
alias config='git --git-dir=/home/williams/.cfg/ --work-tree=/home/williams'
