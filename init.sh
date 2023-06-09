#!/bin/bash

echo "Refreshing Apt Repository"
sudo apt-get update -y

echo "Installing Docker Engine"

sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release -y



curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

echo | sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"

apt-cache policy docker-ce



sudo apt install docker-ce -y





echo "Installing Docker Compose"

sudo apt  install docker-compose -y

echo "Checking Docker version"

docker -v

echo "Checking Docker Compose version"

docker-compose v

echo "Adding user to docker group"

sudo usermod -aG docker ubuntu


echo "CONFIGURE CERTIFICATE"

echo "install letsencrypt" 
sudo apt install certbot python3-certbot-nginx -y

# stop nginx to free up port 80, (also you can run dig +short mymontery.com, in order to see the ip addresses associated with the domain name, should be only 1 ip address). 
sudo systemctl stop nginx

echo "CREATE CERTIFICATE"
sudo certbot certonly --standalone -n --agree-tos --email <domain email> -d <domain name>





echo "Adding git credentials"

git config --global user.name "<github username>"

git config --global user.email "<github email>"

git config --global user.password '<github token>'

git config --global credential.helper store




echo "CLONE REPO AND CHECK OUT BRANCH"

git clone https://github.com/msleigher/snipe-it-dev.git 

cd snipe-it-dev

echo "Create linked certificate"
mkdir cert

sudo cp /etc/letsencrypt/archive/<domain.com>/fullchain1.pem cert/fullchain.pem
sudo cp /etc/letsencrypt/archive/<domain.com>/privkey1.pem cert/privkey.pem

sudo chown ubuntu:ubuntu cert/fullchain.pem
sudo chown ubuntu:ubuntu cert/privkey.pem













