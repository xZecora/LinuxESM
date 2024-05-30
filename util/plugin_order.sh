#!/bin/sh

CONFIG=${1:-$HOME/.config/LinuxESM/}
source ${CONFIG}/config.sh

while read plugin; do
  touch "$plugin"
done < ${CONFIG}/plugins
