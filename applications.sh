# Update software
sudo softwareupdate --install --all

brew -v && {
  export HOMEBREW_CASK_OPTS="--binarydir=$OH_MY_OSX_HOMEBREW_PREFIX/bin"
  brew update
  brew upgrade
  brew install ruby
  brew tap Homebrew/bundle
  brew bundle
  brew cleanup
  qlmanage -r
}

# Cinch postinstall requires accessibility
[ -x /Applications/Cinch.app ] && \
  sudo sqlite3 /Library/Application\ Support/com.apple.TCC/TCC.db \
  "INSERT INTO access VALUES('kTCCServiceAccessibility','com.irradiatedsoftware.Cinch',0,1,1,NULL);"

# Install commandline applications
sudo easy_install httpie

# Install keybase
sudo npm install --global keybase-installer
keybase-installer

# Install some more cli utilities
export GEM_HOME="${HOME}/.gems"
export GEM_PATH="$GEM_HOME"
gem install lolcat lolcommits
