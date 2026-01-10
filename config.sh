#!/bin/bash
set -euo pipefail

backup_and_copy() {
    local src="$1"
    local dest="$2"

    if [ -f "$dest" ]; then
        echo "Backing up existing $dest to $dest.bak"
        mv "$dest" "$dest.bak"
    fi

    echo "Copying $src to $dest"
    cp "$src" "$dest"
}

backup_and_copy .vimrc "$HOME/.vimrc"
backup_and_copy .bashrc "$HOME/.bashrc"
backup_and_copy .tmux.conf "$HOME/.tmux.conf"

echo "All configs deployed"

