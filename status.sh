#!/bin/bash

SCRIPT_ROOT=${0%/*}
pushd "$SCRIPT_ROOT" > /dev/null 2>&1
source ./_config.sh

MEMORY_USAGE=$(free | grep Mem | awk '{printf "%.2f", $3/$2 * 100.0}')
MEMORY_CURRENT=$(free -h | grep Mem | awk '{print $3}')
MEMORY_MAX=$(free -h | grep Mem | awk '{print $2}')

echo "MemUsage: ${MEMORY_USAGE})"
echo "Memory: ${MEMORY_CURRENT}/${MEMORY_MAX}(${MEMORY_USAGE}%)"

arrcon_command "info"
arrcon_command "showplayers"

echo "Last Backup"
ls -td ${BACKUP_ROOT}/archive_* | tail -n 1

popd > /dev/null 2>&1
