#!/bin/bash
set -e

# Stelle sicher, dass zsh existiert
if ! command -v zsh >/dev/null 2>&1; then
  sudo apt-get update && sudo apt-get install -y zsh
fi

# oh-my-zsh installieren (nur wenn noch nicht da)
if [ ! -d "${ZSH:-$HOME/.oh-my-zsh}" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Powerlevel10k klonen
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
    ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

# Falls du eine eigene .p10k.zsh hast, kopiere sie ins Home
if [ -f "$(dirname "$0")/.p10k.zsh" ]; then
  cp "$(dirname "$0")/.p10k.zsh" ~/
fi

cp -f ~/dotfiles/.zshrc ~/.zshrc
cp -f ~/dotfiles/.p10k.zsh ~/.p10k.zsh


echo "✅ Powerlevel10k installiert."
