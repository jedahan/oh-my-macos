#!/bin/zsh
set -e

echo "Updating macOS software"
sudo softwareupdate --install --all

# ! brew leaves --installed-on-request
brew -v && {
  echo "updating homebrew"
  brew update
  brew install \
    avrdude \
    aws-console \
    awscli \
    bat \
    caddy \
    cdrtools \
    colima \
    ddate \
    dfu-util \
    dive \
    entr \
    esbuild \
    exiftool \
    expect \
    eza \
    fd \
    fdupes \
    figlet \
    fzf \
    gallery-dl \
    gammaray \
    gh \
    git \
    git-lfs \
    glow \
    go \
    helix \
    jid \
    lua-language-server \
    lychee \
    mas \
    mtr \
    nginx \
    nmap \
    node \
    nycresistor/nycr/pdf2laser \
    open-ocd \
    oven-sh/bun/bun \
    php \
    podman \
    postgresql@15 \
    qt@5 \
    ripgrep \
    ruby \
    rust \
    rustup-init \
    shellcheck \
    socat \
    squashfs \
    superfile \
    syncthing \
    telnet \
    tio \
    tlrc \
    tmux \
    toilet \
    tokei \
    tree-sitter \
    typescript-language-server \
    vhs \
    watch \
    wireguard-tools \
    xh \
    zig \
    zls \
    zoxide \
    zsh
}

# cargo install --list | grep -v ':'
(( $+commands[cargo] )) && {
  cargo install \
    cargo-outdated \
    elf2uf2-rs \
    flip-link \
    hyperfine \
    libreddit \
    probe-rs-cli \
    probe-run \
    cargo-tauri \
    wireguard-vanity-address \
    zr
}
