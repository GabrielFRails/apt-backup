printf 'Running apt-get update, wait a moment \n'
sudo apt-get update
cd $HOME
printf 'back to HOME, checkin...  '
pwd
printf 'installing docker and docker compose, all logs are in ../logs'
sudo apt-get -y install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(. /etc/os-release; echo "$UBUNTU_CODENAME") stable"
sudo apt-get update
sudo apt-get -y install docker-ce docker-compose
sudo usermod -aG docker $USER
printf 'This is your current docker version install\n' >> ../logs/docker_logs.txt
sudo docker version >> ../logs/docker_logs.txt
printf 'Current docker status\n' >> ../logs/docker_logs.txt
sudo systemctl status docker >> ../logs/docker_logs.txt
