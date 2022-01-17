printf 'Running apt-get update, wait a moment \n'
sudo apt-get update
cd $HOME
printf 'back to HOME, checkin...  '
pwd
git clone https://github.com/vinceliuice/vimix-icon-theme.git
cd vimix-icon-theme/
./install.sh -a
