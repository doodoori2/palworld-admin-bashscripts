#!/bin/bash

SCRIPT_ROOT=${0%/*}
pushd "$SCRIPT_ROOT" > /dev/null 2>&1
source ./_config.sh

MEMORY_USAGE=$(free | grep Mem | awk '{print $3/$2 * 100.0}')

if (( $(echo "$MEMORY_USAGE > $MEMORY_THRESHOLD_PERCENT" | bc -l) )); then
  echo "Memory usage is above $MEMORY_USAGE% > $MEMORY_THRESHOLD_PERCENT%. Running clean command."
  arrcon_command "broadcast Memory_Usage_$MEMORY_USAGE%(>$MEMORY_THRESHOLD_PERCENT%)"
  arrcon_command "save"
  arrcon_command "shutdown 300 ${SERVER_REBOOT_MSG_PREFIX}_in_5_mins"
  arrcon_reboot_broadcast_5_mins()
  $BACKUP_BIN
else
  echo "Memory usage ($MEMORY_USAGE) is below $MEMORY_THRESHOLD_PERCENT%. No action required."
fi

popd > /dev/null 2>&1
