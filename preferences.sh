set -e
name="talon"
echo "Set computer name to $name"
[[ `hostname` == $name ]] || {
  scutil --set ComputerName $name
  scutil --set HostName $name
  scutil --set LocalHostName $name
  defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string $name
}

echo "Hibernate to disk on battery"
sudo pmset -b hibernatemode 25

echo "Disable Gatekeeper"
[[ `spctl --status` == 'assessments disabled' ]] || sudo spctl --master-disable

echo "Enable tap to click"
defaults write com.apple.AppleBluetoothMultitouch.trackpad Clicking -int 1

echo "Enable fast key-repeat"
defaults write -g ApplePressAndHoldEnabled -bool false
defaults write -g KeyRepeat -int 0.02

echo "Switch to Dark interface"
defaults write -globalDomain AppleInterfaceStyle -string Dark

echo "Enable control + scroll for zooming"
defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true

echo "Automatically hide and show the menu bar"
defaults write -globalDomain _HIHideMenuBar -bool true

echo "Automatically hide and show the Dock"
defaults write com.apple.dock autohide -bool true

echo "Remove default apps from the Dock"
defaults write com.apple.dock persistent-apps -array ""

echo "Move dock to the right side"
defaults write com.apple.dock orientation -string "right"

echo "Set clock format to h:mm"
defaults write com.apple.menuextra.clock DateFormat -string "h:mm "

for app in Finder Dock SystemUIServer cfprefsd; do killall "$app" > /dev/null 2>&1; done
echo "Done. Dark interface, tap to click, and scroll to zoom require a restart"
