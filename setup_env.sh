#!/bin/bash

# Clear the screen
clear

# List directory contents
ls

# Update package lists
sudo apt update -y

# Allow SSH
sudo ufw allow ssh

# Allow specific ports
sudo ufw allow 22
sudo ufw allow 8547
sudo ufw allow 8548
sudo ufw allow 6060
sudo ufw allow 30306
sudo ufw allow 9876
sudo ufw allow 9091
sudo ufw allow 3001
sudo ufw allow 3000
sudo ufw allow 3009
sudo ufw allow 5051
sudo ufw allow 7500
sudo ufw allow 7744
sudo ufw allow 8008
sudo ufw allow 8545
sudo ufw allow 8546
sudo ufw allow 8678
sudo ufw allow 8679
sudo ufw allow 9000
sudo ufw allow 9090
sudo ufw allow 12001
sudo ufw allow 13001
sudo ufw allow 30303
sudo ufw allow 30304
sudo ufw allow 30305

# Enable UFW firewall
sudo ufw enable -y

# Clone GitHub repositories
git clone https://github.com/taikoxyz/simple-taiko-node.git
git clone https://github.com/dojonode/taiko-node-dashboard-docker.git

# Install Git if not already installed
sudo apt install git -y

# Remove Docker-related packages
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do
    sudo apt-get remove $pkg -y
done

# Install Docker
sudo apt-get install docker.io -y

# Start and enable Docker service
sudo systemctl start docker
sudo systemctl enable docker

# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/v2.2.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/bin/docker-compose

sudo chmod +x /usr/bin/docker-compose
# List directory contents
ls

