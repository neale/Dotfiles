#!/bin/sh

# paths
dirname=$(pwd)
lib="/usr/local/lib"
bin="/usr/local/bin"


APT_FORMULAS="clang cmake curl fortune-mod gcc-avr git-core ipython, make, minicom \ 
              php5, python-matplotlib, python-scipy, python-numpy tmux, vim, time \
              vim-gtk, weechat, wget, xaos, zsh, docker"
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
  brew install $BREW_FORMULAS
  brew tap homebrew/dupes
  brew install homebrew/dupes/grep
  brew install grc coreutils spark bash findutils
  $PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH
  echo "installing binaries..."
  brew install ${binaries[@]}
  brew cleanup
  brew install caskroom/cask/brew-cask
 # default install is /Users/$user/Applications
  echo "installing cask apps.."
  brew cask install --appdir="Applications" ${apps[@]}
  brew cask alfred link
  brew cleanup
 
  #Use AirDrop over every interface. srsly this should be a default.
  defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1
  
  # Always open everything in Finder's list view. This is important.
  defaults write com.apple.Finder FXPreferredViewStyle Nlsv

  # Set a really fast key repeat.
  defaults write NSGlobalDomain KeyRepeat -int 0

elif [ "$(uname)" == "Linux" ]; then
  sudo apt-get install curl
  curl -sL https://deb.nodesource.com/setup | sudo bash -
  sudo apt-get install -y $APT_FORMULAS
  cd $HOME
  curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
  mkdir repos
  cd repos
  git clone https://github.com/neale/Dotfiles.git
  cd Dotfiles
  sudo cp .bashrc .tmux.conf .vimrc .zlogin .zpreztorc .zshrc $HOME
  cd $HOME
  zsh
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
  chsh -s /bin/zsh
  exit
  zsh
  cd $HOME/repos
  #git repos
  git clone https://github.com/neale/music-collaboratory.git
  git clone https://github.com/neale/relations.git
  git clone https://github.com/neale/EnCom.git
  git clone https://github.com/neale/neural-net-node.git
  git clone https://github.com/neale/nrf-basic.git
  cd $HOME
fi
wget https://bootstrap.pypa.io/get-pip.py
python get-pip.py
echo "done"