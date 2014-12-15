#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
export NVM_DIR="/home/vagrant/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
nvm use v0.11.14
clear
#loads a proper fortune spoken from the true sage
fortune | cowthink -f vader
alias c="clear"
alias s="git status"
#alias cd to cd+ls
function cd() {
new_directory="$*";
if [ $# -eq 0 ]; then 
  new_directory=${HOME};
fi;
builtin cd "${new_directory}" && ll
}
