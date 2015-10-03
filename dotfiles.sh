echo "downloading winhelp hosts.txt to block malware"
sudo curl 'winhelp2002.mvps.org/hosts.txt' -a -o /private/etc/hosts

echo "installing inconsolata font"
curl http://levien.com/type/myfonts/Inconsolata.otf -o ${HOME}/Library/Fonts/Inconsolata.otf

echo "setting iterm2 preferences directory to ${HOME}/.iterm2"
defaults write com.googlecode.iterm2 PrefsCustomFolder -string "${HOME}/.iterm2"

echo "installing prezto for zsh"
git clone --recursive https://github.com/sorin-ionescu/prezto.git $HOME/.zprezto

echo "symlinking dotfiles to home directory"
export PATH=$HOME/.gems/bin:$PATH
homesick clone jedahan/dotfiles && homesick symlink dotfiles

echo "setting shell to zsh"
chsh -s $HOME/.homebrew/bin/zsh

dnsmasq --version &>/dev/null && {
  echo "making *.dev resolve to 127.0.0.1"
  echo 'address=/.dev/127.0.0.1' > $(brew --prefix)/etc/dnsmasq.conf
  sudo cp -v $(brew --prefix dnsmasq)/homebrew.mxcl.dnsmasq.plist /Library/LaunchDaemons
  sudo launchctl load -w /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist
  sudo mkdir -v /etc/resolver
  sudo bash -c 'echo "nameserver 127.0.0.1" > /etc/resolver/dev'
}

vboxmanage --version &>/dev/null && {
  echo "installing the virtualbox extension pack"
  virtualbox_version=`vboxmanage --version | cut -d'r' -f1`
  pushd $TMPDIR
  curl -OL "http://download.virtualbox.org/virtualbox/${virtualbox_version}/Oracle_VM_VirtualBox_Extension_Pack-${virtualbox_version}.vbox-extpack"
  vboxmanage extpack install Oracle_VM_VirtualBox_Extension_Pack-${virtualbox_version}.vbox-extpack
  popd
}

git config --global user.name "Jonathan Dahan"
git config --global user.email "jonathan@jonathan.is"
