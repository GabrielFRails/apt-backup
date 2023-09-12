#!/bin/bash

set_basic_environment()
{
   sudo apt-get update
   sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
   wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
   sudo apt-get update
   sudo apt-get install google-chrome-stable -y

   sudo apt install wget -y
   sudo apt intall vim -y
}

customizations()
{

   github_ssh="git@github.com"
   repositories="vimix-icon-theme Qogir-theme Qogir-icon-theme" 

   echo "let's install something first"
   sudo apt-get install gtk2-engines-murrine gtk2-engines-pixbuf

   cd $HOME
   mkdir my_themes
   cd my_themes
   echo "Created my_themes folder" 

   for r in ${repositories}; do
      git clone ${github_ssh}:vinceliuice/${r}.git
      cd ${r}/
      ./install.sh
      cd ../ 
   done

   sudo apt install cmatrix -y
}

set_dev_environment()
{
   cd $HOME
   sudo apt-get update
   sudo apt install nodejs -y
   sudo apt install npm -y
   sudo npm install -g @vue/cli
   npm install @nuxtjs/vuetify -D

   echo "installing now docker"

   sudo apt-get update
   sudo apt-get -y install apt-transport-https ca-certificates curl software-properties-common
   curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
   sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(. /etc/os-release; echo "$UBUNTU_CODENAME") stable"
   sudo apt-get update
   sudo apt-get -y install docker-ce docker-compose
   sudo usermod -aG docker $USER
}

set_basic_environment
set_dev_environment
customizations
