#!/bin/bash

YELLOW="\[\033[1;33m\]" # Yellow
RED="\[\033[1;31m\]"    # Red
ENDCOLOR="\033[0m"

if [ $USER != root ]; then
    echo -e $RED"Error: Du musst root sein"
    echo -e $YELLOW"Exiting..."$ENDCOLOR
    exit 0
fi

echo -e $YELLOW"Leere apt cache..."$ENDCOLOR
apt-get clean

echo -e $YELLOW"Entferne alle nicht mehr verwendete Pakete..."$ENDCOLOR
apt-get autoremove

if [ "$1" = "-l" ]; then
    echo -e $YELLOW"Entferne alte Logdateien..."$ENDCOLOR
    rm /var/log/*.gz >/dev/null 2>&1
    rm /var/log/*.log.* >/dev/null 2>&1
    rm /var/log/*.1 >/dev/null 2>&1
else
    echo -e $YELLOW"Finish!"$ENDCOLOR
    exit
fi
echo -e $YELLOW"Finish!"$ENDCOLOR
exit
