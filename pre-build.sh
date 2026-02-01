#!/bin/bash
echo "--- Starting SSH Installation (Root Phase) ---"
apt-get update
apt-get install -y openssh-server sudo

# Setup SSH configs
mkdir -p /var/run/sshd
# Use Port 3000 as discussed
sed -i 's/#Port 22/Port 3000/' /etc/ssh/sshd_config
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Set the password for the root user
# Orbit will have $SSH_PASSWORD available if you set it in Env Vars
echo "root:$SSH_PASSWORD" | chpasswd
echo "--- SSH Installation Complete ---"
