sudo apt-get update
sudo apt-get -y install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(. /etc/os-release; echo "$UBUNTU_CODENAME") stable"
sudo apt-get update
sudo apt-get -y install docker-ce docker-compose
sudo usermod -aG docker $USER
printf 'This is your current docker version install\n' >> ../logs/docker_logs.txt
docker version >> ../logs/docker_logs.txt
printf 'Current docker status\n' >> ../logs/docker_logs.txt
sudo systemctl status docker >> ../logs/docker_logs.txt