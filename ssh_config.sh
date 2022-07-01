#!/bin/bash

echo "Enter the ip for ssh conection"
read external_ip
echo "Enter the user for ssh connection"
read user

cd $HOME

printf "Host ${external_ip}\n\tHost ${external_ip}\n\tUser ${user}\n" > .ssh/config

code /home/gabriel_freitas/projetos/script_bash/
sleep 3
clear
wmctrl -a gabriel_freitas@freitas-nitro5: ~
ssh ${user}@${external_ip}