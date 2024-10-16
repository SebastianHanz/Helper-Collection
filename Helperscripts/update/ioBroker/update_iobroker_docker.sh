#!/bin/bash
# This script will automatically update your whole ioBroker-System inside Docker including adapters
# Define your common ioBroker-container-name from Docker
iobroker_container_name=iobroker

echo -e "\nBackup ioBroker...\n"
docker exec $iobroker_container_name iob backup

echo -e "\nStopping ioBroker...\n"
docker exec $iobroker_container_name pkill -u iobroker

echo -e "\nStopping ioBroker...\n"
docker exec $iobroker_container_name iob stop

echo -e "\nFixxing ioBroker if necessary...\n"
docker exec $iobroker_container_name iob fix

echo -e "\nUpdating database...\n"
docker exec $iobroker_container_name iob update

echo -e "\nUpgrade all updatable adapters\n"
docker exec $iobroker_container_name iob upgrade

echo -e "\nUpdate ioBroker js-controller (core). This may take a while..\n"
docker exec $iobroker_container_name iob upgrade self

echo -e "\nRestarting ioBroker\n"
docker exec $iobroker_container_name iob start

echo -e "\nAll done!\n"
echo Finish!
exit
