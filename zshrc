plugins=(git ag zsh-autosuggestions zsh-syntax-highlighting zsh-vi-mode)

export ALIASES=$HOME/.aliases
export EDITOR="nvim"
export GOPATH=$HOME/go
export M2_PATH=$HOME/.m2
export VIMRC=$HOME/.config/nvim/init.lua

export ZSHRC=$HOME/.zshrc
export ZSH=$HOME/.oh-my-zsh
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#bbbbbb,bg=bold"
export ZSH_THEME="agnoster"

source $ZSH/oh-my-zsh.sh

export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/.scripts
export PATH=$PATH:/usr/local/share/npm/bin:/usr/local/bin:/usr/local/sbin

[ -f ~/.aliases ] && source ~/.aliases;
[ -f ~/.bash_profile ] && source ~/.bash_profile;
[ -f ~/.zshrc.local ] && source ~/.zshrc.local;

clear
