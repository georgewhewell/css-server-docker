#!/bin/sh

set -e

su -c "manage-server $@" $STEAMUSER
