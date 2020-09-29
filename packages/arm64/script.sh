#!/bin/bash
apt update && apt install -y wget unzip zip lynx
wget -qq $(lynx -listonly -nonumbers -dump https://www.minecraft.net/en-us/download/server/bedrock | grep bin-linux) -O /tmp/bds.zip
echo "wget status: $?"
unzip -o /tmp/bds.zip -d opt/BDS-Common/
cd opt/*/
rm -rf server.properties worlds permissions.json whitelist.json placehold
ln -s /etc/BDS-Common/server.properties server.properties
ln -s /etc/BDS-Common/worlds worlds
ln -s /etc/BDS-Common/permissions.json permissions.json
ln -s /etc/BDS-Common/whitelist.json whitelist.json