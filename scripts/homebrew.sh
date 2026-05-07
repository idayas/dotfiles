brew update
brew upgrade

# Install Fonts
brew install --cask font-fantasque-sans-mono-nerd-font
brew install --cask font-fantasque-sans-mono

echo "Installing GUI applications...\n\n"
brew install --cask arc                       # Web browser I prefer
brew install --cask aerospace                 # Window tiling manager
brew install --cask affinity                  # Free graphic design software
brew install --cask calibre                   # eBook manager 
brew install --cask cyberduck                 # FTP 
brew install --cask discord                   # Comms Platform
brew install --cask firefox@nightly           # Preferred Dev Browser
brew install --cask gnucash                   # Accounting Software
brew install --cask herd                      # Laravel Herd
brew install --cask httpie-desktop            # Postman Alternative
brew install --cask jetbrains-toolbox         # Suite of IDEs (even though I mostly use Neovim, I like having them around)
brew install --cask kitty                     # Preferred Terminal
brew install --cask netnewswire               # RSS Reader
brew install --cask obsidian                  # Notes
brew install --cask orbstack                  # Mac Specific Docker Runtime
brew install --cask pika                      # Mac specific colour grabbing tool
brew install --cask ungoogled-chromium        # Chrome without the googling
brew install --cask utm                       # FOSS Virtual Machine specific for Mac M-Series

echo "Installing CLI tools..."
brew tap oven-sh/bun

brew install bun                                    # bun package manager (like npm but better)
brew install caarlos0/tap/timer                     # Timer application I enjoy
brew install composer                               # PHP package manager
brew install go                                     # Go Programming Language
brew install jandedobbeleer/oh-my-posh/oh-my-posh   # Terminal prompt
brew install k6                                     # Network load testing framework
brew install mole                                   # Mac specific disk cleaner
brew install neovim --HEAD                          # Neovim nightly release
brew install netbirdio/tap/netbird                  # VPN, can replace with `--cask netbirdio/tap/netbird-ui` if GUI is preferred
brew install node                                   # Node.js
brew install ripgrep                                # Better grep
brew install tealdeer                               # TLDR in terminal
brew install tree                                   # Directory tree viewer
brew install whosthere                              # Network activity monitor
brew install zoxide                                 # Better cd
