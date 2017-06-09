#!/bin/sh

CONTAINER_IMAGE=${CONTAINER_IMAGE:-chiptainer_gifserver}

case "$1" in
    build)
        docker build --no-cache=true -t "${CONTAINER_IMAGE}" .
        ;;
    tag)
        docker tag chiptainer_gifserver xtacocorex/chiptainer_gifserver
        ;;
    push)
        docker push xtacocorex/chiptainer_gifserver
        ;;
esac
