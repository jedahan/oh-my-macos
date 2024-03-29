# jedahan's macOS High Sierra setup

Shell scripts for automated macOS machine setup.

- shell will be set to [zsh](zsh.org) with some plugins like autocomplete, and a fuzzy finder
- sets the color scheme to [new-moon](https://taniarascia.github.io/new-moon/) with the [inconsolata nerd font](http://levien.com/type/myfonts/inconsolata.html)
- sets up [my dotfiles](https://github.com/jedahan/dotfiles) which are [helix](https://helix-editor.com) oriented
- locks down safari to be more secure
- creates master password + ssh keys

## Usage

Edit [preferences.sh](/preferences.sh), [applications.zsh](/applications.zsh), and [defaults.sh](/defaults.sh) to your liking, then run `engage.sh` in your terminal.

`engage.sh` asks for your root password, installs the xcode commandline utilities, installs homebrew, asks for your app store username and password, and:

  1. Applies system preferences (like hostname) from `preferences.sh`
  2. Installs commandline and gui software specified in `applications.zsh`
  3. Installs application extensions, add-ons, and plug-ins with `dotfiles.sh`
  4. Applies gui application preferences in `defaults.sh`
  5. Locks down safari `security.sh`

## Software

`applications.zsh` installs the following software, mostly through [Homebrew](http://brew.sh) and [mas](https://github.com/mas-cli/mas) (from the App Store):

### commandline software

[avr-libc](www.nongnu.org/avr-libc)
, [avrdude](www.nongnu.org/avrdude)
, [bat](github.com/sharkdp/bat)
, [coreutils](www.gnu.org/software/coreutils)
, [eza](eza.rocks/)
, [fd](github.com/sharkdp/fd)
, [fzf](github.com/junegunn/fzf)
, [git](git-scm.com)
, [hub](hub.github.com)
, [hyperfine](github.com/sharkdp/hyperfine)
, [mpv](mpv.io)
, [mtr](www.bitwizard.nl/mtr)
, [netcat6](deepspace6.net/projects/netcat6.html)
, [ngrep](ngrep.sourceforge.net)
, [ngrok](ngrok.com)
, [nmap](nmap.org)
, [nodejs](nodejs.org)
, [python](python.org)
, [pngcheck](www.libpng.org/pub/png/apps/pngcheck.html)
, [ripgrep](blog.burntsushi.net/ripgrep)
, [ruby](ruby-lang.org)
, [tcpdump](tcpdump.org)
, [tlrc (tldr)](tldr.sh/tlrc)
, [tmux](tmux.github.io)
, [vice](vice-emu.sourceforge.net)
, [watch](procps.sourceforge.net)
, [youtube-dl](rg3.github.io/youtube-dl)
, [zr](github.com/jedahan/zr)
, [zsh](zsh.org)

### gui software

[Arduino](arduino.cc)
, [Firefox](mozilla.org)
, [Filckr Uploadr](www.flickr.com/tools)
, [mini vMac](www.gryphel.com/c/minivmac)
, [retroarch](www.retroarch.com)
, [Slack](slack.com)
, [Spotify](spotify.com)
, [Transmission](transmissionbt.com)
, [Twitter](twitter.com)
, [Wezterm](wezfurlong.org/wezterm)
, [Wireshark](wireshark.org)
, [Zed](zed.dev)
