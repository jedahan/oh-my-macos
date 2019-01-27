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
    neovim
    fd
  )

  important_apps=(
    firefox
    caskroom/fonts/font-inconsolata-nerd-font
  )

  clis=(
    avrdude
    coreutils
    hexyl
    hub
    jq
    mpv
    mtr
    netcat6
    ngrep
    nmap
    paritytech/paritytech/parity
    pngcheck
    tcpdump
    watch
    youtube-dl
  )

  gos=(
    "hecate github.com/evanmiller/hecate"
  )

  apps=(
    arduino
    atom
    hex-fiend
    mini-vmac
    ngrok
    retroarch
    slack
    spotify
    steam
    transmission
    typora
    zulip
  )

  quicklooks=(
    qlcolorcode
    qlstephen
    qlcommonmark
    qlimagesize
    webpquicklook
    qlvideo
    quicklook-json
    qlprettypatch
    quicklook-csv
  )

  function brewinstall() { brew list $1 >/dev/null || brew install $_ }

  function caskinstall() { brew cask list $1 >/dev/null || brew cask install $_ }

  function goinstall() { (( $+commands[$1] )) || go get -u $2 }

  for cli in $important_clis; do brewinstall $cli; done
  for app in $important_apps; do caskinstall $app; done
  for cli in $clis; do brewinstall $cli; done
  for cli in $gos; do goinstall ${(s: :)cli}; done
  for app in $apps; do caskinstall $app; done
  for quicklook in $quicklooks; do caskinstall $qiucklook; done; qlmanage -r
}

(( $+commands[cargo] )) && {
  crates=(
    alacritty
    amp
    bat
    cargo-edit
    cargo-update
    hyperfine
    lolcat
    racer
    ripgrep
    tealdeer
    xsv
    zr
  )

  function crateinstall() {
    cargo install --list | grep $1 >/dev/null || cargo install $_
  }

  for crate in $crates; do crateinstall $crate; done
}

(( $+commands[mas] )) && {
  apps=(
    412529613 # Cinch
    896450579 # Textual
    847496013 # Deckset
    425424353 # The Unarchiver
    409789998 # Twitter
  )

  for app in $apps; do mas install ${app%%#}; done
}

(( $+commands[pip3] )) && {
  for pip in (pynvim streamlink lolcommits); do (( $+commands[$pip] )) || pip3 install $pip; done
  (( $+commands[http] )) || pip3 install httpie
}

(( $+commands[gem] )) && {
  export GEM_HOME="${HOME}/.gems"
  export GEM_PATH="$GEM_HOME"
  for gem in (neovim vj); do
    gem list $gem | grep $_ || gem install $_
  done
}
