#!/bin/bash

sudo apt update
sudo apt upgrade -y
sudo apt install python3 python3-pip curl git -y

cd ~
git clone https://github.com/yeyeto2788/cnc_setup.git
cd ./cnc_setup
sudo pip3 install ansible
ansible-playbook main.yaml -K -u $USER

echo
read -r -s -p "Press [ENTER] to terminate and delete files."
echo
cd ~
rm -rf ./cnc_setup
exit 0