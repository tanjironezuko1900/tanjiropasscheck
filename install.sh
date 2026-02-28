#!/bin/bash

echo "Installing TanjiroPassCheck requirements..."

sudo apt update

sudo apt install figlet wget -y

sudo mkdir -p /usr/share/wordlists/

# Install rockyou if missing
if [ ! -f /usr/share/wordlists/rockyou.txt ]; then
    echo "Installing rockyou.txt..."
    sudo wget https://github.com/brannondorsey/naive-hashcat/releases/download/data/rockyou.txt \
    -O /usr/share/wordlists/rockyou.txt
    echo "rockyou installed."
else
    echo "rockyou already installed."
fi

echo
echo "Installation Complete."
