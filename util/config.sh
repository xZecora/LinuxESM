#!/bin/sh

# Any file changes in the runtime will be stored here after the file system is destroyed
OVERWRITE=/home/vitrial/Documents/Oblivion/overwrite

# This is simply needed for fuse-overlayfs, would recommend just leaving it in your cache directory
CACHE=/home/vitrial/.cache/oblivion

# This is where your runtime will be stored when it is created, this should be where steam or you run your game from.
RUNTIME=/home/vitrial/Documents/oblivion-test/oblivion-runtime

#This is your load order file, it controls what overwrites what when the runtime is created, manage file conflicts here.
LOAD_ORDER=load_order

# This is where you store your mods folders, seperate from each other.
# Should be one directory above the data in the mods, otherwise things will not go where you want them.
MODFOLDER=/home/vitrial/Documents/Oblivion/mods/

# The base data for your Oblivion, should point to the Data folder wherever you keep Oblivion.
OBLIVIONDATA=/home/vitrial/games/SteamLibrary/steamapps/common/Oblivion/Data
