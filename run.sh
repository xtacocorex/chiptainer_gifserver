#!/bin/sh

# MAKE DIRECTORY FOR PICTURES
mkdir -p /mnt/pictures

# REMOVE ANY PREVIOUS INSTANCE OF THE CONTAINER
docker rm gifserver

# PULL THE LATEST
docker pull xtacocorex/chiptainer_gifserver

# RUN THE CONTAINER
docker run \
         --rm \
         -it \
         --name gifserver \
         --privileged \
         --net=host \
         -v /sys:/sys \
         --volume=/mnt/pictures:/mnt/pictures \
         xtacocorex/chiptainer_gifserver:latest
