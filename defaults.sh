set -e

echo "Enable encryption and blocklist for Transmission"
defaults write org.m0k.transmission EncryptionRequire -bool true
defaults write org.m0k.transmission BlocklistURL -string "http://list.iblocklist.com/?list=bt_level1&fileformat=p2p&archiveformat=gz"
defaults write org.m0k.transmission BlocklistAutoUpdate -bool true
defaults write org.m0k.transmission BlocklistNew -bool true

echo "Set Tranmission to use minimal UI"
defaults write org.m0k.transmission DeleteOriginalTorrent -bool true
defaults write org.m0k.transmission WarningDonate -bool false
defaults write org.m0k.transmission WarningLegal -bool false
defaults write org.m0k.transmission SmallView -bool true
defaults write org.m0k.transmission InfoVisible -bool false
defaults write org.m0k.transmission StatusBar -bool false
defaults write org.m0k.transmission AutoSize -bool true
defaults write org.m0k.transmission BadgeDownloadRate -bool false
defaults write org.m0k.transmission BadgeUploadRate -bool false
defaults write org.m0k.transmission DownloadAsk -bool false
defaults write org.m0k.transmission MagnetOpenAsk -bool false
defaults write org.m0k.transmission DownloadAsk -bool false
