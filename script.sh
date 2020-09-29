#!/bin/bash
apt update && apt install -y wget unzip zip lynx
wget -qq $(lynx -listonly -nonumbers -dump https://www.minecraft.net/en-us/download/server/bedrock | grep bin-linux) -O /tmp/bds.zip
echo "wget status: $?"
unzip -oqq /tmp/bds.zip -d opt/BDS-Common/
VERSS="$(lynx -listonly -nonumbers -dump https://www.minecraft.net/en-us/download/server/bedrock | grep bin-linux | sed 's|https://minecraft.azureedge.net/bin-linux/bedrock-server-||g' | sed 's|.zip||g')"
OLDVER="$(cat */control | grep 'Version:')"
sed -i "s|$OLDVER|Version: $VERSS|g"
cd opt/*/
rm -rf server.properties worlds permissions.json whitelist.json placehold
ln -s /etc/BDS-Common/server.properties server.properties
ln -s /etc/BDS-Common/worlds worlds
ln -s /etc/BDS-Common/permissions.json permissions.json
ln -s /etc/BDS-Common/whitelist.json whitelist.json