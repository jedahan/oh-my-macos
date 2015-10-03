# jedahan's El Capitan setup

Shell scripts for automated OSX machine setup.

## Prerequisites

* [XCode](https://itunes.apple.com/us/app/xcode/id497799835?mt=12) from the app store
* [homebrew](https://brew.sh)

## Usage

Edit any of the files in to your liking and then run `engage.sh` in your terminal

`engage.sh` will ask for your root password, and then:

  1. Apply system preferences (like hostname) (`preferences.sh`)
  2. Install commandline and gui software (specified in `Brewfile` and `Caskfile`)
  3. Install application extensions, add-ons, and plug-ins (`dotfiles.sh`)
  4. Apply gui application preferences (`defaults.sh`)

Neat things about this setup:
 - shell will be set to [zsh](zsh.org) with [prezto](github.com/sorin-ionescu/prezto)
 - *.dev will always resolve to 127.0.0.1 (thanks dnsmasq!)

## Software

`applications.sh` installs the following software through [Homebrew](http://brew.sh) and [Homebrew Cask](https://github.com/phinze/homebrew-cask):

### commandline software

[aircrack-ng](aircrack-ng.org)
, [android-sdk](developer.android.com/index.html)
, [boot2docker](github.com/boot2docker/boot2docker-cli)
, [dnsmasq](thekelleys.org.uk/dnsmasq/doc.html)
, [fceux](www.fceux.com)
, [git](git-scm.com)
, [gnuradio](gnuradio.org)
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
, [tcpdump](tcpdump.org)
, [the_silver_searcher](github.com/ggreer/the_silver_searcher)
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
, [Virtualbox](virtualbox.org)
, [Vlc](vlc.org)
, [Wireshark](wireshark.org)
, [XQuartz](xquartz.macosforge.org)

### dotfiles

Sets up [My Dotfiles](https://github.com/jedahan/dotfiles), and defaults

## Preinstall Checklist

* Generate new ssh keys
* Login to [App Store](www.apple.com/macosx/whats-new/app-store.html) and install:
  * [MacPass](https://github.com/mstarke/MacPass)
  * [XCode]()
  * [Cinch](https://itunes.apple.com/us/app/cinch/id412529613?mt=12)
  * [Textual](https://itunes.apple.com/us/app/textual-irc-client/id403012667?mt=12)
  * [Twitter](https://itunes.apple.com/us/app/twitter/id409789998?mt=12)
  * [Vox](https://itunes.apple.com/us/app/vox/id461369673?mt=12)
* Set xcode to 18 point [inconsolata](http://www.levien.com/type/myfonts/inconsolata.html), dusk
* Set textual to have command-[ switch across networks
* Add [webster's dictionary](http://jsomers.net/blog/dictionary)
* Login to [keybase](keybase.io)

## Postinstall Checklist
* Activate [alfred powerpack](https://mail.google.com/mail/u/0/#search/alfred+powerpack)
* Set masterpassword username
* Install uBlock for firefox
* Install favicon addon for firefox
* sudo easy_install neovim
* compile youcompleteme
