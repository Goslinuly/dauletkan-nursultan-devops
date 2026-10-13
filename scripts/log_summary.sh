#!/bin/bash
# Count INFO, WARNING and ERROR messages in the application log
LOG="$(dirname "$0")/../logs/application.log"
for level in INFO WARNING ERROR; do
  echo "$level: $(grep -c "$level" "$LOG")"
done
