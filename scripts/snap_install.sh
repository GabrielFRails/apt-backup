printf 'Running apt-get update, wait a moment \n'
sudo apt-get update
cd $HOME
printf 'back to HOME, checkin...  '
pwd
printf 'Lets install this snaps packages :) \n'
sudo rm /etc/apt/preferences.d/nosnap.pref
sudo apt install snapd
sudo snap install snap-store
printf 'installing code, gitkraken, postman and discord \n'
sudo snap install code --classic
sudo snap install gitkraken --classic
sudo snap install postman
sudo snap install discord
printf '\n\nAfter installing snap repositories maybe it will be necessary restart your system\n\n'
