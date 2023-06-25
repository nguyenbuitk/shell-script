#!/bin/bash

logger "MessageFromBash"
logger -p local0.info "MessageFromBash"
logger -s -p local0.info "MessageFromBash"
logger -t myscript -p local0.info "MessageFromBash"
logger -i -t myscript "MessageFromBash"

# verify logging of system
# tail -n 1000 /var/log/syslog  | grep MessageFromBash
