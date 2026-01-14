#!/bin/bash

# Dotfiles installation script
# This script installs vim and tmux dependencies and copies configs to home directory

set -e  # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Get the directory where this script is located
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo -e "${GREEN}Starting dotfiles installation...${NC}\n"

# Check if running on macOS, exit early if not
if [[ "$OSTYPE" != "darwin"* ]]; then
    echo -e "${RED}Error: This script requires macOS.${NC}"
    exit 1
fi

# Install Homebrew dependencies
echo -e "${GREEN}Installing Homebrew dependencies...${NC}"

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo -e "${YELLOW}Homebrew not found. Please install Homebrew first:${NC}"
    echo "  /bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
    exit 1
fi

# Install tmux
if ! command -v tmux &> /dev/null; then
    echo "Installing tmux..."
    brew install tmux
else
    echo "tmux is already installed"
fi

# Install reattach-to-user-namespace (required for tmux clipboard on macOS)
if ! command -v reattach-to-user-namespace &> /dev/null; then
    echo "Installing reattach-to-user-namespace..."
    brew install reattach-to-user-namespace
else
    echo "reattach-to-user-namespace is already installed"
fi
echo ""

# Install Vundle (Vim plugin manager)
echo -e "${GREEN}Setting up Vim...${NC}"
VUNDLE_DIR="$HOME/.vim/bundle/Vundle.vim"
if [ ! -d "$VUNDLE_DIR" ]; then
    echo "Installing Vundle..."
    mkdir -p "$HOME/.vim/bundle"
    git clone https://github.com/VundleVim/Vundle.vim.git "$VUNDLE_DIR"
else
    echo "Vundle is already installed"
fi

# Copy .vimrc
echo "Copying .vimrc to ~/.vimrc..."
cp "$DOTFILES_DIR/.vimrc" "$HOME/.vimrc"
echo -e "${GREEN}✓ .vimrc installed${NC}"

# Install Vundle plugins
echo "Installing Vim plugins (this may take a while)..."
vim +PluginInstall +qall || true
echo -e "${GREEN}✓ Vim plugins installed${NC}\n"

# Install TPM (Tmux Plugin Manager)
echo -e "${GREEN}Setting up tmux...${NC}"
TPM_DIR="$HOME/.tmux/plugins/tpm"
if [ ! -d "$TPM_DIR" ]; then
    echo "Installing TPM..."
    mkdir -p "$HOME/.tmux/plugins"
    git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
else
    echo "TPM is already installed"
fi

# Copy .tmux.conf
echo "Copying .tmux.conf to ~/.tmux.conf..."
cp "$DOTFILES_DIR/.tmux.conf" "$HOME/.tmux.conf"
echo -e "${GREEN}✓ .tmux.conf installed${NC}"

# Install tmux plugins
echo "Installing tmux plugins..."
"$TPM_DIR/bin/install_plugins" || true
echo -e "${GREEN}✓ Tmux plugins installed${NC}\n"

echo -e "${GREEN}Installation complete!${NC}"
echo ""
echo "Next steps:"
echo "  1. Restart your terminal or run: source ~/.vimrc"
echo "  2. If tmux is running, press 'prefix + I' (default prefix is Ctrl-b) to install plugins"
echo "  3. Or restart tmux to load the new configuration"
