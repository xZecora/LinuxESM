#!/bin/sh

# Any file changes in the runtime will be stored here after the file system is destroyed
OVERWRITE=

# This is simply needed for fuse-overlayfs, would recommend just leaving it in your cache directory
CACHE=

# This is where your runtime will be stored when it is created, this should be where steam or you run your game from.
RUNTIME=

# This is where you store your mods folders, seperate from each other.
# Should be one directory above the data in the mods, otherwise things will not go where you want them.
MODFOLDER=

# The base data for your Oblivion, should point to the Data folder wherever you keep Oblivion.
OBLIVIONDATA=
