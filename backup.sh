#!/bin/bash

SCRIPT_ROOT=${0%/*}
pushd "$SCRIPT_ROOT" > /dev/null 2>&1
source ./_config.sh

if [ ! -d "${BACKUP_ROOT}" ]; then
  mkdir -p "${BACKUP_ROOT}"
fi

tar -czf "${BACKUP_ROOT}/archive_$(date +%Y%m%d%H%M%S).tar.gz" -C ${SAVEGAMES_ROOT} .

# rotate backup files
if [[ $BACKUP_FILE_KEEP_COUNT -gt 0 ]]; then 
  ls -td ${BACKUP_ROOT}/archive_* | tail -n +${BACKUP_FILE_KEEP_COUNT} | xargs rm -rf
fi

popd > /dev/null 2>&1
