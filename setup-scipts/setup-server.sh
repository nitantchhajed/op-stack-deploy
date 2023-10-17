#!/bin/bash

set -e

#Downloading other dependencies 
sudo apt install -y git curl make jq

#Installing docker Engine
wget https://get.docker.com -O get-docker.sh

sudo sh get-docker.sh


#Installing docker compose
sudo apt update
sudo apt-get install docker-compose-plugin

#giving permissions to docker
sudo chmod 666 /var/run/docker.sock

#creating docker network
docker network create race-testnet



