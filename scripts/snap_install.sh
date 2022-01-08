sudo apt update
sudo rm /etc/apt/preferences.d/nosnap.pref
sudo apt install snapd
sudo snap install snap-store
sudo snap install code --classic
sudo snap install gitkraken --classic
sudo snap install postman
printf '\n\nAfter installing snap repositories maybe it will be necessary restart your system\n\n'