#!/bin/bash
sudo apt install nodejs -y
sudo apt install npm -y
sudo npm install -g @vue/cli
npm install @nuxtjs/vuetify -D
printf 'Current node, npm and vue version\n' >> ../logs/dev_logs.txt
node --version >> ../logs/dev_logs.txt
npm --version >> ../logs/dev_logs.txt
vue --version >> ../logs/dev_logs.txt

