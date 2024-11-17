set -e

name="talon" 
echo "Set computer name to $name"; {
  [[ "$(scutil --get ComputerName)" == "$name" ]] || scutil --set ComputerName $name
  [[ "$(scutil --get LocalHostName)" == "$name" ]] || scutil --set LocalHostName $name
}

echo "Enable tap to click"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -int 1

echo "Enable fast key-repeat"
defaults write -g ApplePressAndHoldEnabled -bool false
defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 0.1

echo "Automatically hide and show the Dock"
defaults write com.apple.dock autohide -bool true

echo "Remove default apps from the Dock"
defaults write com.apple.dock persistent-apps -array ""

echo "Move dock to the right side"
defaults write com.apple.dock orientation -string "right"

echo "Set clock format to h:mm"
defaults write com.apple.menuextra.clock DateFormat -string "h:mm "

echo "Remove launchpad animations"
defaults write com.apple.dock springboard-show-duration -float 0
defaults write com.apple.dock springboard-hide-duration -float 0

for app in Finder Dock SystemUIServer cfprefsd; do killall "$app" > /dev/null 2>&1; done
echo "Done.  Tap to click, and scroll to zoom require a restart"

