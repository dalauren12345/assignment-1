#!/bin/bash

LOG_DIR="logs"
LOG_FILE="$LOG_DIR/network-check.log"

mkdir -p "$LOG_DIR"

log_message() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$LOG_FILE"
}

if [ "$#" -lt 1 ] || [ "$#" -gt 2 ]; then
    echo "Usage: $0 <hostname-or-ip> [port]"
    log_message "Invalid number of arguments"
    exit 2
fi

host="$1"
port="$2"

if [ -n "$port" ] && { ! [[ "$port" =~ ^[0-9]+$ ]] || [ "$port" -lt 1 ] || [ "$port" -gt 65535 ]; }; then
    echo "Error: port must be an integer from 1 to 65535."
    log_message "Invalid port: $port"
    exit 2
fi

resolved=$(getent ahostsv4 "$host" 2>/dev/null | awk 'NR==1 {print $1}')

if [ -z "$resolved" ]; then
    echo "Error: unable to resolve host: $host"
    log_message "Failed to resolve host: $host"
    exit 1
fi

echo "Host: $host"
echo "Resolved address: $resolved"

if ping -c 1 -W 2 "$host" >/dev/null 2>&1; then
    echo "Connectivity check: SUCCESS"
    log_message "Connectivity check succeeded for $host ($resolved)"
else
    echo "Connectivity check: FAILED"
    log_message "Connectivity check failed for $host ($resolved)"
fi

echo "Network interfaces:"
ip -brief address

if [ -n "$port" ]; then
    if timeout 3 bash -c "</dev/tcp/$host/$port" 2>/dev/null; then
        echo "TCP port $port: OPEN"
        log_message "TCP port $port is open on $host"
    else
        echo "TCP port $port: CLOSED or unreachable"
        log_message "TCP port $port is closed or unreachable on $host"
    fi
fi
