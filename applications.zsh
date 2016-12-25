#!/bin/zsh

# Update software
sudo softwareupdate --install --all

brew -v && {
  brew update
  brew upgrade
  brew install ruby

  taps=(
    neovim/neovim
    homebrew/homebrew-games
    caskroom/homebrew-fonts
    caskroom/homebrew-versions
    osx-cross/avr
  )

  important_clis=(
    git
    zsh
    python3
    ripgrep
    tmux
    neovim
  )

  important_apps=(
    gpgtools
    firefox
    iterm2
    tuxera-ntfs
    font-inconsolata
    font-mononoki
    textual
  )

  crates=(
    ripgrep
    tealdeer
    https://github.com/ogham/exa
  )

  clis=(
    aircrack-ng
    android-sdk
    assh
    avr-libc
    avrdude
    fceux
    gnuradio
    go
    hub
    jq
    mpv
    mtr
    netcat6
    ngrep
    nmap
    node
    ruby
    trash
    tcpdump
    vice
    watch
    youtube-dl
  )

  apps=(
    alfred
    android-file-transfer
    arduino
    atom
    backblaze
    battle-net
    betterzipql
    dash
    flickr-uploadr
    fritzing
    gitify
    hex-fiend
    horndis
    java
    lumen
    mini-vmac
    slack
    soundnode
    spotify
    steam
    transmission
    vagrant
    virtualbox
    virtualbox-extension-pack
    vlc
    wireshark
    xquartz
    zulip
    qlcolorcode
    qlmarkdown
    qlprettypatch
    qlstephen
    qlvideo
    quicklook-csv
    quicklook-json
    suspicious-package
  )

  function brewinstall() {
    brew list $1 >/dev/null || brew install $_
  }

  function caskinstall() {
    brew cask list $1 >/dev/null || brew cask install $_
  }

  function crateinstall() {
    [[ $1 =~ ^http ]] && git="--git" || git=""
    cargo install $git $1
  }

  for cli in $important_clis; do brewinstall $cli; done
  for app in $important_apps; do brewinstall $app; done
  for create in $crates; do crateinstall $crate; done
  for cli in $clis; do brewinstall $cli; done
  for app in $apps; do caskinstall $app; done

  brew cleanup
  qlmanage -r
}

mas -v >/dev/null && {
  apps=(
    412529613 # Cinch
    896450579 # Textual
    662763204 # Master Password
    847496013 # Deckset
    425424353 # The Unarchiver
    409789998 # Twitter
  )

  for app in $apps; do mas install $app; done
}

$+commands[http] || pip3 install httpie
$+commands[livestreamer] || pip3 install livestreamer

export GEM_HOME="${HOME}/.gems"
export GEM_PATH="$GEM_HOME"
gem install lolcat lolcommits
