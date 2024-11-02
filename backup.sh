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

install_docker()
{
   sudo apt update || { echo "Erro na atualização do apt"; exit 1; }

   sudo apt install -y apt-transport-https ca-certificates curl software-properties-common || { echo "Falha na instalação de dependências"; exit 1;}

   curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg || { echo "Falha ao adicionar a chave GPG"; exit 1; }

   echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null || { echo "Falha ao adicionar repositório do Docker"; exit 1; }

   sudo apt update || { echo "Erro na atualização após adicionar o repositório do Docker"; exit 1; }

   sudo apt install -y docker-ce docker-ce-cli containerd.io || { echo "Falha na instalação do Docker CE"; exit 1; }

   while true; do
      if sudo systemctl is-active --quiet docker; then
          echo "Docker está ativo!"
          break
      else
          echo "Aguardando o Docker iniciar..."
          sleep 2
      fi
   done

   sudo usermod -aG docker ${USER} || { echo "Falha ao adicionar usuário ao grupo docker"; exit 1; }

   sudo curl -L -o /usr/local/bin/docker-compose "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" || { echo "Falha ao baixar o Docker Compose"; exit 1; }
   sudo chmod +x /usr/local/bin/docker-compose || { echo "Falha ao configurar permissões do Docker Compose"; exit 1; }

   docker-compose --version || { echo "Falha na verificação da versão do Docker Compose"; exit 1; }
}

runall()
{
   set_basic_environment
   set_dev_environment
   install_docker
}

runall