# Update software
sudo softwareupdate --install --all

brew -v && {
  brew update
  brew upgrade
  brew install ruby
  brew tap Homebrew/bundle
  brew bundle
  brew cleanup
  qlmanage -r
}

# Install commandline applications
sudo easy_install httpie

# Install keybase
sudo npm install --global keybase-installer
keybase-installer

# Install emoji-cli
sudo npm install --global emoji-cli

# Install some more cli utilities
export GEM_HOME="${HOME}/.gems"
export GEM_PATH="$GEM_HOME"
gem install lolcat lolcommits
