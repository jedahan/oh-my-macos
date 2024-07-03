set -e

head /private/etc/hosts | grep github.com/StevenBlack/hosts || {
  echo "downloading hosts to block malware"
  sudo curl 'https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts' -a -o /private/etc/hosts
}

test -f $HOME/.dotfiles || {
  echo "cloning dotfiles"
  git clone --bare git://github.com/jedahan/dotfiles.git $HOME/.dotfiles
  mkdir .dotfiles-backup && git --git-dir=$HOME/.dotfiles --work-tree=$HOME checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .dotfiles-backup/{}
  git --git-dir=$HOME/.dotfiles --work-tree=$HOME checkout
  git --git-dir=$HOME/.dotfiles --work-tree=$HOME config status.showUntrackedFiles no
}
