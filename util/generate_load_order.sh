#!/bin/sh

CONFIG=${1:-$HOME/.config/LinuxESM/}
source ${CONFIG}/config.sh

DIRECTORIES=$(find "$MODFOLDER" -maxdepth 1 -type d)

ORDER_STRING=$OBLIVIONDATA

while IFS= read -r dir; do
  ORDER_STRING=$ORDER_STRING"\n"$dir
done <<< "$DIRECTORIES"

ORDER_STRING=${ORDER_STRING/"$MODFOLDER\n"/}

cp ${CONFIG}/load_order ${CONFIG}/load_order.bak

printf "$ORDER_STRING" > ${CONFIG}/load_order

#fuse-overlayfs lowerdir
