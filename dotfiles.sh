echo "downloading hosts to block malware"
sudo curl 'https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts' -a -o /private/etc/hosts

echo "installing inconsolata font"
curl http://levien.com/type/myfonts/Inconsolata.otf -o ${HOME}/Library/Fonts/Inconsolata.otf

echo "setting iterm2 preferences directory to ${HOME}/.iterm3"
defaults write com.googlecode.iterm2 PrefsCustomFolder -string "${HOME}/.config/iterm3"

echo "symlinking dotfiles to home directory"
git clone git://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
source $HOME/.homesick/repos/homeshick/homeshick.sh
homeshick clone jedahan/dotfiles && homeshick link dotfiles

echo "setting shell to zsh"
zsh_bin=$(brew --prefix)/bin/zsh
grep $zsh_bin /etc/shells || { echo $zsh_bin | sudo tee -a /etc/shells }
chsh -s $zsh_bin

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

echo "configuring git name and email"
git config --global user.name "Jonathan Dahan"
git config --global user.email "jonathan@jonathan.is"
