#!/bin/bash
#This script will automatically update the js-controller of your ioBroker-System inside Docker
iobroker_container_name=iobroker

echo -e "Stopping ioBroker...\n"
docker exec $iobroker_container_name pkill -u iobroker

echo -e "\nUpdating database...\n"
docker exec $iobroker_container_name iob update

echo -e "\nUpdate ioBroker js-controller (core). This may take a while..\n"
docker exec $iobroker_container_name iob upgrade self

echo -e "\nAll done!\n"
echo Finish!
exit