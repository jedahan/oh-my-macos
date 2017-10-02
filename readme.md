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
  5. Locks down safari, generates ssh and master password keys in `security.sh`

## Software

`applications.zsh` installs the following software, mostly through [Homebrew](http://brew.sh) and [mas](https://github.com/mas-cli/mas) (from the App Store):

### commandline software

[aircrack-ng](aircrack-ng.org)
, [avr-libc](www.nongnu.org/avr-libc)
, [avrdude](www.nongnu.org/avrdude)
, [dnsmasq](thekelleys.org.uk/dnsmasq/doc.html)
, [exa](the.exa.website/)
, [fzf](github.com/junegunn/fzf)
, [git](git-scm.com)
, [gnuradio](gnuradio.org)
, [hub](hub.github.com)
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
, [ripgrep](blog.burntsushi.net/ripgrep)
, [ruby](ruby-lang.org)
, [tcpdump](tcpdump.org)
, [tealdeer (tldr)](github.com/dbrgn/tealdeer)
, [tmux](tmux.github.io)
, [trash](hasseg.org/trash)
, [vice](vice-emu.sourceforge.net)
, [watch](procps.sourceforge.net)
, [xsv](github.com/BurntSushi/xsv)
, [youtube-dl](rg3.github.io/youtube-dl)
, [zr](github.com/jedahan/zr)
, [zsh](zsh.org)

### gui software

[quicklook plugins](github.com/sindresorhus/quick-look-plugins)
, [Android File Transfer](android.com/filetransfer)
, [Arduino](arduino.cc)
, [Atom](atom.io)
, [Backblaze](backblaze.com)
, [Battle.net](battle.net)
, [Cerebro](cerebroapp.com)
, [Cinch](irradiatedsoftware.com/cinch/)
, [Deckset](google.com/?g=deckset)
, [Firefox](mozilla.org)
, [Filckr Uploadr](www.flickr.com/tools)
, [Hex Fiend](ridiculousfish.com/hexfiend)
, [Horndis](joshuawise.com/horndis)
, [Master Password](masterpasswordapp.com)
, [mini vMac](www.gryphel.com/c/minivmac)
, [Slack](slack.com)
, [Spotify](spotify.com)
, [Steam](steampowered.com)
, [Textual](codeux.com/textual)
, [Typora](typora.io)
, [The Unarchiver](theunarchiver.com)
, [Transmission](transmissionbt.com)
, [Textual](codeux.com/textual)
, [Twitter](twitter.com)
, [Virtualbox](virtualbox.org)
, [Wireshark](wireshark.org)
, [XQuartz](xquartz.macosforge.org)

## Postinstall Checklist

- [ ] Login to Firefox Sync
- [ ] Run Battle.Net installer
