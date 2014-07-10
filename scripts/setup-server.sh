#!/bin/sh
#
# setup-server - Cria a estrutura básica para o servidor de CS: Source
#

CFGDIR=$SERVERDIR/cstrike/cfg

useradd -d $STEAMCMDDIR -M -s /bin/bash -U $STEAMUSER

mkdir -p $CFGDIR

ln -sv /cfg/motd_text.txt $CFGDIR/
ln -sv /cfg/motd.txt $CFGDIR/
ln -sv /cfg/server.cfg $CFGDIR/

chown -R $STEAMUSER:$STEAMUSER $STEAMCMDDIR $SERVERDIR $CFGDIR

echo "-------------------------------------------------------"
echo "- Setup complete!"
echo "- Run 'css update' to install/update the Server."
echo "-------------------------------------------------------"
