#!/bin/bash

if [ -n "$_CONFIG_LOAD_ONCE" ]; then
  if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    exit
  else
    return 0
  fi
fi
_CONFIG_LOAD_ONCE=true

### PATHS ###
SCRIPT_ROOT="$(dirname "${BASH_SOURCE[0]}")"
GAME_ROOT="/home/ubuntu/game/Pal"
SAVEGAMES_ROOT="${GAME_ROOT}/Saved/SaveGames/0"
BACKUP_ROOT="/home/ubuntu/backups"

### USER_CONFIG ###

RCON_HOST=localhost
RCON_PORT=25575
RCON_ADMIN_PASS=

# https://github.com/radj307/ARRCON/wiki#connecting-to-your-server
ARRCON_SAVED_HOSTS=

TZ=Asia/Seoul

MEMORY_THRESHOLD_PERCENT=90
SERVER_REBOOT_MSG_PREFIX="Server_reboot"
BACKUP_FILE_KEEP_COUNT=25

### BIN PATHS ###
ARRCON_BIN=${SCRIPT_ROOT}/ARRCON
BACKUP_BIN=${SCRIPT_ROOT}/backup.sh
LIBRARY_PATH=${SCRIPT_ROOT}/lib

CONFIG_VALIDATION=1

### Load libraries ### 
source ${LIBRARY_PATH}/arrcon.sh

### config validation ###
if [ ${CONFIG_VALIDATION} = 1 ] ; then
  if [ ! -d "${GAME_ROOT}" ] ; then
    echo "Error: Directory GAME_ROOT('${GAME_ROOT}') does not exist. Please check _config.sh"
    exit 1
  fi
  if [ ! -d "${SAVEGAMES_ROOT}" ] ; then
    echo "Error: Directory SAVEGAMES_ROOT('${GAME_ROOT}') does not exist. Please check _config.sh"
    exit 1
  fi
  if [ ! -f "${ARRCON_BIN}" ] ; then
    echo "Error: Bianary ARRCON_BIN do not exist. Please check _config.sh"
    exit 1
  fi
  if [ -z "${ARRCON_SAVED_HOSTS}" ]; then
    if [ -z "${RCON_HOST}" ]; then
      echo "Error: RCON_HOST is empty. Please check _config.sh"
      exit 1
    fi
    if [ -z "${RCON_PORT}" ]; then
      echo "Error: RCON_PORT is empty. Please check _config.sh"
      exit 1
    fi
    if [ -z "${RCON_ADMIN_PASS}" ]; then
      echo "Error: RCON_ADMIN_PASS is empty. Please check _config.sh"
      exit 1
    fi
  fi

  ARRCON_INFO_RESULT=$(arrcon_command "info")
  if [[ ${ARRCON_INFO_RESULT} != *info* ]] ; then
    echo "Error: Failed to run ARRCON Info command. Please check ARRCON setting in _config.sh"
    exit 1
  fi
fi

