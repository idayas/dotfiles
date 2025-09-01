#!/usr/bin/env bash

DOTFILES=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew update && brew upgrade

# Install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
ln -sf $DOTFILES/zsh/zshrc $HOME/.zshrc

# Neovim
brew install neovim --HEAD
rm -rf $HOME/.config/nvim
ln -s $DOTFILES/nvim $HOME/.config/nvim

# Ohmyposh
brew install jandedobbeleer/oh-my-posh/oh-my-posh
rm -rf $HOME/.config/ohmyposh
ln -s $DOTFILES/ohmyposh $HOME/.config/ohmyposh

# Git
ln -sf $DOTFILES/git/gitconfig $HOME/.gitconfig

# Git Ignore
ln -sf $DOTFILES/git/gitignore_global $HOME/.gitignore_global

# fonts
brew install --cask font-fantasque-sans-mono-nerd-font

# kitty
brew install --cask kitty
rm -rf $HOME/.config/kitty
ln -s $DOTFILES/kitty $HOME/.config/kitty

# enable ctrl + cmd to drag
defaults write -g NSWindowShouldDragOnGesture -bool true

