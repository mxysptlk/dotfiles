export PATH=$PATH:$HOME/.local/bin:$HOME/.local/share/flatpak/exports/bin/
export EDITOR=/usr/bin/nvim

if [[ $(uname -s) == *BSD ]]
then
    source /usr/local/share/zsh-antigen/antigen.zsh
else
    source /usr/share/zsh-antigen/antigen.zsh
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

for file in ~/.zsh/*.zsh; do
    source $file
done
