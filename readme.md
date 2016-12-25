# jedahan's macOS Sierra setup

Shell scripts for automated macOS machine setup.

- shell will be set to [zsh](zsh.org) with some plugins like autocomplete, and a fuzzy finder
- sets the color scheme to tomorrow night eightes with the [inconsolata font](http://levien.com/type/myfonts/inconsolata.html)
- *.dev will always resolve to 127.0.0.1 (thanks dnsmasq!)
- sets up [my dotfiles](https://github.com/jedahan/dotfiles) which are neovim oriented

## Usage

Edit [preferences.sh](/preferences.sh), [applications.zsh](/applications.zsh), and [defaults.sh](/defaults.sh) to your liking, then run `engage.sh` in your terminal.

`engage.sh` asks for your root password, installs the xcode commandline utilities, installs homebrew, asks for your app store username and password, and:

  1. Applies system preferences (like hostname) from `preferences.sh`
  2. Installs commandline and gui software specified in `applications.zsh`
  3. Installs application extensions, add-ons, and plug-ins with `dotfiles.sh`
  4. Applies gui application preferences in `defaults.sh`

## Software

`applications.zsh` installs the following software, mostly through [Homebrew](http://brew.sh) and [mas]() (from the App Store):

### commandline software

[aircrack-ng](aircrack-ng.org)
, [android-sdk](developer.android.com/index.html)
, [assh](assh.io)
, [avr-libc](http://www.nongnu.org/avr-libc)
, [avrdude](http://www.nongnu.org/avrdude)
, [dnsmasq](thekelleys.org.uk/dnsmasq/doc.html)
, [exa](the.exa.website)
, [fceux](www.fceux.com)
, [fzf](github.com/junegunn/fzf)
, [git](git-scm.com)
, [gnuradio](gnuradio.org)
, [go](golang.org)
, [horndis](joshuawise.com/horndis)
, [hub](hub.github.com)
, [jq](stedolan.github.io/jq)
, [mpv](mpv.io)
, [mtr](www.bitwizard.nl/mtr)
, [netcat6](deepspace6.net/projects/netcat6.html)
, [neovim](neovim.io)
, [ngrep](ngrep.sourceforge.net)
, [nmap](nmap.org)
, [nodejs](nodejs.org)
, [python](python.org)
, [ruby](ruby-lang.org)
, [ripgrep](github.com/BurntSushi/ripgrep)
, [tcpdump](tcpdump.org)
, [tmux](tmux.github.io)
, [trash](hasseg.org/trash)
, [vice](vice-emu.sourceforge.net)
, [watch](procps.sourceforge.net)
, [youtube-dl](rg3.github.io/youtube-dl)
, [zsh](zsh.org)

### gui software

[quicklook plugins](github.com/sindresorhus/quick-look-plugins)
, [Alfred](alfredapp.com)
, [Android File Transfer](android.com/filetransfer)
, [Arduino](arduino.cc)
, [Atom](atom.io)
, [Backblaze](backblaze.com)
, [Battle.net](battle.net)
, [Cinch](irradiatedsoftware.com/cinch/)
, [Dash](kapeli.com/dash)
, [Deckset](google.com/?g=deckset)
, [Firefox](mozilla.org)
, [Filckr Uploadr](www.flickr.com/tools)
, [Fritzing](fritzing.org)
, [Gitify](gitify.io)
, [Hex Fiend](ridiculousfish.com/hexfiend)
, [Horndis](joshuawise.com/horndis)
, [iTerm2](iterm2.com)
, [Java](www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)
, [Master Password](masterpasswordapp.com)
, [mini vMac](www.gryphel.com/c/minivmac)
, [Slack](slack.com)
, [Spotify](spotify.com)
, [Steam](steampowered.com)
, [Textual](codeux.com/textual)
, [The Unarchiver]()
, [Transmission](transmissionbt.com)
, [Textual](codeux.com/textual)
, [Twitter](twitter.com)
, [Vagrant](vagrantup.com)
, [Virtualbox](virtualbox.org)
, [Vlc](vlc.org)
, [Wireshark](wireshark.org)
, [XQuartz](xquartz.macosforge.org)

## Postinstall Checklist

- [ ] Generate new ssh keys
- [ ] Set textual to have command-[ switch across networks
- [ ] Alfred - [activate powerpack](https://mail.google.com/mail/u/0/#search/alfred+powerpack)
- [ ] Masterpassword - set username
- [ ] Firefox - login to sync
- [ ] Dash - activate license
- [ ] Dash - integrate with Alfred
- [ ] Battle.Net - run installer
- [ ] Set textual to have command-[ switch across networks

- [ ] Add [webster's dictionary](http://jsomers.net/blog/dictionary)
