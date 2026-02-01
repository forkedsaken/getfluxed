#!/bin/bash
echo aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaasssssssssssssssss
# 1. Install OpenSSH server
sudo apt-get update && sudo apt-get install -y openssh-server

# 2. Configure SSH to run on the port Flux allows (e.g., 3000)
sudo sed -i 's/#Port 22/Port 3000/' /etc/ssh/sshd_config
sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# 3. Set a password for the 'flux' or 'root' user (Use an Env Var for security!)
echo "root:$SSH_PASSWORD" | sudo chpasswd

# 4. Create necessary directory
sudo mkdir -p /var/run/sshd

# 5. Start the SSH service
sudo /usr/sbin/sshd -D &

# 6. Start your actual application (optional, if you just want SSH)
# npm start or python app.py
