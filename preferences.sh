set -e
name="talon"
echo "Set computer name to $name"
[[ `hostname` == $name ]] || {
  scutil --set ComputerName $name
  scutil --set HostName $name
  scutil --set LocalHostName $name
}

echo "Disable Gatekeeper"
[[ `spctl --status` == 'assessments disabled' ]] || sudo spctl --master-disable

echo "Enable tap to click"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -int 1
defaults write com.apple.AppleMultitouch.trackpad Clicking -int 1

echo "Enable fast key-repeat"
defaults write -g ApplePressAndHoldEnabled -bool false
defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 0.1

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

echo "Remap Caps Lock to Control"
#vendor_id=$(ioreg -p IOUSB -c IOUSBDevice | grep -e class -e idVendor | grep Keyboard -A1 | grep idVendor | cut -d'=' -f2 | cut -d' ' -f2)
#product_id=$(ioreg -p IOUSB -c IOUSBDevice | grep -e class -e idProduct | grep Keyboard -A1 | grep idProduct | cut -d'=' -f2 | cut -d' ' -f2)
#defaults -currentHost write -g "com.apple.keyboard.modifiermapping.${vendor_id}-${product_id}-0" -array '<dict><key>HIDKeyboardModifierMappingDst</key><integer>30064771296</integer><key>HIDKeyboardModifierMappingSrc</key><integer>30064771129</integer></dict>'

echo "Remove launchpad animations"
defaults write com.apple.dock springboard-show-duration -float 0
defaults write com.apple.dock springboard-hide-duration -float 0

for app in Finder Dock SystemUIServer cfprefsd; do killall "$app" > /dev/null 2>&1; done
echo "Done. Dark interface, tap to click, caps to control, and scroll to zoom require a restart"

