#!/bin/bash

set_basic_environment()
{
   sudo apt-get update
   sudo apt-get upgrade
   #sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
   #wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
   #sudo apt-get update
   #sudo apt-get install google-chrome-stable -y

   sudo apt install wget -y
   sudo apt install vim -y
   sudo apt install tig -y
   sudo apt install curl -y
   sudo apt install os-prober -y
   sudo apt install sshpass -y
   sudo apt install pip -y
   sudo apt install tmux -y

   curl -o  chrome_package.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
   sudo dpkg -i chrome_package.deb
   sudo rm -r chrome_package.deb
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
   sudo apt install neofetch -y
}

set_dev_environment()
{
   cd $HOME
   sudo apt-get update
   sudo apt install nodejs -y
   sudo apt install npm -y
   sudo npm install -g @vue/cli
   npm install @nuxtjs/vuetify -D

   # Add Docker's official GPG key:
   sudo apt-get update
   sudo apt-get install ca-certificates curl
   sudo install -m 0755 -d /etc/apt/keyrings
   sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
   sudo chmod a+r /etc/apt/keyrings/docker.asc

   # Add the repository to Apt sources:
   echo \
   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
   $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
   sudo apt-get update

   sudo apt-get update
   sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
   sudo usermod -aG docker $USER
}

runall()
{
   set_basic_environment
   set_dev_environment
   customizations
}

runall