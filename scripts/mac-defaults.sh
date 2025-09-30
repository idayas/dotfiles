# Remove all default apps from dock
defaults write com.apple.dock persistent-apps -array

# Set dock to right side
defaults write com.apple.dock orientation -string "right"

# Auto-hide
defaults write com.apple.dock autohide -bool true

# Show hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true

# Default to list view
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Show file extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Enable Cmd + Control to drag anywhere in a window
defaults write -g NSWindowShouldDragOnGesture -bool true

# Enable faster keyboard input, helpful for navigating in nvim
defaults write -g InitialKeyRepeat -float 15.0 
defaults write -g KeyRepeat -float 2 
