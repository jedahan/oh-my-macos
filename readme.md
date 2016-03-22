# jedahan's El Capitan setup

Shell scripts for automated OSX machine setup.

- shell will be set to [zsh](zsh.org) with some plugins like autocomplete, and fzf
- sets the tomorrow night eightes theme and adds the [inconsolata font](http://levien.com/type/myfonts/inconsolata.html)
- *.dev will always resolve to 127.0.0.1 (thanks dnsmasq!)
- sets up [my dotfiles](https://github.com/jedahan/dotfiles) which are neovim oriented

## Usage

Edit [preferences.sh](/preferences.sh), [defaults.sh](/defaults.sh), and the [Brewfile](/Brewfile) to your liking, then run `engage.sh` in your terminal.

`engage.sh` will ask for your root password, install the xcode commandline utilities, install homebrew (to **$HOME/.brew**), and then:

  1. Apply system preferences (like hostname) from `preferences.sh`
  2. Install commandline and gui software specified in the `Brewfile`
  3. Install application extensions, add-ons, and plug-ins with `dotfiles.sh`
  4. Apply gui application preferences in `defaults.sh`

## Software

`applications.sh` installs the following software, mostly through [Homebrew](http://brew.sh) and [Homebrew Cask](https://github.com/phinze/homebrew-cask):

### commandline software

[aircrack-ng](aircrack-ng.org)
, [android-sdk](developer.android.com/index.html)
, [assh](assh.io)
, [avr-libc](http://www.nongnu.org/avr-libc)
, [avrdude](http://www.nongnu.org/avrdude)
, [boot2docker](github.com/boot2docker/boot2docker-cli)
, [dnsmasq](thekelleys.org.uk/dnsmasq/doc.html)
, [fceux](www.fceux.com)
, [git](git-scm.com)
, [gnuradio](gnuradio.org)
, [go](golang.org)
, [horndis](joshuawise.com/horndis)
, [hub](hub.github.com)
, [jq](stedolan.github.io/jq)
, [keybase](keybase.io)
, [mtr](www.bitwizard.nl/mtr)
, [netcat6](deepspace6.net/projects/netcat6.html)
, [neovim](neovim.io)
, [ngrep](ngrep.sourceforge.net)
, [nmap](nmap.org)
, [nodejs](nodejs.org)
, [python](python.org)
, [sift](sift-tool.org)
, [tcpdump](tcpdump.org)
, [trash](hasseg.org/trash)
, [watch](procps.sourceforge.net)
, [vice](vice-emu.sourceforge.net)
, [youtube-dl](rg3.github.io/youtube-dl)
, [zsh](zsh.org)

### gui software

[quicklook plugins](github.com/sindresorhus/quick-look-plugins)
, [Alfred](alfredapp.com)
, [Android File Transfer](android.com/filetransfer)
, [Arduino](arduino.cc)
, [Atom](atom.io)
, [Battle.net](battle.net)
, [Dash](kapeli.com/dash)
, [Disk Inventory X](www.derlien.com)
, [Dropbox](dropbox.com)
, [Firefox](mozilla.org)
, [Filckr Uploadr](www.flickr.com/tools)
, [Fritzing](fritzing.org)
, [Gitify](gitify.io)
, [Hex Fiend](ridiculousfish.com/hexfiend)
, [Horndis](joshuawise.com/horndis)
, [iTerm2](iterm2.com)
, [Java](www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)
, [mini vMac](www.gryphel.com/c/minivmac)
, [mpv](mpv.io)
, [Slack](slack.com)
, [Spotify](spotify.com)
, [Steam](steampowered.com)
, [Transmission](transmissionbt.com)
, [Vagrant](vagrantup.com)
, [Virtualbox](virtualbox.org)
, [Vlc](vlc.org)
, [Wireshark](wireshark.org)
, [XQuartz](xquartz.macosforge.org)

## Postinstall Checklist

- [ ] Generate new ssh keys
- [ ] Login to [keybase](keybase.io)
- [ ] Alfred - [activate powerpack](https://mail.google.com/mail/u/0/#search/alfred+powerpack)
- [ ] Masterpassword - set username
- [ ] Firefox - login to sync
- [ ] Dash - activate license
- [ ] Dash - integrate with Alfred
- [ ] Battle.Net - run installer

- [ ] Add [webster's dictionary](http://jsomers.net/blog/dictionary)


- [ ] App Store - [Line](https://itunes.apple.com/us/app/line/id539883307?mt=12)
- [ ] App Store - [Master Password](https://itunes.apple.com/us/app/master-password-nothing-to/id662763204?mt=12)
- [ ] App Store - [Textual](https://itunes.apple.com/us/app/textual-irc-client/id403012667?mt=12)
    - [ ] Set textual to have command-[ switch across networks
- [ ] App Store - [Twitter](https://itunes.apple.com/us/app/twitter/id409789998?mt=12)
- [ ] App Store - [Vox](https://itunes.apple.com/us/app/vox/id461369673?mt=12)
