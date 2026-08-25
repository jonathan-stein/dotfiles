#!/usr/bin/env bash

set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "==> Setting up Oh My Zsh"

if ! command -v zsh >/dev/null 2>&1; then
    echo "ERROR: zsh is not installed."
    echo "Please install zsh first."
    exit 1
fi

if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
    echo "==> Installing Oh My Zsh"

    RUNZSH=no \
    CHSH=no \
    KEEP_ZSHRC=yes \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "==> Oh My Zsh already installed"
fi

echo "==> Setting up fzf"

if [[ ! -d "$HOME/.fzf" ]]; then
    echo "==> Installing fzf"

    git clone --depth 1 https://github.com/junegunn/fzf.git "$HOME/.fzf"

    "$HOME/.fzf/install" \
        --key-bindings \
        --completion \
        --no-update-rc
else
    echo "==> fzf already installed"
fi

ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

echo "==> Setting up zsh-autosuggestions"

if [[ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]]; then
    git clone \
        https://github.com/zsh-users/zsh-autosuggestions.git \
        "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
else
    echo "==> zsh-autosuggestions already installed"
fi

echo "==> Setting up zsh-syntax-highlighting"

if [[ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]]; then
    git clone \
        https://github.com/zsh-users/zsh-syntax-highlighting.git \
        "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
else
    echo "==> zsh-syntax-highlighting already installed"
fi
