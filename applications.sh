# Update software
sudo softwareupdate --install --all

brew -v && {
  brew update
  brew upgrade
  brew install ruby

  brew tap caskroom/cask
  brew tap homebrew/games
  brew tap neovim/neovim
  brew tap caskroom/fonts
  brew tap osx-cross/avr
  brew tap caskroom/versions

  function brewinstall() {
    brew list $1 >/dev/null || brew install $_
  }

  function caskinstall() {
    brew cask list $1 >/dev/null || brew cask install $_
  }

  brew list neovim >/dev/null || brew install --HEAD neovim

  for important_cli in (git zsh python3 sift); do
    brewinstall $important_cli
  done

  for important_app in (gpgtools firefox iterm2-beta font-inconsolata java slack tuxera-ntfs); do
    caskinstall $important_app
  done

  for cli in (
    aircrack-ng
    android-sdk
    avr-libc
    avrdude
    assh
    boot2docker
    fceux
    gnuradio
    go
    hub
    mtr
    mpv
    ngrep
    nmap
    node
    ruby
    trash
    vice
    watch
    youtube-dl
  ); do
    brewinstall $cli
  done

  for app in (
    alfred
    android-file-transfer
    arduino
    atom
    backblaze
    battle-net
    betterzipql
    dash
    dropbox
    flickr-uploadr
    fritzing
    gitify
    hex-fiend
    horndis
    mini-vmac
    spotify
    steam
    transmission
    vagrant
    virtualbox
    vlc
    xquartz
    qlcolorcode
    qlmarkdown
    qlprettypatch
    qlstephen
    quicklook-csv
    quicklook-json
    suspicious-package
    zulip
  ); do
    caskinstall $app
  done

  brew cleanup
  qlmanage -r
}

$+commands[http] || sudo easy_install httpie

# Install keybase
sudo npm install --global keybase-installer
keybase-installer

# Install emoji-cli
sudo npm install --global emoji-cli

# Install some more cli utilities
export GEM_HOME="${HOME}/.gems"
export GEM_PATH="$GEM_HOME"
gem install lolcat lolcommits
