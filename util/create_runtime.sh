#!/bin/sh

CONFIG=${1:-$HOME/.config/LinuxESM}
source $CONFIG
LOWER=""

if [ ! -f $LOAD_ORDER ]; then
  echo "There is no load order file, please generate one using the command."
  exit
fi

while read line; do
  LOWER=$LOWER:$line
done < $LOAD_ORDER

LOWER="${LOWER#?}"

#echo $LOWER

fuse-overlayfs -o lowerdir="$LOWER",upperdir="$OVERWRITE",workdir="$CACHE" $RUNTIME
