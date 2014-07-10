#!/bin/sh
#
# css - Inicializa o servidor de CS: Source corretamente
#

set -e

su -c "manage-server $@" $STEAMUSER
