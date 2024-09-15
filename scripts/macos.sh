#!/usr/bin/env bash

# Defaults macOS Settings, tested with macOS 10.15.7

# Close system preferences
osascript -e 'tell application "System Preferences" to quit'


#######################################
# GENERAL                             #
#######################################

# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "

# Disable Resume
defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false

# Language settings
defaults write NSGlobalDomain AppleLanguages -array "en" "de"
defaults write NSGlobalDomain AppleLocale -string "en_US@currency=EUR"
sudo systemsetup -settimezone "Europe/Berlin" > /dev/null

# Always require password
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Reduce transparency (in window backgrounds etc.)
defaults write com.apple.universalaccess reduceTransparency -bool true

# Hide icons on desktop
defaults write com.apple.finder CreateDesktop false


#######################################
# DOCK                                #
#######################################

defaults write com.apple.dock autohide -bool false
defaults write com.apple.dock magnification -bool true
defaults write com.apple.dock tilesize -int 24
defaults write com.apple.dock largesize -int 52
defaults write com.apple.dock orientation -string "left"
defaults write com.apple.dock "minimize-to-application" -bool true
defaults write com.apple.dock mineffect -string "scale"
defaults write com.apple.dock "show-recents" -bool false


#######################################
# MENUBAR                             #
#######################################

defaults write com.apple.systemuiserver menuExtras -array-add "/System/Library/CoreServices/Menu Extras/Bluetooth.menu"
defaults write com.apple.systemuiserver menuExtras -array-add "/System/Library/CoreServices/Menu Extras/Volume.menu"
defaults write com.apple.menuextra.battery ShowPercent -bool true


#######################################
# TRACKPAD                            #
#######################################

# Enable tap to click
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerVertSwipeGesture -int 0
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerHorizSwipeGesture -int 0

# Disable notification center gesture
defaults write com.apple.AppleMultitouch.trackpad TrackpadTwoFingerFromRightEdgeSwipeGesture -int 0


#######################################
# TOUCHBAR                            #
#######################################

defaults write com.apple.touchbar.agent PresentationModeGlobal -string "appWithControlStrip"
defaults write com.apple.touchbar.agent PresentationModeFnModes -dict "appWithControlStrip" "fullControlStrip"

defaults write com.apple.controlstrip MiniCustomized -array \
	"com.apple.system.brightness" \
	"com.apple.system.media-play-pause" \
	"com.apple.system.volume" \
	"com.apple.system.mute"


#######################################
# SCREENSHOTS                         #
#######################################

defaults write com.apple.screencapture target -string "${HOME}/Screenshots"


#######################################
# FINDER                              #
#######################################

defaults write com.apple.finder DisableAllAnimations -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowSidebar -bool true
defaults write com.apple.finder ShowRecentTags -bool false

# Always show file extension
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Set default search scope to current folder
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Set default view to columns
defaults write com.apple.Finder FXPreferredViewStyle clmv

# Always show folders first, even when sorting is applied
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Open/close sidebar sections (true == open)
defaults write com.apple.finder SidebarDevicesSectionDisclosedState -bool true
defaults write com.apple.finder SidebarPlacesSectionDisclosedState -bool true
defaults write com.apple.finder SidebarShowingSignedIntoiCloud -bool false
defaults write com.apple.finder SidebarTagsSctionDisclosedState -bool false


#######################################
# UPDATES                             #
#######################################

defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1
defaults write com.apple.SoftwareUpdate AutomaticDownload -bool true


#######################################
# CHROME                              #
#######################################

defaults write com.google.Chrome DisablePrintPreview -bool true
defaults write com.google.Chrome.canary DisablePrintPreview -bool true


#######################################
# ITERM 2                             #
#######################################

defaults write com.googlecode.iterm2 TabStyleWithAutomaticOption -int 5
defaults write com.googlecode.iterm2 HideTab -bool false
defaults write com.googlecode.iterm2 FocusFollowsMouse -bool true
defaults write com.googlecode.iterm2 SplitPaneDimmingAmount -float 0.2


# Restart apps affected by updated configuration
for app in \
	"ControlStrip" \
	"Dock" \
	"Finder" \
	"Google Chrome Canary" \
	"Google Chrome" \
	"iTerm2" \
	"Safari";
do
	killall "${app}" &> /dev/null
done
