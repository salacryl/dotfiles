export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Standard-Plugins
plugins=(git)

source $ZSH/oh-my-zsh.sh

# P10K Konfig laden, falls vorhanden
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
