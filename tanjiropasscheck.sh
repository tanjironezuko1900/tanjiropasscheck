#!/bin/bash

echo "PASSWORD CHECKING TOOL"
echo

VERSION="1.0"
AUTHOR="tanjironezuko1900"

ROCKYOU="/usr/share/wordlists/rockyou.txt"

clear
figlet -f big TanjiroPassCheck
echo "======================================="
echo "      TanjiroPassCheck v$VERSION"
echo "      Author: $AUTHOR"
echo "======================================="
echo

echo "Usage:"
echo "./tanjiropasscheck.sh"
echo
echo "Features:"
echo "Password strength rating"
echo "rockyou password detection"
echo "Requirements:"
echo "rockyou.txt wordlist"
echo "figlet"

# Check rockyou
if [ ! -f "$ROCKYOU" ]; then
    echo "rockyou.txt not found!"
    echo "Run install script:"
    echo "sudo ./install.sh"
    exit 1
fi

echo -n "Enter password: "
read -s password
echo

echo "Checking password..."
for i in {1..20}
do
    echo -n "#"
    sleep 0.05
done

echo

# Rockyou check
if grep -qx "$password" "$ROCKYOU"; then
echo
echo "Password found in rockyou.txt"
echo "This password is NOT secure."
exit 0
fi

score=0

length=${#password}
# Checking if the length of the password is less than  8 or not
if [ $length -lt 8 ]; then
    echo "Your password is too short"
else
    echo "Your password's length is ok"
    ((score++))
fi
# Checking if the password has uppercase or not
if [[ $password =~ [A-Z] ]]; then
    echo "Your password has uppercase"
    ((score++))
else
    echo "Your password doesn't have uppercase"
fi
# Checking if the password has lowercase or not
if [[ $password =~ [a-z] ]]; then
    echo "Your password has lowercase"
    ((score++))
else
    echo "Your password doesn't have lowercase"
fi
# Checking for numbers
if [[ $password =~ [0-9] ]]; then
    echo "Your password has number"
    ((score++))
else
    echo "Your password doesn't have number"
fi
# Checking for symbols
if [[ $password =~ [^a-zA-Z0-9] ]]; then
    echo "Your password has symbol"
    ((score++))
else
    echo "Your password doesn't have  symbol"
fi
echo
echo "Score:" $score" / 5"
echo

# Rating the password
if [ $score -le 2 ]; then
    echo "Password Strength: WEAK"
elif [ $score -le 4 ]; then
    echo "Password Strength: MEDIUM"
else
    echo "Password Strength: STRONG"
fi
