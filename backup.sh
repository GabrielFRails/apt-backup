#!/bin/bash

set_basic_environment()
{
   sudo apt-get update
   sudo apt-get upgrade

   sudo apt install wget -y
   sudo apt install vim -y
   sudo apt install tig -y
   sudo apt install curl -y
   sudo apt install os-prober -y
   sudo apt install sshpass -y
   sudo apt install pip -y
   sudo apt install tmux -y
   sudo apt install snapd -y

   curl -o  chrome_package.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
   sudo dpkg -i chrome_package.deb
   sudo rm -r chrome_package.deb

   # cool stuf
   sudo apt install cmatrix -y
   sudo apt install neofetch -y
}

set_dev_environment()
{
   cd $HOME
   sudo apt-get update

   curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
   export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
   [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
   nvm install 20
   nvm use 20

   npm install -g @vue/cli
   npm install @nuxtjs/vuetify -D

   sudo apt install ghc
   sudo snap install gh
}

runall()
{
   set_basic_environment
   set_dev_environment
}

runall