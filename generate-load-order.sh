#!/bin/sh

MODFOLDER=/home/vitrial/Documents/Oblivion/mods/

OBLIVIONDATA=/home/vitrial/games/SteamLibrary/steamapps/common/Oblivion

DIRECTORIES=$(find "$MODFOLDER" -maxdepth 1 -type d)

LOWER=$OBLIVIONDATA

while IFS= read -r dir; do
  LOWER=$LOWER"\n"$dir
done <<< "$DIRECTORIES"

printf "$LOWER" > load_order

#fuse-overlayfs lowerdir
