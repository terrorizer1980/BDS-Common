#!/bin/bash
sudo apt update
sudo apt install -y wget unzip zip lynx
wget -qq $(lynx -listonly -nonumbers -dump https://www.minecraft.net/en-us/download/server/bedrock | grep bin-linux) -O /tmp/bds.zip
echo "wget status: $?"
unzip -oqq /tmp/bds.zip -d opt/BDS-Common/
rm -fv opt/BDS-Common/placehold
rm -fv etc/BDS-Common/*/PLACEHOLD
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
