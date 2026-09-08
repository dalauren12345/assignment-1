#!/bin/bash

LOG_DIR="logs"
LOG_FILE="$LOG_DIR/disk-check.log"

mkdir -p "$LOG_DIR"

log_message() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$LOG_FILE"
}

if [ "$#" -lt 1 ] || [ "$#" -gt 2 ]; then
    echo "Usage: $0 <threshold> [path]"
    log_message "Invalid number of arguments"
    exit 2
fi

threshold="$1"
path="${2:-/}"

if ! [[ "$threshold" =~ ^[0-9]+$ ]] || [ "$threshold" -lt 1 ] || [ "$threshold" -gt 100 ]; then
    echo "Error: threshold must be an integer from 1 to 100."
    log_message "Invalid threshold: $threshold"
    exit 2
fi

if [ ! -e "$path" ]; then
    echo "Error: path does not exist: $path"
    log_message "Invalid path: $path"
    exit 2
fi

usage=$(df -P "$path" | awk 'NR==2 {gsub("%","",$5); print $5}')

echo "Disk usage for $path: ${usage}%"
log_message "Checked disk usage for $path: ${usage}% with threshold ${threshold}%"

if [ "$usage" -lt "$threshold" ]; then
    exit 0
else
    exit 1
fi
