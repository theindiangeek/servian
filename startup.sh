#!/bin/bash

sudo yum update -y
sudo yum install git docker -y
sudo service docker start
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /bin/docker-compose
sudo chmod +x /bin/docker-compose

cd /opt/
git clone https://github.com/servian/TechChallengeApp/
command cp conf.toml TechChallengeApp/ || cp conf.toml TechChallengeApp/
command cp docker-compose.yaml TechChallengeApp/ || cp docker-compose.yaml TechChallengeApp/
command cp Dockerfile TechChallengeApp/ || cp Dockerfile TechChallengeApp/
cd TechChallengeApp/

docker build -t servian .
docker-compose up -d
