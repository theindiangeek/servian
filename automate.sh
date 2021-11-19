#!/bin/bash

git clone https://github.com/servian/TechChallengeApp/ 
command cp conf.toml TechChallengeApp/ || cp conf.toml TechChallengeApp/
command cp docker-compose.yaml TechChallengeApp/ || cp docker-compose.yaml TechChallengeApp/
command cp Dockerfile TechChallengeApp/ || cp Dockerfile TechChallengeApp/
cd TechChallengeApp/ 

docker build -t servian .
docker-compose up -d
