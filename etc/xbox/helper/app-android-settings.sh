#!/bin/sh

PACKAGE=com.android.settings

exec $SNAP/bin/env.sh launch \
	--package="$PACKAGE"
