echo "hi"
brew -v || {
  echo "brew not found, please install with:"
  echo 'ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install | sed -e \'s|usr/local|Users/jedahan/.homebrew|\')"'
  exit 1
}

echo "root permissions are required for a few commands, asking upfront"
sudo -v
# Keep-alive: update existing `sudo` time stamp until this script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

./preferences.sh
./applications.sh
./dotfiles.sh
./defaults.sh
