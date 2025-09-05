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

## zoxide (better cd)
brew install zoxide

# Languages and Runtimes
## bun
brew tap oven-sh/bun
brew install bun

# GoLang
brew install go

## Composer (php)
brew install composer

# Additional applications
brew install --cask cyberduck           # FTP 
brew install --cask discord             # Comms Platform
brew install --cask firefox@nightly     # Preferred Dev Browser
brew install --cask herd                # Laravel Herd
brew install --cask httpie-desktop      # Postman Alternative
brew install --cask obsidian            # Notes
brew install --cask orbstack            # Mac Specific Docker Runtime
brew install --cask ungoogled-chromium  # Chrome without the googling

# Quality of Life
## enable ctrl + cmd to drag
defaults write -g NSWindowShouldDragOnGesture -bool true

