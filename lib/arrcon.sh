#!/bin/bash

if [ -z "${_CONFIG_LOAD_ONCE}" ]; then
  echo "Error: This script should be sourced from _config.sh"
  exit 1
fi

arrcon_command()
{
  if [ -z "${ARRCON_SAVED_HOSTS}" ]; then
    echo $1 | $ARRCON_BIN -H $RCON_HOST -P $RCON_PORT -p $RCON_ADMIN_PASS
  else
    echo $1 | $ARRCON_BIN -S $ARRCON_SAVED_HOSTS
  fi
}

arrcon_reboot_broadcast_5_secs() 
{
  arrcon_command "broadcast ${SERVER_REBOOT_MSG_PREFIX}_in_5_secs"
  sleep 1
  arrcon_command "broadcast ${SERVER_REBOOT_MSG_PREFIX}_in_4_secs"
  sleep 1
  arrcon_command "broadcast ${SERVER_REBOOT_MSG_PREFIX}_in_3_secs"
  sleep 1
  arrcon_command "broadcast ${SERVER_REBOOT_MSG_PREFIX}_in_2_secs"
  sleep 1
  arrcon_command "broadcast ${SERVER_REBOOT_MSG_PREFIX}_now"
}

arrcon_reboot_broadcast_10_secs() 
{
  arrcon_command "broadcast ${SERVER_REBOOT_MSG_PREFIX}_in_10_secs"
  sleep 5
  arrcon_reboot_broadcast_5_secs
}

arrcon_reboot_broadcast_60_secs() 
{
  arrcon_command "broadcast ${SERVER_REBOOT_MSG_PREFIX}_in_60_secs"
  sleep 50
  arrcon_reboot_broadcast_5_secs
}

arrcon_reboot_broadcast_5_mins() 
{
  arrcon_command "broadcast ${SERVER_REBOOT_MSG_PREFIX}_in_5_mins"
  sleep 120
  arrcon_command "broadcast ${SERVER_REBOOT_MSG_PREFIX}_in_3_mins"
  sleep 60
  arrcon_command "broadcast ${SERVER_REBOOT_MSG_PREFIX}_in_2_mins"
  sleep 60
  arrcon_reboot_broadcast_60_secs
}

