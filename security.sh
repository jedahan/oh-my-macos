set -e

echo "Disable Safari from auto-filling sensitive data"
defaults write ~/Library/Preferences/com.apple.Safari AutoFillCreditCardData -bool false
defaults write ~/Library/Preferences/com.apple.Safari AutoFillFromAddressBook -bool false
defaults write ~/Library/Preferences/com.apple.Safari AutoFillMiscellaneousForms -bool false
defaults write ~/Library/Preferences/com.apple.Safari AutoFillPasswords -bool false

echo "Disable Safari from automatically opening files"
defaults write ~/Library/Preferences/com.apple.Safari AutoOpenSafeDownloads -bool false

echo "Always block cookies and local storage in Safari"
defaults write ~/Library/Preferences/com.apple.Safari BlockStoragePolicy -bool false

echo "Enable Safari warnings when visiting fradulent websites"
defaults write ~/Library/Preferences/com.apple.Safari WarnAboutFraudulentWebsites -bool true

echo "Disable javascript in Safari"
defaults write ~/Library/Preferences/com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaScriptEnabled -bool false
defaults write ~/Library/Preferences/com.apple.Safari WebKitJavaScriptEnabled -bool false

echo "Block popups in Safari"
defaults write ~/Library/Preferences/com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaScriptCanOpenWindowsAutomatically -bool false
defaults write ~/Library/Preferences/com.apple.Safari WebKitJavaScriptCanOpenWindowsAutomatically -bool false

echo "Disable plugins and extensions in Safari"
defaults write ~/Library/Preferences/com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2WebGLEnabled -bool false
defaults write ~/Library/Preferences/com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2PluginsEnabled -bool false
defaults write ~/Library/Preferences/com.apple.Safari WebKitPluginsEnabled -bool false
defaults write ~/Library/Preferences/com.apple.Safari ExtensionsEnabled -bool false
defaults write ~/Library/Preferences/com.apple.Safari PlugInFirstVisitPolicy PlugInPolicyBlock
defaults write ~/Library/Preferences/com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaEnabled -bool false
defaults write ~/Library/Preferences/com.apple.Safari WebKitJavaEnabled -bool false

echo "Safari should treat SHA-1 certificates as insecure"
defaults write ~/Library/Preferences/com.apple.Safari TreatSHA1CertificatesAsInsecure -bool true

echo "Disable pre-loading websites with high search rankings"
defaults write ~/Library/Preferences/com.apple.Safari PreloadTopHit -bool false

echo "Disable Safari search engine suggestions"
defaults write ~/Library/Preferences/com.apple.Safari SuppressSearchSuggestions -bool true

echo "Enable Do-Not-Track HTTP header in Safari"
defaults write ~/Library/Preferences/com.apple.Safari SendDoNotTrackHTTPHeader -bool true

echo "Disable pdf viewing in Safari"
defaults write ~/Library/Preferences/com.apple.Safari WebKitOmitPDFSupport -bool true

echo "Display full website addresses in Safari"
defaults write ~/Library/Preferences/com.apple.Safari ShowFullURLInSmartSearchField -bool true

echo "Disable spotlight universal search (don't send info to Apple)"
defaults write com.apple.safari UniversalSearchEnabled -int 0

echo "Disable wake on network access"
sudo systemsetup -setwakeonnetworkaccess off

echo "Enable Mac App Store automatic updates"
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true

echo "Check for Mac App Store updates daily"
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

echo "Download Mac App Store updates in the background"
defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1

echo "Install Mac App Store system data files & security updates"
defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1

echo "Turn on Mac App Store auto-update"
defaults write com.apple.commerce AutoUpdate -bool true

echo "Setup Master Password"
read -p "What is your master password username? " mp_username
defaults write com.lyndir.lhunath.MasterPassword.Mac usedUserName -string "$mp_username"
defaults write com.lyndir.lhunath.MasterPassword.Mac firstRun -int 0
defaults write com.lyndir.lhunath.MasterPassword.Mac fullScreen -int 0
defaults write com.lyndir.lhunath.MasterPassword.Mac hidePasswords -int 1
defaults write com.lyndir.lhunath.MasterPassword.Mac rememberLogin -int 1

echo "Generating new ssh key for github"
mpw -u "$mp_username" -t max
ssh-keygen -t ed25519 -f ~/.ssh/github.com
ssh-add -k ~/.ssh/github.com
pbcopy < ~/.ssh/github.com.pub
echo "Copied gitub public key to clipboard"
open https://github.com/settings/keys
