function msg {
  echo "➜\033[1;32m $1 \033[0m";
}

msg "root permissions are required for a few commands, asking upfront"
sudo -v

# Keep-alive: update existing `sudo` time stamp until this script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

./preferences.sh
./applications.sh
./dotfiles.sh
./defaults.sh
