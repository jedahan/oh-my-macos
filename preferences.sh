## General

# Set computer name
name="talon"
[[ `hostname` == $name ]] || {
  scutil --set ComputerName $name
  scutil --set HostName $name
  scutil --set LocalHostName $name
  defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string $name
}

# Disable Gatekeeper
[[ `spctl --status` == 'assessments disabled' ]] || sudo spctl --master-disable

## Input Devices

# Enable tap to click
defaults write com.apple.AppleBluetoothMultitouch.trackpad Clicking -int 1

# Disable "press and hold" (enables key repeat)
defaults write -g ApplePressAndHoldEnabled -bool false

# Set key repeat to fast
defaults write -g KeyRepeat -int 0.02

## User Interface

# Dark Interface
defaults write -globalDomain AppleInterfaceStyle -string Dark

# Control + scroll for zooming
defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true

# Automatically hide and show the menu bar
defaults write -globalDomain _HIHideMenuBar -bool true

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Remove default apps from the Dock
defaults write com.apple.dock persistent-apps -array ""

# Move dock to the right side
defaults write com.apple.dock orientation -string "right"

# Set clock format
defaults write com.apple.menuextra.clock DateFormat -string "h:mm "

## Cleanup

# Kill affected applications
for app in Finder Dock SystemUIServer cfprefsd; do killall "$app" > /dev/null 2>&1; done
echo "Done. Dark interface, tap to click, and scroll to zoom require a restart"
