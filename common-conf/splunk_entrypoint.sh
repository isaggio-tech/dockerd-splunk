#!/bin/bash

# ls -lsrt /sbin/entrypoint*

# cat /sbin/entrypoint.sh

export SPLUNK_START_ARGS=--accept-license
export SPLUNK_PASSWORD=Root@123

exec /sbin/entrypoint.sh "$@"
