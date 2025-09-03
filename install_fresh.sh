#!/usr/bin/env bash

DOTFILES=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)

# Developer Tools
## ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
ln -sf $DOTFILES/zsh/zshrc $HOME/.zshrc

## Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew update && brew upgrade

## Fonts
brew install --cask font-fantasque-sans-mono-nerd-font

## Neovim Nightly
brew install neovim --HEAD
rm -rf $HOME/.config/nvim
ln -s $DOTFILES/nvim $HOME/.config/nvim

## Ohmyposh
brew install jandedobbeleer/oh-my-posh/oh-my-posh
rm -rf $HOME/.config/ohmyposh
ln -s $DOTFILES/ohmyposh $HOME/.config/ohmyposh

## Git
ln -sf $DOTFILES/git/gitconfig $HOME/.gitconfig

## Git Ignore
ln -sf $DOTFILES/git/gitignore_global $HOME/.gitignore_global

## kitty
brew install --cask kitty
rm -rf $HOME/.config/kitty
ln -s $DOTFILES/kitty $HOME/.config/kitty

## bun
brew tap oven-sh/bun
brew install bun

## Composer (php)
brew install composer

# Quality of Life
## enable ctrl + cmd to drag
defaults write -g NSWindowShouldDragOnGesture -bool true

