#!/bin/bash

set -euo pipefail

# ==================================================
# Helper function: ensure package is installed
# ==================================================
ensure_installed() {
    local cmd="$1"
    local pkg="$2"

    if ! command -v "$cmd" &>/dev/null; then
        echo "Installing $pkg..."
        sudo apt install -y "$pkg"
    else
        echo "$pkg is already installed."
    fi
}

# ==================================================
# Update system
# ==================================================

echo "Updating package list..."

sudo apt update -y

# ==================================================
# Utilities
# ==================================================

echo -e "\n=== Installing utilities ==="

ensure_installed unzip unzip
ensure_installed curl curl
ensure_installed htop htop
ensure_installed rg ripgrep
ensure_installed wget wget
ensure_installed man manpages
ensure_installed tree tree
ensure_installed tmux tmux
ensure_installed vim vim

# ==================================================
# Python
# ==================================================

echo -e "\n=== Installing Python ==="

ensure_installed python3 python3
ensure_installed pip3 python3-pip
ensure_installed venv python3-venv

# ==================================================
# C / C++ Toolchain
# ==================================================

echo -e "\n=== Installing C/C++ toolchain ==="

ensure_installed gcc build-essential
ensure_installed clang clang
ensure_installed cmake cmake
ensure_installed gdb gdb
ensure_installed valgrind valgrind
ensure_installed strace strace
ensure_installed ltrace ltrace
ensure_installed perf linux-perf
ensure_installed clang-tidy clang-tidy
ensure_installed cppcheck cppcheck

echo -e "\n All done"

