#!/bin/bash

# paths
dirname="$(pwd)"
lib="/usr/local/lib"
bin="/usr/local/bin"
wallpaperdir='$HOME/wallpaper'

PIP_MODULES="numpy scipy matplotlib pymatbridge simplejson pyserial pyzmq pyqtgraph"
APT_FORMULAS="clang cmake curl fortune-mod gcc-avr git-core ipython minicom \ 
php5 cowsay python-matplotlib python-scipy python-numpy tmux vim weechat xaos zsh docker git"
BREW_FORMULAS="vim wget gcc node python git qt gnu-tar gnu-sed gawk gnutls \
  mobile-shell zsh gnu-indent gnu-getopt grc coreutils spark bash findutils tmux"
binaries=(
    graphicsmagick
    webkit2png
    rename
    zopfli
    ffmpeg
    python
    sshfs
    trash
    node
    tree
    ack
    hub
    git
    cowthink
    fortune
)
apps=(
    alfred 
    dropbox
    google-chrome
    slack
    spotify
    vagrant
    flash
    flux
    vlc
    skype
    transmission
)
 
if [ "$(uname)" == "Darwin" ]; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew install -with-default-names $BREW_FORMULAS   
  brew linkapps qt
  brew tap homebrew/dupes
  brew install homebrew/dupes/grep
  PATH="usr/local/opt/coreutils/libexec/gnubin":$PATH
  MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH" 
  echo "installing binaries..."
  brew install ${binaries[@]}
  brew cleanup
  brew install caskroom/cask/brew-cask
 # default install is /Users/$user/Applications
  echo "installing cask apps.."
  brew cask install --appdir="/Applications" ${apps[@]}
  brew cleanup
 
  #Use AirDrop over every interface. srsly this should be a default.
  defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1
  
  # Always open everything in Finder's list view. This is important.
  defaults write com.apple.Finder FXPreferredViewStyle Nlsv

  # Set a really fast key repeat.
  defaults write NSGlobalDomain KeyRepeat -int 0

  mkdir repos && cd repos
  git clone https://github.com/neale/Dotfiles.git && cd Dotfiles
  cp .bashrc .tmux.conf .vimrc .zlogin .zpreztorc .zshrc $HOME
  cd $HOME 
  chsh -s /bin/zsh && zsh
  exit
  zsh
  cd $HOME/repos
  git clone https://github.com/neale/music-collaboratory.git
  git clone https://github.com/neale/relations.git
  git clone https://github.com/neale/EnCom.git
  git clone https://github.com/neale/neural-net-node.git
  git clone https://github.com/neale/nrf-basic.git
  easy_install pip
  pip install $PIP_FORMULAS
  curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
  
  echo "done"
elif [ "$(uname)" == "Linux" ]; then
  sudo apt-get install curl
  curl -sL https://deb.nodesource.com/setup | sudo bash -
  sudo apt-get install -y $APT_FORMULAS
  sudo apt-get install zsh tmux
  cd $HOME 
  mkdir repos
  cd repos
  curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
  echo changing default shell to zsh
  chsh -s /bin/zsh
  echo getting dotfiles
  git clone https://github.com/neale/Dotfiles.git
  cd Dotfiles
  sudo cp .bashrc .tmux.conf .vimrc .zlogin .zpreztorc .zshrc $HOME
  cd $HOME
  zsh
  exit && zsh
  exit && zsh
  cd $HOME/repos
  #git repos
  echo cloning repos
  git clone https://github.com/neale/music-collaboratory.git
  git clone https://github.com/neale/relations.git
  git clone https://github.com/neale/EnCom.git
  git clone https://github.com/neale/neural-net-node.git
  git clone https://github.com/neale/nrf-basic.git
  echo getting wallpaper
  #wallpaper (yosemite)
  wget https://9to5mac.files.wordpress.com/2014/08/yosemite.jpg 
  mkdir wallpaper
  mv yosemite.jpg $wallpaperdir
  files=($wallpaperdir/*)
  yellowstone=`printf "%s\n" "${files[RANDOM % ${files[@]}]}"`
  gconftool-2 -t str --set /desktop/gnome/background/picture_filename "$randompic" cd $HOME
  wget https://bootstrap.pypa.io/get-pip.py
  python get-pip.py
  
fi

echo "done"
