#!/bin/zsh
set -e

echo "Updating macOS software"
sudo softwareupdate --install --all

brew -v && {
  echo "updating homebrew"
  brew update
  brew upgrade --greedy
  brew install ruby

  important_clis=(
    git
    zsh
    python3
    ripgrep
    tlrc
    eza
    helix
    fd
  )

  important_apps=(
    firefox
    caskroom/fonts/font-inconsolata-nerd-font
    zed
  )

  clis=(
    avrdude
    coreutils
    hub
    xh
    jq
    mpv
    mtr
    netcat6
    ngrep
    nmap
    pngcheck
    tcpdump
    watch
    youtube-dl
  )

  apps=(
    arduino
    atom
    element
    hex-fiend
    mini-vmac
    ngrok
    retroarch
    signal
    slack
    spotify
    transmission
    zulip
  )

  function brewinstall() { brew list $1 >/dev/null || brew install $_ }

  function caskinstall() { brew cask list $1 >/dev/null || brew cask install $_ }

  for cli in $important_clis; do brewinstall $cli; done
  for app in $important_apps; do caskinstall $app; done
  for cli in $clis; do brewinstall $cli; done
  for app in $apps; do caskinstall $app; done
}

(( $+commands[cargo] )) && {
  crates=(
    bat
    cargo-edit
    cargo-update
    hyperfine
    zr
  )

  function crateinstall() {
    cargo install --list | grep $1 >/dev/null || cargo install $_
  }

  for crate in $crates; do crateinstall $crate; done
}

