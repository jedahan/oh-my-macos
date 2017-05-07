#!/bin/zsh
set -e

echo "Updating macOS software"
sudo softwareupdate --install --all

brew -v && {
  echo "updating homebrew"
  brew update
  brew upgrade
  brew install ruby

  important_clis=(
    git
    zsh
    python3
    ripgrep
    exa
    tmux
    mpw
    jedahan/homebrew-zpm/zpm
    neovim/neovim/neovim
  )

  # apps that I want asap, or require password on install
  important_apps=(
    horndis
    virtualbox
    wireshark
    xquartz
    qlvideo
    cerebro
    master-password
    gpgtools
    firefox
    iterm2
    textual
    caskroom/fonts/font-inconsolata-nerd-font
  )

  crates=(
    cargo-update
    lolcat
    ripgrep
    tealdeer
  )

  clis=(
    aircrack-ng
    avrdude
    go
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
    watch
    youtube-dl
    osx-cross/homebrew-avr/avr-libc
    osx-cross/homebrew-avr/avr-gcc
  )

  apps=(
    android-file-transfer
    arduino
    atom
    backblaze
    battle-net
    betterzipql
    dash
    hex-fiend
    lumen
    mini-vmac
    slack
    soundnode
    spotify
    steam
    transmission
    virtualbox-extension-pack
    zulip
    qlcolorcode
    qlmarkdown
    qlprettypatch
    qlstephen
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
  for app in $important_apps; do caskinstall $app; done
  for crate in $crates; do crateinstall $crate; done
  for cli in $clis; do brewinstall $cli; done
  for app in $apps; do caskinstall $app; done

  brew cleanup
  qlmanage -r
}

(( $+commands[mas] )) && {
  apps=(
    412529613 # Cinch
    896450579 # Textual
    662763204 # Master Password
    847496013 # Deckset
    425424353 # The Unarchiver
    409789998 # Twitter
  )

  for app in $apps; do mas install ${app%%#}; done
}

(( $+commands[http] )) || pip3 install httpie
(( $+commands[livestreamer] )) || pip3 install livestreamer

export GEM_HOME="${HOME}/.gems"
export GEM_PATH="$GEM_HOME"
gem install lolcommits
