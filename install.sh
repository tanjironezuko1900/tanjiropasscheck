#!/bin/bash

echo "Installing TanjiroPassCheck requirements..."

sudo apt update

sudo apt install figlet wordlists -y

if [ -f /usr/share/wordlists/rockyou.txt.gz ]; then

sudo gzip -d /usr/share/wordlists/rockyou.txt.gz

echo "rockyou.txt installed."

else

echo "rockyou already installed."

fi

echo
echo "Installation Complete."
