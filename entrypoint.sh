#!/bin/bash
export SERVER_HOSTNAME="${hostname}"
export AUTHKEY="${AUTHKEY}"
export PORT="${port:-27015}"
export SERVER_PASSWORD="${password:-}"
export RCON_PASSWORD="${rcon_password:-changeme}"

set -e
cd csgo
./srcds_run -game csgo +hostname "$SERVER_HOSTNAME" +sv_password "$SERVER_PASSWORD" +rcon_password "$RCON_PASSWORD" +map de_dust2 -maxplayers "$maxplayer"  -port "$PORT" -authkey "$AUTHKEY"
