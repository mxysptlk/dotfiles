
if [[ "$OS" == Linux ]]; then
    alias wgup="nmcli connection up wg0"
    alias wgdown="nmcli connection down wg0"
fi

if [ $(which eza) ]; then
    alias ls="eza --icons=auto"
    alias ll="ls -lhg --git"
    alias la="ll -a"
    alias l1="ls -1"
    alias lls="ll --total-size --git"
    alias lsd="eza -D1"
fi
alias ping="ping -c 5"
alias config="git --git-dir=/home/williams/.cfg/ --work-tree=$HOME"

