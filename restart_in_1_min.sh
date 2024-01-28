#!/bin/bash

SCRIPT_ROOT=${0%/*}
pushd "$SCRIPT_ROOT" > /dev/null 2>&1
source ./_config.sh

arrcon_command "save"
arrcon_command "shutdown 60 ${SERVER_REBOOT_MSG_PREFIX}_in_1_minute"

arrcon_reboot_broadcast_60_secs()

popd > /dev/null 2>&1
