#/bin/sh

CONFIG=${1:-$HOME/.config/LinuxESM/}
source ${CONFIG}/config.sh

if [ -d "$CACHE" ]; then
  mkdir --parents "$CACHE" 
fi

if [ -d "$CACHE/old_mods" ]; then
  mkdir --parents "$CACHE"/old_mods 
fi

if [ -d "$OVERWRITE" ]; then
  mkdir --parents "$OVERWRITE"
fi

if [ -d "$MODFOLDER" ]; then
  mkdir --parents "$MODFOLDER"
fi

if [ -d "$RUNTIME" ]; then
  mkdir --parents "$RUNTIME"
fi

if [ -d "$OBLVIONDATA" ]; then
  mkdir --parents "$OBLVIONDATA"
fi
