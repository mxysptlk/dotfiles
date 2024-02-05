
if [[ "$OS" == Linux ]]; then
    alias wgup="nmcli connection up wg0"
    alias wgdown="nmcli connection down wg0"
fi
alias ping="ping -c 5"
alias config="git --git-dir=/home/williams/.cfg/ --work-tree=$HOME"
