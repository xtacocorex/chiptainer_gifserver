#!/bin/sh

# SET THE ANTENNA TO BE THE EXTERNAL ONE
set_antenna ufl

# MAKE DIRECTORY FOR PICTURES
mkdir -p /mnt/pictures

# REMOVE ANY PREVIOUS INSTANCE OF THE CONTAINER
docker rm gifserver

# PULL THE LATEST
docker pull xtacocorex/chiptainer_gifserver

# REMOVE OLD CONTIANER
docker rmi `docker images | grep chiptainer_gifserver | grep "<none>" | tr -s " " | cut -d " " -f 3`

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
