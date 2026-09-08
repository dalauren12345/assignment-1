# Assignment 1 — Linux, Bash & Networking

## Overview

This project demonstrates Linux administration, Bash scripting, disk monitoring, networking checks, logging, and Git version control.

## Project Structure

assignment-1/
├── README.md
├── system-info.sh
├── disk-check.sh
├── network-check.sh
├── grade.sh
└── logs/
    └── .gitkeep

## Requirements

- Linux or WSL
- Bash
- Git
- Standard Linux utilities such as hostname, uname, df, free, lscpu, ip, ping, and getent

## Setup

Clone the repository and enter the project directory:

git clone <repo-url>
cd assignment-1

Make the Bash scripts executable:

chmod +x *.sh

## Usage

### System Information

Run the system information script:

./system-info.sh

The script displays hostname, current user, date/time, operating system, kernel version, uptime, CPU information, memory information, and current working directory.

### Disk Check

Run the disk check with a threshold percentage:

./disk-check.sh 80

The threshold must be an integer from 1 to 100. The default path is the root filesystem (/).

You can also specify a path:

./disk-check.sh 80 /

### Network Check

Run the network check with a hostname or IP address:

./network-check.sh google.com

The script resolves the host, performs a basic connectivity check, and displays network interface information.

You can also check a TCP port:

./network-check.sh google.com 443

The port must be an integer from 1 to 65535.

## Logging

The scripts create useful log entries in the logs/ directory. Each log entry includes a timestamp and a description of the operation performed.

The disk check writes to logs/disk-check.log.
The network check writes to logs/network-check.log.

## Testing

Test the scripts with valid and invalid inputs.

System information:
./system-info.sh

Disk check:
./disk-check.sh 100
./disk-check.sh 101

Network check:
./network-check.sh google.com
./network-check.sh google.com 443
./network-check.sh google.com 99999
./network-check.sh not-a-real-host-12345

The scripts return appropriate exit codes for valid and invalid input and write useful log entries to the logs/ directory.

## Assumptions

- The scripts are intended to run on Linux or WSL.
- Required standard Linux utilities are available in the environment.
- Disk usage is checked using the filesystem containing the specified path.
- Network connectivity depends on the availability of the target host and local network.
- No passwords, API keys, or other secrets are required by the scripts.
