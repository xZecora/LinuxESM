#!/bin/sh

source ./config.sh

if [ -d $MERGE ]; then
  fusermount -u $MERGE
else
  echo "No directory supplied"
fi
