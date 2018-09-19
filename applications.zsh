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
    middleclick
    mini-vmac
    retroarch
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

  wget https://raw.githubusercontent.com/jwilm/alacritty/fd79505fc328827ad6f384defbb324a6ca91ca47/alacritty.info \
  && sudo tic -e alacritty,alacritty-direct alacritty.info
  rm -f alacritty.info
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

(( $+commands[npm] )) && {
  export NPM_CONFIG_PREFIX=/Volumes/data/tmp/npm/global
  export NPM_CONFIG_CACHE=/Volumes/data/tmp/npm/cache
  local clis=(
    emma-cli
    emoj
  )
  for cli in $clis; do
    npm install --global $cli
  done
}
