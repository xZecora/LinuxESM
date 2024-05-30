#!/bin/sh

CONFIG=${1:-$HOME/.config/LinuxESM/}
source ${CONFIG}/config.sh
LOWER=""

if [ ! -f ${CONFIG}/load_order ]; then
  echo "There is no load order file, please generate one using the command."
  exit
fi

while read line; do
  LOWER=$LOWER:$line
done < ${CONFIG}/load_order

LOWER="${LOWER#?}"

#echo $LOWER

fuse-overlayfs -o lowerdir="$LOWER",upperdir="$OVERWRITE",workdir="$CACHE" $RUNTIME
