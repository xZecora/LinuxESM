#!/bin/sh

source ./config.sh
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

fuse-overlayfs -o lowerdir="$LOWER",upperdir="$UPPER",workdir="$WORK" $MERGE
