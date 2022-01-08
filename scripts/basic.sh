sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo apt-get update
sudo apt-get install google-chrome-stable -y
apt-get install git -y
git config --global user.name "UserName Here"
git config --global user.email emailHere@exemple.com
printf 'Current git configs in your system\n' >> ../logs/git_log.txt
git config --list >> ../logs/git_log.txt
