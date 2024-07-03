#!/bin/zsh
set -e

echo "Updating macOS software"
sudo softwareupdate --install --all

# ! brew leaves --installed-on-request
(($+commands[brew])) && {
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

# ! brew leaves --installed-on-request
(($+commands[brew])) && {
  brew install --cask \
    android-studio \
    arduino-ide \
    bitwarden \
    discord \
    element \
    firefox \
    inkscape \
    kicad \
    lycheeslicer \
    macpass \
    obs \
    processing \
    prusaslicer \
    qbittorrent \
    qflipper \
    qt-creator \
    raspberry-pi-imager \
    signal \
    slack \
    steam \
    vitals \
    vscodium \
    wireshark \
    zulip

  brew install --cask \
    ftdi-vcp-driver \
    prolific-pl2303 \
    silicon-labs-vcp-driver
}

(($+commands[mas])) && {
  echo "to install shapr3d, wireguard and xcode, run:"
  echo mas signin
  echo mas install 1091675654 # Shapr3D
  echo mas install 1451685025 # WireGuard
  echo mas install 497799835 # Xcode
}
