#!/bin/sh

CONFIG=${1:-$HOME/.config/LinuxESM/config.sh}
source $CONFIG

DIRECTORIES=$(find "$MODFOLDER" -maxdepth 1 -type d)

ORDER_STRING=$OBLIVIONDATA

while IFS= read -r dir; do
  ORDER_STRING=$ORDER_STRING"\n"$dir
done <<< "$DIRECTORIES"

ORDER_STRING=${ORDER_STRING/"$MODFOLDER\n"/}

printf "$ORDER_STRING" > $LOAD_ORDER

#fuse-overlayfs lowerdir
