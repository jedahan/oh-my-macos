> [!WARNING]
> This has been simplified to a single [bootstrap.zsh][] script in [my dotfiles][]

# jedahan's macOS Sequoia setup

Shell scripts for automated macOS machine setup.

- shell will enable autocomplete, syntax highlighting, and fuzzy-finder on completions
- sets up [my dotfiles](https://github.com/jedahan/dotfiles) which are [helix](https://helix-editor.com) + [ghostty](https://mitchellh.com/ghostty) oriented
- enables auto-updates for system software
- locks down safari to be more secure

## Usage

Edit [preferences.sh](/preferences.sh), [applications.zsh](/applications.zsh), and [defaults.sh](/defaults.sh) to your liking, then run `engage.sh` in your terminal.

`engage.sh` asks for your root password, installs the xcode commandline utilities, installs homebrew, asks for your app store username and password, and:

  1. Applies system preferences (like hostname) from `preferences.sh`
  2. Installs commandline and gui software specified in `applications.zsh`
  3. Installs commandline configs with `dotfiles.sh`
  4. Applies gui application preferences in `defaults.sh`
  5. Locks down safari in `security.sh`

## Software

`applications.zsh` installs the following software, mostly through [Homebrew](http://brew.sh) and [mas](https://github.com/mas-cli/mas) (from the App Store):

### commandline software

[avrdude](www.nongnu.org/avrdude)
, [bat](github.com/sharkdp/bat)
, [eza](eza.rocks/)
, [fd](github.com/sharkdp/fd)
, [fzf](github.com/junegunn/fzf)
, [git](git-scm.com)
, [hub](hub.github.com)
, [hyperfine](github.com/sharkdp/hyperfine)
, [mpv](mpv.io)
, [nmap](nmap.org)
, [nodejs](nodejs.org)
, [ripgrep](blog.burntsushi.net/ripgrep)
, [tcpdump](tcpdump.org)
, [tlrc (tldr)](tldr.sh/tlrc)
, [watch](procps.sourceforge.net)
, [youtube-dl](rg3.github.io/youtube-dl)
, [zr](github.com/jedahan/zr)

### gui software

[Arduino](arduino.cc)
, [Firefox](mozilla.org)
, [mini vMac](www.gryphel.com/c/minivmac)
, [Slack](slack.com)
, [Spotify](spotify.com)
, [Transmission](transmissionbt.com)
, [Wireshark](wireshark.org)
, [Zed](zed.dev)

[my dotfiles]: https://github.com/jedahan/dotfiles
[bootstrap.zsh]: https://github.com/jedahan/dotfiles/blob/macOS/bootstrap.zsh
