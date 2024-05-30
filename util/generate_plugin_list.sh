#!/bin/sh

CONFIG=${1:-$HOME/.config/LinuxESM/}
source ${CONFIG}/config.sh

PLUGINS=""
while read line; do
  plugin="$(find "${line}"/*.es* 2> /dev/null)"
  if [[ ! $plugin = "" ]]; then
    PLUGINS=$PLUGINS"\n"$plugin
  fi
done < ${CONFIG}/load_order

PLUGINS=${PLUGINS/"^\n"/}

cp ${CONFIG}/plugins ${CONFIG}/plugins.bak

printf "$PLUGINS" > ${CONFIG}/plugins

sed -i 1d "${CONFIG}/plugins"
