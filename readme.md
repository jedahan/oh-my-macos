# jedahan's macOS Sierra setup

Shell scripts for automated macOS machine setup.

- shell will be set to [zsh](zsh.org) with some plugins like autocomplete, and a fuzzy finder
- sets the color scheme to tomorrow night eightes with the [inconsolata nerd font](http://levien.com/type/myfonts/inconsolata.html)
- *.dev will always resolve to 127.0.0.1 (thanks dnsmasq!)
- sets up [my dotfiles](https://github.com/jedahan/dotfiles) which are neovim oriented
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

[aircrack-ng](aircrack-ng.org)
, [amp](amp.rs)
, [avr-libc](www.nongnu.org/avr-libc)
, [avrdude](www.nongnu.org/avrdude)
, [bat](github.com/sharkdp/bat)
, [dnsmasq](thekelleys.org.uk/dnsmasq/doc.html)
, [exa](the.exa.website/)
, [fd](github.com/sharkdp/fd)
, [fzf](github.com/junegunn/fzf)
, [git](git-scm.com)
, [gnuradio](gnuradio.org)
, [hub](hub.github.com)
, [hyperfine](github.com/sharkdp/hyperfine),
, [jq](stedolan.github.io/jq)
, [lolcat](github.com/ur0/lolcat)
, [mpv](mpv.io)
, [mtr](www.bitwizard.nl/mtr)
, [netcat6](deepspace6.net/projects/netcat6.html)
, [neovim](neovim.io)
, [ngrep](ngrep.sourceforge.net)
, [nmap](nmap.org)
, [nodejs](nodejs.org)
, [python](python.org)
, [racer](github.com/racer-rust/racer),
, [ripgrep](blog.burntsushi.net/ripgrep)
, [ruby](ruby-lang.org)
, [streamlink](streamlink.github.io)
, [tcpdump](tcpdump.org)
, [tealdeer (tldr)](github.com/dbrgn/tealdeer)
, [tmux](tmux.github.io)
, [trash](hasseg.org/trash)
, [vice](vice-emu.sourceforge.net)
, [vj](github.com/busyloop/vj)
, [watch](procps.sourceforge.net)
, [xsv](github.com/BurntSushi/xsv)
, [youtube-dl](rg3.github.io/youtube-dl)
, [zr](github.com/jedahan/zr)
, [zsh](zsh.org)

### gui software

[quicklook plugins](github.com/sindresorhus/quick-look-plugins)
, [Arduino](arduino.cc)
, [Atom](atom.io)
, [Backblaze](backblaze.com)
, [Battle.net](battle.net)
, [Cinch](irradiatedsoftware.com/cinch/)
, [Deckset](google.com/?g=deckset)
, [Firefox](mozilla.org)
, [Filckr Uploadr](www.flickr.com/tools)
, [Hex Fiend](ridiculousfish.com/hexfiend)
, [middleclick](rouge41.com/labs)
, [mini vMac](www.gryphel.com/c/minivmac)
, [retroarch](www.retroarch.com)
, [Rocket](matthewpalmer.net/rocket)
, [Slack](slack.com)
, [Spotify](spotify.com)
, [Steam](steampowered.com)
, [Textual](codeux.com/textual)
, [Typora](typora.io)
, [The Unarchiver](theunarchiver.com)
, [Transmission](transmissionbt.com)
, [Textual](codeux.com/textual)
, [Twitter](twitter.com)
, [Wireshark](wireshark.org)
