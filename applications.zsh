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
    textual
    caskroom/fonts/font-inconsolata-nerd-font
  )

  clis=(
    aircrack-ng
    avrdude
    jq
    mpv
    mtr
    netcat6
    ngrep
    nmap
    paritytech/paritytech/parity
    ruby
    trash
    tcpdump
    watch
    yarn
    youtube-dl
  )

  apps=(
    arduino
    atom
    backblaze
    battle-net
    hex-fiend
    mini-vmac
    rocket
    slack
    spotify
    steam
    transmission
    typora
    zulip
  )

  quicklooks=(
    betterzipql
    qlcolorcode
    qlmarkdown
    qlprettypatch
    qlvideo
    quicklook-csv
    quicklook-json
    suspicious-package
  )

  function brewinstall() { brew list $1 >/dev/null || brew install $_ }

  function caskinstall() { brew cask list $1 >/dev/null || brew cask install $_ }

  for cli in $important_clis; do brewinstall $cli; done
  for app in $important_apps; do caskinstall $app; done
  for cli in $clis; do brewinstall $cli; done
  for app in $apps; do caskinstall $app; done
  for quicklook in $quicklooks; do caskinstall $qiucklook; done; qlmanage -r
}

(( $+commands[cargo] )) && {
  crates=(
    cargo-edit
    cargo-update
    lolcat
    ripgrep
    tealdeer
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
  for pip in (neovim streamlink lolcommits); do (( $+commands[$pip] )) || pip3 install $pip; done
  (( $+commands[http] )) || pip3 install httpie
}

(( $+commands[gem] )) && {
  export GEM_HOME="${HOME}/.gems"
  export GEM_PATH="$GEM_HOME"
  for gem in (neovim vj); do
    gem list $gem | grep $_ || gem install $_
  done
}
