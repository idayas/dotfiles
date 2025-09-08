#!/usr/bin/env bash
set -e

DOTFILES=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)

# Install Homebrew for all tools
if ! command -v brew &> /dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # Add Homebrew to PATH for this session
  if [[ $(uname -m) == "arm64" ]]; then 
    eval "$(/opt/homebrew/bin/brew shellenv)"
  else
    eval "$(/usr/local/bin/brew shellenv)"
  fi
fi

brew update

# Install oh-my-zsh without auto-switching shells (stops the install)
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  echo "Installing oh-my-zsh..."
  RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Create symlink
ln -sf $DOTFILES/zsh/zshrc $HOME/.zshrc

# Install Fonts
brew install --cask font-fantasque-sans-mono-nerd-font

echo "Installing GUI applications..."
brew install --cask cyberduck           # FTP 
brew install --cask discord             # Comms Platform
brew install --cask firefox@nightly     # Preferred Dev Browser
brew install --cask herd                # Laravel Herd
brew install --cask httpie-desktop      # Postman Alternative
brew install --cask kitty               # Terminal
brew install --cask obsidian            # Notes
brew install --cask orbstack            # Mac Specific Docker Runtime
brew install --cask ungoogled-chromium  # Chrome without the googling

echo "Installing CLI tools..."
brew install neovim --HEAD
brew install jandedobbeleer/oh-my-posh/oh-my-posh
brew install composer
brew install go
brew install zoxide
brew tap oven-sh/bun
brew install bun

echo "Creating symlinks..."
mkdir -p $HOME/.config
rm -rf $HOME/.config/nvim
ln -s $DOTFILES/nvim $HOME/.config/nvim

rm -rf $HOME/.config/ohmyposh
ln -s $DOTFILES/ohmyposh $HOME/.config/ohmyposh

rm -rf $HOME/.config/kitty
ln -s $DOTFILES/kitty $HOME/.config/kitty

ln -sf $DOTFILES/git/gitconfig $HOME/.gitconfig
ln -sf $DOTFILES/git/gitignore_global $HOME/.gitignore_global

echo "Setting Mac system preferences..."
if [[ -f $DOTFILES/scripts/mac-defaults.sh ]]; then
    source $DOTFILES/scripts/mac-defaults.sh
else
    echo "Warning: mac-defaults.sh not found, skipping system preferences"
fi
echo "Setup complete! Restart your terminal to use the new shell configuration."
