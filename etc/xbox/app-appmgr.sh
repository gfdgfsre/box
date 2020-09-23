#!/bin/sh

PACKAGE=org.anbox.appmgr
COMPONENT=org.anbox.appmgr.AppViewActivity

exec $SNAP/bin/env.sh launch \
	--package="$PACKAGE" \
	--component="$COMPONENT"
