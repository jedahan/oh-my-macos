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
