#!/bin/bash
url=$1
filename="${url##*/}"
device=$2

if [ -z "$1" ]; then
	echo -e "\nParameter fehlen!\n"
	echo -e "Die Firmware findest du hier: https://deconz.dresden-elektronik.de/deconz-firmware/\n"
	echo -e "Usage: firmware-upgrade.sh <url> <device>\n"
	echo -e "Beispiel: ./firmware-upgrade.sh https://deconz.dresden-elektronik.de/deconz-firmware/deCONZ_ConBeeII_0x26780700.bin.GCF /dev/ttyACM0\n"
	exit
fi

# Check ob Gerät existiert
if [ -e "$device" ]; then
  echo -e "\nDas Gerät $device existiert."
else
  echo -e "\nDas Gerät $device existiert nicht. Hast du dich verschrieben?\n"
  exit 1  # Abbruch mit Fehlercode 1
fi

#Wechse in das Arbeits-Verzeichnis und lade die Firmware herunter
cd /tmp
wget $url

# Check ob Download erfolgreich war
if [ $? -eq 0 ]; then
  echo -e "\nDownload erfolgreich!\n"
else
  echo -e "\nDownload fehlgeschlagen! Die URL ist eventuell nicht korrekt!\n"
  exit 1  # Abbruch mit Fehlercode 1
fi

#Starte deconz-docker-container
docker run -d --name deconz-firmware --privileged --cap-add=ALL -v /dev:/dev -v /lib/modules:/lib/modules -v /sys:/sys -v /tmp:/tmp deconzcommunity/deconz:stable

#Führen den Flasher im deconz-container aus mit den zugehörigen Parametern
docker exec deconz-firmware /bin/bash -c "cd /tmp && GCFFlasher_internal -d $device -f ./$filename"

#Cleanup
echo -e "Stopped deconz-firmware\n"
docker stop deconz-firmware

echo -e "Removed deconz-firmware\n"
docker rm deconz-firmware

echo -e "Cleanup\n"
rm -f /tmp/$filename

echo "Done"
