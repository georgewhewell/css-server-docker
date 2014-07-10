#!/bin/sh
#
# manage-server - Gerencia o servidor de CS: Source
#

CFGDIR=$SERVERDIR/cstrike/cfg

MAP="de_dust2"
MAXPLAYERS="10"

IP="0.0.0.0"
PORT="27015"

do_start()
{
    echo "Iniciando servidor..."

    srcds_run="$SERVERDIR/srcds_run"

    $srcds_run \
        -steam_dir "$STEAMCMDDIR" \
        -steamcmd_script "$STEAMCMD" \
        -game cstrike \
        +map "$MAP" \
        -maxplayers "$MAXPLAYERS" \
        -ip "$IP" \
        -port "$PORT"
}

do_update()
{
    $STEAMCMD \
        +login anonymous \
        +force_install_dir "$SERVERDIR" \
        +app_update 232330 \
        validate \
        +quit
}


case $1 in
    update) do_update ;;
    *)      do_start  ;;
esac

exit $?
