#!/bin/sh

FILE="$2"

CONFIG=${1:-$HOME/.config/LinuxESM/}
source ${CONFIG}/config.sh

# Get default mod name and archive extension.
NAME=$(basename -- "$FILE")
EXTENSION="${NAME##*.}"
NAME="${NAME%%.*}"

# OMOD's are not reasonable to support currently, just use OBMM and implement a workaround.
if [ "${EXTENSION,,}" == "omod" ]; then
  echo "OMOD files are unsupported. Please attempt with a manual version or using a supported client like OBMM."
  exit
fi

# Detect if a mod name was given, otherwise prompt for one and verify
if [ ! "$3" = "" ]; then
  NAME=$3
else
  VERIFY="n"
  while [ ! "${VERIFY,,}" = "y" ]; do
    printf "What would you like to name the mod (defaults to ${NAME}): "
    read INPUT
    printf "Mod will be named \"$INPUT\", is this correct? <y/N> "
    read VERIFY
  done
  NAME="$INPUT"
fi


# Check if the mod already exists. If it does, prompt the user for how to handle it. If any action besides cancelling the process is taken, backup the current version.
if [ -d "$MODFOLDER/$NAME" ]; then
  echo "This mod already exists. Would you like to (u)pdate, (r)eplace, or (C)ancel (default)? <u/r/C>: "
  read OPTION
  if [ "${OPTION,,}" = "u" ]; then
    cp "$MODFOLDER/$NAME" "$CACHE/old_mods/$NAME-$(date +'%m%d%Y-%H:%M:%S')"
    echo "Previous version cached at $CACHE/old_mods/$NAME-$(date +'%m%d%Y-%H:%M:%S')"
  elif [ "${OPTION,,}" = "r" ]; then
    mv "$MODFOLDER/$NAME" "$CACHE/old_mods/$NAME-$(date +'%m%d%Y-%H:%M:%S')"
    echo "Previous version cached at $CACHE/old_mods/$NAME-$(date +'%m%d%Y-%H:%M:%S')"
  else
    echo "Cancelling and doing nothing. No changes have been made."
    exit
  fi
fi

# Detect the format of the archive, then use appropriate program to extract and place the archive.
if [ "${EXTENSION,,}" == "rar" ]; then
  echo "rar"
  unrar x "$FILE" "$MODFOLDER/$NAME/"
elif [ "${EXTENSION,,}" == "zip" ]; then
  echo "zip"
  unzip "$FILE" -d "$MODFOLDER/$NAME/"
elif [ "${EXTENSION,,}" == "7z" ]; then
  echo "7z"
  7z x "$FILE" "-o$MODFOLDER/$NAME/"
fi
