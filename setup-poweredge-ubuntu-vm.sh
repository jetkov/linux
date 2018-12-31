#!/bin/bash

# Get updates
sudo apt update && sudo apt upgrade -y

# Install tools and MOTD script dependencies
sudo apt install -y open-vm-tools zsh sysstat vnstat geoip-bin

# Copy custom scripts
sudo cp ./tools/* /usr/local/bin/ && sudo chown root:root /usr/local/bin/* && sudo chmod 0755 /usr/local/bin/*

# Copy custom MOTD scripts and disable some default ones
sudo mv /etc/update-motd.d/00-header /etc/update-motd.d/00-header.bak
sudo mv /etc/update-motd.d/40-sysinfo /etc/update-motd.d/40-sysinfo.bak
sudo chmod -x /etc/update-motd.d/00-header.bak /etc/update-motd.d/40-sysinfo.bak
sudo cp ./motd-scripts/00-header /etc/update-motd.d/00-header
sudo cp ./motd-scripts/40-sysinfo /etc/update-motd.d/40-sysinfo
sudo chown root:root /etc/update-motd.d/00-header /etc/update-motd.d/40-sysinfo
sudo chmod 0755 /etc/update-motd.d/00-header /etc/update-motd.d/40-sysinfo
sudo chmod -x /etc/update-motd.d/10-help-text /etc/update-motd.d/50-motd-news
sudo unlink /etc/update-motd.d/50-landscape-sysinfo

# Disable SSH last log printing since it is printed in the MOTD info script
sudo sed -i 's/#PrintLastLog yes/PrintLastLog no/g' /etc/ssh/sshd_config

# Copy bash profiles
cp ./bash-config/user.bashrc ~/.bashrc && chown $USER:$USER ~/.bashrc && chmod 0644 ~/.bashrc 
sudo cp ./bash-config/root.bashrc /root/.bashrc && sudo chown root:root /root/.bashrc && sudo chmod 0644 /root/.bashrc

# Install Oh-My-Zsh and change the theme
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
sed -i 's/ZSH_THEME=\"robbyrussell\"/ZSH_THEME="af-magic"/g' ~/.zshrc
