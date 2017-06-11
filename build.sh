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
    all)
        echo "BUILDING"
        docker build --no-cache=true -t "${CONTAINER_IMAGE}" .
        echo "TAGGING"
        docker tag chiptainer_gifserver xtacocorex/chiptainer_gifserver
        echo "PUSHING"
        docker push xtacocorex/chiptainer_gifserver
        ;;
    remove-tags)
        docker rmi `docker images | grep chiptainer_gifserver | grep "<none>" | tr -s " " | cut -d " " -f 3`
        ;;
esac
