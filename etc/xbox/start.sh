#!/bin/bash

DIR="$(dirname $0)"

CONTAINER_PATH="/opt/anbox/containers"
CONTAINER_NAME=default

if [ -z "$CONTAINER_PATH" ] ; then
    CONTAINER_PATH=/var/lib/anbox/containers
fi

$DIR/_fs.sh
$DIR/_network.sh start
$DIR/_drivers.sh
$DIR/_setup.sh
$DIR/_env.sh

exec /bin/lxc-start -P "$CONTAINER_PATH" -n default -F
