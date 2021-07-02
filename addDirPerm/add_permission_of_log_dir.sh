#!/bin/bash

readonly LOGROTATE_CONF_PATH="/etc/logrotate.d"

logdir=$LOG_DIR
userID=$USER_ID
rotatelogdironnode=$ROTATE_LOG_DIR_ON_NODE
rotatesize=$ROTATE_SIZE
rotatecount=$ROTATE_COUNT

echo "try to set dir: $logdir 's group as $userID"

chown  -R  $userID:$userID $logdir

set_rotate() {
        local log_name=`basename $1` log_size=$2 log_count=$3
        if [[ ! -f ${LOGROTATE_CONF_PATH}/${log_name} ]]; then
                (
                        echo "$1 {"
                        echo "    rotate $log_count"
                        echo "    daily"
                        echo "    maxsize $log_size"
                        echo "    minsize 10M"
                        echo "    copytruncate"
                        echo "    missingok"
                        echo "    create 0644 root root"
                        echo "}"
                ) > ${LOGROTATE_CONF_PATH}/${log_name}

                chmod 644 ${LOGROTATE_CONF_PATH}/${log_name}
        fi
}

if [ "$rotatelogdironnode"x != ""x ] ; then
        set_rotate "$rotatelogdironnode/access.log" $rotatesize $rotatecount
        set_rotate "$rotatelogdironnode/error.log" $rotatesize $rotatecount
fi

