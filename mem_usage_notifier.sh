#!/bin/bash

SCRIPT_ROOT=${0%/*}
pushd "$SCRIPT_ROOT" > /dev/null 2>&1
source ./_config.sh

MEMORY_USAGE=$(free | grep Mem | awk '{printf "%.2f", $3/$2 * 100.0}')
MEMORY_CURRENT=$(free -h | grep Mem | awk '{print $3}')
MEMORY_MAX=$(free -h | grep Mem | awk '{print $2}')
TIME_STR=$(TZ=$TZ date '+%H:%M')

arrcon_command "broadcast [$TIME_STR]Memory:${MEMORY_CURRENT}/${MEMORY_MAX}(${MEMORY_USAGE}%"

popd > /dev/null 2>&1
