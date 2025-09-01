#!/usr/bin/env bash

DOTFILES=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)

# Neovim
rm -rf $HOME/.config/nvim
ln -s $DOTFILES/nvim $HOME/.config/nvim

# Ohmyposh
rm -rf $HOME/.config/ohmyposh
ln -s $DOTFILES/ohmyposh $HOME/.config/ohmyposh

# zsh
ln -sf $DOTFILES/zsh/zshrc $HOME/.zshrc

# Git
ln -sf $DOTFILES/git/gitconfig $HOME/.gitconfig

# Git Ignore
ln -sf $DOTFILES/git/gitignore_global $HOME/.gitignore_global

# kitty
rm -rf $HOME/.config/kitty
ln -s $DOTFILES/kitty $HOME/.config/kitty
