#!/bin/sh

UPPER=$HOME/Documents/Oblivion/overwrite
WORK=$HOME/.cache/oblivion
LOWER=""

while read line; do
  LOWER=$LOWER:$line
done < load_order

LOWER="${LOWER#?}"

echo $LOWER

fuse-overlayfs -o lowerdir="$LOWER",upperdir=/home/vitrial/Documents/Oblivion/overwrite,workdir=$HOME/.cache/oblivion $HOME/Documents/merge
