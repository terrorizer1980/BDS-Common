#!/bin/bash
apt update && apt install -y wget unzip zip
wget -qq $(wget -qO- https://www.minecraft.net/en-us/download/server/bedrock | grep serverBedrockLinux | sed 's|class=btnbtn-disabled-outlinemt-4downloadlinkrole=buttondata-platform=serverBedrockLinuxtabindex=-1>Download</a>||g' | sed 's|<a href=||g' | sed 's| ||g' | sed 's|"||g') -O /tmp/bds.zip
echo "wget status: $?"
unzip -o /tmp/bds.zip -d opt/BDS-Common/
cd opt/*/
rm -rf server.properties worlds permissions.json whitelist.json placehold
ln -s /etc/BDS-Common/server.properties server.properties
ln -s /etc/BDS-Common/worlds worlds
ln -s /etc/BDS-Common/permissions.json permissions.json
ln -s /etc/BDS-Common/whitelist.json whitelist.json