echo "hi"

echo "root permissions are required for a few commands, asking upfront"
sudo -v
# Keep-alive: update existing `sudo` time stamp until this script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# from https://github.com/osxc/legacy-boot/blob/master/boot.sh
/usr/sbin/pkgutil --pkg-info=com.apple.pkg.CLTools_Executables > /dev/null 2>&1 || {
  echo "Installing apple developer tools"
  sudo /usr/bin/touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress
  # find the product id with "Developer" in the name
  PRODID=$(/usr/sbin/softwareupdate -l | awk '/Developer/{print x};{x=$0}' | awk '{print $2}')
  sudo /usr/sbin/softwareupdate -i $PRODID -v
}

brew -v > /dev/null 2>&1 || {
  echo "Installing homebrew"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

mas -v > /dev/null 2>&1 || {
  echo "Installing mas"
  brew install mas
  echo "Login to the App Store (credentials are NOT stored)"
  read -p "Apple ID: " apple_id
  read -p "Password: " password -s
  mas signin $apple_id $password
  unset apple_id
  unset password
}

./preferences.sh
./applications.sh
./dotfiles.sh
./defaults.sh
