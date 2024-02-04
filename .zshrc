export PATH=$PATH:$HOME/.local/bin:$HOME/.local/share/flatpak/exports/bin/
export EDITOR=/usr/bin/nvim
WG_CONF=~/.config/wireguard/wg0.conf

if [[ $(uname -s) == Linux ]]
then
    source /usr/share/zsh-antigen/antigen.zsh
else
    source /usr/local/share/zsh-antigen/antigen.zsh
fi
if [[ $(ls ~/.zsh ) ]]
then
    source ~/.zsh/*
fi
antigen use oh-my-zsh
antigen bundle git
antigen bundle pip
if [[ $(uname -s) == *BSD ]]
then
    antigen bundle Senderman/doas-zsh-plugin
else
    antigen bundle sudo
fi
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle RobSis/zsh-completion-generator
antigen theme bira
antigen apply

alias wgup="nmcli connection import type wireguard file $WG_CONF"
alias wgdown="nmcli connection delete wg0"
alias config='git --git-dir=/home/williams/.cfg/ --work-tree=/home/williams'
