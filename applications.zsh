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

  # apps that I want asap, or require password on install
  important_apps=(
    firefox
    textual
    caskroom/fonts/font-inconsolata-nerd-font
  )

  crates=(
    cargo-update
    lolcat
    ripgrep
    tealdeer
    zr
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
  for quicklook in $quicklooks; do caskinstall $qiucklook; done

  brew cleanup
  qlmanage -r
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

(( $+commands[http] )) || pip3 install httpie
(( $+commands[streamlink] )) || pip3 install streamlink

export GEM_HOME="${HOME}/.gems"
export GEM_PATH="$GEM_HOME"

(( $+commands[lolcommits] )) || gem install lolcommits
pip3 show neovim || pip3 install neovim
gem list neovim | grep $_ || gem install $_
gem list vj | grep $_ || gem install $_
