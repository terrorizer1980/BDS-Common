#!/bin/bash
apt update && apt install -y wget unzip zip lynx &> /dev/null
wget -qq $(lynx -listonly -nonumbers -dump https://www.minecraft.net/en-us/download/server/bedrock | grep bin-linux) -O /tmp/bds.zip
echo "wget status: $?"
unzip -oqq /tmp/bds.zip -d opt/BDS-Common/
echo "unzip status: $?"
VERSS="$(lynx -listonly -nonumbers -dump https://www.minecraft.net/en-us/download/server/bedrock |grep 'linux'|sed 's|.zip||g'|sed 's|/bin-linux/||g'|sed 's|https://||g'|sed 's|minecraft.azureedge.net||g'|sed 's|bedrock-server-||g')"
OLDVER="$(cat */control | grep 'Version:')"
sed -i "s|$OLDVER|Version: $VERSS|g" */control
cd opt/*/
rm -rf server.properties worlds permissions.json whitelist.json placehold
ln -s /etc/BDS-Common/server.properties server.properties
ln -s /etc/BDS-Common/worlds worlds
ln -s /etc/BDS-Common/permissions.json permissions.json
ln -s /etc/BDS-Common/whitelist.json whitelist.json

echo;echo;echo;echo;echo;echo;echo;