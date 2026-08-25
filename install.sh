#!/usr/bin/env bash

set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "==> Installing dotfiles"

link_file() {
    local source="$1"
    local target="$2"

    if [[ -L "$target" ]]; then
        echo "    Removing existing symlink: $target"
        rm "$target"
    elif [[ -e "$target" ]]; then
        local backup="${target}.backup-$(date +%Y%m%d-%H%M%S)"
        echo "    Backing up existing file: $target -> $backup"
        mv "$target" "$backup"
    fi

    echo "    Linking: $target -> $source"
    ln -s "$source" "$target"
}

link_file "$DOTFILES/zsh/.zshrc" "$HOME/.zshrc"
link_file "$DOTFILES/vim/.vimrc" "$HOME/.vimrc"
link_file "$DOTFILES/vim/ftplugin" "$HOME/.vim/ftplugin"
link_file "$DOTFILES/tmux/.tmux.conf" "$HOME/.tmux.conf"
link_file "$DOTFILES/git/.gitconfig" "$HOME/.gitconfig"

echo "==> Dotfiles installed!"

echo "==> Running PlugInstall"

vim -es -u "$HOME/.vimrc" -i NONE \
    -c "PlugInstall --sync" \
    -c "qa"

echo "==> Finished running PlugInstall"
