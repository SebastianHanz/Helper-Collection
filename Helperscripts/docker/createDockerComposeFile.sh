#!/bin/bash
container_name=$1
output_dir=$2

if [ -z "$1" ]; then
	echo -e "\nParameter fehlen!\n"
	echo -e "Usage: createDockerComposeFile.sh <containername> \n"
	echo -e "Beispiel: ./createDockerComposeFile.sh iobroker \n"
	exit
fi

if [ -z "$2" ]; then
	output_dir=$(pwd)/docker-compose.yml
fi

# Erstelle Docker-Compose-File
echo -e "\nErstelle Docker-Compose-File in aktuellem Verzeichnis\n"
docker run --rm -v /var/run/docker.sock:/var/run/docker.sock ghcr.io/red5d/docker-autocompose $container_name > $output_dir
echo -e "Fertig!\n"
exit 0