#!/bin/bash

CONTAINER_PATH="/opt/anbox/containers"
CONTAINER_NAME=default

if [ -z "$CONTAINER_PATH" ] ; then
    CONTAINER_PATH=/var/lib/anbox/containers
fi

exec /bin/lxc-start -P "$CONTAINER_PATH" -n default -F
