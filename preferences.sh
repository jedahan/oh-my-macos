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
defaults write com.apple.AppleMultitouchTrackpad Clicking -int 1

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

# Hide Search, Time Machine, User, and Bluetooth icons
sudo chmod 600 /System/Library/CoreServices/Search.bundle/Contents/MacOS/Search
for domain in ~/Library/Preferences/ByHost/com.apple.systemuiserver.* ; do
  defaults write $domain dontAutoLoad -array \
    "/System/Library/CoreServices/Menu Extras/TimeMachine.menu" \
    "/System/Library/CoreServices/Menu Extras/User.menu" \
    "/System/Library/CoreServices/Menu Extras/Bluetooth.menu"

# Set clock format
defaults write com.apple.menuextra.clock DateFormat -string "h:mm"

# Hot corners
##  0: no-op
##  2: Mission Control
##  3: Show application windows
##  4: Desktop
##  5: Start screen saver
##  6: Disable screen saver
##  7: Dashboard
## 10: Put display to sleep
## 11: Launchpad
## 12: Notification Center

# Top left screen corner → Nothing
defaults write com.apple.dock wvous-tl-corner -int 0
defaults write com.apple.dock wvous-tl-modifier -int 0

# Top right screen corner → Nothing
defaults write com.apple.dock wvous-tr-corner -int 0
defaults write com.apple.dock wvous-tr-modifier -int 0

# Bottom left screen corner → Start screen saver
defaults write com.apple.dock wvous-bl-corner -int 5
defaults write com.apple.dock wvous-bl-modifier -int 0

## Finder

# Finder: Open /Volumes/Data folder by default
defaults write com.apple.finder NewWindowTargetPath -string "file:///Volumes/data/"

# Finder: Enable full keyboard access for all controls (e.g. enable Tab in modal dialogs)
defaults write -globalDomain AppleKeyboardUIMode -int 3

# Finder: Allow quitting Finder via ⌘ + Q; doing so will also hide desktop icons
defaults write com.apple.finder QuitMenuItem -bool true

# Finder: Disable window animations and Get Info animations in Finder
defaults write com.apple.finder DisableAllAnimations -bool true

# Finder: Allow text selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true

# Finder: Open a new Finder window when a volume is mounted
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true

# Finder: Disable .DS_Store file creation on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Finder: Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Finder: Disable the warning before emptying the Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# Finder: Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

## Cleanup

# Kill affected applications
for app in Finder Dock SystemUIServer cfprefsd; do killall "$app" > /dev/null 2>&1; done
echo "Done. Note that some of these changes require a logout/restart to take effect."
