#!/bin/sh

CONFIG=${1:-$HOME/.config/LinuxESM}
source $CONFIG

if [ -d $RUNTIME ]; then
  fusermount -u $RUNTIME
else
  echo "No directory supplied"
fi
