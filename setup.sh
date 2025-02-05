#!/usr/bin/env sh
TMP=/tmp/npm_install.sh
URL=https://raw.githubusercontent.com/Seph29/NPM-Ubuntu-RPI-ARM64/main/install

if [ "$(uname)" != "Linux" ]; then
  echo "OS NOT SUPPORTED"
  exit 1
fi

DISTRO=$(cat /etc/*-release | grep -w ID | cut -d= -f2 | tr -d '"')
if [ "$DISTRO" != "ubuntu" ]; then
  echo "DISTRO NOT SUPPORTED"
  exit 1
fi

rm -rf $TMP
wget -O "$TMP" "$URL/$DISTRO.sh"

chmod +x "$TMP"

if [ "$(command -v bash)" ]; then
  sudo bash "$TMP"
else
  sh "$TMP"
fi


